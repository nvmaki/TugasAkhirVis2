unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, ComCtrls, Grids,
  DBGrids;

type
  TForm8 = class(TForm)
    I_l2: TLabel;
    I_l1: TLabel;
    I_l6: TLabel;
    I_l4: TLabel;
    I_l5: TLabel;
    I_l7: TLabel;
    I_l10: TLabel;
    I_l11: TLabel;
    I_l12: TLabel;
    I_l13: TLabel;
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
    e_4: TEdit;
    dtp1: TDateTimePicker;
    cbb1: TComboBox;
    e_5: TEdit;
    e_6: TEdit;
    cbb3: TComboBox;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    zqry2: TZQuery;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure dgSiswadbgrd1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  id:string;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm8.b1Click(Sender: TObject);
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
e_4.Enabled:= True;
dtp1.Enabled:= True;
cbb1.Enabled:= True;
e_5.Enabled:= True;
e_6.Enabled:= True;
cbb3.Enabled:= True;
end;

procedure TForm8.b2Click(Sender: TObject);
begin
 if e_1.Text='' then
  begin
    ShowMessage('NAMA ORANG TUA BELUM DIISI DENGAN BENAR');
    end else
    if e_2.Text=''then
    begin
     ShowMessage('No TELP BELUM DIISI DENGAN BENAR');
    end else
    if e_3.text=''then
    begin
     ShowMessage('Pendidikan terakhir BELUM DIISI DENGAN BENAR');
    end else
    if e_4.text=''then
    begin
    ShowMessage('PEKERJAAN BELUM SESUAI');
    end else
    if cbb1.Text='' then
    begin
     ShowMessage(' STATUS PEKERJAAN BELUM DIISI DENGAN BENAR');
    end else
    if e_5.text=''then
    begin
     ShowMessage('NIK NOMOR KTP  BELUM SESUAI');
    end else
    if e_6.Text='' then
     begin
     ShowMessage('ALAMAT ORANG TUA BELUM SESUAI');
    end else
     if cbb3.Text='' then
    begin
     ShowMessage('STATUS ORANG TUA BELUM DIISI DENGAN BENAR');
    end else
  if Form8.zqry1.Locate('Nama_orangtua',e_1.Text,[]) then
  begin
   ShowMessage('DATA SUDAH ADA DALAM SISTEM');
  end else
  begin

 zqry1.SQL.Clear;
 zqry1.SQL.Add('insert into orang_tua values(null,"'+e_1.Text+'","' + FormatDateTime('yyyy-mm-dd', dtp1.Date) + '","' + e_2.Text + '","' +e_3.Text + '","' + cbb1.Text +'","'  + e_4.Text + '","' + cbb3.Text + '","' + e_5.Text + '","' +  e_6.Text +'")');
 zqry1.ExecSQL ;

 zqry1.SQL.Clear;
 zqry1.SQL.Add('select * from orang_tua');
 zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');
posisiawal;
end;
end;
procedure TForm8.b3Click(Sender: TObject);
begin
if (e_1.Text= '')or (e_2.Text ='')or(e_3.Text= '')or (e_4.Text ='')or(cbb1.Text='')or(e_5.Text ='')or(e_6.Text='')or(cbb3.Text='') then
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
zqry1.SQL.Add('Update orang_tua set Nama_orangtua = "'+e_1.Text+'",Telp="'+e_2.Text+'",Pendidikan_terakhir="'+e_3.Text+'",Pekerjaan="'+e_4.Text+'" Nik_nomor KTP ="'+ e_5.Text +'", Alamat_org_tua = "' + e_6.Text + '" where Id_org_tua = "' + id + '"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from orang_tua');
zqry1.Open;

posisiawal;
end;
end;


procedure TForm8.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from orang_tua where Id_orgtua ="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from orang_tua');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');
 posisiawal;
end

end;

procedure TForm8.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm8.bersih;
begin
e_1.Clear;
e_2.Clear;
e_3.Clear;
e_4.Clear;
e_5.Clear;
e_6.Clear;
end;



procedure TForm8.posisiawal;
begin
 bersih;
b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
b5.Enabled:= False;
e_1.Enabled:= false;
e_2.Enabled:= false;
e_3.Enabled:= false;
e_4.Enabled:= false;
dtp1.Enabled:= false;
cbb1.Enabled:= false;
e_5.Enabled:= false;
e_6.Enabled:= false;
cbb3.Enabled:= false;
end;


procedure TForm8.b6Click(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

procedure TForm8.FormShow(Sender: TObject);
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
e_4.Enabled:= false;
dtp1.Enabled:= false;
cbb1.Enabled:= false;
e_5.Enabled:= false;
e_6.Enabled:= false;
cbb3.Enabled:= false;
end;

procedure TForm8.dgSiswadbgrd1CellClick(Column: TColumn);
begin
Id:= zqry1.Fields[0].AsString;
e_1.Text:= zqry1.Fields[1].AsString;
e_2.Text:= zqry1.Fields[2].AsString;
e_3.Text:= zqry1.Fields[3].AsString;
e_4.Text:= zqry1.Fields[4].AsString;
cbb1.Text:= zqry1.Fields[5].AsString;
e_5.Text:= zqry1.Fields[6].AsString;
e_6.Text:= zqry1.Fields[7].AsString;
cbb3.Text:= zqry1.Fields[8].AsString;
e_1.Enabled:= True;
e_2.Enabled:= True;
e_3.Enabled:= True;
e_4.Enabled:= True;
dtp1.Enabled:= True;
cbb1.Enabled:= True;
e_5.Enabled:= True;
e_6.Enabled:= True;
cbb3.Enabled:= True;

b1.Enabled:= false;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;

end;

end.
