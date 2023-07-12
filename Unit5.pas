unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm5 = class(TForm)
    I_l2: TLabel;
    I_l1: TLabel;
    I_l4: TLabel;
    I_l10: TLabel;
    dgSiswadbgrd1: TDBGrid;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    e_1: TEdit;
    e_2: TEdit;
    e_3: TEdit;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxDBDataset4: TfrxDBDataset;
    frxrprt1: TfrxReport;
    zqry2: TZQuery;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure dgSiswadbgrd1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm5.b1Click(Sender: TObject);
begin
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
b6.Enabled:= True;
e_1.Enabled:= True;
e_2.Enabled:= True;
e_3.Enabled:= True;
end;

procedure TForm5.b2Click(Sender: TObject);
begin
 if e_1.Text='' then
  begin
    ShowMessage('Nama Kelas BELUM DIISI DENGAN BENAR');
    end else
    if e_2.Text=''then
    begin
     ShowMessage('jurusan BELUM DIISI DENGAN BENAR');
    end else
    if e_3.text=''then
    begin
     ShowMessage('Total kehadiran BELUM DIISI DENGAN BENAR');
    end else
  if Form5.zqry1.Locate(' Nama_kelas', e_1.Text, []) then
  begin
   ShowMessage('DATA SUDAH ADA DALAM SISTEM');
  end
  else
  begin
 zqry1.SQL.Clear;
 zqry1.SQL.Add('insert into kelas values(null, "' + e_1.Text + '", "' + e_2.Text + '", "' + e_3.Text +  '")');
    zqry1.ExecSQL;

 zqry1.SQL.Clear;
 zqry1.SQL.Add('select * from kelas');
 zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');
posisiawal;
end;
end;

procedure TForm5.b3Click(Sender: TObject);
begin
if (e_1.Text = '') or (e_2.Text = '') or (e_3.Text = '')  then
begin
  ShowMessage('INPUTAN WAJIB DIISI!');
end else
if e_1.Text = zqry1.Fields[1].AsString then
begin
 ShowMessage('DATA TIDAK ADA PERUBAHAN');
 posisiawal;
end else
begin
 ShowMessage('DATA BERHASIL DIUPDATE!');
zqry1.SQL.Clear;
    zqry1.SQL.Add('Update kelas set Nama_kelas = "' + e_1.Text +
      '", Jurusan = "' + e_2.Text + '", Total_kehadiran = "' + e_3.Text + '"where Id_poin = "' + id + '"');
    zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from poin');
zqry1.Open;

posisiawal;
end;
end;


procedure TForm5.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from siswa where Id_kelas = "' + Id +'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from poin');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end
 else
begin
 ShowMessage('DATA BATAL DIHAPUS');
 posisiawal;
end

end;

procedure TForm5.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm5.bersih;
begin
e_1.Clear;
e_2.Clear;
e_3.Clear;
end;



procedure TForm5.posisiawal;
begin
 bersih;
b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
b6.Enabled:= False;
e_1.Enabled:= false;
e_2.Enabled:= false;
e_3.Enabled:= false;
end;


procedure TForm5.b6Click(Sender: TObject);
begin
frxrprt1.ShowReport();
end;
procedure TForm5.FormShow(Sender: TObject);
begin
bersih;
b1.Enabled:=true;
b2.Enabled:=false;
b3.Enabled:=false;
b4.Enabled:=false;
b5.Enabled:=false;
b6.Enabled:=false;
e_1.Enabled:= false;
e_2.Enabled:= false;
e_3.Enabled:= false;
end;

procedure TForm5.dgSiswadbgrd1CellClick(Column: TColumn);
begin
 id := zqry1.Fields[0].AsString;
  e_1.Text := zqry1.Fields[1].AsString;
  e_2.Text := zqry1.Fields[2].AsString;
  e_3.Text := zqry1.Fields[3].AsString;
e_1.Enabled:= True;
e_2.Enabled:= True;
e_3.Enabled:= True;

b1.Enabled:= false;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;

end;

end.
