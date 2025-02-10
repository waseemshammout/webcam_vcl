program WebcamProject;

uses
  Vcl.Forms,
  uWebcamForm in 'uWebcamForm.pas' {frmWebCam},
  WebCam in 'WebCam.pas',
  uPeopleCard in 'uPeopleCard.pas' {frmPeopleCard};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
//  Application.CreateForm(TfrmWebCam, frmWebCam);
  Application.CreateForm(TfrmPeopleCard, frmPeopleCard);
  Application.Run;
end.
