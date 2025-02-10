object frmWebCam: TfrmWebCam
  Left = 0
  Top = 0
  Caption = 'frmWebCam'
  ClientHeight = 749
  ClientWidth = 1056
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object Image1: TImage
    Left = 0
    Top = 541
    Width = 200
    Height = 145
  end
  object pnlWebcam: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    BevelOuter = bvNone
    Caption = 'Webcam not connected!'
    Color = clBtnShadow
    ParentBackground = False
    TabOrder = 0
  end
  object btnConnect: TButton
    Left = 0
    Top = 492
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 1
    OnClick = btnConnectClick
  end
  object btnDisconnect: TButton
    Left = 562
    Top = 492
    Width = 75
    Height = 25
    Caption = 'Disconnect'
    TabOrder = 2
    OnClick = btnDisconnectClick
  end
  object btnConfigure: TButton
    Left = 369
    Top = 492
    Width = 75
    Height = 25
    Caption = 'Configure'
    TabOrder = 3
    OnClick = btnConfigureClick
  end
  object edFileName: TEdit
    Left = 320
    Top = 549
    Width = 320
    Height = 23
    TabOrder = 4
    Text = 'd:\webcam\test'
  end
  object btnCapture: TButton
    Left = 457
    Top = 492
    Width = 75
    Height = 25
    Caption = 'Capture'
    TabOrder = 5
    OnClick = btnCaptureClick
  end
  object btnSave: TButton
    Left = 712
    Top = 492
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 6
    OnClick = btnSaveClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 25
    OnTimer = Timer1Timer
    Left = 651
    Top = 496
  end
end
