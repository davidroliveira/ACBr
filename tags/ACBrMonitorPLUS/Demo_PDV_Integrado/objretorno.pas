unit objRetorno;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IniFiles, pcnConversao;

const
  cOK                 =  'OK:';

  cMetodoBuscarPorCEP =  'BuscarPorCEP';
  cMetodoLePeso       =  'LePeso';
  cMetodoUltimaLeitura=  'UltimaLeitura';
  cMetodoExibirLinhaDIS= 'ExibirLinha';
  cMetodoLimparDIS    =  'LimparDisplay';
  cMetodoImprimirLinhaESC= 'ImprimirLinha';
  cMetodoAtivar       =  'Ativar';
  cMetodoDesAtivar    =  'Desativar';
  cMetodoInicializar  =  'Inicializar';
  cMetodoDesInicializar= 'DesInicializar';
  cMetodoConsultarStatusOperacional= 'ConsultarStatusOperacional';
  cMetodoCriarEnviarCFe= 'CriarEnviarCFe';
  cMetodoImprimirExtratoVenda= 'ImprimirExtratoVenda';
  cMetodoCriarEnviarNFe= 'CriarEnviarNFe';
  cMetodoEnviarNFe     = 'EnviarNFe';
  cMetodoStatusServico = 'StatusServico';
  cMetodoSetFormaEmissao= 'SetFormaEmissao';
  cMetodoCriarNFe=        'CriarNFe';
  cMetodoImprimirDanfe=   'ImprimirDANFe';
  cMetodoGerarChave=      'GerarChave';
  cMetodoConsultarNFe=    'ConsultarNFe';
  cMetodoEnviarEvento=    'EnviarEvento';
  cMetodoInutilizarNFe=   'InutilizarNFe';

  cBairro=               'Bairro';
  cCEP=                  'CEP';
  cComplemento=          'Complemento';
  cIBGE_Municipio=       'IBGE_Municipio';
  cIBGE_UF=              'IBGE_UF';
  cLogradouro=           'Logradouro';
  cMunicipio=            'Municipio';
  cTipo_Logradouro=      'Tipo_Logradouro';
  cUF=                   'UF';

  cPeso=                 'Peso';

  cResultado =           'Resultado';
  cNumerosecao =         'Numerosecao';
  cCodigoDeRetorno =     'CodigoDeRetorno';
  cRetornoStr =          'RetornoStr';
  cArqCFe =              'Arquivo';
  cXML =                 'XML';

  asecaoCEP=            'Endereco1';
  asecaoBAL=            'Peso1';
  asecaoCFe=            'Envio';
  asecaoNFe=            'NFe';
  asecaoConsulta=       'CONSULTA';

  ccStat=               'cStat';
  cxMotivo=             'xMotivo';
  cdigVal=              'digVal';
  cchNFe=               'chNFe';
  cnProt=               'nProt';
  cArquivo=             'Arquivo';
  ccodErro=             'codErro';
  cMsg=                 'xMsg';
  cDhRecbto=            'DhRecbto';



type
  { TObjeto}
  TObjetosACBr = ( obGAV,obDIS,obLCB,obACBR,obBAL,obETQ,obCEP,obIBGE,obEMAIL,obSEDEX,obNCM,obNFE,obSAT,obESCPOS );

  { TPopulaObjResposta }
  TPopulaObjResposta = class
  protected
    FIni: TMemIniFile;
    FStream: TStream;
    FRespostaUnica: String;
    FObjetosACBr: TObjetosACBr;
    FMetodoACBr: String;

  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);virtual;
    destructor Destroy; override;

    procedure ObterResposta(const AStream: TStream);virtual;
    function ObjetoACBrToDescricao(const t: TObjetosACBr):String;

    property Ini: TMemIniFile read FIni write FIni;
    property ObjetoACBr: TObjetosACBr  read FObjetosACBr;
    property MetodoACBr: String read FMetodoACBr;
    property RespostaUnica: String read FRespostaUnica;

  end;

  { TMetodoAtivar }
  TMetodoAtivar = class(TPopulaObjResposta)
  private
    FAtivo: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Ativo: String read FAtivo;

  end;

  { TMetodoDesativar }
  TMetodoDesativar = class(TPopulaObjResposta)
  private
    FDesativo: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Desativo: String read FDesativo;

  end;

  { TCEPResposta }
  TCEPResposta = class(TPopulaObjResposta)
  private
    FBairro: string;
    FCEP: string;
    FComplemento: string;
    FIBGE_Municipio: string;
    FIBGE_UF: string;
    FLogradouro: string;
    FMunicipio: string;
    FTipo_Logradouro: string;
    FUF: string;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property CEP: string read FCEP;
    property Tipo_Logradouro: string read FTipo_Logradouro;
    property Logradouro: string read FLogradouro;
    property Complemento: string read FComplemento;
    property Bairro: string read FBairro;
    property Municipio: string read FMunicipio;
    property UF: string read FUF;
    property IBGE_Municipio: string read FIBGE_Municipio;
    property IBGE_UF: string read FIBGE_UF;
  end;

  { TBALResposta }
  TBALResposta = class(TPopulaObjResposta)
  private
    FPeso: Double;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Peso: Double read FPeso write FPeso ;

  end;

  { TLCBResposta }
  TLCBResposta = class(TPopulaObjResposta)
  private
    FCodigo: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Codigo: String read FCodigo;

  end;

  { TDISResposta }
  TDISResposta = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TDISLimparDisplay }
  TDISLimparDisplay = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TESCImprimirLinha }
  TESCImprimirLinha = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TSATInicializar }
  TSATInicializar = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TSATDesInicializar }
  TSATDesInicializar = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TSATConsultarStatusOperacional }
  TSATConsultarStatusOperacional = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TSATCriarEnviarCFe }
  TSATCriarEnviarCFe = class(TPopulaObjResposta)
  private
    FResultado : String;
    FNumerosecao : String;
    FCodigoDeRetorno : String;
    FRetornoStr : String;
    FArquivo : String;
    FXML : String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Resultado: String read FResultado;
    property Numerosecao: String read FNumerosecao;
    property CodigoDeRetorno: String read FCodigoDeRetorno;
    property RetornoStr: String read FRetornoStr;
    property Arquivo: String read FArquivo;
    property XML: String read FXML;

  end;

  { TSATImprimirExtratoVenda }
  TSATImprimirExtratoVenda = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TNFeStatusServico }
  TNFeStatusServico = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TNFeGerarChave }
  TNFeGerarChave = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TNFeSetFormaEmissao }
  TNFeSetFormaEmissao = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TNFeCriarNFe }
  TNFeCriarNFe = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TNFeImprimirDanfe }
  TNFeImprimirDANFe = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TNFeCriarEnviarNFe }
  TNFeCriarEnviarNFe = class(TPopulaObjResposta)
  private
    FcStat: Integer;
    FxMotivo: String;
    FDigVal: String;
    FchNFe: String;
    FnProt: String;
    FArquivo : String;
    FcodErro: Integer;
    FMsg: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property cStat: Integer read FcStat;
    property xMotivo: String read FxMotivo;
    property digVal: String read FDigVal;
    property chNFe: String read FchNFe;
    property nProt: String read FnProt;
    property Arquivo: String read FArquivo;
    property codErro: Integer read FcodErro;
    property Msg: String read FMsg;

  end;

  { TNFeEnviarNFe }
  TNFeEnviarNFe = class(TPopulaObjResposta)
  private
    FcStat: Integer;
    FxMotivo: String;
    FDigVal: String;
    FchNFe: String;
    FnProt: String;
    FArquivo : String;
    FcodErro: Integer;
    FMsg: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property cStat: Integer read FcStat;
    property xMotivo: String read FxMotivo;
    property digVal: String read FDigVal;
    property chNFe: String read FchNFe;
    property nProt: String read FnProt;
    property Arquivo: String read FArquivo;
    property codErro: Integer read FcodErro;
    property Msg: String read FMsg;

  end;

  { TNFeConsultarNFe }
  TNFeConsultarNFe = class(TPopulaObjResposta)
  private
    FcStat: Integer;
    FMsg: String;
    FxMotivo: String;
    FDigVal: String;
    FchNFe: String;
    FnProt: String;
    FDhRecbto: TDateTime;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property cStat: Integer read FcStat;
    property Msg: String read FMsg;
    property xMotivo: String read FxMotivo;
    property DigVal: String read FDigVal;
    property chNFe: String read FchNFe;
    property nProt: String read FnProt;
    property DhRecbto: TDateTime read FDhRecbto;

  end;

  { TNFeEnviarEvento }
  TNFeEnviarEvento = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

  { TNFeInutilizarNFe }

  TNFeInutilizarNFe = class(TPopulaObjResposta)
  private
    FRetorno: String;
  public
    constructor Create(AObjACBr: TObjetosACBr = obACBR);override;

    procedure ObterResposta(const AStream: TStream);override;

    property Retorno: String read FRetorno;

  end;

implementation

{ TNFeInutilizarNFe }

constructor TNFeInutilizarNFe.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obNFE;
  FMetodoACBr:= cMetodoInutilizarNFe;
  FRetorno:= '';
end;

procedure TNFeInutilizarNFe.ObterResposta(const AStream: TStream);
begin
  if Assigned(FStream) then
    FRetorno := FRespostaUnica;
end;

{ TNFeEnviarEvento }

constructor TNFeEnviarEvento.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obNFE;
  FMetodoACBr:= cMetodoEnviarEvento;
  FRetorno:= '';
end;

procedure TNFeEnviarEvento.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;
end;

{ TNFeConsultarNFe }

constructor TNFeConsultarNFe.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obNFE;
  FMetodoACBr:= cMetodoConsultarNFe;
  FcStat:= 0;
  FMsg:= '';
  FxMotivo:= '';
  FDigVal:= '';
  FchNFe:= '';
  FnProt:= '';
  FDhRecbto:= 0;
end;

procedure TNFeConsultarNFe.ObterResposta(const AStream: TStream);
var
  TagLeitura: String;
begin
   inherited ObterResposta(AStream);
  if Assigned(FStream) then
  begin
    TagLeitura:= asecaoConsulta;
    FcStat:= Fini.ReadInteger( TagLeitura , ccStat, 0 );
    FxMotivo:= Fini.ReadString( TagLeitura , cxMotivo, '' );
    FMsg:= Fini.ReadString( TagLeitura , cMsg, '' );
    FDigVal:= Fini.ReadString( TagLeitura , cdigVal, '' );
    FchNFe:= Fini.ReadString( TagLeitura , cchNFe, '' );
    FnProt:= Fini.ReadString( TagLeitura , cnProt, '' );
    FDhRecbto:= Fini.ReadDateTime( TagLeitura , cDhRecbto, 0);
  end;
end;

{ TNFeStatusServico }

constructor TNFeStatusServico.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obNFE;
  FMetodoACBr:= cMetodoStatusServico;
  FRetorno:= '';
end;

procedure TNFeStatusServico.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;
end;

{ TNFeEnviarNFe }

constructor TNFeEnviarNFe.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obNFE;
  FMetodoACBr:= cMetodoEnviarNFe;
  FcStat:= 0;
  FxMotivo:= '';
  FDigVal:= '';
  FchNFe:= '';
  FnProt:= '';
  FArquivo:= '';
  FcodErro:= 0;
  FMsg:= '';
end;

procedure TNFeEnviarNFe.ObterResposta(const AStream: TStream);
var
  TagLeitura: String;
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
  begin
    TagLeitura:= asecaoCFe;
    FcStat:= Fini.ReadInteger( TagLeitura , ccStat, 0  );
    FxMotivo:= Fini.ReadString( TagLeitura , cxMotivo, ''  );
    FMsg:= Fini.ReadString( TagLeitura , cMsg, ''  );

  end;
end;

{ TNFeGerarChave }

constructor TNFeGerarChave.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obNFE;
  FMetodoACBr:= cMetodoGerarChave;
  FRetorno:= '';
end;

procedure TNFeGerarChave.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;
end;

{ TNFeImprimirDANFe }

constructor TNFeImprimirDANFe.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obNFE;
  FMetodoACBr:= cMetodoImprimirDanfe;
  FRetorno:= '';
end;

procedure TNFeImprimirDANFe.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;
end;

{ TNFeCriarNFe }

constructor TNFeCriarNFe.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obNFE;
  FMetodoACBr:= cMetodoCriarNFe;
  FRetorno:= '';
end;

procedure TNFeCriarNFe.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;
end;

{ TNFeSetFormaEmissao }

constructor TNFeSetFormaEmissao.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obNFE;
  FMetodoACBr:= cMetodoSetFormaEmissao;
  FRetorno:= '';
end;

procedure TNFeSetFormaEmissao.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;
end;

{ TNFeCriarEnviarNFe }

constructor TNFeCriarEnviarNFe.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obNFE;
  FMetodoACBr:= cMetodoCriarEnviarNFe;
  FcStat:= 0;
  FxMotivo:= '';
  FDigVal:= '';
  FchNFe:= '';
  FnProt:= '';
  FArquivo:= '';
  FcodErro:= 0;
  FMsg:= '';
end;

procedure TNFeCriarEnviarNFe.ObterResposta(const AStream: TStream);
var
  TagLeitura: String;
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
  begin
    TagLeitura:= asecaoCFe;
    FcStat:= Fini.ReadInteger( TagLeitura , ccStat, 0  );
    FxMotivo:= Fini.ReadString( TagLeitura , cxMotivo, ''  );
    FMsg:= Fini.ReadString( TagLeitura , cMsg, ''  );

    {TagLeitura:= asecaoNFe + lCFEmit_nNF;
    FcStat:= Fini.ReadInteger( TagLeitura , ccStat, 0  );
    FxMotivo:= Fini.ReadString( TagLeitura , cxMotivo, ''  );
    FDigVal:= Fini.ReadString( TagLeitura , cdigVal, ''  );
    FchNFe:= Fini.ReadString( TagLeitura , cchNFe, ''  );
    FnProt:= Fini.ReadString( TagLeitura , cnProt, ''  );
    FArquivo:= Fini.ReadString( TagLeitura , cArquivo, ''  );
    FcodErro:= Fini.ReadInteger( TagLeitura , ccodErro, 0  );
    FMsg:= Fini.ReadString( TagLeitura , cMsg, ''  );  }

  end;
end;

{ TSATImprimirExtratoVenda }

constructor TSATImprimirExtratoVenda.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obSAT;
  FMetodoACBr:= cMetodoImprimirExtratoVenda;
  FRetorno:= '';
end;

procedure TSATImprimirExtratoVenda.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;
end;

{ TSATCriarEnviarCFe }

constructor TSATCriarEnviarCFe.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obSAT;
  FMetodoACBr:= cMetodoCriarEnviarCFe;
  FResultado         :=  '';
  FNumerosecao       :=  '';
  FCodigoDeRetorno   :=  '';
  FRetornoStr        :=  '';
  FArquivo           :=  '';
  FXML               :=  '';

end;

procedure TSATCriarEnviarCFe.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
  begin
    FResultado         := Fini.ReadString( asecaoCFe , cResultado, ''  );
    FNumerosecao       := Fini.ReadString( asecaoCFe , cNumerosecao, ''  );
    FCodigoDeRetorno   := Fini.ReadString( asecaoCFe , cCodigoDeRetorno, ''  );
    FRetornoStr        := Fini.ReadString( asecaoCFe , cRetornoStr, ''  );
    FArquivo           := Fini.ReadString( asecaoCFe , cArqCFe, ''  );
    FXML               := Fini.ReadString( asecaoCFe , cXML, ''  );

  end;
end;

{ TSATConsultarStatusOperacional }

constructor TSATConsultarStatusOperacional.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obSAT;
  FMetodoACBr:= cMetodoConsultarStatusOperacional;
  FRetorno:= '';
end;

procedure TSATConsultarStatusOperacional.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;
end;

{ TSATDesInicializar }

constructor TSATDesInicializar.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obSAT;
  FMetodoACBr:= cMetodoDesInicializar;
  FRetorno:= '';
end;

procedure TSATDesInicializar.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;

end;

{ TSATInicializar }

constructor TSATInicializar.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obSAT;
  FMetodoACBr:= cMetodoInicializar;
  FRetorno:= '';
end;

procedure TSATInicializar.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;
end;

{ TESCImprimirLinha }

constructor TESCImprimirLinha.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obESCPOS;
  FMetodoACBr:= cMetodoImprimirLinhaESC;
  FRetorno:= '';
end;

procedure TESCImprimirLinha.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;
end;

{ TDISLimparDisplay }

constructor TDISLimparDisplay.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obDIS;
  FMetodoACBr:= cMetodoLimparDIS;
  FRetorno:= '';
end;

procedure TDISLimparDisplay.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;
end;

{ TDISResposta }

constructor TDISResposta.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obDIS;
  FMetodoACBr:= cMetodoExibirLinhaDIS;
  FRetorno:= '';
end;

procedure TDISResposta.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FRetorno  := FRespostaUnica;
end;

{ TLCBResposta }

constructor TLCBResposta.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obLCB;
  FMetodoACBr:= cMetodoUltimaLeitura;
  FCodigo:= '';
end;

procedure TLCBResposta.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FCodigo          := FRespostaUnica;
end;

{ TMetodoDesativar }

constructor TMetodoDesativar.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= AObjACBr;
  FMetodoACBr:= cMetodoDesativar;
  FDesativo:= '';
end;

procedure TMetodoDesativar.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FDesativo          := FRespostaUnica;
end;

{ TMetodoAtivar }

constructor TMetodoAtivar.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= AObjACBr;
  FMetodoACBr:= cMetodoAtivar;
  FAtivo:= '';
end;

procedure TMetodoAtivar.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FAtivo          := FRespostaUnica;
end;

{ TBALResposta }

constructor TBALResposta.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obBAL;
  FMetodoACBr:= cMetodoLePeso;
  FPeso:= 0;
end;

procedure TBALResposta.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
    FPeso          := StrToFloatDef(FRespostaUnica,0);

end;

function TPopulaObjResposta.ObjetoACBrToDescricao(const t: TObjetosACBr
  ): String;
begin
  result := EnumeradoToStr(t,  ['GAV','DIS','LCB','ACBR','BAL','ETQ','CEP',
                               'IBGE','EMAIL','SEDEX','NCM','NFE','SAT','ESCPOS'],
                               [obGAV,obDIS,obLCB,obACBR,obBAL,obETQ,obCEP,
                               obIBGE,obEMAIL,obSEDEX,obNCM,obNFE,obSAT,obESCPOS]);
end;

{ TPopulaObjResposta }

constructor TPopulaObjResposta.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create;
  FObjetosACBr:= AObjACBr;
  FRespostaUnica:= '';
  FMetodoACBr:= '';

end;

destructor TPopulaObjResposta.Destroy;
begin
  if Assigned(FIni) then
    FIni.Free;
  inherited Destroy;
end;

procedure TPopulaObjResposta.ObterResposta(const AStream: TStream);
var
  SL: TStringList;
  respOK: String;
begin
  FStream:= AStream;
  respOK:= cOK;

  if Assigned(FStream) then
  begin
    FIni := TMemIniFile.Create('');
    SL := TStringList.Create;
    try
       FStream.Position := 0;
       SL.LoadFromStream(FStream);
       FIni.SetStrings(SL);
       FRespostaUnica:= TrimLeft( StringReplace(SL.Strings[0], respOK, '',
                         [rfReplaceAll, rfIgnoreCase]) ) ;
    finally
       SL.Free;
    end;

  end;
end;

{ TCEPResposta }

constructor TCEPResposta.Create(AObjACBr: TObjetosACBr);
begin
  inherited Create();
  FObjetosACBr:= obCEP;
  FMetodoACBr:= cMetodoBuscarPorCEP;
  FBairro:= '';
  FCEP:= '';
  FComplemento:= '';
  FIBGE_Municipio:= '';
  FIBGE_UF:= '';
  FLogradouro:= '';
  FMunicipio:= '';
  FTipo_Logradouro:= '';
  FUF:= '';
end;

procedure TCEPResposta.ObterResposta(const AStream: TStream);
begin
  inherited ObterResposta(AStream);
  if Assigned(FStream) then
  begin
    FBairro          := Fini.ReadString( AsecaoCEP , cBairro, ''  );
    FCEP             := Fini.ReadString( AsecaoCEP , cCEP, ''  );
    FComplemento     := Fini.ReadString( AsecaoCEP , cComplemento, ''  );
    FIBGE_Municipio  := Fini.ReadString( AsecaoCEP , cIBGE_Municipio, ''  );
    FIBGE_UF         := Fini.ReadString( AsecaoCEP , cIBGE_UF, ''  );
    FLogradouro      := Fini.ReadString( AsecaoCEP , cLogradouro, ''  );
    FMunicipio       := Fini.ReadString( AsecaoCEP , cMunicipio, ''  );
    FTipo_Logradouro := Fini.ReadString( AsecaoCEP , cTipo_Logradouro, ''  );
    FUF              := Fini.ReadString( AsecaoCEP , cUF, ''  );

  end;
end;

end.

