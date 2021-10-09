unit vendeitem;

{$mode objfpc}{$H+}

interface

uses
  LResources, SysUtils, Variants, Types, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type

  { TfrVendeItem }

  TfrVendeItem = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Button1: TButton;
    Button2: TButton;
    edCodigo: TEdit;
    edDesconto: TEdit;
    edDescricao: TEdit;
    edICMS: TEdit;
    edPrecoUnita: TEdit;
    edQtd: TEdit;
    edUN: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    rbPercentagem: TRadioButton;
    rbValor: TRadioButton;
    procedure edPrecoUnitaChange(Sender: TObject);
    procedure edQtdChange(Sender: TObject);
    procedure edQtdKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frVendeItem: TfrVendeItem;

implementation

uses ecfteste1;

procedure TfrVendeItem.edQtdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [',','.'] then
     Key := DecimalSeparator ;
end;

procedure TfrVendeItem.edQtdChange(Sender: TObject);
begin

end;

procedure TfrVendeItem.edPrecoUnitaChange(Sender: TObject);
begin

end;

procedure TfrVendeItem.Button1Click(Sender: TObject);
Var Desc : Char ;
begin
//  if Form1.ACBrECF1.AguardandoResposta then
//     raise Exception.Create('Aguarde imprimindo Item anterior...') ;

  Button1.Enabled := False ;
  Desc := '%' ;
  if rbValor.Checked then
     Desc := '$' ;

  try
     Form1.ACBrECF1.VendeItem( edCodigo.Text, edDescricao.Text,
                               edICMS.Text, StrToFloatDef( edQtd.Text, 0 ),
                               StrToFloatDef( edPrecoUnita.Text,0 ),
                               StrToFloatDef( edDesconto.Text,0 ), edUN.Text,
                               Desc );
     Form1.mResp.Lines.Add( 'Vende Item: Cod:'+ edCodigo.Text+
                            ' Desc'+ edDescricao.Text+
                            ' Aliq:'+edICMS.Text +
                            ' Qtd:'+edQtd.Text +
                            ' Preço:'+edPrecoUnita.Text +
                            ' Desc:'+edDesconto.Text +
                            ' Un:'+edUN.Text +
                            ' Desc:'+Desc );
     Form1.AtualizaMemos ;
  finally
     Button1.Enabled := True ;
  end ;
end;

procedure TfrVendeItem.Button2Click(Sender: TObject);
begin
  close ;
end;

initialization
   {$I vendeitem.lrs}

end.
