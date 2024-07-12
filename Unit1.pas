unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls, frxClass,
  frxDBSet;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    cbb1: TComboBox;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    dbgrd1: TDBGrid;
    ds1: TDataSource;
    con1: TZConnection;
    zqry1: TZQuery;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    btn7: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
  private
    procedure ClearFields;
    procedure EnableFields(Enable: Boolean);
    procedure DisplayDiscount;
    procedure LoadAllData;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  con1.Connect;
  LoadAllData;
  cbb1.Items.Add('Yes');
  cbb1.Items.Add('No');
  dbgrd1.ReadOnly := True;
end;

procedure TForm1.ClearFields;
begin
  edt1.Clear;
  edt2.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  cbb1.ItemIndex := -1;
  lbl2.Caption := '';
end;

procedure TForm1.EnableFields(Enable: Boolean);
begin
  edt1.Enabled := Enable;
  edt2.Enabled := Enable;
  edt3.Enabled := Enable;
  edt4.Enabled := Enable;
  edt5.Enabled := Enable;
  edt6.Enabled := Enable;
  cbb1.Enabled := Enable;
end;

procedure TForm1.DisplayDiscount;
begin
  if cbb1.Text = 'Yes' then
    lbl2.Caption := '10%'
  else if cbb1.Text = 'No' then
    lbl2.Caption := '5%';
end;

procedure TForm1.LoadAllData;
begin
  zqry1.Close;
  zqry1.SQL.Text := 'SELECT * FROM kustomer';
  zqry1.Open;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  ClearFields;
  EnableFields(True);
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  with zqry1 do
  begin
    Append;
    FieldByName('nik').AsString := edt1.Text;
    FieldByName('nama').AsString := edt2.Text;
    FieldByName('telp').AsString := edt3.Text;
    FieldByName('email').AsString := edt4.Text;
    FieldByName('alamat').AsString := edt5.Text;
    FieldByName('member').AsString := cbb1.Text;
    Post;
  end;
  ClearFields;
  EnableFields(False);
  LoadAllData;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  if not zqry1.IsEmpty then
  begin
    with zqry1 do
    begin
      Edit;
      FieldByName('nik').AsString := edt1.Text;
      FieldByName('nama').AsString := edt2.Text;
      FieldByName('telp').AsString := edt3.Text;
      FieldByName('email').AsString := edt4.Text;
      FieldByName('alamat').AsString := edt5.Text;
      FieldByName('member').AsString := cbb1.Text;
      Post;
    end;
    ClearFields;
    EnableFields(False);
    LoadAllData;
  end;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  if not zqry1.IsEmpty then
  begin
    if MessageDlg('Apakah Anda Yakin Menghapus Data Ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      zqry1.Delete;
      ClearFields;
      EnableFields(False);
      LoadAllData;
    end;
  end
  else
    ShowMessage('Tidak Ada Data Untuk Dihapus!');
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  ClearFields;
  EnableFields(False);
  LoadAllData;
end;

procedure TForm1.cbb1Change(Sender: TObject);
begin
  DisplayDiscount;
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
  if not zqry1.IsEmpty then
  begin
    edt1.Text := zqry1.FieldByName('nik').AsString;
    edt2.Text := zqry1.FieldByName('nama').AsString;
    edt3.Text := zqry1.FieldByName('telp').AsString;
    edt4.Text := zqry1.FieldByName('email').AsString;
    edt5.Text := zqry1.FieldByName('alamat').AsString;
    cbb1.Text := zqry1.FieldByName('member').AsString;
    DisplayDiscount;
    EnableFields(True);
  end;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
  if Trim(edt6.Text) = '' then
  begin
    ShowMessage('Masukan NIK atau Nama Untuk Mencari Data');
    Exit;
  end;

  zqry1.Close;
  zqry1.SQL.Text := 'SELECT * FROM kustomer WHERE nama LIKE :nama OR nik LIKE :nik';
  zqry1.Params.ParamByName('nama').AsString := '%' + edt6.Text + '%';
  zqry1.Params.ParamByName('nik').AsString := '%' + edt6.Text + '%';
  zqry1.Open;

  if zqry1.RecordCount = 0 then
    ShowMessage('Data tidak ditemukan!');
end;

procedure TForm1.btn7Click(Sender: TObject);
begin
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\DATA KUSTOMER.fr3');
  frxReport1.ShowReport;
end;

end.

