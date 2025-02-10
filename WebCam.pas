unit WebCam;

// source: https://www.youtube.com/watch?v=Fl-5ImV_PE4
interface

uses
  Windows, Messages;

type
  TWebcam = class
    constructor Create(const WindowName: string = ''; ParentWnd: HWND = 0;
      Left: integer = 0; Top: integer = 0; Width: integer = 0;
      Height: integer = 0; Style: Cardinal = WS_CHILD or WS_VISIBLE;
      WebCamID: integer = 0);
  public const
    WM_Connect = WM_USER + 10;
    WM_Disconnet = WM_USER + 11;
    WM_GrabFrame = WM_USER + 60;
    WM_SaveDIB = WM_USER + 25;
    WM_Preview = WM_USER + 50;
    WM_PreviewRate = WM_USER + 52;
    WM_Configure = WM_USER + 41;
  public
    procedure Connect;
    procedure Disconnect;
    procedure GrabFrame;
    procedure SaveDIB(const FileName: string = 'webcam.bmp');
    procedure Preview(&on: boolean = True);
    procedure PreviewRate(Rate: integer = 42);
    procedure Configure;
  private
    CaptureWnd: HWND;
  end;

implementation

function capCreateCaptureWindowA(WindowName: PChar; dwStyle: Cardinal;
  x, y, Width, Height: integer; ParentWnd: HWND; WebCamID: integer): HWND;
stdcall external 'AVICAP32.dll';

{ TWebcam }

  procedure TWebcam.Configure;
  begin
    if CaptureWnd <> 0 then
      SendMessage(CaptureWnd, WM_Configure, 0, 0);
  end;

  procedure TWebcam.Connect;
  begin
    if CaptureWnd <> 0 then
    begin
      SendMessage(CaptureWnd, WM_Connect, 0, 0);
    end;
  end;

  constructor TWebcam.Create(const WindowName: string; ParentWnd: HWND;
    Left, Top, Width, Height: integer; Style: Cardinal; WebCamID: integer);
  begin
    CaptureWnd := capCreateCaptureWindowA(PChar(WindowName), Style, Left, Top,
      Width, Height, ParentWnd, WebCamID)
  end;

  procedure TWebcam.Disconnect;
  begin
    if CaptureWnd <> 0 then
      SendMessage(CaptureWnd, WM_Disconnet, 0, 0);
  end;

  procedure TWebcam.GrabFrame;
  begin
    if CaptureWnd <> 0 then
      SendMessage(CaptureWnd, WM_GrabFrame, 0, 0);
  end;

  procedure TWebcam.Preview(&on: boolean);
  begin
    if CaptureWnd <> 0 then
      if &on then
        SendMessage(CaptureWnd, WM_Preview, 1, 0)
      else
        SendMessage(CaptureWnd, WM_Preview, 0, 0);
  end;

  procedure TWebcam.PreviewRate(Rate: integer);
  begin
    if CaptureWnd <> 0 then
      SendMessage(CaptureWnd, WM_PreviewRate, Rate, 0);
  end;

  procedure TWebcam.SaveDIB(const FileName: string);
  begin
    if CaptureWnd <> 0 then
      SendMessage(CaptureWnd, WM_SaveDIB, 0, Cardinal(PChar(FileName)));
  end;

end.
