object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  Caption = 'Tarefa 1'
  ClientHeight = 449
  ClientWidth = 740
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LblColunas: TLabel
    Left = 8
    Top = 21
    Width = 45
    Height = 16
    Caption = 'Colunas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblTabelas: TLabel
    Left = 216
    Top = 21
    Width = 45
    Height = 16
    Caption = 'Tabelas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblCondicoes: TLabel
    Left = 423
    Top = 21
    Width = 58
    Height = 16
    Caption = 'Condi'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblSql: TLabel
    Left = 8
    Top = 250
    Width = 68
    Height = 16
    Caption = 'SQL Gerado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object MemoColunas: TMemo
    Left = 8
    Top = 40
    Width = 193
    Height = 193
    TabOrder = 0
  end
  object MemoTabelas: TMemo
    Left = 216
    Top = 40
    Width = 193
    Height = 193
    TabOrder = 1
  end
  object MemoCondicoes: TMemo
    Left = 423
    Top = 40
    Width = 193
    Height = 193
    TabOrder = 2
  end
  object MemoSQL: TMemo
    Left = 8
    Top = 272
    Width = 608
    Height = 169
    ReadOnly = True
    TabOrder = 3
  end
  object BtnGera: TButton
    Left = 622
    Top = 112
    Width = 110
    Height = 57
    Caption = 'Gera SQL'
    TabOrder = 4
    OnClick = BtnGeraClick
  end
  object spSql: TspQuery
    Left = 624
    Top = 408
  end
end
