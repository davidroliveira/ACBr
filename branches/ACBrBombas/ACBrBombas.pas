
{$I ACBr.inc}

Unit ACBrBombas ;

interface
uses ACBrBase, ACBrDevice, ACBrBombasClass,ACBrUtil, {Units da ACBr}
     SysUtils , ACBrConsts, Classes
     {$IFNDEF CONSOLE}
        {$IFDEF VisualCLX}, QControls, QForms, QDialogs, QGraphics, QStdCtrls{$ENDIF}
        {$IFDEF VCL}, Controls, Forms, Dialogs, Graphics, StdCtrls {$ENDIF}
     {$ENDIF} ;

type

{ Modelos suportados pelo componente TACBrBombas atualmente
  Não há garantia de plena compatibilidade entre os diferentes
  equipamentos.
  Modelos ainda a adicionar (Cesna, Dresser Wayne, Gilbarco Veeder-Root, VWTech)
  (Favor reportar possiveis BUGS) }
TACBrBombasModelo = (bombaNenhum, bombaCompanytec, bombaGVR, bombaVWTech);


{ Componente ACBrBombas }
TACBrBombas = class( TACBrComponent )
  private
    fsDevice  : TACBrDevice ;   { SubComponente ACBrDevice }

    { Propriedades do Componente ACBrBombas }
    fsAtivo  : Boolean;
    fsModelo : TACBrBombasModelo;

//    fsTipoConexao : TTipoConexao;

    fsBomba : TACBrBombasClass ;  { Classe com instancia da bomba de fsModelo}

    procedure SetAtivo(const Value: Boolean);
    procedure SetModelo(const Value: TACBrBombasModelo);
    procedure SetTipoConexao(const Value: TTipoConexao);
    procedure SetPorta(const Value: String);
    procedure SetIPConcentrador(const Value: String);
    procedure SetPortaIP(const Value: String);
    procedure SetTimeOut(const Value: Integer);

    function GetTipoConexao: TTipoConexao;
    function GetPorta: String;
    function GetIPConcentrador: String;
    function GetPortaIP: String;
    function GetTimeOut: Integer;
    function GetComandoEnviadoClass: String;
    function GetRespostaComandoClass: String;

    function GetDataHoraClass: TDateTime;

    function GetArqLOG: String;
    procedure SetArqLOG(const Value: String);
    function GetComandoLOGClass: AnsiString;
    procedure SetComandoLOGClass(const Value: AnsiString);

  protected
    //
  public
    constructor Create(AOwner: TComponent); override;
    Destructor Destroy  ; override ;

    procedure Ativar ;
    procedure Desativar ;
    property Ativo : Boolean read fsAtivo write SetAtivo ;

    property Bomba : TACBrBombasClass read fsBomba ;

    { Propriedades lidas da Classe Instanciada em fsBombas }
    Property ComandoEnviado     : String  read GetComandoEnviadoClass ;
    Property RespostaComando    : String  read GetRespostaComandoClass ;
    property ComandoLOG         : AnsiString  read GetComandoLOGClass
       write SetComandoLOGClass ;

    { Concentrador - variáveis }
    Property DataHora: TDateTime read GetDataHoraClass ;

    { ECFs - Flags}
    function EmLinha( lTimeOut : Integer = 1) : Boolean ;


    {*****************************
     Funções e propriedades ainda a organizar...
               ************************************}
    function InicializaComunicacao(): Integer ; //usará os dados da configuração de propriedades
    function FinalizaComunicacao(): Integer ;
    function StatusComunicacao(): Integer; //Function Comunica; external 'COMPANYTEC.DLL' name 'Comunica'; StatusCom external ControlTech32.dll

    function AjustaRelogio(DataHora : TDateTime ): Integer ;

    function AlteraPrecoBico(bico:Integer; Preco:Real): Integer;

    function LeAbastecimentosPendentes(var ListaAbastecimentos: TListaAbastecimentos): Integer;
    function LeAbastecimentoemAndamentoBico(bico: Integer; var VolumeAbastecido, ValorAbastecido:Real): Integer; //Retorna o display
//    function LeAbastecimentosEmAndamento(var: Abast_And:DisplayAbastecimentos ): Integer;

    function LeEncerrantesBico(bico:integer; var vDadosEncerrante: Encerrante): Integer;

    function LeStatusBico(bico: Integer; var Status: TStatusBicoBomba ): Integer;
    function AutorizaBico(bico: Integer) : Integer;
    function BloquearBico(bico: Integer) : Integer;

    Function PredeterminaAbastecimentoemVolumeBico( bico: Integer; Volume:Real): Integer; //não é muito usado no Brasil ??
    Function PredeterminaAbastecimentoemValorBico( bico: Integer; Valor:Real): Integer; //não é muito usado no Brasil ??

//    function AutorizaBomba (Bomba:Integer) : Integer; //Presente apenas na versão Gilbarco GVR
//    function BloqueiaBomba (Bomba:Integer) : Integer; //Presente apenas na versão Gilbarco GVR
//    Function LePrecoBico(bico:Integer): Integer; // Comando encontrado apenas na APIs Companytech e vwtech


    { Utilitarios e Diversos }
    Function EnviaComando( cmd : String): String; overload;
    { Permitindo mudar o TimeOut padrao }
    Function EnviaComando( cmd : String; lTimeOut : Integer): String;
       overload ;


  published

    property Modelo : TACBrBombasModelo read fsModelo write SetModelo
                 default bombaNenhum ;

    property TipoConexao : TTipoConexao read GetTipoConexao write SetTipoConexao
                  default tcNenhuma ;
    property Porta : String read GetPorta write SetPorta ;
    property IPConcentrador : String read GetIPConcentrador write SetIPConcentrador ;
    property PortaIP : String read GetPortaIP write SetPortaIP;

    property TimeOut : Integer read GetTimeOut write SetTimeOut
                 default cTimeout ;


    { Instancia do Componente ACBrDevice, será passada para fsBombas.create }
    property Device : TACBrDevice read fsDevice ;

    property ArqLOG : String read GetArqLOG write SetArqLOG ;
end;

implementation

Uses ACBrBombasCompany;


constructor TACBrBombas.Create(AOwner: TComponent);
begin
  inherited create( AOwner );

  { Inicializando as Variaveis Internas }
  fsAtivo := false ;

  { Instanciando SubComponente TACBrDevice }
  fsDevice := TACBrDevice.Create( self ) ;  { O dono é o proprio componente }
  fsDevice.Name := 'ACBrDevice' ;      { Apenas para aparecer no Object Inspector}
  {$IFDEF COMPILER6_UP}
  fsDevice.SetSubComponent( true );{ para gravar no DFM/XFM }
  {$ENDIF}
  fsDevice.Porta := 'COM1';

  { Instanciando fsBomba com modelo Generico (ACBrBombasClass) }
  fsBomba := TACBrBombasClass.create( self );

end;

destructor TACBrBombas.Destroy;
begin
  Ativo := false ;

  if Assigned( fsBomba ) then
     FreeAndNil( fsBomba ) ;

  FreeAndNil( fsDevice ) ;

  inherited Destroy;
end;

procedure TACBrBombas.Ativar;
begin
  //
  if fsAtivo then exit ;

  if fsModelo = bombaNenhum then
     raise Exception.Create(ACBrStr('Modelo não definido'));

  {?????
   Verificar a comunicação
  ?????}
//  if ((Porta = '') or (LowerCase(Porta) = 'procurar')) then
//     AcharPorta ;


  ComandoLOG := DateToStr(now)+ ' Ativar';
  fsBomba.Ativar ;
  fsAtivo := true ;

end;

procedure TACBrBombas.Desativar;
begin
  //
  if not fsAtivo then exit ;

  ComandoLOG := DateToStr(now)+ ' Desativar';
  fsBomba.Desativar ;
  fsAtivo := false;

end;

procedure TACBrBombas.SetAtivo(const Value: Boolean);
begin
  if Value then
     Ativar
  else
     Desativar ;
end;

function TACBrBombas.GetTimeOut: Integer;
begin
  result := fsBomba.TimeOut ;
end;

procedure TACBrBombas.SetTimeOut(const Value: Integer);
begin
  fsBomba.TimeOut := Value ;
end;

procedure TACBrBombas.SetModelo(const Value: TACBrBombasModelo);
var wTimeOut  : Integer ;   { Variaveis de Trabalho, usadas para transportar }
    wArqLOG : String ;      { as informações de uma Classe ECF antiga para a }
                            { do novo modelo que será instanciada }
begin
  if fsModelo = Value then exit ;

  if fsAtivo then
     raise Exception.Create(ACBrStr(cACBrECFSetModeloException));

  wTimeOut              := TimeOut ;
  wArqLOG               := ArqLOG ;

  FreeAndNil( fsBomba ) ;

  { Instanciando uma nova classe de acordo com fsModelo }
  case Value of
    bombaCompanytec   : fsBomba := TACBrBombasCompany.create( Self ) ;
//    bombaGVR          : fsBomba := TACBrBombasGVR.create( Self ) ;
//    bombaVWTech       : fsBomba := TACBrBombasVWTech.create( Self ) ;
  else
     fsBomba := TACBrBombasClass.create( Self ) ;
  end;

  { Passando propriedades da Classe anterior para a Nova Classe }
  wTimeOut              := TimeOut ;
  wArqLOG               := ArqLOG ;

  fsModelo := Value;
end;

function TACBrBombas.GetTipoConexao: TTipoConexao;
begin
  result := fsBomba.TipoConexao;
end;


procedure TACBrBombas.SetTipoConexao(const Value: TTipoConexao);
begin
  fsBomba.TipoConexao := Value;
end;

function TACBrBombas.GetPorta: String;
begin
  result := fsDevice.Porta;
end;

procedure TACBrBombas.SetPorta(const Value: String);
begin
  fsDevice.Porta := Value;
end;

function TACBrBombas.GetIPConcentrador: String;
begin
//  result := fsDevice.IPConcentrador;
end;

procedure TACBrBombas.SetIPConcentrador(const Value: String);
begin
//  fsDevice.IPConcentrador := Value;
end;

function TACBrBombas.GetPortaIP: String;
begin
//  result := fsDevice.PortaIP;
end;

procedure TACBrBombas.SetPortaIP(const Value: String);
begin
//  fsDevice.PortaIP := Value;
end;

function TACBrBombas.GetComandoEnviadoClass: String;
begin
  result := fsBomba.ComandoEnviado ;
end;

function TACBrBombas.GetArqLOG: String;
begin
  Result := fsBomba.ArqLOG ;
end;

procedure TACBrBombas.SetArqLOG(const Value: String);
begin
  fsBomba.ArqLOG := Value ;
end;

function TACBrBombas.GetComandoLOGClass: AnsiString;
begin
  Result := fsBomba.ComandoLOG ;
end;

procedure TACBrBombas.SetComandoLOGClass(const Value: AnsiString);
begin
  fsBomba.ComandoLOG := Value ;
  fsBomba.ComandoEnviado  := '' ;
  fsBomba.RespostaComando := '' ;
end;

function TACBrBombas.GetDataHoraClass: TDateTime;
begin
  ComandoLOG := 'DataHora' ;
  Result := fsBomba.DataHora ;
end;

function TACBrBombas.GetRespostaComandoClass: String;
begin
  result := fsBomba.RespostaComando ;
end;

function TACBrBombas.EmLinha(lTimeOut: Integer): Boolean;
begin
  result := fsBomba.EmLinha(lTimeOut) ;
end;

function TACBrBombas.EnviaComando(cmd: String ): String;
begin
  result := fsBomba.EnviaComando( cmd ) ;
end;

function TACBrBombas.EnviaComando(cmd: String; lTimeOut: Integer): String;
begin
  result := fsBomba.EnviaComando( cmd, lTimeOut ) ;
end;

{------------------------------------------------------------------------------}
function TACBrBombas.InicializaComunicacao: Integer;
begin
  ComandoLOG := 'InicializaComunicacao' ;
  result := fsBomba.InicializaComunicacao;
end;

function TACBrBombas.FinalizaComunicacao: Integer;
begin
  ComandoLOG := 'FinalizaComunicacao' ;
  result := fsBomba.FinalizaComunicacao;
end;

function TACBrBombas.StatusComunicacao: Integer;
begin
// ????
// Analisar as possibilidade dos retornos dos concentradores...
// ????
  ComandoLOG := 'StatusComunicacao' ;
  result := fsBomba.StatusComunicacao;
end;

function TACBrBombas.AjustaRelogio(DataHora: TDateTime): Integer;
begin
  ComandoLOG := 'AjustaRelogio('+DateTimeToStr(DataHora)+')' ;
  result := fsBomba.AjustaRelogio(DataHora);
end;

function TACBrBombas.LeAbastecimentoemAndamentoBico(bico: Integer;
  var VolumeAbastecido, ValorAbastecido: Real): Integer;
begin
  ComandoLOG := 'LeAbastecimentoemAndamentoBico('+inttostr(bico)+','+ floattostr(VolumeAbastecido)+','+floattostr(ValorAbastecido)+')' ;
  fsBomba.LeAbastecimentoemAndamentoBico(bico, VolumeAbastecido, ValorAbastecido);
end;

function TACBrBombas.LeEncerrantesBico(bico: integer;
  var vDadosEncerrante: Encerrante): Integer;
begin
  ComandoLOG := 'LeEncerrantesBico('+inttostr(bico)+', vDadosEncerrante)' ;
  fsBomba.LeEncerrantesBico(bico, vDadosEncerrante);
end;

function TACBrBombas.AlteraPrecoBico(bico: Integer; Preco: Real): Integer;
begin
  ComandoLOG := 'AlteraPrecoBico('+inttostr(bico)+', '+floattoStr(Preco)+')' ;
  fsBomba.AlteraPrecoBico(bico, Preco);
end;

function TACBrBombas.LeStatusBico(bico: Integer;
  var Status: TStatusBicoBomba): Integer;
begin
  ComandoLOG := 'LeStatusBico('+inttostr(bico)+', Status)' ;
  fsBomba.LeStatusBico(bico, Status);
end;

function TACBrBombas.AutorizaBico(bico: Integer): Integer;
begin
  ComandoLOG := 'AutorizaBico('+inttostr(bico)+')' ;
  fsBomba.AutorizaBico(bico);
end;

function TACBrBombas.BloquearBico(bico: Integer): Integer;
begin
  ComandoLOG := 'BloquearBico('+inttostr(bico)+')' ;
  fsBomba.BloquearBico(bico);
end;

function TACBrBombas.LeAbastecimentosPendentes(
  var ListaAbastecimentos: TListaAbastecimentos): Integer;
begin
  ComandoLOG := 'LeAbastecimentosPendentes(ListaAbastecimentos)' ;
  fsBomba.LeAbastecimentosPendentes(ListaAbastecimentos);
end;

function TACBrBombas.PredeterminaAbastecimentoemValorBico(bico: Integer;
  Valor: Real): Integer;
begin
  ComandoLOG := 'PredeterminaAbastecimentoemValorBico('+inttostr(bico)+', '+FloattoStr(Valor)+')' ;
  fsBomba.PredeterminaAbastecimentoemValorBico(bico, Valor);
end;

function TACBrBombas.PredeterminaAbastecimentoemVolumeBico(bico: Integer;
  Volume: Real): Integer;
begin
  ComandoLOG := 'PredeterminaAbastecimentoemVolumeBico('+inttostr(bico)+','+Floattostr(Volume)+')' ;
  fsBomba.PredeterminaAbastecimentoemVolumeBico(bico, Volume);
end;

end.
