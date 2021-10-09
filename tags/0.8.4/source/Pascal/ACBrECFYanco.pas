{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 02/07/2004:  Daniel Simoes de Almeida
|*   Inicio do desenvolvimento  baseada na Bematech
******************************************************************************}

{$I ACBr.inc}

unit ACBrECFYanco ;

interface
uses ACBrECFClass, ACBrUtil,
     Classes,
     {$IFDEF VisualCLX} QDialogs, QControls, QForms {$ENDIF}
     {$IFDEF VCL} Dialogs, Controls, Forms {$ENDIF} ;

const STX = #02 ;
      ETX = #03 ;
       
type

{ Classe filha de TACBrECFClass com implementaçao para Yanco }
TACBrECFYanco = class( TACBrECFClass )
 private
    { Tamanho da Resposta Esperada ao comando. Necessário, pois a Yanco nao
      usa um Sufixo padrão no fim da resposta da Impressora. }
    fsNumVersao : String ;
    fsNumSerie  : String ;
    fsNumECF    : String ;

    fsSEQ       : Integer ;

    Function PreparaCmd( cmd : String ) : String ;
 protected
    function GetDataHora: TDateTime; override ;
    function GetNumCupom: String; override ;
    function GetNumECF: String; override ;
    function GetNumSerie: String; override ;
    function GetNumVersao: String; override ;
    function GetSubTotal: Double; override ;
    function GetTotalPago: Double; override ;

    function GetEstado: TACBrECFEstado; override ;
    function GetGavetaAberta: Boolean; override ;
    function GetPoucoPapel : Boolean; override ;
    function GetChequePronto: Boolean; override ;

    Function VerificaFimLeitura(Retorno:String) : Boolean ; override ;

 public
    Constructor create( AOwner : TComponent  )  ;
    Destructor Destroy  ; override ;

    procedure Ativar ; override ;
    Function EnviaComando( cmd : String ) : String ; override ;

    Procedure AbreCupom( CPF_CNPJ : String = '') ; override ;
    Procedure VendeItem( Codigo, Descricao : String; AliqotaICMS : String;
       Qtd : Double ; ValorUnitario : Double; DescontoPorc : Double = 0;
       Unidade : String = '') ; override ;
    Procedure SubtotalizaCupom( DescontoAcrescimo : Double = 0;
       MensagemRodape : String  = '' ) ; override ;
    Procedure EfetuaPagamento( CodFormaPagto : String; Valor : Double;
       Observacao : String = ''; ImprimeVinculado : Boolean = false) ;
       override ;
    Procedure FechaCupom( Observacao : String = '') ; override ;
    Procedure CancelaCupom ; override ;
    Procedure CancelaItemVendido( NumItem : Integer ) ; override ;

    Procedure LeituraX ; override ;
    Procedure ReducaoZ(DataHora : TDateTime) ; override ;
    Procedure AbreRelatorioGerencial ; override ;
    Procedure LinhaRelatorioGerencial( Linha : String ) ; override ;
    Procedure AbreCupomVinculado(COO, CodFormaPagto, CodComprovanteNaoFiscal :
       String; Valor : Double) ; override ;
    Procedure LinhaCupomVinculado( Linha : String ) ; override ;
    Procedure FechaRelatorio ; override ;

    Procedure CancelaImpressaoCheque ; override ;

    Procedure MudaHorarioVerao  ; overload ; override ;
    Procedure MudaHorarioVerao( EHorarioVerao : Boolean ) ; overload ; override ;

    Procedure AbreGaveta ; override ;

    procedure CarregaAliquotas ; override ;
    procedure CarregaFormasPagamento ; override ;
 end ;

implementation
Uses ACBrBase,
     SysUtils, Math,
    {$IFDEF Delphi6_UP} DateUtils, StrUtils {$ELSE} ACBrD5, Windows{$ENDIF} ;

{ ----------------------------- TDJECFYanco ------------------------------ }

constructor TACBrECFYanco.create( AOwner : TComponent ) ;
begin
  inherited create( AOwner ) ;

  fpDevice.HandShake := hsRTS_CTS ;
  { Variaveis internas dessa classe }
  fsNumVersao := '' ;
  fsNumSerie  := '' ;
  fsNumECF    := '' ;
  fpModeloStr := 'Yanco' ;
  fsSEQ       := 0 ;
end;

destructor TACBrECFYanco.Destroy;
begin
  inherited Destroy ;
end;

procedure TACBrECFYanco.Ativar;
begin
  if not fpDevice.IsSerialPort  then
     raise Exception.Create('Esse modelo de impressora requer'+#10+
                            'Porta Serial:  (COM1, COM2, COM3, ...)');

  fpDevice.HandShake := hsRTS_CTS ;
  inherited Ativar ; { Abre porta serial }

  fsNumVersao := '' ;
  fsNumSerie  := '' ;
  fsNumECF    := '' ;

  try
     if EnviaComando('1FACBR') <> 'ACBR' then { 1F = Eco }   
        raise EACBrECFNaoInicializado.Create(
                 'Erro inicializando a impressora '+ModeloStr );

  except
     Desativar ;
     raise ;
  end ;
end;


Function TACBrECFYanco.EnviaComando( cmd : String ) : String ;
Var ErroMsg : String ;
    ACK : Byte ;
    Erro : String ;
begin

  Erro    := '00' ;
  result  := '' ;
  ErroMsg := '' ;
  ACK     := 0 ;
  fpComandoEnviado   := '' ;
  fpRespostaComando  := '' ;
  AguardandoResposta := true ;
  
  try
     if (not fpDevice.Ativo) then
        raise EACBrECFNaoInicializado.create(
                 'Componente ACBrECF não está Ativo');

     { Codificando CMD de acordo com o protocolo da Yanco }
     cmd := PreparaCmd( cmd ) ;

     while  not EmLinha( 3 ) do  { Impressora está em-linha ? }
     begin
        if Retentar and
           (MessageDlg('A impressora '+ModeloStr+' não está pronta.'+#10+#10+
                       'Deseja tentar novamente ?',mtConfirmation,
                       [mbYes,mbNo],0) = mrYes) then
           Continue ;

        raise EACBrECFSemResposta.create(
                 'Impressora '+ModeloStr+' não está em linha') ;
     end ;

     fpDevice.Serial.DeadlockTimeout := 2000 ; { Timeout p/ Envio }
     fpDevice.Serial.Purge ;                   { Limpa a Porta }

     while (ACK <> 20) do     { Se ACK = 20 Comando foi reconhecido }
     begin
        ACK := 0 ;

        try
           fpDevice.Serial.SendString( cmd );   { Eviando o comando }
        except
           if (not Retentar) or (MessageDlg(
              'Camandos não estão sendo enviados para Impressora '+ModeloStr+
              #10+'Deseja tentar novamente ?',
              mtConfirmation,[mbYes,mbNo],0) <> mrYes) then
              raise EACBrECFSemResposta.create(
                    'Erro ao enviar comandos para a Impressora '+ModeloStr)
           else
              continue ;
        end ;

        { espera ACK chegar na Porta por 1,5 seg }
        try
           try
              ACK := fpDevice.Serial.RecvByte( 1500 ) ;
           except
              raise EACBrECFSemResposta.create(
                    'Impressora '+ModeloStr+' não responde') ;
           end ;

           if ACK = 21 then    { retorno em caracter 21d=15h=NAK }
              raise EACBrECFSemResposta.create(
                    'Impressora '+ModeloStr+' não reconheceu o Comando')
           else if ACK <> 20 then
              raise EACBrECFSemResposta.create(
                    'Erro. Resposta da Impressora '+ModeloStr+' inválida') ;
        except
           on E : EACBrECFSemResposta do
           begin
              fpDevice.Serial.Purge ;

              if (not Retentar) or
                 (MessageDlg( E.Message +#10+#10+
                     'Deseja tentar novamente ?'+#10+#10+
                     'Se o problema persistir, verifique os cabos, ou'+#10+
                     'experimente desligar a impressora durante 5 seg,'+#10+
                     'liga-la novamente, e repetir a operação...',
                     mtConfirmation,[mbYes,mbNo],0) <> mrYes) then
                 raise ;
           end ;
           else
              raise ;
        end ;
     end ;

     if not fpDevice.Serial.CTS then
        fpDevice.Serial.RTS := false ;

     fpComandoEnviado := cmd ;

     { Chama Rotina da Classe mãe TACBrClass para ler Resposta. Se houver
       falha na leitura LeResposta dispara Exceçao }
     LeResposta ;

     { Separando o Retorno }
     Result := copy(fpRespostaComando, 8, Length(fpRespostaComando)-10 ) ;
     if copy(fpRespostaComando,1,5) <> copy(cmd,1,5) then
        Erro := 'EE'
     else
        if Length( Result ) = 2 then
           Erro := Result ;

     { Verificando por erros em Retorno }
     if Erro = '00' then
        ErroMsg := ''
     else if Erro = 'EE' then
        ErroMsg := 'Retorno da Impressora inválido.'
     else
        ErroMsg := 'Erro Código ('+Erro+')' ;

     { Yanco nao tem erro de "Pouco Papel" }

     if ErroMsg <> '' then
     begin
        ErroMsg := 'Erro retornado pela Impressora: '+ModeloStr+#10+#10+
                   ErroMsg ;
        raise EACBrECFSemResposta.create(ErroMsg) ;
     end ;
  finally
     AguardandoResposta := false ;
  end ;

end;

function TACBrECFYanco.VerificaFimLeitura(Retorno:String) : Boolean;
begin
  result := // fpDevice.Serial.CTS and
           (length(Retorno) > 10) and
           (copy(  Retorno, length(fpRespostaComando)-2,1) = ETX) ;

end;

Function TACBrECFYanco.PreparaCmd( cmd : String ) : String ; 
Var A, iSoma   : Integer ;
    CKS1, CKS2 : String ;
begin

  result := '' ;
  if cmd = '' then exit ;

  fsSEQ := fsSEQ + 1 ;
  if fsSEQ > 9999 then fsSEQ := 1 ;
  
  cmd   := STX + IntToStrZero( fsSEQ, 4 ) + cmd + ETX ;

  { Calculando a Soma dos caracteres ASC }
  iSoma := 0 ;
  For A := 1 to Length(cmd) do
     iSoma := iSoma + ord( cmd[A] ) ;

  if iSoma > 65536 then
     iSoma := iSoma mod 65536 ;

  { Calculando os dígitos }
  CKS1 := chr( Trunc( iSoma div 256 ) ) ;
  CKS2 := chr( iSoma mod 256 ) ;

  result := cmd + CKS1 + CKS2 ;
end ;


function TACBrECFYanco.GetDataHora: TDateTime;
Var RetCmd : String ;
    OldShortDateFormat : String ;
    Pos1 : Integer ;
begin
  RetCmd := EnviaComando( '34071' );  { Data }

  OldShortDateFormat := ShortDateFormat ;
  try
     ShortDateFormat := 'dd/mm/yy' ;
     result := StrToDate( StringReplace(Copy(RetCmd,1,8),'/',DateSeparator,
                          [rfReplaceAll] ) ) ;
  finally
     ShortDateFormat := OldShortDateFormat ;
  end ;
  RetCmd := EnviaComando( '34070' );  { Hora }
  Pos1   := pos(':',RetCmd) ;
  result := RecodeHour(  result,StrToIntDef(copy(RetCmd,1,Pos1-1),0)) ;
  result := RecodeMinute(result,StrToIntDef(copy(RetCmd,Pos1+1,2),0)) ;
end;

function TACBrECFYanco.GetNumCupom: String;
begin
  result := EnviaComando( '34077' ) ;
end;

function TACBrECFYanco.GetNumECF: String;
begin
  if fsNumECF = '' then
  begin
     fsNumECF := EnviaComando( '34076' ) ;
  end ;

  Result := fsNumECF
end;

function TACBrECFYanco.GetNumSerie: String;
begin
  if fsNumSerie = '' then
  begin
     fsNumSerie := copy(EnviaComando( '2D0' ), 8, 10) ;
  end ;

  result := fsNumSerie ;
end;

function TACBrECFYanco.GetNumVersao: String ;
begin
  if fsNumVersao = '' then
  begin
     fsNumVersao := copy(EnviaComando( '2D0' ), 18, 2) ;
  end ;

  Result := fsNumVersao ;
end;

function TACBrECFYanco.GetTotalPago: Double;
begin
  result := 0 ;   // TODO
end;

function TACBrECFYanco.GetSubTotal: Double;
begin
  result := 0 ;   // TODO
end;


function TACBrECFYanco.GetEstado: TACBrECFEstado;
begin
  result := estLivre ;   // TODO
end;

function TACBrECFYanco.GetGavetaAberta: Boolean;
begin
  result := false ;   // TODO
end;

function TACBrECFYanco.GetPoucoPapel: Boolean;
begin
  result := false ;   // TODO
end;

Procedure TACBrECFYanco.LeituraX ;
begin
  EnviaComando( '241             ') ;  { Espaço em branco = Supervisor C 13 }
end;

Procedure TACBrECFYanco.AbreGaveta ;
begin
  EnviaComando('26') ;
  sleep(100) ;
end;

Procedure TACBrECFYanco.ReducaoZ(DataHora: TDateTime) ;
begin
  EnviaComando( '221             ') ;  { Espaço em branco = Supervisor C 13 }
end;

Procedure TACBrECFYanco.MudaHorarioVerao ;
begin
end;

procedure TACBrECFYanco.MudaHorarioVerao(EHorarioVerao: Boolean);
begin
  if EHorarioVerao <> HorarioVerao then
     MudaHorarioVerao ;
end;

procedure TACBrECFYanco.AbreCupom(CPF_CNPJ: String);
begin
end;

procedure TACBrECFYanco.CancelaCupom;
begin
end;

procedure TACBrECFYanco.CancelaItemVendido(NumItem: Integer);
begin
end;

procedure TACBrECFYanco.EfetuaPagamento(CodFormaPagto: String;
  Valor: Double; Observacao: String; ImprimeVinculado: Boolean);
begin
  inherited EfetuaPagamento(CodFormaPagto, Valor, Observacao, ImprimeVinculado);

end;

procedure TACBrECFYanco.FechaCupom(Observacao: String);
begin
end;

procedure TACBrECFYanco.SubtotalizaCupom(DescontoAcrescimo: Double;
       MensagemRodape : String);
begin
end;

procedure TACBrECFYanco.VendeItem(Codigo, Descricao: String;
  AliqotaICMS : String; Qtd: Double; ValorUnitario: Double;
  DescontoPorc: Double; Unidade: String);
begin
end;

procedure TACBrECFYanco.CarregaAliquotas;
begin
  inherited CarregaAliquotas ;   { Cria fpAliquotas }

end;

procedure TACBrECFYanco.CarregaFormasPagamento;  { funçao Lenta +- 3 sec. }
begin
  inherited CarregaFormasPagamento ;   { Cria fpFormasPagamentos }

end;

procedure TACBrECFYanco.CancelaImpressaoCheque;
begin
end;

function TACBrECFYanco.GetChequePronto: Boolean;
begin
  result := false ;    // TODO
end;

procedure TACBrECFYanco.AbreRelatorioGerencial;
begin
end;

procedure TACBrECFYanco.LinhaRelatorioGerencial(Linha: String);
begin
end;

procedure TACBrECFYanco.AbreCupomVinculado(COO, CodFormaPagto,
  CodComprovanteNaoFiscal: String; Valor: Double);
Var FPG : TACBrECFFormaPagamento ;
    FPGDesc : String ;
begin
  FPG := AchaFPGIndice( CodFormaPagto ) ;

  if FPG = nil then
     raise Exception.create( 'Forma de Pagamento: '+CodFormaPagto+
                             ' não foi cadastrada.' ) ;

  COO       := Poem_Zeros( trim(COO) ,6) ;
  FPGDesc   := padL( FPG.Descricao, 16 ) ;

//   EnviaComando( #66 + FPGDesc, 5) ;
end;

procedure TACBrECFYanco.LinhaCupomVinculado(Linha: String);
begin
end;

procedure TACBrECFYanco.FechaRelatorio;
begin
end;

end.


