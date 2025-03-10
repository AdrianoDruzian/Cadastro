unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Data.Win.ADODB, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    DBGrid1: TDBGrid;
    DsClientes: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery1idClient: TAutoIncField;
    ADOQuery1nome: TStringField;
    ADOQuery1email: TStringField;
    edtId: TDBEdit;
    ID: TLabel;
    Nome: TLabel;
    Label3: TLabel;
    EdtNome: TDBEdit;
    EdtEmail: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    procedure inativacampo;
    procedure ativacampo;
    procedure inativabotoes;
    procedure ativabotoes;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ativabotoes;
begin
  btnIncluir.Visible := True;
  btnAlterar.Visible := True;
  btnGravar.Visible := False;
  btnCancelar.Visible := False;
  btnExcluir.Visible := True;
end;

procedure TfrmPrincipal.ativacampo;
begin
  EdtId.Enabled := False;
  EdtNome.Enabled := True;
  Edtemail.Enabled := True;
end;

procedure TfrmPrincipal.btnAlterarClick(Sender: TObject);
begin
  ADOQuery1.Edit;
  ativacampo;
  edtNome.SetFocus;
  inativabotoes;
end;

procedure TfrmPrincipal.btnCancelarClick(Sender: TObject);
begin
  ADOQuery1.Cancel;
  inativacampo;
  ativabotoes;
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin

  if (Application.MessageBox('Deseja Realmente Excluir esse Registro?', 'Confirmação', MB_ICONQUESTION + MB_USEGLYPHCHARS) = mrYes) then
  begin
    ADOQuery1.delete;
  end;

end;

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
begin
  ADOQuery1.Post;
  //ADOConnection1.Close;
  ADOConnection1.Open;
  inativacampo;
  showmessage('Registro Saldo com Sucesso');
  ativabotoes;
end;

procedure TfrmPrincipal.btnIncluirClick(Sender: TObject);
begin
  ADOQuery1.Insert;
  ativacampo;
  edtNome.setFocus;
  inativabotoes;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
 ADOConnection1.Connected := True;
 ADOQuery1.Open();
 inativacampo;
 ativabotoes;
end;

procedure TfrmPrincipal.inativabotoes;
begin
  btnIncluir.Visible := False;
  btnAlterar.Visible := False;
  btnGravar.Visible := True;
  btnCancelar.Visible := True;
  btnExcluir.Visible :=False;
end;

procedure TfrmPrincipal.inativacampo;
begin
  EdtId.Enabled := False;
  EdtNome.Enabled := False;
  Edtemail.Enabled := False;
end;

end.
