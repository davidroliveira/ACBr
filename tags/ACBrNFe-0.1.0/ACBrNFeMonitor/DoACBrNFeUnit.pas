{******************************************************************************}
{ Projeto: ACBr Monitor                                                        }
{  Executavel multiplataforma que faz uso do conjunto de componentes ACBr para }
{ criar uma interface de comunica��o com equipamentos de automacao comercial.  }
{                                                                              }
{ Direitos Autorais Reservados (c) 2006 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na p�gina do Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Este programa � software livre; voc� pode redistribu�-lo e/ou modific�-lo   }
{ sob os termos da Licen�a P�blica Geral GNU, conforme publicada pela Free     }
{ Software Foundation; tanto a vers�o 2 da Licen�a como (a seu crit�rio)       }
{ qualquer vers�o mais nova.                                                   }
{                                                                              }
{  Este programa � distribu�do na expectativa de ser �til, mas SEM NENHUMA     }
{ GARANTIA; nem mesmo a garantia impl�cita de COMERCIALIZA��O OU DE ADEQUA��O A}
{ QUALQUER PROP�SITO EM PARTICULAR. Consulte a Licen�a P�blica Geral GNU para  }
{ obter mais detalhes. (Arquivo LICENCA.TXT ou LICENSE.TXT)                    }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral GNU junto com este}
{ programa; se n�o, escreva para a Free Software Foundation, Inc., 59 Temple   }
{ Place, Suite 330, Boston, MA 02111-1307, USA. Voc� tamb�m pode obter uma     }
{ copia da licen�a em:  http://www.opensource.org/licenses/gpl-license.php     }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

unit DoACBrNFeUnit ;

interface
Uses Classes, TypInfo, SysUtils, CmdUnitNFe, Types, smtpsend, ssl_openssl, mimemess, mimepart, RpDevice ;

Procedure DoACBrNFe( Cmd : TACBrNFeCmd ) ;
Function ConvertStrRecived( AStr: String ) : String ;
function UFparaCodigo(const UF: string): integer;
function ObterCodigoMunicipio(const xMun, xUF: string): integer;
procedure GerarIniNFe( AStr: WideString ) ;
procedure EnviarEmail(const sSmtpHost, sSmtpPort, sSmtpUser, sSmtpPasswd, sFrom, sTo, sAssunto, sAttachment, sAttachment2: String; sMensagem : TStrings; SSL : Boolean);

implementation

Uses IniFiles, StrUtils, DateUtils,
  Windows, Forms, XMLIntf, XMLDoc,
  ACBrUtil, ACBrNFeMonitor1 , ACBrNFeWebServices, ACBrNFe,
  ACBrNFeConfiguracoes, ACBrNFeTypes, ACBrNFeNotasFiscais,
  ACBrNFeDadosProdutos, ACBrNFeXML, ACBrNFeTransportador,
  ACBrNFeDadosAdicionais,
  ACBrNFe_retConsReciNFe, ACBrNFe_retConsStatServ,
  ACBrNFe_retEnviNFe, ACBrNFe_retConsSitNFe,
  ACBrNFe_retCancNFe, ACBrNFe_retInutNFe;

Procedure DoACBrNFe( Cmd : TACBrNFeCmd ) ;
var
  I : Integer;
  ArqNFe, ArqPDF : String;
  Salva  : Boolean;
  SL     : TStringList;

  XmlDoc: IXMLDocument;
  NFeRetConsStatServ : IXMLTRetConsStatServ;
  NFeRetConsSitNFe   : IXMLTRetConsSitNFe;
  NFeRetCancNFe      : IXMLTRetCancNFe;
  NFeRetEnviNFe      : IXMLTRetEnviNFe;
  NFeRetConsReciNFe  : IXMLTRetConsReciNFe;
  NFeRetInutNFe      : IXMLTRetInutNFe;
begin
 with frmAcbrNfeMonitor do
  begin
     try
        if Cmd.Metodo = 'statusservico' then
         begin
           if ACBrNFe1.WebServices.StatusServico.Executar then
            begin
              XmlDoc     := LoadXMLData(ACBrNFe1.WebServices.StatusServico.RetWS);
              NFeRetConsStatServ := GetretConsStatServ(XmlDoc);

              Cmd.Resposta := ACBrNFe1.WebServices.StatusServico.Msg+
                              '[STATUS]'+sLineBreak+
                              'Versao='+NFeRetConsStatServ.Versao+sLineBreak+
                              'TpAmb='+NFeRetConsStatServ.TpAmb+sLineBreak+
                              'VerAplic='+NFeRetConsStatServ.VerAplic+sLineBreak+
                              'CStat='+NFeRetConsStatServ.CStat+sLineBreak+
                              'XMotivo='+NFeRetConsStatServ.XMotivo+sLineBreak+
                              'CUF='+NFeRetConsStatServ.CUF+sLineBreak+
                              'DhRecbto='+NFeRetConsStatServ.DhRecbto+sLineBreak+
                              'TMed='+NFeRetConsStatServ.TMed+sLineBreak+
                              'DhRetorno='+NFeRetConsStatServ.DhRetorno+sLineBreak+
                              'XObs='+NFeRetConsStatServ.XObs+sLineBreak;
            end;
         end

        else if Cmd.Metodo = 'validarnfe' then
         begin
           ACBrNFe1.NotasFiscais.Clear;
           if FileExists(Cmd.Params(0)) then
              ACBrNFe1.NotasFiscais.Add.XML.LoadFromFile(Cmd.Params(0))
           else
              raise Exception.Create('Arquivo '+Cmd.Params(0)+' n�o encontrado.');

           ACBrNFe1.NotasFiscais.Valida;
         end

        else if Cmd.Metodo = 'assinarnfe' then
         begin
           ACBrNFe1.NotasFiscais.Clear;
           if FileExists(Cmd.Params(0)) then
              ACBrNFe1.NotasFiscais.Add.XML.LoadFromFile(Cmd.Params(0))
           else
              raise Exception.Create('Arquivo '+Cmd.Params(0)+' n�o encontrado.');

           Salva := ACBrNFe1.Configuracoes.Geral.Salvar;
           if not Salva then
            begin
             ForceDirectories(PathWithDelim(ExtractFilePath(Application.ExeName))+'Logs');
             ACBrNFe1.Configuracoes.Geral.PathSalvar := PathWithDelim(ExtractFilePath(Application.ExeName))+'Logs';
            end;
           ACBrNFe1.Configuracoes.Geral.Salvar := True;
           ACBrNFe1.NotasFiscais.Assinar;
           ACBrNFe1.Configuracoes.Geral.Salvar := Salva;
         end

        else if Cmd.Metodo = 'consultarnfe' then
         begin
           ACBrNFe1.WebServices.Consulta.NFeChave := Cmd.Params(0);
           try
              ACBrNFe1.WebServices.Consulta.Executar;
              XmlDoc     := LoadXMLData(ACBrNFe1.WebServices.Consulta.RetWS);
              NFeRetConsSitNFe := GetretConsSitNFe(XmlDoc);

              Cmd.Resposta := ACBrNFe1.WebServices.Consulta.Msg+sLineBreak+
                              '[CONSULTA]'+sLineBreak+
                              'Versao='+NFeRetConsSitNFe.Versao+sLineBreak+
                              'Id='+NFeRetConsSitNFe.InfProt.Id+sLineBreak+
                              'TpAmb='+NFeRetConsSitNFe.InfProt.TpAmb+sLineBreak+
                              'VerAplic='+NFeRetConsSitNFe.InfProt.VerAplic+sLineBreak+
                              'CStat='+NFeRetConsSitNFe.InfProt.CStat+sLineBreak+
                              'XMotivo='+NFeRetConsSitNFe.InfProt.XMotivo+sLineBreak+
                              'CUF='+NFeRetConsSitNFe.InfProt.CUF+sLineBreak+
                              'ChNFe='+NFeRetConsSitNFe.InfProt.ChNFe+sLineBreak+
                              'DhRecbto='+NFeRetConsSitNFe.InfProt.DhRecbto+sLineBreak+
                              'NProt='+NFeRetConsSitNFe.InfProt.NProt+sLineBreak+
                              'DigVal='+NFeRetConsSitNFe.InfProt.DigVal+sLineBreak;

           except
              raise Exception.Create(ACBrNFe1.WebServices.Consulta.Msg);
           end;
         end

        else if Cmd.Metodo = 'cancelarnfe' then
         begin
           ACBrNFe1.WebServices.Consulta.NFeChave := Cmd.Params(0);
           ACBrNFe1.WebServices.Consulta.Executar;

           ACBrNFe1.WebServices.Cancelamento.NFeChave      := ACBrNFe1.WebServices.Consulta.NFeChave;
           ACBrNFe1.WebServices.Cancelamento.Protocolo     := ACBrNFe1.WebServices.Consulta.Protocolo;
           ACBrNFe1.WebServices.Cancelamento.Justificativa := Cmd.Params(1);
           try
              ACBrNFe1.WebServices.Cancelamento.Executar;
              XmlDoc     := LoadXMLData(ACBrNFe1.WebServices.Cancelamento.RetWS);
              NFeRetCancNFe := GetretCancNFe(XmlDoc);

              Cmd.Resposta := ACBrNFe1.WebServices.Cancelamento.Msg+sLineBreak+
                              '[CANCELAMENTO]'+sLineBreak+
                              'Versao='+NFeRetCancNFe.Versao+sLineBreak+
                              'Id='+NFeRetCancNFe.InfCanc.Id+sLineBreak+
                              'TpAmb='+NFeRetCancNFe.InfCanc.TpAmb+sLineBreak+
                              'VerAplic='+NFeRetCancNFe.InfCanc.VerAplic+sLineBreak+
                              'CStat='+NFeRetCancNFe.InfCanc.CStat+sLineBreak+
                              'XMotivo='+NFeRetCancNFe.InfCanc.XMotivo+sLineBreak+
                              'CUF='+NFeRetCancNFe.InfCanc.CUF+sLineBreak+
                              'ChNFe='+NFeRetCancNFe.InfCanc.ChNFe+sLineBreak+
                              'DhRecbto='+NFeRetCancNFe.InfCanc.DhRecbto+sLineBreak+
                              'NProt='+NFeRetCancNFe.InfCanc.DhRecbto+sLineBreak;
           except
              raise Exception.Create(ACBrNFe1.WebServices.Cancelamento.Msg);
           end;
         end

        else if Cmd.Metodo = 'imprimirdanfe' then
         begin
           Restaurar1.Click;
           Application.BringToFront;
           ACBrNFe1.NotasFiscais.Clear;
           if FileExists(Cmd.Params(0)) or FileExists(PathWithDelim(ExtractFilePath(Application.ExeName))+'Logs\'+Cmd.Params(0)) then
            begin
              if FileExists(Cmd.Params(0)) then
                 ACBrNFe1.NotasFiscais.Add.XML.LoadFromFile(Cmd.Params(0))
              else
                 ACBrNFe1.NotasFiscais.Add.XML.LoadFromFile(PathWithDelim(ExtractFilePath(Application.ExeName))+'Logs\'+Cmd.Params(0));
            end
           else
              raise Exception.Create('Arquivo '+Cmd.Params(0)+' n�o encontrado.');

           RPDev.DeviceIndex := cbxImpressora.ItemIndex;    
           ACBrNFe1.NotasFiscais.Imprimir;
           Cmd.Resposta := 'Danfe Impresso com sucesso';
           Ocultar1.Click;
         end

        else if Cmd.Metodo = 'imprimirdanfepdf' then
         begin
           ACBrNFe1.NotasFiscais.Clear;
           if FileExists(Cmd.Params(0)) then
              ACBrNFe1.NotasFiscais.Add.XML.LoadFromFile(Cmd.Params(0))
           else
              raise Exception.Create('Arquivo '+Cmd.Params(0)+' n�o encontrado.');

           try
              ACBrNFe1.NotasFiscais.ImprimirPDF;
              Cmd.Resposta := 'Arquivo criado em '+ExtractFileDir(application.ExeName)+'\'+ACBrNFe1.NotasFiscais.Items[0].XML.NFe.InfNFe.Id+'.pdf'
           except
              raise Exception.Create('Erro ao criar o arquivo PDF');
           end;
         end

        else if Cmd.Metodo = 'inutilizarnfe' then
         begin                            //CNPJ         //Justificat   //Ano                    //Modelo                 //S�rie                  //Num.Inicial            //Num.Final
           ACBrNFe1.WebServices.Inutiliza(Cmd.Params(0), Cmd.Params(1), StrToInt(Cmd.Params(2)), StrToInt(Cmd.Params(3)), StrToInt(Cmd.Params(4)), StrToInt(Cmd.Params(5)), StrToInt(Cmd.Params(6)));

           XmlDoc := LoadXMLData(ACBrNFe1.WebServices.Inutilizacao.RetWS);
           NFeRetInutNFe := GetretInutNFe(XmlDoc);

           Cmd.Resposta := ACBrNFe1.WebServices.Inutilizacao.Msg+sLineBreak+
                           '[INUTILIZACAO]'+sLineBreak+
                           'Versao='+NFeRetInutNFe.Versao+sLineBreak+
                           'Id='+NFeRetInutNFe.InfInut.Id+sLineBreak+
                           'TpAmb='+NFeRetInutNFe.InfInut.TpAmb+sLineBreak+
                           'VerAplic='+NFeRetInutNFe.InfInut.VerAplic+sLineBreak+
                           'CStat='+NFeRetInutNFe.InfInut.CStat+sLineBreak+
                           'XMotivo='+NFeRetInutNFe.InfInut.XMotivo+sLineBreak+
                           'CUF='+NFeRetInutNFe.InfInut.CUF+sLineBreak+
                           'DhRecbto='+NFeRetInutNFe.InfInut.DhRecbto+sLineBreak+
                           'NProt='+NFeRetInutNFe.InfInut.NProt+sLineBreak;
         end

        else if Cmd.Metodo = 'enviarnfe' then
         begin
           ACBrNFe1.NotasFiscais.Clear;
           if FileExists(Cmd.Params(0)) then
              ACBrNFe1.NotasFiscais.Add.XML.LoadFromFile(Cmd.Params(0))
           else
              raise Exception.Create('Arquivo '+Cmd.Params(0)+' n�o encontrado.');

           if Cmd.Params(2) <> '0' then
              ACBrNFe1.NotasFiscais.Assinar;

           ACBrNFe1.NotasFiscais.Valida;

           if not(ACBrNFe1.WebServices.StatusServico.Executar) then
            raise Exception.Create(ACBrNFe1.WebServices.StatusServico.Msg);

           ACBrNFe1.WebServices.Enviar.Lote := StrToInt(Cmd.Params(1));
           if not(ACBrNFe1.WebServices.Enviar.Executar) then
            raise Exception.Create(ACBrNFe1.WebServices.Enviar.Msg);

           XmlDoc     := LoadXMLData(ACBrNFe1.WebServices.Enviar.RetWS);
           NFeRetEnviNFe := GetretEnviNFe(XmlDoc);

           Cmd.Resposta :=  ACBrNFe1.WebServices.Enviar.Msg+sLineBreak+
                            '[ENVIO]'+sLineBreak+
                            'Versao='+NFeRetEnviNFe.Versao+sLineBreak+
                            'TpAmb='+NFeRetEnviNFe.TpAmb+sLineBreak+
                            'VerAplic='+NFeRetEnviNFe.VerAplic+sLineBreak+
                            'CStat='+NFeRetEnviNFe.CStat+sLineBreak+
                            'XMotivo='+NFeRetEnviNFe.XMotivo+sLineBreak+
                            'CUF='+NFeRetEnviNFe.CUF+sLineBreak+
                            'NRec='+NFeRetEnviNFe.InfRec.NRec+sLineBreak+
                            'DhRecbto='+NFeRetEnviNFe.InfRec.DhRecbto+sLineBreak+
                            'TMed='+NFeRetEnviNFe.InfRec.TMed+sLineBreak;

           ACBrNFe1.WebServices.Retorno.Recibo := ACBrNFe1.WebServices.Enviar.Recibo;
           if not(ACBrNFe1.WebServices.Retorno.Executar) then
            raise Exception.Create(ACBrNFe1.WebServices.Retorno.Msg);

           NFeRetConsReciNFe := ACBrNFe1.WebServices.Retorno.NFeRetorno;

           Cmd.Resposta :=  Cmd.Resposta+
                            ACBrNFe1.WebServices.Retorno.Msg+sLineBreak+
                            '[RETORNO]'+sLineBreak+
                            'Versao='+NFeRetConsReciNFe.Versao+sLineBreak+
                            'TpAmb='+NFeRetConsReciNFe.TpAmb+sLineBreak+
                            'VerAplic='+NFeRetConsReciNFe.VerAplic+sLineBreak+
                            'NRec='+NFeRetConsReciNFe.NRec+sLineBreak+
                            'CStat='+NFeRetConsReciNFe.CStat+sLineBreak+
                            'XMotivo='+NFeRetConsReciNFe.XMotivo+sLineBreak+
                            'CUF='+NFeRetConsReciNFe.CUF+sLineBreak;
           for I:= 0 to ACBrNFe1.NotasFiscais.Count-1 do
            begin
              ACBrNFe1.WebServices.Consulta.NFeChave := ACBrNFe1.NotasFiscais.Items[i].XML.GetNFeChave;
              ACBrNFe1.WebServices.Consulta.Executar;
              XmlDoc     := LoadXMLData(ACBrNFe1.WebServices.Consulta.RetWS);
              NFeRetConsSitNFe := GetretConsSitNFe(XmlDoc);

              Cmd.Resposta := Cmd.Resposta+
                             '[NFE'+Trim(ACBrNFe1.NotasFiscais.Items[i].XML.NFe.InfNFe.Ide.NNF)+']'+sLineBreak+
                             'Versao='+NFeRetConsSitNFe.Versao+sLineBreak+
                             'Id='+NFeRetConsSitNFe.InfProt.Id+sLineBreak+
                             'TpAmb='+NFeRetConsSitNFe.InfProt.TpAmb+sLineBreak+
                             'VerAplic='+NFeRetConsSitNFe.InfProt.VerAplic+sLineBreak+
                             'CStat='+NFeRetConsSitNFe.InfProt.CStat+sLineBreak+
                             'XMotivo='+NFeRetConsSitNFe.InfProt.XMotivo+sLineBreak+
                             'CUF='+NFeRetConsSitNFe.InfProt.CUF+sLineBreak+
                             'ChNFe='+NFeRetConsSitNFe.InfProt.ChNFe+sLineBreak+
                             'DhRecbto='+NFeRetConsSitNFe.InfProt.DhRecbto+sLineBreak+
                             'NProt='+NFeRetConsSitNFe.InfProt.NProt+sLineBreak+
                             'DigVal='+NFeRetConsSitNFe.InfProt.DigVal+sLineBreak;

              RPDev.DeviceIndex := cbxImpressora.ItemIndex; 
              if ACBrNFe1.NotasFiscais.Items[i].XML.Confirmada and (Cmd.Params(3) = '1') then
                 ACBrNFe1.NotasFiscais.Items[i].XML.Imprimir;
            end;
         end
        else if (Cmd.Metodo = 'recibonfe')then
         begin
           ACBrNFe1.WebServices.Recibo.Recibo := Cmd.Params(0);
           if not(ACBrNFe1.WebServices.Recibo.Executar) then
             raise Exception.Create(ACBrNFe1.WebServices.Recibo.Msg);

           NFeRetConsReciNFe := ACBrNFe1.WebServices.Recibo.NFeRetorno;

{           ACBrNFe1.WebServices.Retorno.Recibo :=  Cmd.Params(0);
           if not(ACBrNFe1.WebServices.Retorno.Executar) then
            raise Exception.Create(ACBrNFe1.WebServices.Retorno.Msg);

           NFeRetConsReciNFe := ACBrNFe1.WebServices.Retorno.NFeRetorno;}

           Cmd.Resposta :=  Cmd.Resposta+
                            ACBrNFe1.WebServices.Recibo.Msg+sLineBreak+
                           '[RETORNO]'+sLineBreak+
                           'Versao='+NFeRetConsReciNFe.Versao+sLineBreak+
                           'TpAmb='+NFeRetConsReciNFe.TpAmb+sLineBreak+
                           'VerAplic='+NFeRetConsReciNFe.VerAplic+sLineBreak+
                           'NRec='+NFeRetConsReciNFe.NRec+sLineBreak+
                           'CStat='+NFeRetConsReciNFe.CStat+sLineBreak+
                           'XMotivo='+NFeRetConsReciNFe.XMotivo+sLineBreak+
                           'CUF='+NFeRetConsReciNFe.CUF+sLineBreak;

           if ACBrNFe1.Configuracoes.Geral.Salvar then
            begin
              Cmd.Resposta :=  Cmd.Resposta+
              'Arquivo='+ACBrNFe1.Configuracoes.Geral.PathSalvar+Cmd.Params(0)+'-pro-rec.xml';
            end;  


         end
        else if (Cmd.Metodo = 'criarnfe') or (Cmd.Metodo = 'criarenviarnfe')then
         begin
           GerarIniNFe( Cmd.Params(0)  ) ;

           Salva := ACBrNFe1.Configuracoes.Geral.Salvar;
           if not Salva then
            begin
             ForceDirectories(PathWithDelim(ExtractFilePath(Application.ExeName))+'Logs');
             ACBrNFe1.Configuracoes.Geral.PathSalvar := PathWithDelim(ExtractFilePath(Application.ExeName))+'Logs';
            end;
           ACBrNFe1.Configuracoes.Geral.Salvar := True;
           ACBrNFe1.NotasFiscais.GerarNFe;
           ACBrNFe1.NotasFiscais.Assinar;
           ACBrNFe1.NotasFiscais.Valida;
           ACBrNFe1.Configuracoes.Geral.Salvar := Salva;

           ArqNFe := PathWithDelim(ACBrNFe1.Configuracoes.Geral.PathSalvar)+StringReplace(ACBrNFe1.NotasFiscais.Items[0].XML.GetNFeChave, 'NFe', '', [rfIgnoreCase])+'-nfe.xml';

           SL := TStringList.Create;
           SL.LoadFromFile(ArqNFe);
           if (Cmd.Metodo = 'criarnfe') and (Cmd.Params(1) = '1') then
              Cmd.Resposta :=  'NFe criada em: '+ArqNFe+sLineBreak+SL.Text
           else
              Cmd.Resposta :=  'NFe criada em: '+ArqNFe;

           SL.Free;
           if Cmd.Metodo = 'criarenviarnfe' then
            begin
              if not(ACBrNFe1.WebServices.StatusServico.Executar) then
               raise Exception.Create(ACBrNFe1.WebServices.StatusServico.Msg);

              ACBrNFe1.WebServices.Enviar.Lote := StrToInt(Cmd.Params(1));
              if not(ACBrNFe1.WebServices.Enviar.Executar) then
               raise Exception.Create(ACBrNFe1.WebServices.Enviar.Msg);

              XmlDoc     := LoadXMLData(ACBrNFe1.WebServices.Enviar.RetWS);
              NFeRetEnviNFe := GetretEnviNFe(XmlDoc);

              Cmd.Resposta :=  ACBrNFe1.WebServices.Enviar.Msg+sLineBreak+
                              '[ENVIO]'+sLineBreak+
                              'Versao='+NFeRetEnviNFe.Versao+sLineBreak+
                              'TpAmb='+NFeRetEnviNFe.TpAmb+sLineBreak+
                              'VerAplic='+NFeRetEnviNFe.VerAplic+sLineBreak+
                              'CStat='+NFeRetEnviNFe.CStat+sLineBreak+
                              'XMotivo='+NFeRetEnviNFe.XMotivo+sLineBreak+
                              'CUF='+NFeRetEnviNFe.CUF+sLineBreak+
                              'NRec='+NFeRetEnviNFe.InfRec.NRec+sLineBreak+
                              'DhRecbto='+NFeRetEnviNFe.InfRec.DhRecbto+sLineBreak+
                              'TMed='+NFeRetEnviNFe.InfRec.TMed+sLineBreak;

              ACBrNFe1.WebServices.Retorno.Recibo := ACBrNFe1.WebServices.Enviar.Recibo;
              if not(ACBrNFe1.WebServices.Retorno.Executar) then
               raise Exception.Create(ACBrNFe1.WebServices.Retorno.Msg);

              NFeRetConsReciNFe := ACBrNFe1.WebServices.Retorno.NFeRetorno;

              Cmd.Resposta :=  Cmd.Resposta+
                               ACBrNFe1.WebServices.Retorno.Msg+sLineBreak+
                              '[RETORNO]'+sLineBreak+
                              'Versao='+NFeRetConsReciNFe.Versao+sLineBreak+
                              'TpAmb='+NFeRetConsReciNFe.TpAmb+sLineBreak+
                              'VerAplic='+NFeRetConsReciNFe.VerAplic+sLineBreak+
                              'NRec='+NFeRetConsReciNFe.NRec+sLineBreak+
                              'CStat='+NFeRetConsReciNFe.CStat+sLineBreak+
                              'XMotivo='+NFeRetConsReciNFe.XMotivo+sLineBreak+
                              'CUF='+NFeRetConsReciNFe.CUF+sLineBreak;

              for I:= 0 to ACBrNFe1.NotasFiscais.Count-1 do
               begin
                 ACBrNFe1.WebServices.Consulta.NFeChave := ACBrNFe1.NotasFiscais.Items[i].XML.GetNFeChave;
                 ACBrNFe1.WebServices.Consulta.Executar;
                 XmlDoc     := LoadXMLData(ACBrNFe1.WebServices.Consulta.RetWS);
                 NFeRetConsSitNFe := GetretConsSitNFe(XmlDoc);

                 Cmd.Resposta := Cmd.Resposta+
                                '[NFE'+Trim(ACBrNFe1.NotasFiscais.Items[i].XML.NFe.InfNFe.Ide.NNF)+']'+sLineBreak+
                                'Versao='+NFeRetConsSitNFe.Versao+sLineBreak+
                                'Id='+NFeRetConsSitNFe.InfProt.Id+sLineBreak+
                                'TpAmb='+NFeRetConsSitNFe.InfProt.TpAmb+sLineBreak+
                                'VerAplic='+NFeRetConsSitNFe.InfProt.VerAplic+sLineBreak+
                                'CStat='+NFeRetConsSitNFe.InfProt.CStat+sLineBreak+
                                'XMotivo='+NFeRetConsSitNFe.InfProt.XMotivo+sLineBreak+
                                'CUF='+NFeRetConsSitNFe.InfProt.CUF+sLineBreak+
                                'ChNFe='+NFeRetConsSitNFe.InfProt.ChNFe+sLineBreak+
                                'DhRecbto='+NFeRetConsSitNFe.InfProt.DhRecbto+sLineBreak+
                                'NProt='+NFeRetConsSitNFe.InfProt.NProt+sLineBreak+
                                'DigVal='+NFeRetConsSitNFe.InfProt.DigVal+sLineBreak;

                 if (Cmd.Params(2) = '1') then
                  begin
                    Restaurar1.Click;
                    Application.BringToFront;
                  end;
                 RPDev.DeviceIndex := cbxImpressora.ItemIndex;                   
                 if ACBrNFe1.NotasFiscais.Items[i].XML.Confirmada and (Cmd.Params(2) = '1') then
                    ACBrNFe1.NotasFiscais.Items[i].XML.Imprimir;
                 if (Cmd.Params(2) = '1') then
                    Ocultar1.Click;
            end;

            end;
         end

        else if Cmd.Metodo = 'enviaremail' then
         begin
           if FileExists(Cmd.Params(1)) then
            begin
              ACBrNFe1.NotasFiscais.Clear;
              ACBrNFe1.NotasFiscais.Add.XML.LoadFromFile(Cmd.Params(1));
            end  
           else
              raise Exception.Create('Arquivo '+Cmd.Params(1)+' n�o encontrado.');

           if (Cmd.Params(2) = '1') then
            begin
              try
                 ACBrNFe1.NotasFiscais.ImprimirPDF;
                 ArqPDF := ExtractFileDir(application.ExeName)+'\'+ACBrNFe1.NotasFiscais.Items[0].XML.NFe.InfNFe.Id+'.pdf'
              except
                 raise Exception.Create('Erro ao criar o arquivo PDF');
              end;
            end;
            try
               EnviarEmail(edtSmtpHost.Text, edtSmtpPort.Text, edtSmtpUser.Text, edtSmtpPass.Text, edtSmtpUser.Text, Cmd.Params(0), edtEmailAssunto.Text, Cmd.Params(1), ArqPDF, mmEmailMsg.Lines, cbEmailSSL.Checked);
               Cmd.Resposta := 'Email enviado com sucesso';
            except
               raise Exception.Create('Erro ao enviar email');
            end;
         end

        else if Cmd.Metodo = 'restaurar' then
           Restaurar1Click( frmAcbrNfeMonitor )

        else if Cmd.Metodo = 'ocultar' then
           Ocultar1Click( frmAcbrNfeMonitor )

        else if Cmd.Metodo = 'encerrarmonitor' then
           Application.Terminate

        else if pos('|'+Cmd.Metodo+'|', '|exit|bye|fim|sair|') > 0 then {fecha conexao}
         begin
           Cmd.Resposta := 'Obrigado por usar o ACBrNFeMonitor' ;
           mCmd.Lines.Clear;

           if Assigned( Conexao ) then
              if Assigned( Conexao.Connection ) then
                 Conexao.Connection.Disconnect ;
         end


        else //Else Final - Se chegou ate aqui, o comando � inv�lido
           raise Exception.Create('Comando inv�lido ('+Cmd.Comando+')') ;

     finally
        { Nada a fazer aqui por enquanto... :) }
     end ;
  end;
end ;

Function ConvertStrRecived( AStr: String ) : String ;
 Var P   : Integer ;
     Hex : String ;
     CharHex : Char ;
begin
  { Verificando por codigos em Hexa }
  Result := AStr ;

  P := pos('\x',Result) ;
  while P > 0 do
  begin
     Hex := copy(Result,P+2,2) ;

     try
        CharHex := Chr(StrToInt('$'+Hex)) ;
     except
        CharHex := ' ' ;
     end ;

     Result := StringReplace(Result,'\x'+Hex,CharHex,[rfReplaceAll]) ;
     P      := pos('\x',Result) ;
  end ;
end ;

function UFparaCodigo(const UF: string): integer;
const
  (**)UFS = '.AC.AL.AP.AM.BA.CE.DF.ES.GO.MA.MT.MS.MG.PA.PB.PR.PE.PI.RJ.RN.RS.RO.RR.SC.SP.SE.TO.';
  CODIGOS = '.12.27.16.13.29.23.53.32.52.21.51.50.31.15.25.41.26.22.33.24.43.11.14.42.35.28.17.';
begin
  try
    result := StrToInt(copy(CODIGOS, pos('.' + UF + '.', UFS) + 1, 2));
  except
    result := 0;
  end;
end;

function ObterCodigoMunicipio(const xMun, xUF: string): integer;
var
  i: integer;
  PathArquivo: string;
  List: TstringList;
begin
  result := 0;
  PathArquivo :=  PathWithDelim(ExtractFilePath(Application.ExeName))+ 'MunIBGE\MunIBGE-UF' + InttoStr(UFparaCodigo(xUF)) + '.txt';
  if FileExists(PathArquivo) then
   begin
     List := TstringList.Create;
     List.LoadFromFile(PathArquivo);
     i := 0;
     while (i < list.count) and (result = 0) do
      begin
       if pos(UpperCase(TiraAcentos(xMun)), UpperCase(TiraAcentos(List[i]))) > 0 then
          result := StrToInt(Trim(copy(list[i],1,7)));
       inc(i);
      end;
     List.free;
   end;
end;

procedure GerarIniNFe( AStr: WideString ) ;
var
  I, J : Integer;
  sSecao, sCodPro, sNumeroDI, sNumeroADI, sQtdVol, sNumDup, sCampoAdic : String;
  INIRec : TMemIniFile ;
  SL     : TStringList;
begin
 INIRec := TMemIniFile.create( 'nfe.ini' ) ;
 SL := TStringList.Create;
 Sl.Text := ConvertStrRecived( Astr );
 INIRec.SetStrings( SL );
 SL.Free ;
 with frmAcbrNfeMonitor do
  begin
   try
      ACBrNFe1.NotasFiscais.Clear;
      with ACBrNFe1.NotasFiscais.Add do
       begin
         Identificacao.NaturezaOperacao  := INIRec.ReadString(  'Identificacao','NaturezaOperacao' ,'');
         Identificacao.Modelo            := INIRec.ReadInteger( 'Identificacao','Modelo' ,55);
         Identificacao.Serie             := INIRec.ReadInteger( 'Identificacao','Serie'  ,1);
         Identificacao.Codigo            := INIRec.ReadInteger( 'Identificacao','Codigo' ,0);
         Identificacao.Numero            := INIRec.ReadInteger( 'Identificacao','Numero' ,0);
         Identificacao.DataEmissao       := StrToDate(INIRec.ReadString( 'Identificacao','Emissao',''));
         Identificacao.DataSaida         := StrToDate(INIRec.ReadString( 'Identificacao','Saida'  ,''));
         Identificacao.Tipo              := TNFeTipo(INIRec.ReadInteger( 'Identificacao','Tipo',1));
         Identificacao.FormaPagamento    := TNFeFormaPagamento(INIRec.ReadInteger( 'Identificacao','FormaPag',0));
         Identificacao.Finalidade        := TNFeFinalidade(INIRec.ReadInteger( 'Identificacao','Finalidade',0));

         Emitente.CNPJ                      := INIRec.ReadString(  'Emitente','CNPJ'    ,'');
         Emitente.IE                        := INIRec.ReadString(  'Emitente','IE'      ,'');
         Emitente.Nome.RazaoSocial          := INIRec.ReadString(  'Emitente','Razao'   ,'');
         Emitente.Nome.Fantasia             := INIRec.ReadString(  'Emitente','Fantasia','');
         Emitente.Endereco.Fone             := INIRec.ReadString(  'Emitente','Fone' ,'');
         Emitente.Endereco.CEP              := INIRec.ReadString(  'Emitente','CEP'  ,'');
         Emitente.Endereco.Logradouro       := INIRec.ReadString(  'Emitente','Logradouro' ,'');
         Emitente.Endereco.Numero           := INIRec.ReadString(  'Emitente','Numero'     ,'');
         Emitente.Endereco.Complemento      := INIRec.ReadString(  'Emitente','Complemento','');
         Emitente.Endereco.Bairro           := INIRec.ReadString(  'Emitente','Bairro'     ,'');
         Emitente.Endereco.Cidade.Codigo    := INIRec.ReadInteger( 'Emitente','CidadeCod'  ,0);
         Emitente.Endereco.Cidade.Descricao := INIRec.ReadString(  'Emitente','Cidade'     ,'');
         Emitente.Endereco.UF               := INIRec.ReadString(  'Emitente','UF'         ,'');
         if Emitente.Endereco.Cidade.Codigo <= 0 then
            Emitente.Endereco.Cidade.Codigo := ObterCodigoMunicipio(Emitente.Endereco.Cidade.Descricao,Emitente.Endereco.UF);
         Emitente.Endereco.Pais.Codigo      := INIRec.ReadInteger( 'Emitente','PaisCod'    ,0);
         Emitente.Endereco.Pais.Descricao   := INIRec.ReadString(  'Emitente','Pais'       ,'');

         Destinatario.CNPJCPF                   := INIRec.ReadString(  'Destinatario','CNPJ'       ,'');
         Destinatario.IE                        := INIRec.ReadString(  'Destinatario','IE'         ,'');
         Destinatario.ISUF                      := INIRec.ReadString(  'Destinatario','ISUF'         ,'');
         Destinatario.NomeRazao                 := INIRec.ReadString(  'Destinatario','NomeRazao'  ,'');
         Destinatario.Endereco.Fone             := INIRec.ReadString(  'Destinatario','Fone'       ,'');
         Destinatario.Endereco.CEP              := INIRec.ReadString(  'Destinatario','CEP'       ,'');
         Destinatario.Endereco.Logradouro       := INIRec.ReadString(  'Destinatario','Logradouro' ,'');
         Destinatario.Endereco.Numero           := INIRec.ReadString(  'Destinatario','Numero'     ,'');
         Destinatario.Endereco.Complemento      := INIRec.ReadString(  'Destinatario','Complemento','');
         Destinatario.Endereco.Bairro           := INIRec.ReadString(  'Destinatario','Bairro'     ,'');
         Destinatario.Endereco.Cidade.Codigo    := INIRec.ReadInteger( 'Destinatario','CidadeCod'  ,0);
         Destinatario.Endereco.Cidade.Descricao := INIRec.ReadString(  'Destinatario','Cidade'     ,'');
         Destinatario.Endereco.UF               := INIRec.ReadString(  'Destinatario','UF'         ,'');
         if Destinatario.Endereco.Cidade.Codigo <= 0 then
            Destinatario.Endereco.Cidade.Codigo := ObterCodigoMunicipio(Destinatario.Endereco.Cidade.Descricao,Destinatario.Endereco.UF);
         Destinatario.Endereco.Pais.Codigo      := INIRec.ReadInteger( 'Destinatario','PaisCod'    ,0);
         Destinatario.Endereco.Pais.Descricao   := INIRec.ReadString(  'Destinatario','Pais'       ,'');

         I := 1 ;
         while true do
          begin
            sSecao    := 'Produto'+IntToStrZero(I,3) ;
            sCodPro   := INIRec.ReadString(sSecao,'Codigo','FIM') ;
            if sCodPro = 'FIM' then
               break ;

            with DadosProdutos.Add do
             begin
               CFOP          := INIRec.ReadInteger(sSecao,'CFOP'     ,0);
               Codigo        := INIRec.ReadString( sSecao,'Codigo'   ,'');
               Descricao     := INIRec.ReadString( sSecao,'Descricao','');
               if Length(INIRec.ReadString( sSecao,'EAN','')) > 0 then
                  EAN           := INIRec.ReadString( sSecao,'EAN'      ,'');
               if Length(INIRec.ReadString( sSecao,'NCM','')) > 0 then
                  NCM           := INIRec.ReadString( sSecao,'NCM'      ,'');
               Unidade       := INIRec.ReadString( sSecao,'Unidade'  ,'');
               Quantidade    := StringToFloatDef( INIRec.ReadString(sSecao,'Quantidade'   ,'') ,0) ;
               ValorUnitario := StringToFloatDef( INIRec.ReadString(sSecao,'ValorUnitario','') ,0) ;
               ValorTotal    := StringToFloatDef( INIRec.ReadString(sSecao,'ValorTotal'   ,'') ,0) ;
               ValorDesconto := StringToFloatDef( INIRec.ReadString(sSecao,'ValorDesconto','') ,0) ;

               sNumeroDI := INIRec.ReadString(sSecao,'NumeroDI','') ;

               if sNumeroDI <> '' then
                begin
                  with DI do
                   begin
                     NumeroDI         := sNumeroDI;
                     DataRegistroDI   := StrToDate(INIRec.ReadString(sSecao,'DataRegistroDI'  ,''));
                     LocalDesembaraco := INIRec.ReadString(sSecao,'LocalDesembaraco','');
                     UFDesembaraco    := INIRec.ReadString(sSecao,'UFDesembaraco'   ,'');
                     DataDesembaraco  := StrToDate(INIRec.ReadString(sSecao,'DataDesembaraco',''));
                     CodigoExportador := INIRec.ReadString(sSecao,'CodigoExportador','');;

                     J := 1 ;
                     while true do
                      begin
                        sSecao      := 'LADI'+IntToStrZero(I,3)+IntToStrZero(J,3) ;
                        sNumeroADI := INIRec.ReadString(sSecao,'NumeroAdicao','FIM') ;
                        if (sNumeroADI = 'FIM') or (Length(sNumeroADI) <= 0) then
                           break;

                        with LADI.Add do
                         begin
                           NumeroAdicao      := StrToInt(sNumeroADI);
                           CodigoFrabricante := INIRec.ReadString( sSecao,'CodigoFrabricante','');
                           ValorDesconto     := StringToFloatDef( INIRec.ReadString(sSecao,'DescontoADI','') ,0);
                         end;
                        Inc(J)  
                      end;
                   end;
                end;

               with Tributos do
                begin
                  with ICMS do
                   begin
                     sSecao    := 'ICMS'+IntToStrZero(I,3) ;
                     CST := INIRec.ReadString( sSecao,'CST','');

                     if CST = '00' then
                      begin
                        ICMS00.Origem     := TNFeOrigem(    INIRec.ReadInteger(sSecao,'Origem'    ,0));
                        ICMS00.Modalidade := TNFeModalidade(INIRec.ReadInteger(sSecao,'Modalidade',0));
                        ICMS00.ValorBase  := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase','') ,0);
                        ICMS00.Aliquota   := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota' ,'') ,0);
                        ICMS00.Valor      := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'    ,'') ,0);
                      end
                     else if CST = '10' then
                      begin
                        ICMS10.Origem       := TNFeOrigem(    INIRec.ReadInteger(sSecao,'Origem'    ,0));
                        ICMS10.Modalidade   := TNFeModalidade(INIRec.ReadInteger(sSecao,'Modalidade',0));
                        ICMS10.ValorBase    := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase','') ,0);
                        ICMS10.Aliquota     := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota' ,'') ,0);
                        ICMS10.Valor        := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'    ,'') ,0);
                        ICMS10.ModalidadeST := TNFeModalidadeST(INIRec.ReadInteger(sSecao,'ModalidadeST',0));
                        ICMS10.PercentualMargemST  := StringToFloatDef( INIRec.ReadString(sSecao,'PercentualMargemST' ,'') ,0);
                        ICMS10.PercentualReducaoST := StringToFloatDef( INIRec.ReadString(sSecao,'PercentualReducaoST','') ,0);
                        ICMS10.ValorBaseST  := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBaseST','') ,0);
                        ICMS10.AliquotaST   := StringToFloatDef( INIRec.ReadString(sSecao,'AliquotaST' ,'') ,0);
                        ICMS10.ValorST      := StringToFloatDef( INIRec.ReadString(sSecao,'ValorST'    ,'') ,0);
                      end
                     else if CST = '20' then
                      begin
                        ICMS20.Origem            := TNFeOrigem(    INIRec.ReadInteger(sSecao,'Origem'    ,0));
                        ICMS20.Modalidade        := TNFeModalidade(INIRec.ReadInteger(sSecao,'Modalidade',0));
                        ICMS20.PercentualReducao := StringToFloatDef( INIRec.ReadString(sSecao,'PercentualReducao','') ,0);
                        ICMS20.ValorBase         := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase','') ,0);
                        ICMS20.Aliquota          := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota' ,'') ,0);
                        ICMS20.Valor             := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'    ,'') ,0);
                      end
                     else if CST = '30' then
                      begin
                        ICMS30.Origem              := TNFeOrigem(    INIRec.ReadInteger(sSecao,'Origem'    ,0));
                        ICMS30.ModalidadeST        := TNFeModalidadeST(INIRec.ReadInteger(sSecao,'ModalidadeST',0));
                        ICMS30.PercentualMargemST  := StringToFloatDef( INIRec.ReadString(sSecao,'PercentualMargemST','') ,0);
                        ICMS30.PercentualReducaoST := StringToFloatDef( INIRec.ReadString(sSecao,'PercentualReducaoST','') ,0);
                        ICMS30.ValorBaseST         := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBaseST','') ,0);
                        ICMS30.AliquotaST          := StringToFloatDef( INIRec.ReadString(sSecao,'AliquotaST' ,'') ,0);
                        ICMS30.ValorST             := StringToFloatDef( INIRec.ReadString(sSecao,'ValorST'    ,'') ,0);
                      end
                     else if (CST = '40') or (CST = '41') or (CST = '50') then
                      begin
                        ICMS40_41_50.Origem := TNFeOrigem(    INIRec.ReadInteger(sSecao,'Origem'    ,0));
                      end
                     else if CST = '51' then
                      begin
                        ICMS51.Origem            := TNFeOrigem(    INIRec.ReadInteger(sSecao,'Origem'    ,0));
                        ICMS51.Modalidade        := TNFeModalidade(INIRec.ReadInteger(sSecao,'Modalidade',0));
                        ICMS51.PercentualReducao := StringToFloatDef( INIRec.ReadString(sSecao,'PercentualReducao','') ,0);
                        ICMS51.ValorBase         := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase','') ,0);
                        ICMS51.Aliquota          := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota' ,'') ,0);
                        ICMS51.Valor             := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'    ,'') ,0);
                      end
                     else if CST = '60' then
                      begin
                        ICMS60.Origem      := TNFeOrigem(    INIRec.ReadInteger(sSecao,'Origem'    ,0));
                        ICMS60.ValorBaseST := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBaseST','') ,0);
                        ICMS60.ValorST     := StringToFloatDef( INIRec.ReadString(sSecao,'ValorST'    ,'') ,0);
                      end
                     else if CST = '70' then
                      begin
                        ICMS70.Origem            := TNFeOrigem(    INIRec.ReadInteger(sSecao,'Origem'    ,0));
                        ICMS70.Modalidade        := TNFeModalidade(INIRec.ReadInteger(sSecao,'Modalidade',0));
                        ICMS70.PercentualReducao := StringToFloatDef( INIRec.ReadString(sSecao,'PercentualReducao','') ,0);
                        ICMS70.ValorBase         := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase','') ,0);
                        ICMS70.Aliquota          := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota' ,'') ,0);
                        ICMS70.Valor             := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'    ,'') ,0);
                        ICMS70.ModalidadeST      := TNFeModalidadeST(INIRec.ReadInteger(sSecao,'ModalidadeST',0));
                        ICMS70.PercentualMargemST  := StringToFloatDef( INIRec.ReadString(sSecao,'PercentualMargemST','') ,0);
                        ICMS70.PercentualReducaoST := StringToFloatDef( INIRec.ReadString(sSecao,'PercentualReducaoST','') ,0);
                        ICMS70.ValorBaseST       := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBaseST','') ,0);
                        ICMS70.AliquotaST        := StringToFloatDef( INIRec.ReadString(sSecao,'AliquotaST' ,'') ,0);
                        ICMS70.ValorST           := StringToFloatDef( INIRec.ReadString(sSecao,'ValorST'    ,'') ,0);
                      end
                     else if CST = '90' then
                      begin
                        ICMS90.Origem       := TNFeOrigem(    INIRec.ReadInteger(sSecao,'Origem'    ,0));
                        ICMS90.Modalidade   := TNFeModalidade(INIRec.ReadInteger(sSecao,'Modalidade',0));
                        ICMS90.PercentualReducao := StringToFloatDef( INIRec.ReadString(sSecao,'PercentualReducao','') ,0);
                        ICMS90.ValorBase    := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase','') ,0);
                        ICMS90.Aliquota     := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota' ,'') ,0);
                        ICMS90.Valor        := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'    ,'') ,0);
                        ICMS90.ModalidadeST := TNFeModalidadeST(INIRec.ReadInteger(sSecao,'ModalidadeST',0));
                        ICMS90.PercentualMargemST  := StringToFloatDef( INIRec.ReadString(sSecao,'PercentualMargemST' ,'') ,0);
                        ICMS90.PercentualReducaoST := StringToFloatDef( INIRec.ReadString(sSecao,'PercentualReducaoST','') ,0);
                        ICMS90.ValorBaseST  := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBaseST','') ,0);
                        ICMS90.AliquotaST   := StringToFloatDef( INIRec.ReadString(sSecao,'AliquotaST' ,'') ,0);
                        ICMS90.ValorST      := StringToFloatDef( INIRec.ReadString(sSecao,'ValorST'    ,'') ,0);
                      end;
                   end;

                  with IPI do
                   begin
                     sSecao    := 'IPI'+IntToStrZero(I,3) ;

                     CST := INIRec.ReadString( sSecao,'CST','') ;
                     ClasseEnquadramento := INIRec.ReadString(  sSecao,'ClasseEnquadramento','');
                     CNPJProdutor        := INIRec.ReadString(  sSecao,'CNPJProdutor'       ,'');
                     CodigoSeloIPI       := INIRec.ReadString(  sSecao,'CodigoSeloIPI'      ,'');
                     QuantidadeSelos     := StringToFloatDef( INIRec.ReadString(sSecao,'QuantidadeSelos'    ,'') ,0);
                     CodigoEnquadramento := INIRec.ReadString(  sSecao,'CodigoEnquadramento','');

                     ValorBase    := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase'   ,'') ,0);
                     Quantidade   := StringToFloatDef( INIRec.ReadString(sSecao,'Quantidade'  ,'') ,0);
                     ValorUnidade := StringToFloatDef( INIRec.ReadString(sSecao,'ValorUnidade','') ,0);
                     Aliquota     := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota'    ,'') ,0);
                     Valor        := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'       ,'') ,0);
                   end;

                  with II do
                   begin
                     sSecao    := 'II'+IntToStrZero(I,3) ;

                     ValorBase := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase','') ,0);
                     ValorDespAduaneiras := StringToFloatDef( INIRec.ReadString(sSecao,'ValorDespAduaneiras'   ,'') ,0);
                     ValorII   := StringToFloatDef( INIRec.ReadString(sSecao,'ValorII'  ,'') ,0);
                     ValorIOF  := StringToFloatDef( INIRec.ReadString(sSecao,'ValorIOF' ,'') ,0);
                   end;

                  with PIS do
                   begin
                     sSecao    := 'PIS'+IntToStrZero(I,3) ;
                     CST := INIRec.ReadString( sSecao,'CST','01');

                     if (CST = '01') or (CST = '02') then
                      begin
                        PIS01_02.ValorBase := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase','') ,0);
                        PIS01_02.Aliquota  := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota' ,'') ,0);
                        PIS01_02.Valor     := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'    ,'') ,0);
                      end
                     else if CST = '03' then
                      begin
                        PIS03.Quantidade := StringToFloatDef( INIRec.ReadString(sSecao,'Quantidade','') ,0);
                        PIS03.Aliquota   := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota'  ,'') ,0);
                        PIS03.Valor      := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'     ,'') ,0);
                      end
                     else if CST = '99' then
                      begin
                        PIS99.Valor       := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'     ,'') ,0);
                        PIS99.TipoCalculo := TNFeTipoCalculo( INIRec.ReadInteger(sSecao,'TipoCalculo',0));
                        PIS99.Quantidade  := StringToFloatDef( INIRec.ReadString(sSecao,'Quantidade','') ,0);
                        PIS99.Aliquota    := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota'  ,'') ,0);
                        PIS99.ValorBase   := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase' ,'') ,0);
                      end;
                   end;

                  with PISST do
                   begin
                     sSecao    := 'PISST'+IntToStrZero(I,3) ;
                     ValorBase     := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase'    ,'') ,0);
                     AliquotaPerc  := StringToFloatDef( INIRec.ReadString(sSecao,'AliquotaPerc' ,'') ,0);
                     Quantidade    := StringToFloatDef( INIRec.ReadString(sSecao,'Quantidade'   ,'') ,0);
                     AliquotaValor := StringToFloatDef( INIRec.ReadString(sSecao,'AliquotaValor','') ,0);
                     ValorPISST    := StringToFloatDef( INIRec.ReadString(sSecao,'ValorPISST'   ,'') ,0);
                   end;

                  with COFINS do
                   begin
                     sSecao    := 'COFINS'+IntToStrZero(I,3) ;
                     CST := INIRec.ReadString( sSecao,'CST','01');

                     if (CST = '01') or (CST = '02')   then
                      begin
                        COFINS01_02.ValorBase := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase','') ,0);
                        COFINS01_02.Aliquota  := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota' ,'') ,0);
                        COFINS01_02.Valor     := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'    ,'') ,0);
                      end
                     else if CST = '03' then
                      begin
                        COFINS03.Quantidade := StringToFloatDef( INIRec.ReadString(sSecao,'Quantidade','') ,0);
                        COFINS03.Aliquota   := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota'  ,'') ,0);
                        COFINS03.Valor      := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'     ,'') ,0);
                      end
                     else if CST = '99' then
                      begin
                        COFINS99.Valor       := StringToFloatDef( INIRec.ReadString(sSecao,'Valor'     ,'') ,0);
                        COFINS99.TipoCalculo := TNFeTipoCalculo( INIRec.ReadInteger(sSecao,'TipoCalculo',0)) ;
                        COFINS99.Quantidade  := StringToFloatDef( INIRec.ReadString(sSecao,'Quantidade','') ,0);
                        COFINS99.Aliquota    := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota'  ,'') ,0);
                        COFINS99.ValorBase   := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase' ,'') ,0);
                      end;
                   end;

                  with COFINSST do
                   begin
                     sSecao    := 'COFINSST'+IntToStrZero(I,3) ;

                     ValorBase     := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase'    ,'') ,0);
                     AliquotaPerc  := StringToFloatDef( INIRec.ReadString(sSecao,'AliquotaPerc' ,'') ,0);
                     Quantidade    := StringToFloatDef( INIRec.ReadString(sSecao,'Quantidade'   ,'') ,0);
                     AliquotaValor := StringToFloatDef( INIRec.ReadString(sSecao,'AliquotaValor','') ,0);
                     ValorCOFINSST := StringToFloatDef( INIRec.ReadString(sSecao,'ValorCOFINSST','') ,0);
                   end;

                  with ISSQN do
                   begin
                     sSecao    := 'ISSQN'+IntToStrZero(I,3) ;

                     ValorBase     := StringToFloatDef( INIRec.ReadString(sSecao,'ValorBase'    ,'') ,0);
                     Aliquota      := StringToFloatDef( INIRec.ReadString(sSecao,'Aliquota' ,'') ,0);
                     ValorISSQN    := StringToFloatDef( INIRec.ReadString(sSecao,'ValorISSQN'   ,'') ,0);
                     MunicipioFatoGerador := StrToInt( INIRec.ReadString(sSecao,'MunicipioFatoGerador',''));
                     CodigoServico := INIRec.ReadString(sSecao,'CodigoServico','');
                   end;

                end;

             end;
            Inc( I ) ;
          end ;

         ValoresTotais.BaseICMS      := StringToFloatDef( INIRec.ReadString('Total','BaseICMS'     ,'') ,0) ;
         ValoresTotais.ValorICMS     := StringToFloatDef( INIRec.ReadString('Total','ValorICMS'    ,'') ,0) ;
         ValoresTotais.ValorProduto  := StringToFloatDef( INIRec.ReadString('Total','ValorProduto' ,'') ,0) ;
         ValoresTotais.BaseICMSSubstituicao  := StringToFloatDef( INIRec.ReadString('Total','BaseICMSSubstituicao' ,'') ,0) ;
         ValoresTotais.ValorICMSSubstituicao := StringToFloatDef( INIRec.ReadString('Total','ValorICMSSubstituicao','') ,0) ;
         ValoresTotais.ValorFrete    := StringToFloatDef( INIRec.ReadString('Total','ValorFrete'   ,'') ,0) ;
         ValoresTotais.ValorSeguro   := StringToFloatDef( INIRec.ReadString('Total','ValorSeguro'  ,'') ,0) ;
         ValoresTotais.ValorDesconto := StringToFloatDef( INIRec.ReadString('Total','ValorDesconto','') ,0) ;
         ValoresTotais.ValorII       := StringToFloatDef( INIRec.ReadString('Total','ValorII'      ,'') ,0) ;
         ValoresTotais.ValorIPI      := StringToFloatDef( INIRec.ReadString('Total','ValorIPI'     ,'') ,0) ;
         ValoresTotais.ValorPIS      := StringToFloatDef( INIRec.ReadString('Total','ValorPIS'     ,'') ,0) ;
         ValoresTotais.ValorCOFINS   := StringToFloatDef( INIRec.ReadString('Total','ValorCOFINS'  ,'') ,0) ;
         ValoresTotais.ValorOutrasDespesas := StringToFloatDef( INIRec.ReadString('Total','ValorOutrasDespesas','') ,0) ;
         ValoresTotais.ISSQNTot.ValorServicos := StringToFloatDef( INIRec.ReadString('Total','ValorServicos','') ,0) ;
         ValoresTotais.ISSQNTot.ValorBase     := StringToFloatDef( INIRec.ReadString('Total','ValorBaseISS','') ,0) ;
         ValoresTotais.ISSQNTot.ValorISSQN    := StringToFloatDef( INIRec.ReadString('Total','ValorISSQN','') ,0) ;
         ValoresTotais.ISSQNTot.ValorPIS      := StringToFloatDef( INIRec.ReadString('Total','ValorPISISS','') ,0) ;
         ValoresTotais.ISSQNTot.ValorCOFINS   := StringToFloatDef( INIRec.ReadString('Total','ValorCONFINSISS','') ,0) ;
         ValoresTotais.ValorNota     := StringToFloatDef( INIRec.ReadString('Total','ValorNota'    ,'') ,0) ;

         Transportador.FretePorConta := TNFeFrete(INIRec.ReadInteger('Transportador','FretePorConta',0));
         Transportador.CnpjCpf       := INIRec.ReadString('Transportador','CnpjCpf'  ,'');
         Transportador.NomeRazao     := INIRec.ReadString('Transportador','NomeRazao','');
         Transportador.IE            := INIRec.ReadString('Transportador','IE'       ,'');
         Transportador.Endereco      := INIRec.ReadString('Transportador','Endereco' ,'');
         Transportador.Cidade        := INIRec.ReadString('Transportador','Cidade'   ,'');
         Transportador.UF            := INIRec.ReadString('Transportador','UF'       ,'');

         Transportador.RetencaoICMS.ValorServico := StringToFloatDef( INIRec.ReadString('Transportador','ValorServico','') ,0) ;
         Transportador.RetencaoICMS.ValorBase    := StringToFloatDef( INIRec.ReadString('Transportador','ValorBase'   ,'') ,0) ;
         Transportador.RetencaoICMS.Aliquota     := StringToFloatDef( INIRec.ReadString('Transportador','Aliquota'    ,'') ,0) ;
         Transportador.RetencaoICMS.Valor        := StringToFloatDef( INIRec.ReadString('Transportador','Valor'       ,'') ,0) ;
         Transportador.RetencaoICMS.CFOP         := INIRec.ReadInteger('Transportador','CFOP'     ,0);
         Transportador.RetencaoICMS.Cidade       := INIRec.ReadInteger('Transportador','CidadeCod',0);

         Transportador.Veiculo.Placa := INIRec.ReadString('Transportador','Placa'  ,'');
         Transportador.Veiculo.UF    := INIRec.ReadString('Transportador','UFPlaca','');
         Transportador.Veiculo.RNTC  := INIRec.ReadString('Transportador','RNTC'   ,'');

         I := 1 ;
         while true do
          begin
            sSecao    := 'Volume'+IntToStrZero(I,3) ;
            sQtdVol   := INIRec.ReadString(sSecao,'Quantidade','FIM') ;
            if (sQtdVol = 'FIM') or (Length(sQtdVol) <= 0)  then
               break ;

            with Transportador.Volumes.Add do
             begin
               Quantidade  := StrToInt(sQtdVol);
               Especie     := INIRec.ReadString( sSecao,'Especie'  ,'');
               Marca       := INIRec.ReadString( sSecao,'Marca'    ,'');
               Numeracao   := INIRec.ReadString( sSecao,'Numeracao','');
               PesoLiquido := StringToFloatDef( INIRec.ReadString(sSecao,'PesoLiquido','') ,0) ;
               PesoBruto   := StringToFloatDef( INIRec.ReadString(sSecao,'PesoBruto'  ,'') ,0) ;
             end;
            Inc(I);
          end;

         Fatura.Numero        := INIRec.ReadString( 'Fatura','Numero','');
         Fatura.ValorOriginal := StringToFloatDef( INIRec.ReadString('Fatura','ValorOriginal','') ,0) ;
         Fatura.ValorDesconto := StringToFloatDef( INIRec.ReadString('Fatura','ValorDesconto','') ,0) ;
         Fatura.ValorLiquido  := StringToFloatDef( INIRec.ReadString('Fatura','ValorLiquido' ,'') ,0) ;

         I := 1 ;
         while true do
          begin
            sSecao    := 'Duplicata'+IntToStrZero(I,3) ;
            sNumDup   := INIRec.ReadString(sSecao,'Numero','FIM') ;
            if (sNumDup = 'FIM') or (Length(sNumDup) <= 0) then
               break ;

            with Fatura.Duplicatas.Add do
             begin
               Numero         := sNumDup;
               DataVencimento := StrToDate(INIRec.ReadString( sSecao,'DataVencimento',''));
               Valor          := StringToFloatDef( INIRec.ReadString(sSecao,'Valor','') ,0) ;
             end;
            Inc(I);
          end;

         DadosAdicionais.Complemento :=  INIRec.ReadString( 'DadosAdicionais','Complemento','');

         I := 1 ;
         while true do
          begin
            sSecao     := 'InfAdic'+IntToStrZero(I,3) ;
            sCampoAdic := INIRec.ReadString(sSecao,'Campo','FIM') ;
            if (sCampoAdic = 'FIM') or (Length(sCampoAdic) <= 0) then
               break ;

            with DadosAdicionais.Informacoes.Add do
             begin
               Campo := sCampoAdic;
               Texto := INIRec.ReadString( sSecao,'Texto','');
             end;
            Inc(I);
          end;

       end;
   finally
      INIRec.Free ;
   end;
  end;
end;

procedure EnviarEmail(const sSmtpHost, sSmtpPort, sSmtpUser, sSmtpPasswd, sFrom, sTo, sAssunto, sAttachment, sAttachment2: String; sMensagem : TStrings; SSL : Boolean);
var
  smtp: TSMTPSend;
  msg_lines: TStringList;
  m:TMimemess;
  p: TMimepart;
begin
  try
     m:=TMimemess.create;
     p := m.AddPartMultipart('mixed', nil);
     if sMensagem <> nil then
        m.AddPartText(sMensagem, p);
     if sAttachment <> '' then
       m.AddPartBinaryFromFile(sAttachment, p);
     if sAttachment2 <> '' then
       m.AddPartBinaryFromFile(sAttachment2, p);
     m.header.tolist.add(sTo);
     m.header.From := sFrom;
     m.header.subject:=sAssunto;
     m.EncodeMessage;

     msg_lines := TStringList.Create;
     smtp := TSMTPSend.Create;
     msg_lines.Add(m.Lines.Text);

     smtp.UserName := sSmtpUser;
     smtp.Password := sSmtpPasswd;

     smtp.TargetHost := sSmtpHost;
     smtp.TargetPort := sSmtpPort;

     smtp.FullSSL := SSL;
     smtp.AutoTLS := SSL;
     if not smtp.Login() then
       raise Exception.Create('SMTP ERROR: Login:' + smtp.EnhCodeString);

     if not smtp.MailFrom(sFrom, Length(sFrom)) then
       raise Exception.Create('SMTP ERROR: MailFrom:' + smtp.EnhCodeString);
     if not smtp.MailTo(sTo) then
       raise Exception.Create('SMTP ERROR: MailTo:' + smtp.EnhCodeString);
     if not smtp.MailData(msg_lines) then
       raise Exception.Create('SMTP ERROR: MailData:' + smtp.EnhCodeString);

     if not smtp.Logout() then
       raise Exception.Create('SMTP ERROR: Logout:' + smtp.EnhCodeString);
  finally
     msg_lines.Free;
     smtp.Free;
     m.free;
  end;
end;

end.
