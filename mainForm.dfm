object fTarefas: TfTarefas
  Left = 0
  Top = 0
  Caption = 'Tarefas'
  ClientHeight = 359
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MenuTarefas
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object MenuTarefas: TMainMenu
    Left = 24
    Top = 304
    object mTarefas: TMenuItem
      Caption = 'Tarefas'
      object itemTarefas1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = itemTarefas1Click
      end
      object itemTarefas2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = itemTarefas2Click
      end
      object itemTarefas3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = itemTarefas3Click
      end
    end
  end
end
