{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera??o com equipa- }
{ mentos de Automa??o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc? pode obter a ?ltima vers?o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca ? software livre; voc? pode redistribu?-la e/ou modific?-la }
{ sob os termos da Licen?a P?blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers?o 2.1 da Licen?a, ou (a seu crit?rio) }
{ qualquer vers?o posterior.                                                   }
{                                                                              }
{  Esta biblioteca ? distribu?da na expectativa de que seja ?til, por?m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl?cita de COMERCIABILIDADE OU      }
{ ADEQUA??O A UMA FINALIDADE ESPEC?FICA. Consulte a Licen?a P?blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN?A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc? deve ter recebido uma c?pia da Licen?a P?blica Geral Menor do GNU junto}
{ com esta biblioteca; se n?o, escreva para a Free Software Foundation, Inc.,  }
{ no endere?o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc? tamb?m pode obter uma copia da licen?a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim?es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra?a Anita Costa, 34 - Tatu? - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}
{                                                                              }
{******************************************************************************
|* Historico
|*
|* 30/10/2008: Primeira Versao
|*    Daniel Simoes de Almeida
|*  - Migra?ao do componente TACBrDevice de ACBrBase.pas para essa Unit para
|*    evitar que componentes, que usem TACBrComponente (de ACBrBase.pas) mas que
|*    nao usem TACBrDevice, carreguem codigo desnecessario como por exemplo
|*    toda a classe SynaSer
******************************************************************************}

{$I ACBr.inc}

//{$DEFINE ThreadEnviaLPT}  { Use // no inicio dessa linha para desabilitar a Thread}

{$IFDEF LINUX}
   { Thread TACBrThreadEnviaLPT nao funciona muito bem no Linux }
   { infelizmente, Strings grandes nao funcionam bem no LINUX usando a Thread}
  {$UNDEF ThreadEnviaLPT}
{$ENDIF}

unit ACBrDevice ;

interface

uses synaser, {Unit da SynaSer (comunica??o serial) }
     SysUtils,
     ACBrConsts, 
     {$IFDEF COMPILER6_UP}
        DateUtils, Types, StrUtils,
     {$ELSE}
        Windows, ACBrD5,
     {$ENDIF}
     {$IFNDEF CONSOLE}
       {$IFDEF VisualCLX}
          QForms, QPrinters,
       {$ELSE}
          Forms, Printers,
       {$ENDIF}
     {$ENDIF}
     Classes ;

type

TACBrECFEstado = (estNaoInicializada, { Porta Serial ainda nao foi aberta }
                  estDesconhecido, {Porta aberta, mas estado ainda nao definido}
                  estLivre, { Impressora Livre, sem nenhum cupom aberto,
                              pronta para nova venda, Reducao Z e Leitura X ok,
                              pode ou nao j? ter ocorrido 1? venda no dia...}
                  estVenda, { Cupom de Venda Aberto com ou sem venda do 1? Item}
                  estPagamento, { Iniciado Fechamento de Cupom com Formas Pagto
                                  pode ou nao ter efetuado o 1? pagto. Nao pode
                                  mais vender itens, ou alterar Subtotal}
                  estRelatorio, { Imprimindo Cupom Fiscal Vinculado ou
                                  Relatorio Gerencial }
                  estBloqueada, { Redu?ao Z j? emitida, bloqueada at? as 00:00 }
                  estRequerZ, {Reducao Z dia anterior nao emitida. Emita agora }
                  estRequerX,  {Esta impressora requer Leitura X todo inicio de
                               dia. Imprima uma Leitura X para poder vender}
                  estNaoFiscal  { Comprovante Nao Fiscal Aberto }
                  ) ;
TACBrECFEstadoSet = set of TACBrECFEstado ;

TACBrGAVAberturaAntecipada = ( aaIgnorar , aaException, aaAguardar ) ;

TACBrETQOrientacao = (orNormal, or270, or180, or90);

{Criando o tipo enumerado para tipos de c?digo de barras }
TACBrECFTipoCodBarra =  ( barEAN13, barEAN8, barSTANDARD, barINTERLEAVED,
                         barCODE128, barCODE39, barCODE93, barUPCA,
                         barCODABAR, barMSI, barCODE11 );

{Criando o tipo enumerado para tipo de documentos em Leitura da MFD }
TACBrECFTipoDocumento = ( docRZ, docLX, docCF, docCFBP, docCupomAdicional,
                          docCFCancelamento, docCCD, docAdicionalCCD,
                          docSegViaCCD, docReimpressaoCCD, docEstornoCCD,
                          docCNF, docCNFCancelamento, docSangria, docSuprimento,
                          docEstornoPagto, docRG, docLMF, docTodos);
TACBrECFTipoDocumentoSet = set of TACBrECFTipoDocumento;

TACBrSerialParity = (pNone, pOdd, pEven, pMark, pSpace) ;
TACBrSerialStop   = (s1, s1eMeio, s2) ;
TACBrHandShake    = (hsNenhum, hsXON_XOFF, hsRTS_CTS, hsDTR_DSR) ;

{ ACBrDevice ? um componente apenas para usarmos o recurso de AutoExpand do
  ObjectInspector para SubComponentes, poderia ser uma Classe }
TACBrDevice = class( TComponent )
  private
    fsHardFlow: Boolean;
    fsSoftFlow: Boolean;
    fsParity: Char ;
    fsData : Integer;
    fsBaud: Integer;
    fsStop: Integer ;
    fsPorta: String;
    fsTimeOut: Integer ;
    fsAtivo: Boolean;

    fsHandShake: TACBrHandShake;
    fsSendBytesCount: Integer;
    fsSendBytesInterval: Integer;
    fProcessMessages: Boolean;

    procedure ConfiguraSerial ;
    {$IFDEF ThreadEnviaLPT}
    procedure EnviaStrThread( AString : AnsiString ) ;
    {$ENDIF}

    procedure SetBaud(const Value: Integer);
    procedure SetData(const Value: Integer);
    procedure SetHardFlow(const Value: Boolean);
    function GetParity: TACBrSerialParity;
    procedure SetParity(const Value: TACBrSerialParity);
    procedure SetSoftFlow(const Value: Boolean);
    function GetStop: TACBrSerialStop;
    procedure SetStop(const Value: TACBrSerialStop);
    procedure SetPorta(const Value: String);
    procedure SetTimeOut(const Value: Integer);
    procedure SetOnStatus(const Value: THookSerialStatus);
    function GetOnStatus: THookSerialStatus;
    procedure SetAtivo(const Value: Boolean);
    procedure SetHandShake(const Value: TACBrHandShake);
    function GetParamsString: String;
    procedure SetParamsString(const Value: String);
    function GetMaxBandwidth: Integer;
    procedure SetMaxBandwidth(const Value: Integer);
  public
    Serial : TBlockSerial ;
    PosImp : TPoint;

    property Ativo : Boolean read fsAtivo write SetAtivo ;

    property Porta   : String  read fsPorta write SetPorta ;
    property TimeOut : Integer read fsTimeOut write SetTimeOut ;
    Function EmLinha( lTimeOut : Integer = 1) : Boolean  ;

    property ParamsString : String read GetParamsString write SetParamsString ;

    constructor Create(AOwner: TComponent); override ;
    destructor Destroy ; override ;

    procedure Ativar ;
    procedure Desativar ;
    Procedure EnviaString( const AString : AnsiString ) ;

    Procedure ImprimePos(const Linha, Coluna : Integer; const AString: AnsiString) ;
    Procedure Eject ;

    Procedure SetDefaultValues ;
    Function IsSerialPort : Boolean ;
    Function IsTXTFilePort: Boolean ;

  published
     property Baud     : Integer read fsBaud write SetBaud default 9600 ;
     property Data     : Integer read fsData write SetData default 8 ;
     property Parity   : TACBrSerialParity read GetParity write SetParity
                         default pNone ;
     property Stop     : TACBrSerialStop read GetStop write SetStop
                         default s1 ;
     property MaxBandwidth : Integer read  GetMaxBandwidth
                                     write SetMaxBandwidth default 0 ;
     property SendBytesCount : Integer read  fsSendBytesCount
                                       write fsSendBytesCount  default 0 ;
     property SendBytesInterval : Integer read  fsSendBytesInterval
                                       write fsSendBytesInterval  default 0 ;
     property HandShake : TACBrHandShake read fsHandShake write SetHandShake
                         default hsNenhum ;
     property SoftFlow : Boolean read fsSoftFlow write SetSoftFlow
                         default false ;
     property HardFlow : Boolean read fsHardFlow write SetHardFlow
                         default false ;

     { propriedade que ativa/desativa o processamento de mensagens do windows }
     property ProcessMessages : Boolean read fProcessMessages
        write fProcessMessages default True ;

     property OnStatus : THookSerialStatus read GetOnStatus write SetOnStatus ;
end ;

{ Essa classe ? usada pela fun??o EnviaStrThread para detectar se os Dados
  estao sendo "gravados" com sucesso na porta paralela ou arquivo. }
TACBrThreadEnviaLPT = class(TThread)
  private
    { Private declarations }
    fsTextoAEnviar : String ;
    fsLinhaAtual: Integer;
    fsOwner : TObject ;
  protected
    procedure Execute ; override;
  public
    constructor Create(AOwner : TObject; AString : String) ;
    property LinhaAtual : Integer read fsLinhaAtual ;
  end;


implementation
Uses ACBrUtil ;

{ TACBrDevice }
constructor TACBrDevice.create( AOwner : TComponent );
begin
  inherited Create( AOwner ) ;

  { Classe SynaSer para acesso direto a Serial }
  Serial := TBlockSerial.Create ;
  Serial.RaiseExcept := true ;

  { Variaveis Internas }
  fsPorta   := '' ;
  fsTimeOut := cTimeout ;

  fsSendBytesCount    := 0 ;
  fsSendBytesInterval := 0 ;

  fProcessMessages := True ;

  SetDefaultValues ;
end;

destructor TACBrDevice.Destroy;
begin
  Serial.Free ;
  IOResult ;

  inherited Destroy ;
end;

procedure TACBrDevice.SetDefaultValues;
begin
  fsHardFlow := false ;
  fsSoftFlow := false ;
  fsHandShake:= hsNenhum ;
  fsParity   := 'N' ;
  fsData     := 8 ;
  fsBaud     := 9600 ;
  fsStop     := 0 ;

  PosImp.X   := 0 ;
  PosImp.Y   := 0 ;
end;


procedure TACBrDevice.SetAtivo(const Value: Boolean);
begin
  if Value then
     Ativar
  else
     Desativar ;
end;

procedure TACBrDevice.Ativar;
Var ArqPrn : TextFile ;
begin
  if fsAtivo then exit ;

  if fsPorta = '' then
     raise Exception.Create(ACBrStr(cACBrDeviceAtivarPortaException));

  if IsSerialPort then
   begin
     try
        Serial.CloseSocket ;  { Fecha se ficou algo aberto }
        Serial.DeadlockTimeout := (TimeOut * 1000) ;
        Serial.Connect( fsPorta ) ;
        ConfiguraSerial ;

        Serial.Purge ;  { Limpa Buffer de envio e recep??o }
     except
        try
           Serial.RaiseExcept := false ;
           Serial.CloseSocket ;
        finally
           Serial.RaiseExcept := true ;
        end ;
        raise ;
     end ;
   end
  else
   begin{ Tenta Abrir Arquivo/Porta para ver se xiste e est? disponivel}
      try
         try
            try    { Tenta 2x pois as vezes o handle nao fica livre }
               AssignFile( ArqPrn, Porta );
               Rewrite( ArqPrn ) ;
            except
               {$I-} {$IFNDEF FPC}System.{$ENDIF}CloseFile( ArqPrn ) ; {$I+}
               AssignFile( ArqPrn, Porta );
               Rewrite( ArqPrn ) ;
            end ;
         finally
            {$I-} {$IFNDEF FPC}System.{$ENDIF}CloseFile( ArqPrn ) ; {$I+}
         end ;
      except
         on E : Exception do
         begin
            raise Exception.Create( Format(ACBrStr(cACBrDeviceAtivarException),
                                           [ Porta , E.Message]) );
         end ;
      end ;
   end ;

  fsAtivo := true ;
end;

procedure TACBrDevice.ConfiguraSerial ;
begin
  if not Serial.InstanceActive then exit ;

  Serial.Config( fsBaud, fsData, fsParity, fsStop, fsSoftFlow, fsHardFlow);

  if HandShake = hsRTS_CTS then
     Serial.RTS := true
  else if HandShake = hsDTR_DSR then
     Serial.DTR := true ;
end ;

procedure TACBrDevice.Desativar;
begin
  if not fsAtivo then exit ;

  if IsSerialPort then
  begin
     try
        Serial.RaiseExcept := false ;
        Serial.CloseSocket ;
     finally
        Serial.RaiseExcept := true ;
     end ;
  end ;

  fsAtivo := false ;
end;

function TACBrDevice.GetOnStatus: THookSerialStatus;
begin
  result := Serial.OnStatus ;
end;

procedure TACBrDevice.SetOnStatus(const Value: THookSerialStatus);
begin
  Serial.OnStatus := Value ;
end;

procedure TACBrDevice.SetBaud(const Value: Integer);
begin
  if fsBaud = Value then exit ;

  if (Value < 50) or (Value > 4000000) then
     raise Exception.Create( ACBrStr(cACBrDeviceSetBaudException) );

  fsBaud := Value ;
  ConfiguraSerial ;
end;

procedure TACBrDevice.SetData(const Value: Integer);
begin
  if fsData = Value then exit ;

  if (Value < 5) or (Value > 8) then
     raise Exception.Create( ACBrStr(cACBrDeviceSetDataException) );

   fsData := Value ;
   ConfiguraSerial ;
end;

function TACBrDevice.GetParity: TACBrSerialParity;
begin
  case fsParity of
     'O' : result := pOdd   ;
     'E' : result := pEven  ;
     'M' : result := pMark  ;
     'S' : result := pSpace ;
  else
     result := pNone ;
  end;
end;

procedure TACBrDevice.SetParity(const Value: TACBrSerialParity);
begin
  if Parity = Value then exit ;

  case Value of
     pOdd   : fsParity := 'O' ;
     pEven  : fsParity := 'E' ;
     pMark  : fsParity := 'M' ;
     pSpace : fsParity := 'S' ;
  else
     fsParity := 'N' ;
  end;
  ConfiguraSerial ;
end;

function TACBrDevice.GetStop: TACBrSerialStop;
begin
  case fsStop of
     1 : result := s1eMeio ;
     2 : result := s2      ;
  else
     result := s1 ;
  end;
end;

procedure TACBrDevice.SetStop(const Value: TACBrSerialStop );
begin
  if Stop = Value then exit ;

  case Value of
     s1eMeio : fsStop := 1 ;
     s2      : fsStop := 2 ;
  else
     fsStop  := 0 ;
  end;
  ConfiguraSerial ;
end;

function TACBrDevice.GetMaxBandwidth: Integer;
begin
  Result := Serial.MaxSendBandwidth ;
end;

procedure TACBrDevice.SetMaxBandwidth(const Value: Integer);
begin
  Serial.MaxLineLength := Value ;
end;

procedure TACBrDevice.SetHardFlow(const Value: Boolean);
begin
  if Value then
     HandShake := hsRTS_CTS
  else
     if HandShake = hsRTS_CTS then
        HandShake := hsNenhum ;
end;

procedure TACBrDevice.SetSoftFlow(const Value: Boolean);
begin
  if Value then
     HandShake := hsXON_XOFF
  else
     if HandShake = hsXON_XOFF then
        HandShake := hsNenhum ;
end;

procedure TACBrDevice.SetHandShake(const Value: TACBrHandShake);
begin
  fsHardFlow  := (Value = hsRTS_CTS);
  fsSoftFlow  := (Value = hsXON_XOFF);

  fsHandShake := Value;
  ConfiguraSerial ;
end;

procedure TACBrDevice.SetPorta(const Value: String);
Var StrTemp : String ;
begin
  if fsPorta = Value then exit ;

  if Ativo then
     raise Exception.Create( ACBrStr(cACBrDeviceSetPortaException) );

  StrTemp := UpperCase( Value ) ;
  if (pos('LPT',StrTemp) = 1) or (pos('COM',StrTemp) = 1) then
     fsPorta := StrTemp
  else
     fsPorta := Value ;
end;

procedure TACBrDevice.SetTimeOut(const Value: Integer);
begin
  if Value = fsTimeOut then
     exit ;

  if Value < 1 then
     fsTimeOut := 1
  else
     fsTimeOut := Value ;

  if IsSerialPort then
     Serial.DeadlockTimeout := (TimeOut * 1000) ;
end;

function TACBrDevice.EmLinha( lTimeOut : Integer) : Boolean;
var TempoLimite : TDateTime ;
begin
  if not IsSerialPort then
  begin
     try
        {$IFDEF ThreadEnviaLPT}
        EnviaStrThread(#0);  { Tenta escrever algo (#0) na Porta/Arquivo }
        {$ENDIF}
        Result := true ;
     except
        Result := false ;
     end ;

     exit ;
  end ;

  result := false ;
  if lTimeout < 1 then
     lTimeOut := 1 ;

  if not Serial.InstanceActive then
     exit ;

  TempoLimite := IncSecond( now, lTimeOut)  ;
  while (not result) and (now < TempoLimite) do
  begin
     case HandShake of
       hsRTS_CTS :
          Result := Serial.CTS ;

       hsDTR_DSR :
          Result := Serial.DSR ;
     else ;
        Result := true ;    { Nao h? sinal de HandShake para verificar }
     end;

     if not result then
     begin
        {$IFNDEF CONSOLE}
          if fProcessMessages then
             Application.ProcessMessages ;  { para redesenhar a tela do programa }
        {$ENDIF}
        sleep(10) ;
     end ;
  end ;
end;

function TACBrDevice.IsSerialPort: Boolean;
begin
   Result := (pos('COM', fsPorta) =  1)
             {$IFDEF LINUX}
               or (pos('/dev/tty', fsPorta) =  1)
             {$ELSE}
               or (copy(fsPorta,1,4) = '\\.\')
             {$ENDIF}
end;

function TACBrDevice.IsTXTFilePort: Boolean;
begin
  Result := UpperCase(RightStr(fsPorta,4)) = '.TXT' ;
end;

function TACBrDevice.GetParamsString: String;
Var sStop, sHandShake : String ;
begin
  Result := '' ;

  if fsBaud <> 9600 then
     Result := Result + ' BAUD='+IntToStr(fsBaud) ;

  if fsData <> 8 then
     Result := Result + ' DATA='+IntToStr(fsData) ;

  if fsParity <> 'N' then
     Result := Result + ' PARITY='+fsParity ;

  if fsStop <> 0 then
  begin
     if fsStop = 2 then
        sStop := '2'
     else if fsStop = 1 then
        sStop := '1,5'
     else
        sStop := '1' ;

     Result := Result + ' STOP='+sStop ;
  end ;

  if fsHandShake <> hsNenhum then
  begin
     if fsHandShake = hsXON_XOFF then
        sHandShake := 'XON/XOFF'
     else if fsHandShake = hsDTR_DSR then
        sHandShake := 'DTR/DSR'
     else if fsHandShake = hsRTS_CTS then
        sHandShake := 'RTS/CTS' ;

     Result := Result +  ' HANDSHAKE='+sHandShake ;
  end ;

  if fsHardFlow then
     Result := Result + ' HARDFLOW' ;

  if fsSoftFlow then
     Result := Result + ' SOFTFLOW' ;

  if MaxBandwidth > 0 then
     Result := Result + ' MAXBANDWIDTH='+IntToStr(MaxBandwidth) ;
     
  Result := Trim(Result) ;
end;

procedure TACBrDevice.SetParamsString(const Value: String);
Var S, Linha   : String ;
  Function GetValue( LinhaParametros, Parametro : String ) : String ;
    Var P   : Integer ;
        Sub : String ;
  begin
    Result := '' ;
    P := pos(Parametro,LinhaParametros) ;

    if P > 0 then
    begin
      Sub := Trim(copy(LinhaParametros, P + Length(Parametro) ,200)) ;
      if copy(Sub,1,1) = '=' then
         Sub := Trim(copy(Sub,2,200)) ;

      P := pos(' ',Sub) ;
      if P = 0 then
         P := Length(Sub) ;

      Result := Trim(copy(Sub,1,P)) ;
    end ;
  end ;
begin
  SetDefaultValues ;

  Linha := Trim(UpperCase(Value)) ;

  Baud := StrToIntDef(GetValue(Linha,'BAUD'),Baud) ;

  S := GetValue(Linha,'PARITY') ;
  if S <> '' then
     if S[1] in ['O','E','M','S','N'] then
        fsParity := S[1] ;

  Data := StrToIntDef(GetValue(Linha,'DATA'),Data) ;

  S := GetValue(Linha,'STOP') ;
  if S = '1' then
    Stop := s1
  else if S = '1,5' then
    Stop := s1eMeio
  else if S = '2' then
    Stop := s2 ;

  HardFlow := (pos('HARDFLOW',Linha) > 0) ;
  SoftFlow := (pos('SOFTFLOW',Linha) > 0) ;

  S := GetValue(Linha,'HANDSHAKE') ;
  if S = 'XON/XOFF' then
     HandShake := hsXON_XOFF
  else if S = 'DTR/DSR' then
     HandShake := hsDTR_DSR
  else if S = 'RTS/CTS' then
     HandShake := hsRTS_CTS ;

  S := GetValue(Linha,'MAXBANDWIDTH') ;
  MaxBandwidth := StrToIntDef(S,MaxBandwidth) ;
end;


procedure TACBrDevice.EnviaString( const AString: AnsiString);
Var I, Max, NBytes : Integer ;
{$IFNDEF ThreadEnviaLPT}
   ArqPrn : TextFile ;
{$ENDIF}
begin
  I   := 1 ;
  Max := Length(AString) ;
  NBytes := fsSendBytesCount ;
  if NBytes = 0 then
     NBytes := Max ;

  if IsSerialPort then
   begin
     while I <= Max do
     begin
        Serial.SendString( copy(AString, I, NBytes ) ) ;    { Envia para Porta Serial }
        if fsSendBytesInterval > 0 then
           Sleep( fsSendBytesInterval ) ;
        I := I + NBytes ;
     end ;
   end
  else
   begin
     {$IFNDEF ThreadEnviaLPT}
        AssignFile( ArqPrn, Porta );
        try
           if IsTXTFilePort and FileExists(Porta) then
              Append( ArqPrn )
           else
              Rewrite( ArqPrn ) ;

           while I <= Max do
           begin
              Write( ArqPrn, copy(AString, I, NBytes ) ) ;
              if fsSendBytesInterval > 0 then
                 Sleep( fsSendBytesInterval ) ;
              I := I + NBytes ;
           end ;

           Flush( ArqPrn ) ;
        finally
           {$I+}
           {$IFNDEF FPC}System.{$ENDIF}CloseFile( ArqPrn ) ;
           {$I+}
        end ;
     {$ELSE}
        EnviaStrThread( AString );
     {$ENDIF}
   end ;
end;

{$IFDEF ThreadEnviaLPT}
{ A ideia dessa Thread ? testar se os dados est?o sendo gravados com sucesso na
  Porta Paralela (ou arquivo). ? criada uma Thread para "gravar" os dados em
  segundo plano, enquanto o programa monitora se as linhas est?o sendo enviadas.
  Caso a Thread nao consiga enviar uma linha dentro do Timeout definido a Thread
  ? cancelada e ? gerado um TIMEOUT. Isso evita o "travamento" do programa
  quando a porta ou arquivo n?o est?o prontos para a grava??o com o comando
  Write() }
procedure TACBrDevice.EnviaStrThread(AString: AnsiString);
Var IsTimeOut  : Boolean ;
    TempoFinal : TDateTime ;
    UltimaLinhaImpressa : Integer ;
    ThreadEnviaLPT : TACBrThreadEnviaLPT ;
begin
  { Criando Thread para monitorar o envio de dados a Porta Paralela }
  IsTimeOut           := false ;
  UltimaLinhaImpressa := -1 ;
  TempoFinal          := -1 ;
  ThreadEnviaLPT      := TACBrThreadEnviaLPT.Create( Self, AString ) ;
  try
     while not ThreadEnviaLPT.Terminated do
     begin
        if UltimaLinhaImpressa <> ThreadEnviaLPT.LinhaAtual then
        begin
           TempoFinal := IncSecond(now,TimeOut) ;
           UltimaLinhaImpressa := ThreadEnviaLPT.LinhaAtual ;
        end ;

        {$IFNDEF CONSOLE}
          if fProcessMessages then
             Application.ProcessMessages ;
        {$ENDIF}
        IsTimeOut := (now > TempoFinal) ; {Verifica se estourou o tempo TIMEOUT}
        if IsTimeOut then
           Break ;

        sleep(200) ;
     end ;
  finally
     ThreadEnviaLPT.Terminate ;

     if IsTimeOut then
        raise Exception.Create( Format(ACBrStr(cACBrDeviceEnviaStrThreadException), [ Porta ] )) ;
  end ;
end;
{$ENDIF}

procedure TACBrDevice.ImprimePos(const Linha, Coluna : Integer;
  const AString: AnsiString);
Var Cmd : String ;
begin
  if (AString = '') or
     (Linha < 0)    or
     (Coluna < 0) then
     exit ;

  Cmd := '' ;

  if Linha < PosImp.X then
     Eject ;

  if Linha > PosImp.X then
  begin
     Cmd := StringOfChar( LF, (Linha - PosImp.X) ) ;
     PosImp.X := Linha ;
  end ;

  if Coluna < PosImp.Y then
  begin
     Cmd := Cmd + CR ;
     PosImp.Y := 0 ;
  end ;

  if Coluna > PosImp.Y then
  begin
     Cmd := Cmd + StringOfChar( ' ', (Coluna - PosImp.Y) ) ;
     PosImp.Y := Coluna ;
  end ;

  EnviaString( Cmd + AString ) ;
  PosImp.Y := PosImp.Y + Length( AString );

end;

procedure TACBrDevice.Eject;
begin
  EnviaString( FF );
  PosImp.X := 0 ;
end;

{---------------------------- TACBrThreadEnviaLPT -----------------------------}
constructor TACBrThreadEnviaLPT.Create(AOwner : TObject; AString: String ) ;
begin
  if not (AOwner is TACBrDevice) then
     raise Exception.Create(ACBrStr('Uso Inv?lido da TACBrThreadEnviaLPT'));

  inherited Create( false ) ; { Rodar Imediatemanete }
  FreeOnTerminate := true ;

  fsOwner        := AOwner  ;
  fsTextoAEnviar := AString ;
end;

procedure TACBrThreadEnviaLPT.Execute;
Var ArqPrn : TextFile;
    Linha  : String ;
    P      : Integer ;
begin
  if fsTextoAEnviar <> '' then
  begin
     fsLinhaAtual := 0 ;
     with TACBrDevice(fsOwner) do
     begin
        AssignFile( ArqPrn, Porta);
        try
           if IsTXTFilePort and FileExists(Porta) then
              Append( ArqPrn )
           else
              Rewrite( ArqPrn ) ;

           while (fsTextoAEnviar <> '') and (not Terminated) do
           begin
              P := pos(CRLF,fsTextoAEnviar) ;
              if P = 0 then
                 P := Length( fsTextoAEnviar ) ;

              Linha          := copy(fsTextoAEnviar,1,P+1) ; { +1 = CRLF }
              fsTextoAEnviar := copy(fsTextoAEnviar,P+2,Length(fsTextoAEnviar)) ;
              fsLinhaAtual   := fsLinhaAtual + 1 ;

              Write( ArqPrn, Linha ) ;
           end ;
           Flush( ArqPrn ) ;
        finally
           {$I-}
           {$IFNDEF FPC}System.{$ENDIF}CloseFile( ArqPrn ) ;
           {$I+}
        end ;
     end ;
  end ;

  Terminate ;
end;



end.

