unit uPeopleCard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Vcl.ExtCtrls,
  Vcl.StdCtrls, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  Data.Bind.Controls, Vcl.Buttons, Vcl.Bind.Navigator, Vcl.Imaging.jpeg, WebCam;

type
  TfrmPeopleCard = class(TForm)
    StatusBar1: TStatusBar;
    tbPeople: TFDTable;
    edID: TEdit;
    DBImage1: TImage;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    FDConnection1: TFDConnection;
    btnEdit: TButton;
    btnSave: TButton;
    Label1: TLabel;
    edFirstName: TEdit;
    Label2: TLabel;
    edLastName: TEdit;
    Label3: TLabel;
    edFatherName: TEdit;
    Label4: TLabel;
    edMotherName: TEdit;
    Label5: TLabel;
    edBirthPlace: TEdit;
    Label6: TLabel;
    edBirthDate: TEdit;
    Label7: TLabel;
    edNationalID: TEdit;
    edAddress: TEdit;
    Label8: TLabel;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    BindNavigator1: TBindNavigator;
    LinkControlToField10: TLinkControlToField;
    Panel1: TPanel;
    edNationalIDSearch: TEdit;
    Edit2: TEdit;
    btnSearch: TButton;
    pnlWebcam: TPanel;
    btnConnect: TButton;
    btnCapture: TButton;
    btnDisconnect: TButton;
    Timer1: TTimer;
    edFileName: TEdit;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edNationalIDSearchEnter(Sender: TObject);
    procedure edNationalIDSearchExit(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnCaptureClick(Sender: TObject);
    procedure edNationalIDSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FileName: string;
    Camera: TWebcam;
  public
    { Public declarations }
  end;

var
  frmPeopleCard: TfrmPeopleCard;

implementation

{$R *.dfm}

procedure TfrmPeopleCard.btnCaptureClick(Sender: TObject);
var
  Bitmap: TBitmap;
  RectToCapture: TRect;
begin

  // Define the area you want to capture
  RectToCapture := Rect(DBImage1.Left, DBImage1.Top,
    DBImage1.Width + pnlWebcam.Width + 20, pnlWebcam.Height + pnlWebcam.Top);
  // Left, Top, Right, Bottom

  // Create a bitmap to store the captured area
  Bitmap := TBitmap.Create;
  try
    // Set the size of the bitmap to match the area you want to capture
    Bitmap.Width := RectToCapture.Right - RectToCapture.Left;
    Bitmap.Height := RectToCapture.Bottom - RectToCapture.Top;

    // Copy the area from the form into the bitmap
    Bitmap.Canvas.CopyRect(Rect(0, 0, Bitmap.Width, Bitmap.Height), Self.Canvas,
      RectToCapture);

    // Assign the bitmap to the TImage component
    Image1.Picture.Bitmap.Assign(Bitmap);
    Image1.Stretch := True;
    Image1.Visible := True;
  finally
    Bitmap.Free;
  end;

  with TJPEGImage.Create do
    try
      Assign(Image1.Picture.Bitmap);
      FileName := edFileName.Text + FormatDateTime('YYYYmmDDHHMMSS',
        Now) + '.jpg';
      SaveToFile(FileName);
    finally
      Free;
    end;
end;

procedure TfrmPeopleCard.btnConnectClick(Sender: TObject);
begin
  Camera.Connect;
  Timer1.Enabled := True;
end;

procedure TfrmPeopleCard.btnDisconnectClick(Sender: TObject);
begin
  Camera.Disconnect;
  Image1.Visible := False;
end;

procedure TfrmPeopleCard.btnEditClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(nil);
  if OpenDialog.Execute then
    FileName := OpenDialog.FileName
  else
    exit;
  Image1.Picture.LoadFromFile(FileName);
end;

procedure TfrmPeopleCard.btnSaveClick(Sender: TObject);
var
  Bitmap: TPicture;
  Stream: TStream;
  FDQuery: TFDQuery;
begin
  try
    Bitmap := TPicture.Create;
    Bitmap.LoadFromFile(FileName);
    Stream := TMemoryStream.Create;
    Bitmap.SaveToStream(Stream);
    Stream.Position := 0;
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := FDConnection1;
    FDQuery.SQL.Text := 'Update people set picture = :Image where id = :id';
    FDQuery.ParamByName('Image').LoadFromStream(Stream, ftBlob);
    FDQuery.ParamByName('id').Value := tbPeople.FieldByName('id').AsString;
    FDQuery.ExecSQL;
  except
    on e: Exception do
    begin
      FileName := '';
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TfrmPeopleCard.btnSearchClick(Sender: TObject);
begin
  Image1.Visible := False;
  Camera.Disconnect;
  with tbPeople do
  begin
    Close;
    Filter := 'national_no = ' + QuotedStr(edNationalIDSearch.Text);
    Filtered := True;
    Open;
    if Eof then
      ShowMessage('No entry found with the specified criteria.');
  end;
end;

procedure TfrmPeopleCard.edNationalIDSearchEnter(Sender: TObject);
begin
  if edNationalIDSearch.Text = 'Enter National No.' then
    edNationalIDSearch.Clear;
end;

procedure TfrmPeopleCard.edNationalIDSearchExit(Sender: TObject);
begin
  if Length(edNationalIDSearch.Text) = 0 then
    edNationalIDSearch.Text := 'Enter National No.';
end;

procedure TfrmPeopleCard.edNationalIDSearchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then btnSearchClick(Self);
end;

procedure TfrmPeopleCard.FormCreate(Sender: TObject);
begin
  Camera := TWebcam.Create('Waseem', pnlWebcam.Handle, 0, 0, pnlWebcam.Width,
    pnlWebcam.Height);
end;

procedure TfrmPeopleCard.Timer1Timer(Sender: TObject);
begin
  Camera.GrabFrame;
end;

end.
