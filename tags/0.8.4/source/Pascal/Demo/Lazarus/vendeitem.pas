unit vendeitem;

{$mode objfpc}{$H+}

interface

uses
  LResources, SysUtils, Variants, Types, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type

  { TfrVendeItem }

  TfrVendeItem = class(TForm)
    Label1: TLabel;
    edCodigo: TEdit;
    Label2: TLabel;
    edDescricao: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edICMS: TEdit;
    Label6: TLabel;
    edDesconto: TEdit;
    Label7: TLabel;
    edUN: TEdit;
    Button1: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edPrecoUnita: TEdit;
    Button2: TButton;
    edQtd: TEdit;
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

procedure TfrVendeItem.Button1Click(Sender: TObject);
begin
//  if Form1.ACBrECF1.AguardandoResposta then
//     raise Exception.Create('Aguarde imprimindo Item anterior...') ;

  Button1.Enabled := False ;

  try
     Form1.ACBrECF1.VendeItem( edCodigo.Text, edDescricao.Text,
                               edICMS.Text, StrToFloatDef( edQtd.Text, 0 ),
                               StrToFloatDef( edPrecoUnita.Text,0 ),
                               StrToFloatDef( edDesconto.Text,0 ), edUN.Text );
     Form1.mResp.Lines.Add( 'Vende Item: Cod:'+ edCodigo.Text+
                            ' Desc'+ edDescricao.Text+
                            ' Aliq:'+edICMS.Text +
                            ' Qtd:'+edQtd.Text +
                            ' Pre�o:'+edPrecoUnita.Text +
                            ' Desc:'+edDesconto.Text +
                            ' Un:'+edUN.Text );
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
