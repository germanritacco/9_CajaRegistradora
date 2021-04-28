object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Caja Registradora'
  ClientHeight = 378
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 25
    Top = 8
    Width = 136
    Height = 13
    Caption = 'Ingresar cantidad de billetes'
  end
  object lbledt1: TLabeledEdit
    Left = 40
    Top = 40
    Width = 121
    Height = 21
    EditLabel.Width = 12
    EditLabel.Height = 13
    EditLabel.Caption = '$1'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 0
    Text = '0'
    OnExit = lbledt1Exit
  end
  object lbledt1000: TLabeledEdit
    Left = 40
    Top = 339
    Width = 121
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = '$1000'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 1
    Text = '0'
    OnExit = lbledt1000Exit
  end
  object lbledt500: TLabeledEdit
    Left = 40
    Top = 305
    Width = 121
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = '$500'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 2
    Text = '0'
    OnExit = lbledt500Exit
  end
  object lbledt200: TLabeledEdit
    Left = 40
    Top = 272
    Width = 121
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = '$200'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 3
    Text = '0'
    OnExit = lbledt200Exit
  end
  object lbledt100: TLabeledEdit
    Left = 40
    Top = 239
    Width = 121
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = '$100'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 4
    Text = '0'
    OnExit = lbledt100Exit
  end
  object lbledt50: TLabeledEdit
    Left = 40
    Top = 206
    Width = 121
    Height = 21
    EditLabel.Width = 18
    EditLabel.Height = 13
    EditLabel.Caption = '$50'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 5
    Text = '0'
    OnExit = lbledt50Exit
  end
  object lbledt20: TLabeledEdit
    Left = 40
    Top = 172
    Width = 121
    Height = 21
    EditLabel.Width = 18
    EditLabel.Height = 13
    EditLabel.Caption = '$20'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 6
    Text = '0'
    OnExit = lbledt20Exit
  end
  object lbledt10: TLabeledEdit
    Left = 40
    Top = 139
    Width = 121
    Height = 21
    EditLabel.Width = 18
    EditLabel.Height = 13
    EditLabel.Caption = '$10'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 7
    Text = '0'
    OnExit = lbledt10Exit
  end
  object lbledt5: TLabeledEdit
    Left = 40
    Top = 106
    Width = 121
    Height = 21
    EditLabel.Width = 12
    EditLabel.Height = 13
    EditLabel.Caption = '$5'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 8
    Text = '0'
    OnExit = lbledt5Exit
  end
  object lbledt2: TLabeledEdit
    Left = 40
    Top = 73
    Width = 121
    Height = 21
    EditLabel.Width = 12
    EditLabel.Height = 13
    EditLabel.Caption = '$2'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 9
    Text = '0'
    OnExit = lbledt2Exit
  end
  object btnCargar: TButton
    Left = 192
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Cargar Caja'
    TabOrder = 10
    OnClick = btnCargarClick
  end
  object Memo1: TMemo
    Left = 411
    Top = 8
    Width = 241
    Height = 329
    TabOrder = 11
  end
  object btnSaldo: TButton
    Left = 280
    Top = 16
    Width = 113
    Height = 25
    Caption = 'Estado y Saldo Caja'
    TabOrder = 12
    OnClick = btnSaldoClick
  end
  object GroupBox1: TGroupBox
    Left = 192
    Top = 73
    Width = 201
    Height = 120
    TabOrder = 13
    object Label1: TLabel
      Left = 103
      Top = 15
      Width = 77
      Height = 26
      Caption = 'Ingresar billetes'#13#10'la izquierda'
    end
    object btnCobrar: TButton
      Left = 14
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Dar Vuelto'
      TabOrder = 0
      OnClick = btnCobrarClick
    end
    object lbledtcobrar: TLabeledEdit
      Left = 14
      Top = 80
      Width = 121
      Height = 21
      EditLabel.Width = 121
      EditLabel.Height = 13
      EditLabel.Caption = 'Ingresar monto a cobrar:'
      NumbersOnly = True
      TabOrder = 1
      Text = '1'
      OnExit = lbledtcobrarExit
    end
  end
  object btnLimpiar: TButton
    Left = 192
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Vaciar Caja'
    TabOrder = 14
    OnClick = btnLimpiarClick
  end
end
