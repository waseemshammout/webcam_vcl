unit uWebcamForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WebCam, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmWebCam = class(TForm)
    pnlWebcam: TPanel;
    btnConnect: TButton;
    btnDisconnect: TButton;
    Timer1: TTimer;
    btnConfigure: TButton;
    edFileName: TEdit;
    Image1: TImage;
    btnCapture: TButton;
    btnSave: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnConfigureClick(Sender: TObject);
    procedure btnCaptureClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    Camera: TWebcam;

  public
    { Public declarations }
  end;

var
  frmWebCam: TfrmWebCam;

implementation

uses
  jpeg;

{$R *.dfm}

procedure TfrmWebCam.btnConfigureClick(Sender: TObject);
begin
  Camera.Configure;
end;

procedure TfrmWebCam.btnConnectClick(Sender: TObject);
begin
  Camera.Connect;
  Timer1.Enabled := True;
end;

procedure TfrmWebCam.btnCaptureClick(Sender: TObject);
var
  PanelDC: HDC;
  FileName: string;
begin
  if not assigned(Image1.Picture.Bitmap) then
    Image1.Picture.Bitmap := TBitmap.Create
  else
  begin
    Image1.Picture.Bitmap.Free;
    Image1.Picture.Bitmap := TBitmap.Create;
  end;

  Image1.Picture.Bitmap.Height := pnlWebcam.Height;
  Image1.Picture.Bitmap.Width := pnlWebcam.Width;
  Image1.Stretch := True;

  PanelDC := GetDC(Handle);

  try
    BitBlt(Image1.Picture.Bitmap.Canvas.Handle, pnlWebcam.Left, pnlWebcam.Top, frmWebCam.Width, frmWebCam.Height,
           PanelDC, pnlWebcam.Left, pnlWebcam.Top, SRCCOPY);
  finally
    ReleaseDC(Handle, PanelDC);
  end;

  with TJPEGImage.Create do
    try
      Assign(Image1.Picture.Bitmap);
      FileName := edFileName.Text + '.jpg';
      SaveToFile(FileName);
    finally
      Free;
    end;

end;

procedure TfrmWebCam.btnDisconnectClick(Sender: TObject);
begin
  Camera.Disconnect;
  Timer1.Enabled := False;
end;

procedure TfrmWebCam.btnSaveClick(Sender: TObject);
var
  hdcSource, hdcDest: HDC;
  rectWidth, rectHeight: Integer;
  FileName: string;
begin

  hdcSource := GetDC(0);  // Handle to the screen device context (0 = desktop)
  hdcDest := GetDC(WindowHandle); // Handle to the destination window or bitmap

  // Define the area to copy (e.g., 100x100 pixels starting at (50, 50) on the screen)
  rectWidth := 100;
  rectHeight := 100;

  // Perform the BitBlt operation
  BitBlt(hdcDest, 0, 0, rectWidth, rectHeight, hdcSource, 50, 50, SRCCOPY);

  // Release the device contexts when done
  ReleaseDC(0, hdcSource);
  ReleaseDC(WindowHandle, hdcDest);

  with TJPEGImage.Create do
    try
      Assign(Image1.Picture.Bitmap);
      FileName := edFileName.Text + '.jpg';
      SaveToFile(FileName);
    finally
      Free;
    end;

end;

procedure TfrmWebCam.FormCreate(Sender: TObject);
begin
  Camera := TWebcam.Create('Waseem', pnlWebcam.Handle, 0, 0, pnlWebcam.Width,
    pnlWebcam.Height);
end;

procedure TfrmWebCam.Timer1Timer(Sender: TObject);
begin
  Camera.GrabFrame;
end;

end.
