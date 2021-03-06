{******************************************************************************}
{ Projeto: Componente ACBrNFe                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emiss?o de Nota Fiscal}
{ eletr?nica - NFe - http://www.nfe.fazenda.gov.br                          }
{                                                                              }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       Andr? Ferreira de Moraes               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc? pode obter a ?ltima vers?o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
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

{******************************************************************************
|* Historico
|*
|* 16/12/2008: Wemerson Souto
|*  - Doa??o do componente para o Projeto ACBr
|* 25/07/2009: Gilson Carmo
|*  - Envio do e-mail utilizando Thread
******************************************************************************}
{$I ACBr.inc}

unit ACBrNFeNotasFiscais;

interface

uses
  Classes, Sysutils, Dialogs, Forms,
  ACBrNFeUtil, ACBrNFeConfiguracoes,
  ACBrNFeDANFEClass,
  smtpsend, ssl_openssl, mimemess, mimepart, // units para enviar email
  pcnNFe, pcnNFeR, pcnNFeW, pcnConversao, pcnAuxiliar, pcnLeitor;

type

  NotaFiscal = class(TCollectionItem)
  private
    FNFe: TNFe;
    FXML: AnsiString;
    FConfirmada : Boolean;
    FMsg : AnsiString ;
    FAlertas: AnsiString;
    FNomeArq: String;
    function GetNFeXML: AnsiString;
  public
    constructor Create(Collection2: TCollection); override;
    destructor Destroy; override;
    procedure Imprimir;
    procedure ImprimirPDF;
    function SaveToFile(CaminhoArquivo: string = ''; SalvaTXT : Boolean = False): boolean;
    function SaveToStream(Stream: TStringStream): boolean;
    procedure EnviarEmail(const sSmtpHost,
                                sSmtpPort,
                                sSmtpUser,
                                sSmtpPasswd,
                                sFrom,
                                sTo,
                                sAssunto: String;
                                sMensagem : TStrings;
                                SSL : Boolean;
                                EnviaPDF: Boolean = true;
                                sCC: TStrings = nil;
                                Anexos:TStrings=nil);
    property NFe: TNFe  read FNFe write FNFe;
    property XML: AnsiString  read GetNFeXML write FXML;
    property Confirmada: Boolean  read FConfirmada write FConfirmada;
    property Msg: AnsiString  read FMsg write FMsg;
    property Alertas: AnsiString read FAlertas write FAlertas;
    property NomeArq: String read FNomeArq write FNomeArq;
  end;

  TNotasFiscais = class(TOwnedCollection)
  private
    FConfiguracoes : TConfiguracoes;
    FACBrNFe : TComponent ;

    function GetItem(Index: Integer): NotaFiscal;
    procedure SetItem(Index: Integer; const Value: NotaFiscal);
  public
    constructor Create(AOwner: TPersistent; ItemClass: TCollectionItemClass);

    procedure GerarNFe;
    procedure Assinar;
    procedure Valida;
    procedure Imprimir;
    procedure ImprimirPDF;
    function  Add: NotaFiscal;
    function Insert(Index: Integer): NotaFiscal;
    property Items[Index: Integer]: NotaFiscal read GetItem  write SetItem;
    property Configuracoes: TConfiguracoes read FConfiguracoes  write FConfiguracoes;

    function GetNamePath: string; override ;
    function LoadFromFile(CaminhoArquivo: string): boolean;
    function LoadFromStream(Stream: TStringStream): boolean;
    function SaveToFile(PathArquivo: string = ''; SalvaTXT : Boolean = False): boolean;

    property ACBrNFe : TComponent read FACBrNFe ;
  end;

  TSendMailThread = class(TThread)
  private
    FException : Exception;
    procedure DoHandleException;
  public
    smtp : TSMTPSend;
    sFrom : String;
    sTo : String;
    sCC : TStrings;
    slmsg_Lines : TStrings;
    constructor Create;
    destructor Destroy ; override ;
  protected
    procedure Execute; override;
    procedure HandleException;
  end;


implementation

uses ACBrNFe, ACBrUtil, pcnGerador;

{ NotaFiscal }

constructor NotaFiscal.Create(Collection2: TCollection);
begin
  inherited Create(Collection2);
  FNFe := TNFe.Create;

  FNFe.Ide.tpNF   := tnSaida;
  FNFe.Ide.modelo := 55;

  FNFe.Ide.tpNF      := tnSaida;
  FNFe.Ide.indPag    := ipVista;
  FNFe.Ide.verProc   := '1.0.0.0';
  FNFe.Ide.tpAmb     := TACBrNFe( TNotasFiscais( Collection ).ACBrNFe ).Configuracoes.WebServices.Ambiente  ;
  FNFe.Ide.tpEmis    := TACBrNFe( TNotasFiscais( Collection ).ACBrNFe ).Configuracoes.Geral.FormaEmissao ;  

  FNFe.Emit.EnderEmit.xPais := 'BRASIL';
  FNFe.Emit.EnderEmit.cPais := 1058;
  FNFe.Emit.EnderEmit.nro   := 'SEM NUMERO';

  FNFe.Dest.EnderDest.xPais := 'BRASIL';
  FNFe.Dest.EnderDest.cPais := 1058;
  FNFe.Dest.EnderDest.nro   := 'SEM NUMERO';

end;

destructor NotaFiscal.Destroy;
begin
  FNFe.Free;
  inherited Destroy;
end;

procedure NotaFiscal.Imprimir;
begin
  TACBrNFe( TNotasFiscais( Collection ).ACBrNFe ).DANFE.ImprimirDANFE(NFe);
end;

procedure NotaFiscal.ImprimirPDF;
begin
  TACBrNFe( TNotasFiscais( Collection ).ACBrNFe ).DANFE.ImprimirDANFEPDF(NFe);
end;

function NotaFiscal.SaveToFile(CaminhoArquivo: string = ''; SalvaTXT : Boolean = False): boolean;
var
  LocNFeW : TNFeW;
begin
  try
     Result := True;
     LocNFeW := TNFeW.Create(NFe);
     try
        LocNFeW.schema := TsPL005c;
        LocNFeW.Opcoes.GerarTXTSimultaneamente := SalvaTXT;
        LocNFeW.GerarXml;
        if NotaUtil.EstaVazio(CaminhoArquivo) then
           CaminhoArquivo := PathWithDelim(TACBrNFe( TNotasFiscais( Collection ).ACBrNFe ).Configuracoes.Geral.PathSalvar)+copy(NFe.infNFe.ID, (length(NFe.infNFe.ID)-44)+1, 44)+'-NFe.xml';
        LocNFeW.Gerador.SalvarArquivo(CaminhoArquivo);
        if SalvaTXT then
           LocNFeW.Gerador.SalvarArquivo(ChangeFileExt(CaminhoArquivo,'.txt'),fgTXT);
        NomeArq := CaminhoArquivo;
     finally
        LocNFeW.Free;
     end;
  except
     Result := False;
  end;
end;

function NotaFiscal.SaveToStream(Stream: TStringStream): boolean;
var
  LocNFeW : TNFeW;
begin
  try
     Result := True;
     LocNFeW := TNFeW.Create(NFe);
     try
        LocNFeW.schema := TsPL005c;
        LocNFeW.GerarXml;
        Stream.WriteString(LocNFeW.Gerador.ArquivoFormatoXML);
     finally
        LocNFeW.Free;
     end;
  except
     Result := False;
  end;
end;

procedure NotaFiscal.EnviarEmail(const sSmtpHost,
                                      sSmtpPort,
                                      sSmtpUser,
                                      sSmtpPasswd,
                                      sFrom,
                                      sTo,
                                      sAssunto: String;
                                      sMensagem : TStrings;
                                      SSL : Boolean;
                                      EnviaPDF: Boolean = true;
                                      sCC: TStrings=nil;
                                      Anexos:TStrings=nil);
var
 ThreadSMTP : TSendMailThread;
 m:TMimemess;
 p: TMimepart;
 StreamNFe : TStringStream;
 NomeArq : String;
 i: Integer;
begin
 m:=TMimemess.create;
 ThreadSMTP := TSendMailThread.Create ;  // N?o Libera, pois usa FreeOnTerminate := True ;
 StreamNFe  := TStringStream.Create('');
 try
    p := m.AddPartMultipart('mixed', nil);
    if sMensagem <> nil then
       m.AddPartText(sMensagem, p);
    SaveToStream(StreamNFe) ;
    m.AddPartBinary(StreamNFe,copy(NFe.infNFe.ID, (length(NFe.infNFe.ID)-44)+1, 44)+'-NFe.xml', p);
    if (EnviaPDF) then
    begin
       if TACBrNFe( TNotasFiscais( Collection ).ACBrNFe ).DANFE <> nil then
       begin
          TACBrNFe( TNotasFiscais( Collection ).ACBrNFe ).DANFE.ImprimirDANFEPDF(NFe);
          NomeArq :=  StringReplace(NFe.infNFe.ID,'NFe', '', [rfIgnoreCase]);
          NomeArq := PathWithDelim(TACBrNFe( TNotasFiscais( Collection ).ACBrNFe ).DANFE.PathPDF)+NomeArq+'.pdf';
          m.AddPartBinaryFromFile(NomeArq, p);
       end;
    end;

    if assigned(Anexos) then
      for i := 0 to Anexos.Count - 1 do
      begin
        m.AddPartBinaryFromFile(Anexos[i], p);
      end;

    m.header.tolist.add(sTo);
    m.header.From := sFrom;
    m.header.subject:=sAssunto;
    m.EncodeMessage;

    ThreadSMTP.sFrom := sFrom;
    ThreadSMTP.sTo   := sTo;
    if sCC <> nil then
       ThreadSMTP.sCC.AddStrings(sCC);
    ThreadSMTP.slmsg_Lines.AddStrings(m.Lines);

    ThreadSMTP.smtp.UserName := sSmtpUser;
    ThreadSMTP.smtp.Password := sSmtpPasswd;

    ThreadSMTP.smtp.TargetHost := sSmtpHost;
    if not NotaUtil.EstaVazio( sSmtpPort ) then     // Usa default
       ThreadSMTP.smtp.TargetPort := sSmtpPort;

    ThreadSMTP.smtp.FullSSL := SSL;
    ThreadSMTP.smtp.AutoTLS := SSL;
    TACBrNFe( TNotasFiscais( Collection ).ACBrNFe ).SetStatus( stNFeEmail );

    ThreadSMTP.Resume; // inicia a thread

    TACBrNFe( TNotasFiscais( Collection ).ACBrNFe ).SetStatus( stIdle );
 finally
    m.free;
    StreamNFe.Free ;
 end;
end;

function NotaFiscal.GetNFeXML: AnsiString;
var
 LocNFeW : TNFeW;
begin
 LocNFeW := TNFeW.Create(Self.NFe);
 try
    LocNFeW.schema := TsPL005c;
    LocNFeW.GerarXml;
    Result := LocNFeW.Gerador.ArquivoFormatoXML;
 finally
    LocNFeW.Free;
 end;
// Result := FXML;
end;

{ TNotasFiscais }
constructor TNotasFiscais.Create(AOwner: TPersistent;
  ItemClass: TCollectionItemClass);
begin
  if not (AOwner is TACBrNFe ) then
     raise Exception.Create( 'AOwner deve ser do tipo TACBrNFe') ;

  inherited;

  FACBrNFe := TACBrNFe( AOwner ) ;
end;


function TNotasFiscais.Add: NotaFiscal;
begin
  Result := NotaFiscal(inherited Add);

  Result.NFe.Ide.tpAmb := Configuracoes.WebServices.Ambiente ;
end;

procedure TNotasFiscais.Assinar;
var
  i: Integer;
  vAssinada : AnsiString;
  LocNFeW : TNFeW;
  Leitor: TLeitor;
  FMsg : AnsiString;
begin
  for i:= 0 to Self.Count-1 do
   begin
     LocNFeW := TNFeW.Create(Self.Items[i].NFe);
     try
        LocNFeW.schema := TsPL005c;
        LocNFeW.GerarXml;
        Self.Items[i].Alertas := LocNFeW.Gerador.ListaDeAlertas.Text;
{$IFDEF ACBrNFeOpenSSL}
        if not(NotaUtil.Assinar(LocNFeW.Gerador.ArquivoFormatoXML, FConfiguracoes.Certificados.Certificado , FConfiguracoes.Certificados.Senha, vAssinada, FMsg)) then
           raise Exception.Create('Falha ao assinar Nota Fiscal Eletr?nica '+
                                   IntToStr(Self.Items[i].NFe.Ide.nNF)+FMsg);
{$ELSE}
        if not(NotaUtil.Assinar(LocNFeW.Gerador.ArquivoFormatoXML, FConfiguracoes.Certificados.GetCertificado , vAssinada, FMsg)) then
           raise Exception.Create('Falha ao assinar Nota Fiscal Eletr?nica '+
                                   IntToStr(Self.Items[i].NFe.Ide.nNF)+FMsg);
{$ENDIF}
        vAssinada := StringReplace( vAssinada, '<'+ENCODING_UTF8_STD+'>', '', [rfReplaceAll] ) ;
        vAssinada := StringReplace( vAssinada, '<?xml version="1.0"?>', '', [rfReplaceAll] ) ;
        Self.Items[i].XML := vAssinada;

        Leitor := TLeitor.Create;
        leitor.Grupo := vAssinada;
        Self.Items[i].NFe.signature.URI := Leitor.rAtributo('Reference URI=');
        Self.Items[i].NFe.signature.DigestValue := Leitor.rCampo(tcStr, 'DigestValue');
        Self.Items[i].NFe.signature.SignatureValue := Leitor.rCampo(tcStr, 'SignatureValue');
        Self.Items[i].NFe.signature.X509Certificate := Leitor.rCampo(tcStr, 'X509Certificate');
        Leitor.Free;
        
        if FConfiguracoes.Geral.Salvar then
           FConfiguracoes.Geral.Save(StringReplace(Self.Items[i].NFe.infNFe.ID, 'NFe', '', [rfIgnoreCase])+'-nfe.xml', vAssinada);

        if NotaUtil.NaoEstaVazio(Self.Items[i].NomeArq) then
           FConfiguracoes.Geral.Save(ExtractFileName(Self.Items[i].NomeArq), vAssinada, ExtractFilePath(Self.Items[i].NomeArq));

     finally
        LocNFeW.Free;
     end;
   end;

end;

procedure TNotasFiscais.GerarNFe;
var
 i: Integer;
 LocNFeW : TNFeW;
begin
 for i:= 0 to Self.Count-1 do
  begin
    LocNFeW := TNFeW.Create(Self.Items[i].NFe);
    try
       LocNFeW.schema := TsPL005c;
       LocNFeW.GerarXml;
       Self.Items[i].XML := LocNFeW.Gerador.ArquivoFormatoXML;
       Self.Items[i].Alertas := LocNFeW.Gerador.ListaDeAlertas.Text;
    finally
       LocNFeW.Free;
    end;
  end;
end;

function TNotasFiscais.GetItem(Index: Integer): NotaFiscal;
begin
  Result := NotaFiscal(inherited Items[Index]);
end;

function TNotasFiscais.GetNamePath: string;
begin
  Result := 'NotaFiscal';
end;

procedure TNotasFiscais.Imprimir;
begin
  TACBrNFe( FACBrNFe ).DANFE.ImprimirDANFE(nil);
end;

procedure TNotasFiscais.ImprimirPDF;
begin
  TACBrNFe( FACBrNFe ).DANFE.ImprimirDANFEPDF(nil);
end;

function TNotasFiscais.Insert(Index: Integer): NotaFiscal;
begin
  Result := NotaFiscal(inherited Insert(Index));
end;

procedure TNotasFiscais.SetItem(Index: Integer; const Value: NotaFiscal);
begin
  Items[Index].Assign(Value);
end;

procedure TNotasFiscais.Valida;
var
 i: Integer;
 FMsg : AnsiString;
begin
  for i:= 0 to Self.Count-1 do
   begin
     if pos('<Signature',Self.Items[i].XML) = 0 then
        Assinar;
     if not(NotaUtil.Valida(('<NFe xmlns' + RetornarConteudoEntre(Self.Items[i].XML, '<NFe xmlns', '</NFe>')+ '</NFe>'), FMsg,Self.FConfiguracoes.Geral.PathSchemas)) then
     //if not(NotaUtil.Valida(('<NFe xmlns' + RetornarConteudoEntre(Self.Items[i].XML, '<NFe xmlns', '</NFe>')+ '</NFe>'), FMsg)) then
       raise Exception.Create('Falha na valida??o dos dados da nota '+
                               IntToStr(Self.Items[i].NFe.Ide.nNF)+sLineBreak+Self.Items[i].Alertas+FMsg);
  end;
end;                                               

function TNotasFiscais.LoadFromFile(CaminhoArquivo: string): boolean;
var
 LocNFeR : TNFeR;
 ArquivoXML: TStringList;
 XML : AnsiString;
begin
 try
    ArquivoXML := TStringList.Create;
    ArquivoXML.LoadFromFile(CaminhoArquivo);
    Result := True;
    while pos('</NFe>',ArquivoXML.Text) > 0 do
     begin
       if pos('</nfeProc>',ArquivoXML.Text) > 0  then
        begin
          XML := copy(ArquivoXML.Text,1,pos('</nfeProc>',ArquivoXML.Text)+5);
          ArquivoXML.Text := Trim(copy(ArquivoXML.Text,pos('</nfeProc>',ArquivoXML.Text)+10,length(ArquivoXML.Text)));
        end
       else
        begin
          XML := copy(ArquivoXML.Text,1,pos('</NFe>',ArquivoXML.Text)+5);
          ArquivoXML.Text := Trim(copy(ArquivoXML.Text,pos('</NFe>',ArquivoXML.Text)+6,length(ArquivoXML.Text)));
        end;
       LocNFeR := TNFeR.Create(Self.Add.NFe);
       try
          LocNFeR.Leitor.Arquivo := XML;
          LocNFeR.LerXml;
          Items[Self.Count-1].XML := LocNFeR.Leitor.Arquivo;
          Items[Self.Count-1].NomeArq := CaminhoArquivo;
          GerarNFe;
       finally
          LocNFeR.Free;
       end;
     end;
    ArquivoXML.Free;
 except
    raise;
    Result := False;    
 end;
end;

function TNotasFiscais.LoadFromStream(Stream: TStringStream): boolean;
var
 LocNFeR : TNFeR;
begin
  try
    Result := True;
    LocNFeR := TNFeR.Create(Self.Add.NFe);
    try
       LocNFeR.Leitor.CarregarArquivo(Stream);
       LocNFeR.LerXml;
       Items[Self.Count-1].XML := LocNFeR.Leitor.Arquivo;
       GerarNFe;       
    finally
       LocNFeR.Free
    end;
  except
    Result := False;
  end;
end;

function TNotasFiscais.SaveToFile(PathArquivo: string = ''; SalvaTXT : Boolean = False): boolean;
var
 i : integer;
 CaminhoArquivo : String;
begin
 Result := True;
 try
    for i:= 0 to TACBrNFe( FACBrNFe ).NotasFiscais.Count-1 do
     begin
        if NotaUtil.EstaVazio(PathArquivo) then
           PathArquivo := TACBrNFe( FACBrNFe ).Configuracoes.Geral.PathSalvar
        else
           PathArquivo := ExtractFilePath(PathArquivo);
        CaminhoArquivo := PathWithDelim(PathArquivo)+StringReplace(TACBrNFe( FACBrNFe ).NotasFiscais.Items[i].NFe.infNFe.ID, 'NFe', '', [rfIgnoreCase])+'-NFe.xml';
        TACBrNFe( FACBrNFe ).NotasFiscais.Items[i].SaveToFile(CaminhoArquivo, SalvaTXT);
     end;
 except
    Result := False;
 end;
end;

{ TSendMailThread }

procedure TSendMailThread.DoHandleException;
begin
  Sysutils.ShowException(FException, nil );
end;

constructor TSendMailThread.Create ;
begin
  smtp        := TSMTPSend.Create;
  slmsg_Lines := TStringList.Create;
  sCC         := TStringList.Create;

  sFrom := '';
  sTo   := '';

  FreeOnTerminate := True;

  inherited Create(True);
end;

destructor TSendMailThread.Destroy;
begin
  slmsg_Lines.Free ;
  sCC.Free ;
  smtp.Free ;

  inherited;
end;

procedure TSendMailThread.Execute;
var
   i: integer;
begin
  inherited;

  try
     if not smtp.Login() then
        raise Exception.Create('SMTP ERROR: Login:' + smtp.EnhCodeString+sLineBreak+smtp.FullResult.Text);
     if not smtp.MailFrom( sFrom, Length(sFrom)) then
        raise Exception.Create('SMTP ERROR: MailFrom:' + smtp.EnhCodeString+sLineBreak+smtp.FullResult.Text);
     if not smtp.MailTo(sTo) then
        raise Exception.Create('SMTP ERROR: MailTo:' + smtp.EnhCodeString+sLineBreak+smtp.FullResult.Text);
     if (sCC <> nil) then
     begin
        for I := 0 to sCC.Count - 1 do
        begin
           if not smtp.MailTo(sCC.Strings[i]) then
              raise Exception.Create('SMTP ERROR: MailTo:' + smtp.EnhCodeString+sLineBreak+smtp.FullResult.Text);
        end;
     end;
     if not smtp.MailData(slmsg_Lines) then
        raise Exception.Create('SMTP ERROR: MailData:' + smtp.EnhCodeString+sLineBreak+smtp.FullResult.Text);
     if not smtp.Logout() then
        raise Exception.Create('SMTP ERROR: Logout:' + smtp.EnhCodeString+sLineBreak+smtp.FullResult.Text);
  except
     try smtp.Sock.CloseSocket ; except end ;
     HandleException;
  end;
end;

procedure TSendMailThread.HandleException;
begin
  FException := Exception(ExceptObject);
  try
    // N?o mostra mensagens de EAbort
    if not (FException is EAbort) then
      Synchronize(DoHandleException);
  finally
    FException := nil;
  end;
end;

end.
