unit IntegracaoConfig;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Contnrs, ACBrUtil, DateUtils, forms, IniFiles, objRetorno;

const
  cnomeTemp = 'Temp.txt';
  cLogIntegracao = 'LogIntegracao.txt';
  cConfiguracaoINI = 'Configuracao.ini';
  cOK = 'OK:';
  cErro= 'Erro: ';

  csecaoConfig= 'Config';
  cCampoPathLeitura= 'PathLeitura';
  cCampoPathEscrita= 'PathEscrita';
  cCampoNomeArqLeitura= 'NomeArqLeitura';
  cCampoNomeArqEscrita= 'NomeArqEscrita';
  cNFCePendente= 'NFCePendente';
  cTempoContingencia='TempoContingencia';
  cContingenciaAutomatica='ContingenciaAutomatica';
  cTentativaReenvio='TentativaReenvio';
  cTempoNormal='TempoNormal';
  cAvisos='Avisos';
  cBloqueio='Bloqueio';

  csecaoInfCFe= 'infCFe';
  cCampoversao= 'versao';

  csecaoIdentificacao= 'Identificacao';
  cCampoCNPJ= 'CNPJ';
  cCampoSignAC= 'SignAC';
  cCamponumeroCaixa= 'NumeroCaixa';
  cCampo_cUF='cUF';
  cCampo_natOp='natOp';
  cCampo_indPag='indPag';
  cCampo_serie='serie';
  cCampo_cNF='cNF';
  cCampo_nNF='nNF';
  cCampo_dhEmi='dhEmi';
  cCampo_tpNF='tpNF';
  cCampo_idDest='idDest';
  cCampo_cMunFG='cMunFG';
  cCampo_indFinal='indFinal';
  cCampo_indPres='indPres';
  cCampo_tpimp='tpimp';
  cCampo_tpEmis='tpEmis';
  cCampo_tpAmb='tpAmb';
  cCampo_dhCont='dhCont';
  cCampo_xJust='xJust';

  csecaoEmitente= 'Emitente';
  cCampoCNPJEmit= 'CNPJ';
  cCampoIEEmit= 'IE';
  cCampoIMEmit= 'IM';
  cCampoindRatISSQNEmit= 'indRatISSQN';
  cCampo_CRT= 'CRT';
  cCampo_Razao='Razao';
  cCampo_Fantasia='Fantasia';
  cCampo_Fone='Fone';
  cCampo_CEP='CEP';
  cCampo_Logradouro='Logradouro';
  cCampo_Numero='Numero';
  cCampo_Complemento='Complemento';
  cCampo_Bairro='Bairro';
  cCampo_CidadeCod='CidadeCod';
  cCampo_Cidade='Cidade';
  cCampo_UF='UF';

  csecaoDestinatario= 'Destinatario';
  cCampoCNPJCPFDest= 'CNPJCPF';
  cCampoNomeDest= 'xNome';
  cCampoIndIEDest= 'indIEDest';

  csecaoProduto= 'Produto';
  cCampocProd= 'cProd';
  cCampoxProd= 'xProd';
  cCampoNCM= 'NCM';
  cCampoCFOP= 'CFOP';
  cCampouCom= 'uCom';
  cCampoCombustivel= 'Combustivel';
  cCampoqCom= 'qCom';
  cCampovUnCom= 'vUnCom';
  cCampoindRegra= 'indRegra';
  cCampovItem= 'vItem';
  cCampovProd= 'vProd';

  csecaoICMS= 'ICMS';
  cCampoOrig= 'Orig';
  cCampoCSOSN= 'CSOSN';

  csecaoPIS= 'PIS';
  cCampoCST= 'CST';

  csecaoCOFINS= 'COFINS';

  csecaoISSQN= 'ISSQN';
  cCampo_vBC='vBC';
  cCampo_vAliq='vAliq';
  cCampo_vISSQN='vISSQN';
  cCampo_cListServ='cListServ';
  cCampo_vISSRet='vISSRet';
  cCampo_indISS='indISS';
  cCampo_indIncentivo='indIncentivo';

  csecaoDescAcrEntr= 'DescAcrEntr';
  cCampovDescSubtot= 'vDescSubtot';
  cCampovAcresSubtot= 'vAcresSubtot';

  csecaoTotal= 'Total';
  cCampovalorNota= 'valorNota';
  cCampovTroco= 'vTroco';
  cCampovBC='vBC';

  csecaoISSQNtot='ISSQNtot';
  cCampo_vServ='vServ';
  cCampo_vISS='vISS';
  cCampo_dCompet='dCompet';

  csecaoPagto= 'Pagto';
  cCampocMP= 'cMP';
  cCampovMP= 'vMP';

  csecaoPag= 'Pag';
  cCampo_tPag='tPag';
  cCampo_vPag='vPag';

  csecaoTransportador= 'Transportador';
  cCampo_modFrete='modFrete';


  cPathEntradaDefault= 'C:\ACBrMonitorPLUS\';
  cPathSaidaDefault= 'C:\ACBrMonitorPLUS\';
  cNomeArqEntradaDefault = 'ENT.txt';
  cNomeArqSaidaDefault = 'SAI.txt';


  cEnvio= '<<< Envio >>>';
  cRetorno= '<<< Retorno >>>';

ResourceString
  SErrPathEntradaNaoDefinido = 'Path de Entrada não definido para Integração';
  SErrPathSaidaNaoDefinido = 'Path de Saida não definido para Integração';
  SErrDiretorioEntradaInvalido = 'Diretório Entrada Inválido para Integração: %s';
  SErrDiretorioSaidaInvalido = 'Diretório Saida Inválido para Integração: %s';
  SErrArqRespostaNaoEncontrado= 'Resposta não encontrado em: ';

type

  EDemoException = class(Exception);

  { TNFePendente}
  TNFePendente = class
    private
      FChavePendente: String;
      FDataHora: TDatetime;
      FErro: String;
      FcStat: String;
      FMsgRetorno: String;
      FChaveRelacionada: String;
      FchaveCancelada: Boolean;
      FChaveInutilizada: Boolean;
      FAjusteReenvio: Boolean;
      FTransmitida: Boolean;
    public
      constructor Create();
      destructor Destroy; override;

      property ChavePendente: String read FChavePendente write FChavePendente;
      property DataHora: TDatetime   read FDataHora      write FDataHora;
      property Erro: String          read FErro          write FErro;
      property cStat: String         read FcStat         write FcStat;
      property MsgRetorno: String    read FMsgRetorno    write FMsgRetorno;
      property ChaveRelacionada: String read FChaveRelacionada write FChaveRelacionada;
      property ChaveCancelada: Boolean read FChaveCancelada write FchaveCancelada;
      property ChaveInutilizada: Boolean read FChaveInutilizada write FChaveInutilizada;
      property AjusteReenvio: Boolean read FAjusteReenvio write FAjusteReenvio;
      property Transmitida: Boolean read FTransmitida write FTransmitida;

  end;

  { TListaNFePendente }
  TListaNFePendente = class(TObjectList)
  protected
    procedure SetObject (Index: Integer; Item: TNFePendente);
    function  GetObject (Index: Integer): TNFePendente;
    procedure Insert (Index: Integer; Obj: TNFePendente);
  public
    function Add (Obj: TNFePendente): Integer;
    property Objects [Index: Integer]: TNFePendente read GetObject write SetObject; default;
  end;

  { TIntegracaoConfig }

  TIntegracaoConfig = class
    private
      FOffLine: Boolean;
      FChavePendente: String;
      FChaveRelacionada: String;
      FRelaciona: Boolean;
      FListaNFePendente : TListaNFePendente;
      FPathArqEntrada: String;
      FPathArqSaida: String;
      FNomeArqEntrada: String;
      FNomeArqSaida: String;
      FPathLogIntegracao: String;
      FCampoCNPJ: String;
      FCampoSignAC: String;
      FCamponumeroCaixa: String;
      FCampoCNPJEmit: String;
      FCampoIEEmit: String;
      FCampoIMEmit: String;
      FCampoindRatISSQNEmit: String;

      FNFCePendente: Integer;
      FTempoContingencia: TDateTime;
      FContingenciaAutomatica: Boolean;
      FTentativaReenvio: Integer;
      FTempoNormal: Integer;
      FAvisos: Integer;
      FBloqueio: Integer;

      FCampo_CRT: String;
      FCampo_Razao: String;
      FCampo_Fantasia: String;
      FCampo_Fone: String;
      FCampo_CEP: String;
      FCampo_Logradouro: String;
      FCampo_Numero: String;
      FCampo_Complemento: String;
      FCampo_Bairro: String;
      FCampo_CidadeCod: String;
      FCampo_Cidade: String;
      FCampo_UF: String;

      FCampo_cUF: Integer;
      FCampo_natOp: String;
      FCampo_indPag: Integer;
      FCampo_serie: String;
      FCampo_cNF: Integer;
      FCampo_nNF: String;
      FCampo_dhEmi: TDateTime;
      FCampo_tpNF: String;
      FCampo_idDest: Integer;
      FCampo_cMunFG: String;
      FCampo_indFinal: Integer;
      FCampo_indPres: Integer;
      FCampo_tpimp: Integer;
      FCampo_tpEmis: Integer;
      FCampo_tpAmb: Integer;
      FCampo_dhCont: TDateTime;
      FCampo_xJust: String;

      procedure ValidarPath(const AOut: Boolean = False );
      function SintaxeMetodo(const Objeto, Comando, Parametros: String): String;
      procedure ExcluirArquivo(const APath: String);
      procedure AddLogIntegracao(ALog: String);
      procedure AddLogIntegracao(ALog: TStrings);overload;

      procedure LimparParametros;
      function SalvarArquivo(objRetorno: TPopulaObjResposta; const Parametros: String): String;
      procedure LerArquivo(out Ok: String; objRetorno: TPopulaObjResposta; linhaCompleta: Boolean = False);

    public
      constructor Create();
      destructor Destroy; override;

      procedure ParametrizarPathIntegracao(AUpdate: Boolean);
      procedure ConfigurarOffLine(off: Boolean);
      procedure Executar(out Ok: String; objRetorno: TPopulaObjResposta ;
               const Parametros: String; const TempoEspera: Integer; const LinhaCompleta: Boolean = False );

      property ListaNFePendente : TListaNFePendente read FListaNFePendente write FListaNFePendente;
      function AdicionarNFePendente: TNFePendente;

      property OffLine: Boolean           read FOffLine write FOffLine;
      property ChavePendente: String      read FChavePendente write FChavePendente;
      property ChaveRelacionada: String   read FChaveRelacionada write FChaveRelacionada;
      property Relaciona: Boolean         read FRelaciona write FRelaciona;
      property PathArqEntrada: String     read FPathArqEntrada;
      property PathArqSaida: String       read FPathArqSaida;
      property NomeArqEntrada: String     read FNomeArqEntrada;
      property NomeArqSaida: String       read FNomeArqSaida;
      property PathLogIntegracao: String  read FPathLogIntegracao;
      property CampoCNPJ: String          read FCampoCNPJ;
      property CampoSignAC: String        read FCampoSignAC;
      property CamponumeroCaixa: String   read FCamponumeroCaixa;
      property CampoCNPJEmit: String      read FCampoCNPJEmit;
      property CampoIEEmit: String        read FCampoIEEmit;
      property CampoIMEmit: String        read FCampoIMEmit;
      property CampoindRatISSQNEmit: String read FCampoindRatISSQNEmit;

      property NFCePendente: Integer             read FNFCePendente write FNFCePendente;
      property TempoContingencia: TDateTime      read FTempoContingencia write FTempoContingencia;
      property ContingenciaAutomatica: Boolean   read FContingenciaAutomatica;
      property TentativaReenvio: Integer         read FTentativaReenvio;
      property TempoNormal: Integer              read FTempoNormal;
      property Avisos: Integer                   read FAvisos;
      property Bloqueio: Integer                 read FBloqueio;

      property Campo_CRT: String read FCampo_CRT;
      property Campo_Razao: String read FCampo_Razao;
      property Campo_Fantasia: String read FCampo_Fantasia;
      property Campo_Fone: String read FCampo_Fone;
      property Campo_CEP: String read FCampo_CEP;
      property Campo_Logradouro: String read FCampo_Logradouro;
      property Campo_Numero: String read FCampo_Numero;
      property Campo_Complemento: String read FCampo_Complemento;
      property Campo_Bairro: String read FCampo_Bairro;
      property Campo_CidadeCod: String read FCampo_CidadeCod;
      property Campo_Cidade: String read FCampo_Cidade;
      property Campo_UF: String read FCampo_UF;

      property Campo_cUF: Integer read FCampo_cUF;
      property Campo_natOp: String read FCampo_natOp;
      property Campo_indPag: Integer read FCampo_indPag;
      property Campo_serie: String read FCampo_serie;
      property Campo_cNF: Integer read FCampo_cNF;
      property Campo_nNF: String read FCampo_nNF;
      property Campo_dhEmi: TDateTime read FCampo_dhEmi;
      property Campo_tpNF: String read FCampo_tpNF;
      property Campo_idDest: Integer read FCampo_idDest;
      property Campo_cMunFG: String read FCampo_cMunFG;
      property Campo_indFinal: Integer read FCampo_indFinal;
      property Campo_indPres: Integer read FCampo_indPres;
      property Campo_tpimp: Integer read FCampo_tpimp;
      property Campo_tpEmis: Integer read FCampo_tpEmis;
      property Campo_tpAmb: Integer read FCampo_tpAmb;
      property Campo_dhCont: TDateTime read FCampo_dhCont;
      property Campo_xJust:  String read FCampo_xJust;

  end;

implementation

{ TListaNFePendente }

procedure TListaNFePendente.SetObject(Index: Integer; Item: TNFePendente);
begin
  inherited SetItem (Index, Item) ;
end;

function TListaNFePendente.GetObject(Index: Integer): TNFePendente;
begin
  Result := inherited GetItem(Index) as TNFePendente ;
end;

procedure TListaNFePendente.Insert(Index: Integer; Obj: TNFePendente);
begin
  inherited Insert(Index, Obj);
end;

function TListaNFePendente.Add(Obj: TNFePendente): Integer;
begin
  Result := inherited Add(Obj) ;
end;

{ TNFePendente }

constructor TNFePendente.Create();
begin
  FChavePendente:= '';
  FDataHora:= 0;
  FErro:= '';
  FcStat:= '';
  FMsgRetorno:= '';
  FChaveRelacionada:= '';
  FchaveCancelada:= False;
  FChaveInutilizada:= False;
  FAjusteReenvio:= False;
  FTransmitida:= False;

end;

destructor TNFePendente.Destroy;
begin
  inherited Destroy;
end;


{ TIntegracaoConfig }

procedure TIntegracaoConfig.ValidarPath(const AOut: Boolean = False);
begin
  if not AOut then
  begin
    if FPathArqEntrada = '' then
    raise EDemoException.Create(SErrPathEntradaNaoDefinido);

    if (not DirectoryExists(FPathArqEntrada)) then
    raise EDemoException.CreateFmt(SErrDiretorioEntradaInvalido, [FPathArqEntrada]);

  end
  else
  begin
    if FPathArqSaida = '' then
      raise EDemoException.Create(SErrPathSaidaNaoDefinido);

    if (not DirectoryExists(FPathArqSaida)) then
      raise EDemoException.CreateFmt(SErrDiretorioSaidaInvalido, [FPathArqSaida]);

  end;

end;

function TIntegracaoConfig.SintaxeMetodo(const Objeto, Comando, Parametros: String
  ): String;
begin
  Result:= Objeto + '.' + Comando +'('+ Parametros +')' ;
end;

constructor TIntegracaoConfig.Create();
begin
  FOffLine:= False;
  FChavePendente:= '';
  FChaveRelacionada:= '';
  FNFCePendente:= 0;
  FTempoContingencia:= 0;
  FRelaciona:= False;
  LimparParametros;
  FListaNFePendente := TListaNFePendente.Create(true);
  ParametrizarPathIntegracao(False);
  FPathLogIntegracao:= PathWithDelim(ExtractFilePath(Application.ExeName)) + cLogIntegracao;

  ExcluirArquivo(FPathLogIntegracao);
end;

destructor TIntegracaoConfig.Destroy;
begin
  FListaNFePendente.Free;
  inherited Destroy;
end;

function TIntegracaoConfig.SalvarArquivo(objRetorno: TPopulaObjResposta; const Parametros: String): String;
var
  FS: TFileStream;
  SL: TStringList;
  Path, PathTemp : String;
begin
  Result:= '';
  ValidarPath;
  PathTemp := PathWithDelim(FPathArqEntrada) + cnomeTemp;
  Path := PathWithDelim( FPathArqEntrada ) + FNomeArqEntrada;

  if FileExists(Path) then
    TryDeleteFile(Path, 1000);

  if FileExists(PathTemp) then
    TryDeleteFile(PathTemp, 1000);


  FS := TFileStream.Create(PathTemp, fmCreate or fmOpenReadWrite);
  try
    SL := TStringList.Create;
    try
      FS.Position := 0;
      with objRetorno do
        SL.Add( SintaxeMetodo(ObjetoACBrToDescricao(ObjetoACBr), MetodoACBr, Parametros) );
      SL.SaveToStream(FS);
    finally
      Result:= SL.Text;
      AddLogIntegracao(sLineBreak + cEnvio );
      AddLogIntegracao(SL);
      SL.Free;
    end;

  finally
    FS.Free;
    RenameFile(PathTemp, Path);
  end;


end;

procedure TIntegracaoConfig.LerArquivo(out Ok: String;
  objRetorno: TPopulaObjResposta; linhaCompleta: Boolean = False);
var
  FS: TFileStream;
  SL: TStringList;
  Path: String;
  Line: String;
begin
  ValidarPath(True);
  Path := PathWithDelim( FPathArqSaida ) + FNomeArqSaida;

  if  FileExists(Path) then
  begin
    SL := TStringList.Create;
    try
      SL.LoadFromFile(Path);
      Line := StringReplace(SL.Strings[0],' [', sLineBreak + '[',
             [rfReplaceAll, rfIgnoreCase] );
      if not(linhaCompleta) then
        ok:= copy(SL.Strings[0],1,3)
      else
        ok:= copy(SL.Strings[0], 1, Length(SL.Strings[0]) );
      if Pos('[',line) <> 0 then
      begin
        SL.Strings[0]:= Line;
        SL.SaveToFile(Path);
        Sleep(100);
      end;

      AddLogIntegracao(sLineBreak + cRetorno);
      AddLogIntegracao(SL);
    finally
      SL.free;
    end;

    FS := TFileStream.Create(Path, fmOpenRead);
    try
      FS.Position := 0;
      if (ok = cOK) then
         objRetorno.ObterResposta(FS)
      else
         ok:= Line ;

    finally
      FS.Free;
    end;

    ExcluirArquivo(Path);

  end;

end;

procedure TIntegracaoConfig.Executar(out Ok: String; objRetorno: TPopulaObjResposta ;
         const Parametros: String; const TempoEspera: Integer; const LinhaCompleta: Boolean = False);
Var
  Espera : TDateTime ;
  Valido: Boolean;
  APath: String;
begin
  Ok:= '';
  SalvarArquivo(objRetorno, Parametros);

  APath := PathWithDelim( FPathArqSaida ) + FNomeArqSaida;
  Espera := IncMilliSecond(now, TempoEspera) ;

  repeat
    Valido := ( FileExists( APath ));
    if Valido then
      Break;

    Sleep(100);
  until (now > Espera) ;

  if Valido then
    LerArquivo(Ok, objRetorno, LinhaCompleta)
  else
  begin
    Ok:= cErro + SErrArqRespostaNaoEncontrado + APath;
    AddLogIntegracao(Ok);
  end;

end;

function TIntegracaoConfig.AdicionarNFePendente: TNFePendente;
var
  i: Integer;
begin
  i := FListaNFePendente.Add(TNFePendente.Create());
  Result:= FListaNFePendente[i];
end;


procedure TIntegracaoConfig.ExcluirArquivo(const APath: String);
begin
  if FileExists(APath) then
    TryDeleteFile(Apath, 1000);
end;

procedure TIntegracaoConfig.AddLogIntegracao(ALog: String);
var
  AtualizaArquivoExistente: Boolean;
  PularLinha: Boolean;
begin
  AtualizaArquivoExistente:= True;
  PularLinha:= True;

  if (ALog <> '' ) then
    WriteToTXT(FPathLogIntegracao, ALog, AtualizaArquivoExistente, PularLinha);

end;

procedure TIntegracaoConfig.AddLogIntegracao(ALog: TStrings);
var
  AtualizaArquivoExistente: Boolean;
  PularLinha: Boolean;
begin
  AtualizaArquivoExistente:= True;
  PularLinha:= True;

  if (ALog.Count > 0 ) then
    WriteToTXT(FPathLogIntegracao, ALog.Text, AtualizaArquivoExistente, PularLinha);


end;

procedure TIntegracaoConfig.LimparParametros;
begin
  FPathArqEntrada:= '';
  FPathArqSaida:= '';
  FNomeArqEntrada:= '';
  FNomeArqSaida:= '';
  FCampoCNPJ:= '';
  FCampoSignAC:= '';
  FCamponumeroCaixa:= '';
  FCampoCNPJEmit:= '';
  FCampoIEEmit:= '';
  FCampoIMEmit:= '';
  FCampoindRatISSQNEmit:= '';

  FContingenciaAutomatica:= True;
  FTentativaReenvio:= 1;
  FTempoNormal:= 1;
  FAvisos:= 1;
  FBloqueio:= 1;

  FCampo_CRT:= '1';
  FCampo_Razao:= '';
  FCampo_Fantasia:= '';
  FCampo_Fone:= '';
  FCampo_CEP:= '';
  FCampo_Logradouro:= '';
  FCampo_Numero:= '';
  FCampo_Complemento:= '';
  FCampo_Bairro:= '';
  FCampo_CidadeCod:= '';
  FCampo_Cidade:= '';
  FCampo_UF:= '';

  FCampo_cUF:= 0;
  FCampo_natOp:= '';
  FCampo_indPag:=0;
  FCampo_serie:= '';
  FCampo_cNF:=0;
  FCampo_nNF:= '';
  FCampo_dhEmi:= 0;
  FCampo_tpNF:= '1';
  FCampo_idDest:= 1;
  FCampo_cMunFG:= '';
  FCampo_indFinal:= 1;
  FCampo_indPres:= 1;
  FCampo_tpimp:= 4;
  FCampo_tpEmis:= 1;
  FCampo_tpAmb:= 2;
  FCampo_dhCont:= 0;
  FCampo_xJust:= '';
end;

procedure TIntegracaoConfig.ParametrizarPathIntegracao(AUpdate: Boolean);
var
  lINI: TMemIniFile;
  SL : TStringList;
  PathINI: String;
begin

  PathINI:= PathWithDelim(ExtractFilePath(Application.ExeName)) + cConfiguracaoINI;

  if (FileExists( PathINI ) and (not(AUpdate))) then
  begin
    LimparParametros;
    SL := TStringList.Create;
    try
      SL.LoadFromFile(PathINI);
      lINI := TMemIniFile.Create('');
      try
        LIni.SetStrings(SL);
        FPathArqEntrada          := lINI.ReadString( csecaoConfig , cCampoPathLeitura, FPathArqEntrada  );
        FPathArqSaida            := lINI.ReadString( csecaoConfig , cCampoPathEscrita, FPathArqSaida  );
        FNomeArqEntrada          := lINI.ReadString( csecaoConfig , cCampoNomeArqLeitura, FNomeArqEntrada  );
        FNomeArqSaida            := lINI.ReadString( csecaoConfig , cCampoNomeArqEscrita, FNomeArqSaida  );

        //FNFCePendente            := lINI.ReadInteger( csecaoConfig , cNFCePendente, FNFCePendente );
        //FTempoContingencia       := lINI.ReadDateTime( csecaoConfig , cTempoContingencia, FTempoContingencia );
        FContingenciaAutomatica  := lINI.ReadBool( csecaoConfig , cContingenciaAutomatica, FContingenciaAutomatica );
        FTentativaReenvio        := lINI.ReadInteger( csecaoConfig , cTentativaReenvio, FTentativaReenvio );
        FTempoNormal             := lINI.ReadInteger( csecaoConfig , cTempoNormal, FTempoNormal );
        FAvisos                  := lINI.ReadInteger( csecaoConfig , cAvisos, FAvisos );
        FBloqueio                := lINI.ReadInteger( csecaoConfig , cBloqueio, FBloqueio);

        FCampoCNPJ               := lINI.ReadString( csecaoIdentificacao , cCampoCNPJ, FCampoCNPJ  );
        FCampoSignAC             := lINI.ReadString( csecaoIdentificacao , cCampoSignAC, FCampoSignAC  );
        FCamponumeroCaixa        := lINI.ReadString( csecaoIdentificacao , cCamponumeroCaixa, FCamponumeroCaixa  );

        FCampo_cUF               := lINI.ReadInteger( csecaoIdentificacao , cCampo_cUF, FCampo_cUF  );
        FCampo_natOp             := lINI.ReadString( csecaoIdentificacao , cCampo_natOp, FCampo_natOp  );
        FCampo_indPag            := lINI.ReadInteger( csecaoIdentificacao , cCampo_indPag, FCampo_indPag );
        FCampo_serie             := lINI.ReadString( csecaoIdentificacao , cCampo_serie, FCampo_serie  );
        FCampo_cNF               := lINI.ReadInteger( csecaoIdentificacao , cCampo_cNF, FCampo_cNF  );
        FCampo_nNF               := lINI.ReadString( csecaoIdentificacao , cCampo_nNF, FCampo_nNF  );
        FCampo_dhEmi             := lINI.ReadDateTime( csecaoIdentificacao , cCampo_dhEmi, FCampo_dhEmi );
        FCampo_tpNF              := lINI.ReadString( csecaoIdentificacao , cCampo_tpNF, FCampo_tpNF  );
        FCampo_idDest            := lINI.ReadInteger( csecaoIdentificacao , cCampo_idDest, FCampo_idDest );
        FCampo_cMunFG            := lINI.ReadString( csecaoIdentificacao , cCampo_cMunFG, FCampo_cMunFG  );
        FCampo_indFinal          := lINI.ReadInteger( csecaoIdentificacao , cCampo_indFinal, FCampo_indFinal );
        FCampo_indPres           := lINI.ReadInteger( csecaoIdentificacao , cCampo_indPres, FCampo_indPres );
        FCampo_tpimp             := lINI.ReadInteger( csecaoIdentificacao , cCampo_tpimp, FCampo_tpimp );
        FCampo_tpEmis            := lINI.ReadInteger( csecaoIdentificacao , cCampo_tpEmis, FCampo_tpEmis );
        FCampo_tpAmb             := lINI.ReadInteger( csecaoIdentificacao , cCampo_tpAmb, FCampo_tpAmb );
        FCampo_dhCont            := lINI.ReadDateTime( csecaoIdentificacao , cCampo_dhCont, FCampo_dhCont );
        FCampo_xJust             := lINI.ReadString( csecaoIdentificacao , cCampo_xJust, FCampo_xJust  );

        FCampoCNPJEmit           := lINI.ReadString( csecaoEmitente , cCampoCNPJEmit, FCampoCNPJEmit  );
        FCampoIEEmit             := lINI.ReadString( csecaoEmitente , cCampoIEEmit, FCampoIEEmit  );
        FCampoIMEmit             := lINI.ReadString( csecaoEmitente , cCampoIMEmit, FCampoIMEmit  );
        FCampoindRatISSQNEmit    := lINI.ReadString( csecaoEmitente , cCampoindRatISSQNEmit, FCampoindRatISSQNEmit  );

        FCampo_CRT               := lINI.ReadString( csecaoEmitente , cCampo_CRT, FCampo_CRT          );
        FCampo_Razao             := lINI.ReadString( csecaoEmitente , cCampo_Razao, FCampo_Razao        );
        FCampo_Fantasia          := lINI.ReadString( csecaoEmitente , cCampo_Fantasia, FCampo_Fantasia     );
        FCampo_Fone              := lINI.ReadString( csecaoEmitente , cCampo_Fone, FCampo_Fone         );
        FCampo_CEP               := lINI.ReadString( csecaoEmitente , cCampo_CEP, FCampo_CEP          );
        FCampo_Logradouro        := lINI.ReadString( csecaoEmitente , cCampo_Logradouro, FCampo_Logradouro   );
        FCampo_Numero            := lINI.ReadString( csecaoEmitente , cCampo_Numero, FCampo_Numero       );
        FCampo_Complemento       := lINI.ReadString( csecaoEmitente , cCampo_Complemento, FCampo_Complemento  );
        FCampo_Bairro            := lINI.ReadString( csecaoEmitente , cCampo_Bairro, FCampo_Bairro       );
        FCampo_CidadeCod         := lINI.ReadString( csecaoEmitente , cCampo_CidadeCod, FCampo_CidadeCod    );
        FCampo_Cidade            := lINI.ReadString( csecaoEmitente , cCampo_Cidade, FCampo_Cidade       );
        FCampo_UF                := lINI.ReadString( csecaoEmitente , cCampo_UF, FCampo_UF           );

      finally
        lINI.free
      end;

    finally
      SL.Free;
    end;

  end
  else
  begin
    if EstaVazio(FPathArqEntrada) then
    begin
      FPathArqEntrada          := cPathEntradaDefault;
      FPathArqSaida            := cPathSaidaDefault;
      FNomeArqEntrada          := cNomeArqEntradaDefault;
      FNomeArqSaida            := cNomeArqSaidaDefault;

    end;

    LINI := TMemIniFile.Create('');
    try
      LINI.WriteString( csecaoConfig , cCampoPathLeitura, FPathArqEntrada  );
      LINI.WriteString( csecaoConfig , cCampoPathEscrita, FPathArqSaida  );
      LINI.WriteString( csecaoConfig , cCampoNomeArqLeitura, FNomeArqEntrada  );
      LINI.WriteString( csecaoConfig , cCampoNomeArqEscrita, FNomeArqSaida  );

      //LINI.WriteInteger( csecaoConfig , cNFCePendente, FNFCePendente );
      //LINI.WriteDateTime( csecaoConfig , cTempoContingencia, FTempoContingencia );
      LINI.WriteBool( csecaoConfig , cContingenciaAutomatica, FContingenciaAutomatica );
      LINI.WriteInteger( csecaoConfig , cTentativaReenvio, FTentativaReenvio );
      LINI.WriteInteger( csecaoConfig , cTempoNormal, FTempoNormal );
      LINI.WriteInteger( csecaoConfig , cAvisos, FAvisos );
      LINI.WriteInteger( csecaoConfig , cBloqueio, FBloqueio);

      LINI.WriteString( csecaoIdentificacao , cCampoCNPJ, FCampoCNPJ  );
      LINI.WriteString( csecaoIdentificacao , cCampoSignAC, FCampoSignAC  );
      LINI.WriteString( csecaoIdentificacao , cCamponumeroCaixa, FCamponumeroCaixa  );

      LINI.WriteInteger( csecaoIdentificacao , cCampo_cUF, FCampo_cUF  );
      LINI.WriteString( csecaoIdentificacao , cCampo_natOp, FCampo_natOp  );
      LINI.WriteInteger( csecaoIdentificacao , cCampo_indPag, FCampo_indPag );
      LINI.WriteString( csecaoIdentificacao , cCampo_serie, FCampo_serie  );
      LINI.WriteInteger( csecaoIdentificacao , cCampo_cNF, FCampo_cNF );
      LINI.WriteInteger( csecaoIdentificacao , cCampo_nNF, StrToIntDef(FCampo_nNF,0) + 1);
      LINI.WriteDateTime( csecaoIdentificacao , cCampo_dhEmi, FCampo_dhEmi );
      LINI.WriteString( csecaoIdentificacao , cCampo_tpNF, FCampo_tpNF  );
      LINI.WriteInteger( csecaoIdentificacao , cCampo_idDest, FCampo_idDest );
      LINI.WriteString( csecaoIdentificacao , cCampo_cMunFG, FCampo_cMunFG  );
      LINI.WriteInteger( csecaoIdentificacao , cCampo_indFinal, FCampo_indFinal );
      LINI.WriteInteger( csecaoIdentificacao , cCampo_indPres, FCampo_indPres );
      LINI.WriteInteger( csecaoIdentificacao , cCampo_tpimp, FCampo_tpimp );
      LINI.WriteInteger( csecaoIdentificacao , cCampo_tpEmis, FCampo_tpEmis );
      LINI.WriteInteger( csecaoIdentificacao , cCampo_tpAmb, FCampo_tpAmb );
      LINI.WriteDateTime( csecaoIdentificacao , cCampo_dhCont, FCampo_dhCont );
      LINI.WriteString( csecaoIdentificacao , cCampo_xJust, FCampo_xJust  );

      LINI.WriteString( csecaoEmitente , cCampoCNPJEmit, FCampoCNPJEmit  );
      LINI.WriteString( csecaoEmitente , cCampoIEEmit, FCampoIEEmit  );
      LINI.WriteString( csecaoEmitente , cCampoIMEmit, FCampoIMEmit  );
      LINI.WriteString( csecaoEmitente , cCampoindRatISSQNEmit, FCampoindRatISSQNEmit  );

      LINI.WriteString( csecaoEmitente , cCampo_CRT, FCampo_CRT          );
      LINI.WriteString( csecaoEmitente , cCampo_Razao, FCampo_Razao        );
      LINI.WriteString( csecaoEmitente , cCampo_Fantasia, FCampo_Fantasia     );
      LINI.WriteString( csecaoEmitente , cCampo_Fone, FCampo_Fone         );
      LINI.WriteString( csecaoEmitente , cCampo_CEP, FCampo_CEP          );
      LINI.WriteString( csecaoEmitente , cCampo_Logradouro, FCampo_Logradouro   );
      LINI.WriteString( csecaoEmitente , cCampo_Numero, FCampo_Numero       );
      LINI.WriteString( csecaoEmitente , cCampo_Complemento, FCampo_Complemento  );
      LINI.WriteString( csecaoEmitente , cCampo_Bairro, FCampo_Bairro       );
      LINI.WriteString( csecaoEmitente , cCampo_CidadeCod, FCampo_CidadeCod    );
      LINI.WriteString( csecaoEmitente , cCampo_Cidade, FCampo_Cidade       );
      LINI.WriteString( csecaoEmitente , cCampo_UF, FCampo_UF           );

      SL := TStringList.Create;
      try
        LINI.GetStrings(SL);
        SL.SaveToFile(PathINI);
      finally
        SL.Free;
      end;

    finally
      lINI.free
    end;

  end;
end;

procedure TIntegracaoConfig.ConfigurarOffLine(off: Boolean);
begin
   FOffLine:= off;
end;

end.

