object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Programa Exemplo'
  ClientHeight = 607
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object ID: TLabel
    Left = 8
    Top = 355
    Width = 11
    Height = 15
    Caption = 'ID'
  end
  object Nome: TLabel
    Left = 8
    Top = 403
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 8
    Top = 453
    Width = 34
    Height = 15
    Caption = 'E-mail'
  end
  object Panel1: TPanel
    Left = 0
    Top = 520
    Width = 847
    Height = 87
    Align = alBottom
    Color = 15175448
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 568
    object btnIncluir: TButton
      Left = 16
      Top = 16
      Width = 113
      Height = 52
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 176
      Top = 16
      Width = 113
      Height = 52
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnGravar: TButton
      Left = 344
      Top = 16
      Width = 113
      Height = 52
      Caption = 'Gravar'
      TabOrder = 2
      OnClick = btnGravarClick
    end
    object btnCancelar: TButton
      Left = 528
      Top = 16
      Width = 113
      Height = 52
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object btnExcluir: TButton
      Left = 704
      Top = 16
      Width = 113
      Height = 52
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = btnExcluirClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 847
    Height = 345
    Align = alTop
    DataSource = DsClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object edtId: TDBEdit
    Left = 8
    Top = 376
    Width = 41
    Height = 23
    DataField = 'idClient'
    DataSource = DsClientes
    Enabled = False
    TabOrder = 2
  end
  object EdtNome: TDBEdit
    Left = 8
    Top = 424
    Width = 257
    Height = 23
    CharCase = ecUpperCase
    DataField = 'nome'
    DataSource = DsClientes
    TabOrder = 3
  end
  object EdtEmail: TDBEdit
    Left = 8
    Top = 472
    Width = 257
    Height = 23
    CharCase = ecLowerCase
    DataField = 'email'
    DataSource = DsClientes
    TabOrder = 4
  end
  object DsClientes: TDataSource
    DataSet = ADOQuery1
    Left = 768
    Top = 296
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=Dados;Data Source=ADRIANODRUZIAN\SQLEXP' +
      'RESS;Use Procedure for Prepare=1;Auto Translate=True;Packet Size' +
      '=4096;Workstation ID=ADRIANODRUZIAN;Use Encryption for Data=Fals' +
      'e;Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 608
    Top = 296
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM CLIENTES')
    Left = 696
    Top = 296
    object ADOQuery1idClient: TAutoIncField
      AutoGenerateValue = arAutoInc
      FieldName = 'idClient'
      ReadOnly = True
    end
    object ADOQuery1nome: TStringField
      FieldName = 'nome'
      Size = 45
    end
    object ADOQuery1email: TStringField
      FieldName = 'email'
      Size = 25
    end
  end
end
