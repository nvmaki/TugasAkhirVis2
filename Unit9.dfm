object Form9: TForm9
  Left = 403
  Top = 239
  Width = 554
  Height = 208
  Caption = 'Main Form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -8
    Top = 0
    Width = 545
    Height = 153
    Caption = 'Selamat Datang di Sistem Informasi Sekolah'
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 40
    object Menu1: TMenuItem
      Caption = 'Menu'
      object abel11: TMenuItem
        Caption = 'Tabel Siswa'
        OnClick = abel11Click
      end
      object abelWaliKelas1: TMenuItem
        Caption = 'Tabel Wali Kelas'
        OnClick = abelWaliKelas1Click
      end
      object abelPoin1: TMenuItem
        Caption = 'Tabel User'
        OnClick = abelPoin1Click
      end
      object abelPoin2: TMenuItem
        Caption = 'Tabel Poin'
        OnClick = abelPoin2Click
      end
      object abelKelas1: TMenuItem
        Caption = 'Tabel Kelas'
        OnClick = abelKelas1Click
      end
      object abelHubungan1: TMenuItem
        Caption = 'Tabel Hubungan'
        OnClick = abelHubungan1Click
      end
      object abelOrangTua1: TMenuItem
        Caption = 'Tabel Catatan'
        OnClick = abelOrangTua1Click
      end
      object abelOrangTua2: TMenuItem
        Caption = 'Tabel Orang Tua'
        OnClick = abelOrangTua2Click
      end
    end
    object Profile1: TMenuItem
      Caption = 'Profile'
    end
  end
end
