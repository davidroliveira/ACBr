{$I ACBr.inc}

Unit ACBrBombasClass ;

interface
uses ACBrDevice,
     ACBrUtil,
     SysUtils ,
     Classes,
     ACBrConsts,
     Contnrs
     {$IFNDEF CONSOLE}
       {$IFDEF VisualCLX},
         {$IFDEF QT3CLX} QtLibrary, QtSignalHooks {$ELSE} Qt {$ENDIF},
          QControls, QForms, QGraphics, QDialogs, QExtCtrls
       {$ENDIF}
       {$IFDEF VCL}
          , Controls, Forms, Graphics, Dialogs, ExtCtrls
       {$ENDIF}
       {$IFDEF MSWINDOWS}
         , Messages, Windows
       {$ENDIF}
     {$ENDIF} ;

const
cTimeout = 3 ;   { Tempo PADRAO para msg de falha de comunicacao }

  {mudar as constantes abaixo para o ACBrConsts}
  cACBrBombasCMDInvalidoException      = 'Procedure: %s '+ sLineBreak +
                                         ' não implementada para o concentrador: %s'+sLineBreak + sLineBreak +
                                         'Ajude no desenvolvimento do projeto ACBr. '+ sLineBreak+
                                         'Acesse nosso Forum em: http://acbr.sf.net/' ;

  cACBrBombasClassCreateException      = 'Essa Classe deve ser instanciada por TACBrBombas' ;

type

EACBrBombasCMDInvalido     = class(Exception) ;
EACBrBombasSemResposta     = class(Exception) ;
EACBrBombasNaoInicializado = class(Exception) ;

{ Tipo estado das bombas }
TStatusBicoBomba = (sbbLivre, sbbBloqueada, sbbAbastecimentoConcluido, sbbOcupada, sbbEmFalha, sbbAbastInterrompido);
{ Tipo Conexão}
TTipoConexao = (tcNenhuma, tcSerial, tcTCPIP, tcDLLSerial, tcDLLTCPIP); // tipos tcDLLSerial e tcDLLTCPIP especificam como a DLL deve se comunicar com o concentrador.

{Implementado para facilitar o retorno da função LeEncerrantesBico}
Encerrante=record
  Bico:byte;
  Encerrante_litros: Real;
  Encerrante_valor: Real;
  Valor_Unitario : Real;
  //VigulaPU = 1 byte
end;

{usado para ler os abastecimentos pendentes...LeAbastecimentosPendentes}
Abastecimento = record
  Bico: String[2];
  Hora: TTime;
  Data: TDate;
  VirgulaPrecoUnitario: byte;
  VirgulaLitros: byte;
  PrecoUnitario: Real;
  Litros: Real;
  ValorTotal: Real;
  Encerrante: Real;
End;

TListaAbastecimentos = array of Abastecimento;

TInternalBico = record
  Codigo: string[2];
end;

TInternalBicos = array of TInternalBico;

{ Classe generica de Bombas, nao implementa nenhum modelo especifico, apenas
  declara a Classe. NAO DEVE SER INSTANCIADA. Usada apenas como base para
  as demais Classes de Bombas como por exemplo a classe TACBrBombasCompanytech }

{ Nota sobre procimentos e funções VIRTUAL. Essas funçoes/procedimentos PODEM
  ou NAO ser implementados nas Classes filhas com a clausula OVERRIDE. Se não
  forem implementadas nas classes filhas, a funçao/procedimento definida aqui
  nessa classe (TACBrBombasClass) e que será execuada }


TACBrBombasClass = class
 private
    fsTimeOut      : Integer ;


    procedure SetAtivo(const Value: Boolean);
    procedure SetTimeOut(const Value: Integer);

    function GetTimeOut: Integer;

    procedure ErroAbstract( NomeProcedure : String ) ; // usado para criar uma exception quando uma função abstrata (não implementada na classe) for chamada
 Protected
    fpDevice  : TACBrDevice ;
    fpOwner  : TComponent ;   { Componente ACBrECF }
    fpAtivo: Boolean;
    fpModeloStr: String;
    fpComandoEnviado: AnsiString;
    fpRespostaComando: AnsiString;
    fpArqLOG: String;
    fpComandoLOG: AnsiString;

    fpTipoConexao : TTipoConexao;

    fpBicos : TInternalBicos;

    function GetModeloStr: String; virtual ;
    function GetDataHora: TDateTime; virtual ;
    procedure SetTipoConexao(const Value: TTipoConexao);
    function GetTipoConexao: TTipoConexao;

    procedure LeResposta ; virtual ;

 public
    Constructor create( AOwner : TComponent ) ;
    Destructor Destroy  ; override ;

    Property Ativo  : Boolean read fpAtivo write SetAtivo ;
    procedure Ativar ; virtual;
    procedure Desativar ; virtual;

    property ArqLOG : String read fpArqLOG write fpArqLOG ;
    property ComandoLOG : AnsiString read fpComandoLOG write fpComandoLOG ;

    Property TimeOut  : Integer read fsTimeOut write SetTimeOut ;

    Property ModeloStr: String  read GetModeloStr ;
    property TipoConexao : TTipoConexao read GetTipoConexao write SetTipoConexao
                  default tcNenhuma ;

    function InicializaComunicacao(): Integer ; virtual; //usará os dados da configuração de propriedades
    function FinalizaComunicacao(): Integer ; virtual;
    function StatusComunicacao(): Integer;  virtual;//Function Comunica; external 'COMPANYTEC.DLL' name 'Comunica'; StatusCom external ControlTech32.dll

    Property DataHora: TDateTime read GetDataHora;
    function AjustaRelogio(vDataHora : TDateTime ): Integer ; virtual;

    function AlteraPrecoBico(bico:Integer; Preco:Real): Integer; virtual;

    function LeAbastecimentosPendentes(var ListaAbastecimentos: TListaAbastecimentos): Integer; virtual;
    function LeAbastecimentoemAndamentoBico(bico: Integer; var VolumeAbastecido, ValorAbastecido:Real): Integer;  virtual;//Retorna o display
//    function LeAbastecimentosEmAndamento(var: Abast_And:DisplayAbastecimentos ): Integer; virtual;

    function LeEncerrantesBico(bico:integer; var vDadosEncerrante: Encerrante): Integer; virtual;

    function LeStatusBico(bico: Integer; var Status: TStatusBicoBomba ): Integer; virtual;
    function AutorizaBico(bico: Integer) : Integer; virtual;
    function BloquearBico(bico: Integer) : Integer; virtual;

    Function PredeterminaAbastecimentoemVolumeBico( bico: Integer; Volume:Real): Integer;  virtual;//não é muito usado no Brasil ??
    Function PredeterminaAbastecimentoemValorBico( bico: Integer; Valor:Real): Integer;  virtual;//não é muito usado no Brasil ??

                      //-------------//
    { String com Comando exatamente como foi enviado para impressora }
    Property ComandoEnviado : AnsiString read fpComandoEnviado
       write fpComandoEnviado ;
    { String com a Resposta Completa da Impressora (sem tratamentos) }
    Property RespostaComando : AnsiString read fpRespostaComando
       write fpRespostaComando ;

    function EmLinha( lTimeOut : Integer = 1) : Boolean ; virtual ;

    { Retorna a Resposta do Concentrador }
    function EnviaComando( cmd : String ) : String ; overload ; virtual ;
    { Versao que Permite mudar o TimeOut padrao }
    function EnviaComando( cmd : String; lTimeOut : Integer): String; overload ;
       virtual ;
end ;

implementation

Uses ACBrBombas ;

{ ---------------------------- TACBrBombasClass ------------------------------ }

constructor TACBrBombasClass.create(AOwner: TComponent);
begin
  if not (AOwner is TACBrBombas) then
     raise Exception.create( ACBrStr(cACBrBombasClassCreateException) );

  fpOwner := AOwner ;

// não sei se será necessário ainda
  { Criando ponteiro interno para as Propriedade SERIAL e FORMMSG de ACBrECF,
    para permitir as Classes Filhas o acesso a essas propriedades do Componente}
  fpDevice := (AOwner as TACBrBombas).Device ;
  fpDevice.SetDefaultValues ;


  { Ajustando variaveis Internas }
//  fsTimeOut := 3;

  { Variaveis Protected fp___ acessiveis pelas Classes filhas }
  fpAtivo                 := false ;
  fpComandoEnviado        := '' ;
  fpRespostaComando       := '' ;
  fpModeloStr             := 'Não Definido' ;

  fpArqLOG                := '' ;
  fpComandoLOG            := '' ;

end;

destructor TACBrBombasClass.Destroy;
begin
  Desativar ;
  fpDevice  := nil ; { Apenas remove referencia (ponteiros internos) }

  inherited Destroy;
end;

procedure TACBrBombasClass.SetAtivo(const Value: Boolean);
begin
  if Value then
     Ativar
  else
     Desativar ;
end;

procedure TACBrBombasClass.Ativar;
begin
  if fpAtivo then exit ;

  if (TipoConexao = tcSerial) then fpDevice.Ativar ;

//  fpEstado := estDesconhecido ; ????
  fpAtivo  := true ;
end;

procedure TACBrBombasClass.Desativar;
begin
  if not fpAtivo then exit ;

  if fpDevice.ativo then fpDevice.Desativar ;

//  fpEstado := estNaoInicializada ;
  fpAtivo  := false ;
end;

{------------------------------------------------------------------------------}
function TACBrBombasClass.EnviaComando(cmd: String; lTimeOut: Integer): String;
Var wTimeOut : Integer ;
begin
  wTimeOut := TimeOut ;
  TimeOut  := lTimeOut ;

  try
     result := EnviaComando( cmd ) ;
  finally
     TimeOut := wTimeOut ;
  end ;
end;

function TACBrBombasClass.EnviaComando(cmd: String): String;
begin
//  result := ''; ver ACBrECFClass
end;

function TACBrBombasClass.GetDataHora: TDateTime;
begin
  Result := now ;
end;

function TACBrBombasClass.GetModeloStr: String;
begin
  Result := fpModeloStr ;
end;

function TACBrBombasClass.GetTimeOut: Integer;
begin
  Result := fpDevice.TimeOut ;
end;

procedure TACBrBombasClass.SetTimeOut(const Value: Integer);
begin
  fpDevice.TimeOut := Value ;
end;

function TACBrBombasClass.GetTipoConexao: TTipoConexao;
begin
  Result := fpTipoConexao;
end;

procedure TACBrBombasClass.SetTipoConexao(const Value: TTipoConexao);
begin
  // precisa fazer algumas considerações tipo se há conexão ativa etc...
  // e gerar excessões. Pode ser feito nas classes filhas

  fpTipoConexao := Value;
end;

function TACBrBombasClass.AjustaRelogio(vDataHora: TDateTime): Integer;
begin
  ErroAbstract('AjustaRelogio');
end;

function TACBrBombasClass.AlteraPrecoBico(bico: Integer; Preco: Real): Integer;
begin
  ErroAbstract('AlteraPrecoBico');
end;


function TACBrBombasClass.AutorizaBico(bico: Integer): Integer;
begin
  ErroAbstract('AutorizaBico');
end;

function TACBrBombasClass.BloquearBico(bico: Integer): Integer;
begin
  ErroAbstract('BloquearBico');
end;

function TACBrBombasClass.EmLinha( lTimeOut: Integer): Boolean;
begin
  result := fpDevice.EmLinha( lTimeOut ) ;
end;

procedure TACBrBombasClass.ErroAbstract(NomeProcedure: String);
begin
  raise EACBrBombasCMDInvalido.create(Format(ACBrStr(cACBrBombasCMDInvalidoException),
                                          [NomeProcedure, ModeloStr] )) ;
end;

function TACBrBombasClass.StatusComunicacao: Integer;
begin
  ErroAbstract('StatusComunicacao');
end;

function TACBrBombasClass.FinalizaComunicacao: Integer;
begin
  ErroAbstract('FinalizaComunicacao');
end;

function TACBrBombasClass.InicializaComunicacao: Integer;
begin
  ErroAbstract('InicializaComunicacao');
end;

function TACBrBombasClass.LeAbastecimentoemAndamentoBico(bico: Integer;
  var VolumeAbastecido, ValorAbastecido: Real): Integer;
begin
  ErroAbstract('LeAbastecimentoemAndamentoBico');
end;

function TACBrBombasClass.LeAbastecimentosPendentes(
  var ListaAbastecimentos: TListaAbastecimentos): Integer;
begin
  ErroAbstract('LeAbastecimentosPendentes');
end;

function TACBrBombasClass.LeEncerrantesBico(bico: integer;
  var vDadosEncerrante: Encerrante): Integer;
begin
  ErroAbstract('LeEncerrantesBico');
end;

procedure TACBrBombasClass.LeResposta;
begin
  fpDevice.Serial.DeadlockTimeout := TimeOut * 10000 ; { Define Timeout }
  fpDevice.Serial.Purge;                   { Limpa a Porta }

  fpRespostaComando := '' ;  { de fsOwner -> TACBrBombasClass }

  try
    while (Pos(')',fpRespostaComando) = 0) do begin
      fpRespostaComando := fpRespostaComando +
                           fpDevice.Serial.RecvPacket( 500 );
    end; { while }
  except
    { Exceçao silenciosa }
  end ;
end;

function TACBrBombasClass.LeStatusBico(bico: Integer;
  var Status: TStatusBicoBomba): Integer;
begin
  ErroAbstract('LeStatusBico');
end;

function TACBrBombasClass.PredeterminaAbastecimentoemValorBico(bico: Integer;
  Valor: Real): Integer;
begin
  ErroAbstract('PredeterminaAbastecimentoemValorBico');
end;

function TACBrBombasClass.PredeterminaAbastecimentoemVolumeBico(bico: Integer;
  Volume: Real): Integer;
begin
  ErroAbstract('PredeterminaAbastecimentoemVolumeBico');
end;

end.

