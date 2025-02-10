object frmPeopleCard: TfrmPeopleCard
  Left = 0
  Top = 0
  Caption = 'People Card'
  ClientHeight = 927
  ClientWidth = 1674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object DBImage1: TImage
    Left = 24
    Top = 112
    Width = 320
    Height = 240
    Stretch = True
  end
  object Label1: TLabel
    Left = 80
    Top = 208
    Width = 11
    Height = 15
    Caption = 'ID'
    Visible = False
  end
  object Label2: TLabel
    Left = 24
    Top = 424
    Width = 57
    Height = 15
    Caption = 'First Name'
  end
  object Label3: TLabel
    Left = 168
    Top = 422
    Width = 56
    Height = 15
    Caption = 'Last Name'
  end
  object Label4: TLabel
    Left = 24
    Top = 472
    Width = 68
    Height = 15
    Caption = 'Father Name'
  end
  object Label5: TLabel
    Left = 168
    Top = 472
    Width = 74
    Height = 15
    Caption = 'Mother Name'
  end
  object Label6: TLabel
    Left = 24
    Top = 520
    Width = 70
    Height = 15
    Caption = 'Place of Birth'
  end
  object Label7: TLabel
    Left = 168
    Top = 520
    Width = 66
    Height = 15
    Caption = 'Date of Birth'
  end
  object Label8: TLabel
    Left = 24
    Top = 570
    Width = 42
    Height = 15
    Caption = 'Address'
  end
  object Image1: TImage
    Left = 1014
    Top = 112
    Width = 478
    Height = 240
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 908
    Width = 1674
    Height = 19
    Panels = <>
  end
  object edID: TEdit
    Left = 80
    Top = 229
    Width = 121
    Height = 23
    TabOrder = 1
    Visible = False
  end
  object btnEdit: TButton
    Left = 24
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Edit Pic'
    TabOrder = 2
    OnClick = btnEditClick
  end
  object btnSave: TButton
    Left = 105
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Save Pic'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object edFirstName: TEdit
    Left = 24
    Top = 445
    Width = 138
    Height = 23
    TabOrder = 4
  end
  object edLastName: TEdit
    Left = 168
    Top = 443
    Width = 176
    Height = 23
    TabOrder = 5
  end
  object edFatherName: TEdit
    Left = 24
    Top = 493
    Width = 138
    Height = 23
    TabOrder = 6
  end
  object edMotherName: TEdit
    Left = 168
    Top = 493
    Width = 176
    Height = 23
    TabOrder = 7
  end
  object edBirthPlace: TEdit
    Left = 24
    Top = 541
    Width = 138
    Height = 23
    TabOrder = 8
  end
  object edBirthDate: TEdit
    Left = 168
    Top = 541
    Width = 176
    Height = 23
    TabOrder = 9
  end
  object edNationalID: TEdit
    Left = 200
    Top = 369
    Width = 144
    Height = 23
    TabOrder = 10
  end
  object edAddress: TEdit
    Left = 24
    Top = 591
    Width = 320
    Height = 23
    TabOrder = 11
  end
  object BindNavigator1: TBindNavigator
    Left = 0
    Top = 883
    Width = 1674
    Height = 25
    DataSource = BindSourceDB1
    Align = alBottom
    Orientation = orHorizontal
    TabOrder = 12
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1674
    Height = 89
    Align = alTop
    TabOrder = 13
    object edNationalIDSearch: TEdit
      Left = 24
      Top = 30
      Width = 225
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = 'Enter National No.'
      OnEnter = edNationalIDSearchEnter
      OnExit = edNationalIDSearchExit
      OnKeyDown = edNationalIDSearchKeyDown
    end
    object Edit2: TEdit
      Left = 288
      Top = 30
      Width = 225
      Height = 28
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = 'Enter Passport No.'
    end
    object btnSearch: TButton
      Left = 568
      Top = 33
      Width = 75
      Height = 25
      Caption = 'Search'
      TabOrder = 2
      OnClick = btnSearchClick
    end
  end
  object pnlWebcam: TPanel
    Left = 368
    Top = 112
    Width = 640
    Height = 480
    BevelOuter = bvNone
    Caption = 'Webcam not connected!'
    Color = clBtnShadow
    ParentBackground = False
    TabOrder = 14
  end
  object btnConnect: TButton
    Left = 368
    Top = 598
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 15
    OnClick = btnConnectClick
  end
  object btnCapture: TButton
    Left = 631
    Top = 628
    Width = 75
    Height = 25
    Caption = 'Capture'
    TabOrder = 16
    OnClick = btnCaptureClick
  end
  object btnDisconnect: TButton
    Left = 530
    Top = 598
    Width = 75
    Height = 25
    Caption = 'Disconnect'
    TabOrder = 17
    OnClick = btnDisconnectClick
  end
  object edFileName: TEdit
    Left = 368
    Top = 629
    Width = 257
    Height = 23
    TabOrder = 18
    Text = 'C:\Users\Waseem\Desktop\webcam_vcl\img\'
  end
  object tbPeople: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'people'
    Left = 928
    Top = 432
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = tbPeople
    ScopeMappings = <>
    Left = 928
    Top = 360
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 924
    Top = 293
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'id'
      Control = edID
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'first_name'
      Control = edFirstName
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'address'
      Control = edAddress
      Track = True
    end
    object LinkControlToField4: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'mother_name'
      Control = edMotherName
      Track = True
    end
    object LinkControlToField5: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'place_of_birth'
      Control = edBirthPlace
      Track = True
    end
    object LinkControlToField6: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'national_no'
      Control = edNationalID
      Track = True
    end
    object LinkControlToField7: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'father_name'
      Control = edFatherName
      Track = True
    end
    object LinkControlToField8: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'last_name'
      Control = edLastName
      Track = True
    end
    object LinkControlToField9: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'date_of_birth'
      Control = edBirthDate
      Track = True
    end
    object LinkControlToField10: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'picture'
      Control = DBImage1
      Track = False
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Waseem\Desktop\webcam_vcl\db\db.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 1008
    Top = 296
  end
  object Timer1: TTimer
    Interval = 25
    OnTimer = Timer1Timer
    Left = 1016
    Top = 440
  end
end
