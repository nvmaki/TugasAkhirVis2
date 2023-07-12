unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls;

type
  TForm9 = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Profile1: TMenuItem;
    abel11: TMenuItem;
    abelWaliKelas1: TMenuItem;
    abelPoin1: TMenuItem;
    abelPoin2: TMenuItem;
    abelKelas1: TMenuItem;
    abelHubungan1: TMenuItem;
    abelOrangTua1: TMenuItem;
    abelOrangTua2: TMenuItem;
    procedure abel11Click(Sender: TObject);
    procedure abelWaliKelas1Click(Sender: TObject);
    procedure abelPoin1Click(Sender: TObject);
    procedure abelPoin2Click(Sender: TObject);
    procedure abelKelas1Click(Sender: TObject);
    procedure abelHubungan1Click(Sender: TObject);
    procedure abelOrangTua1Click(Sender: TObject);
    procedure abelOrangTua2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit1, Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8;

{$R *.dfm}

procedure TForm9.abel11Click(Sender: TObject);
begin
Form1.show;
end;

procedure TForm9.abelWaliKelas1Click(Sender: TObject);
begin
Form2.show;
end;

procedure TForm9.abelPoin1Click(Sender: TObject);
begin
Form3.show;
end;

procedure TForm9.abelPoin2Click(Sender: TObject);
begin
Form4.show;
end;

procedure TForm9.abelKelas1Click(Sender: TObject);
begin
Form5.show;
end;

procedure TForm9.abelHubungan1Click(Sender: TObject);
begin
Form6.show;
end;

procedure TForm9.abelOrangTua1Click(Sender: TObject);
begin
Form7.show;
end;

procedure TForm9.abelOrangTua2Click(Sender: TObject);
begin
Form8.show;
end;

end.
