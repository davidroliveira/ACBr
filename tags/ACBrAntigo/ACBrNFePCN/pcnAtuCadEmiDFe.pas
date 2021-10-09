////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//              PCN - Projeto Cooperar NFe                                    //
//                                                                            //
//   Descri��o: Classes para gera��o/leitura dos arquivos xml da NFe          //
//                                                                            //
//        site: www.projetocooperar.org/nfe                                   //
//       email: projetocooperar@zipmail.com.br                                //
//       forum: http://br.groups.yahoo.com/group/projeto_cooperar_nfe/        //
//     projeto: http://code.google.com/p/projetocooperar/                     //
//         svn: http://projetocooperar.googlecode.com/svn/trunk/              //
//                                                                            //
// Coordena��o: Paulo Casagrande                                              //
//                                                                            //
//      Equipe: Vide o arquivo leiame.txt na pasta raiz do projeto            //
//                                                                            //
//      Vers�o: Vide o arquivo leiame.txt na pasta raiz do projeto            //
//                                                                            //
//     Licen�a: GNU General Public License (GNU GPL)                          //
//                                                                            //
//              - Este programa � software livre; voc� pode redistribu�-lo    //
//              e/ou modific�-lo sob os termos da Licen�a P�blica Geral GNU,  //
//              conforme publicada pela Free Software Foundation; tanto a     //
//              vers�o 2 da Licen�a como (a seu crit�rio) qualquer vers�o     //
//              mais nova.                                                    //
//                                                                            //
//              - Este programa � distribu�do na expectativa de ser �til,     //
//              mas SEM QUALQUER GARANTIA; sem mesmo a garantia impl�cita de  //
//              COMERCIALIZA��O ou de ADEQUA��O A QUALQUER PROP�SITO EM       //
//              PARTICULAR. Consulte a Licen�a P�blica Geral GNU para obter   //
//              mais detalhes. Voc� deve ter recebido uma c�pia da Licen�a    //
//              P�blica Geral GNU junto com este programa; se n�o, escreva    //
//              para a Free Software Foundation, Inc., 59 Temple Place,       //
//              Suite 330, Boston, MA - 02111-1307, USA ou consulte a         //
//              licen�a oficial em http://www.gnu.org/licenses/gpl.txt        //
//                                                                            //
//    Nota (1): - Esta  licen�a  n�o  concede  o  direito  de  uso  do nome   //
//              "PCN  -  Projeto  Cooperar  NFe", n�o  podendo o mesmo ser    //
//              utilizado sem previa autoriza��o.                             //
//                                                                            //
//    Nota (2): - O uso integral (ou parcial) das units do projeto esta       //
//              condicionado a manuten��o deste cabe�alho junto ao c�digo     //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

unit pcnAtuCadEmiDFe;

interface uses
  SysUtils, Classes, pcnAuxiliar, pcnConversao, pcnGerador;

type

  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  //    E M   D E S E N V O L V I M E N T O   -   N � O   T E S T A D O       //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////

  TAtuCadEmiDFe = class;
  Tinclui = class;
  TDFe = class;
  Texclui = class;

  TAtuCadEmiDFe = class(TPersistent)
  private
    FGerador: TGerador;
    FSchema: TpcnSchema;
    Fid: string;
    FUF: string;
    Finclui: Tinclui;
    Fexclui: Texclui;
  public
    constructor Create;
    destructor Destroy; override;
    function GerarXML: boolean;
  published
    property Gerador: TGerador read FGerador write FGerador;
    property schema: TpcnSchema read Fschema write Fschema;
    property Id: string read FId write FId;
    property UF: string read FUF write FUF;
    property inclui: Tinclui read Finclui write Finclui;
    property exclui: Texclui read Fexclui write Fexclui;
  end;

  Tinclui = class(TPersistent)
  private
    FUF: string;
    FCNPJ: string;
    FCNPJMatriz: string;
    FIE: string;
    FDFe: TDFe;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property UF: string read FUF write FUF;
    property CNPJ: string read FCNPJ write FCNPJ;
    property CNPJMatriz: string read FCNPJMatriz write FCNPJMatriz;
    property IE: string read FIE write FIE;
    property DFe: TDFe read FDFe write FDFe;
  end;

  TDFe = class(TPersistent)
  private
    Fmodelo: integer;
    Fsit: TpcnSituacaoEmissor;
  published
    property modelo: integer read Fmodelo write Fmodelo;
    property sit: TpcnSituacaoEmissor read Fsit write Fsit;
  end;

  Texclui = class(TPersistent)
  private
    FUF: string;
    FCNPJ: string;
  published
    property UF: string read FUF write FUF;
    property CNPJ: string read FCNPJ write FCNPJ;
  end;

implementation

{ TAtuCadEmiDFe }

constructor TAtuCadEmiDFe.Create;
begin
  FGerador := TGerador.Create;
  Finclui := Tinclui.Create;
  Fexclui := Texclui.Create;
end;

destructor TAtuCadEmiDFe.Destroy;
begin
  FGerador.Free;
  Finclui.Free;
  Fexclui.Free;
  inherited;
end;

constructor Tinclui.Create;
begin
  FDFe := TDFe.Create;
end;

destructor Tinclui.Destroy;
begin
  FDFe.Free;
  inherited;
end;

function TAtuCadEmiDFe.GerarXML: boolean;
begin
  if FSchema = tsPL005C then
  begin
    Gerador.ArquivoFormatoXML := '';
    Gerador.wGrupo(ENCODING_UTF8, '',False);
    Gerador.wGrupo('AtuCadEmiDFe ' + NAME_SPACE + ' ' + V1_07);
    Gerador.wCampo(tcStr, 'M05', 'UF     ', 02, 02, 1, FUF, DSC_UF);
    if not ValidarUF(FUF) then
      Gerador.wAlerta('M05', 'UF', DSC_UF, ERR_MSG_INVALIDO);
    if Finclui.FUF <> '' then
    begin
      Gerador.wGrupo('inclui');
      Gerador.wCampo(tcStr, 'M07', 'UF        ', 02, 02, 1, Finclui.FUF, DSC_UF);
      if not ValidarUF(Finclui.FUF) then
        Gerador.wAlerta('M07', 'UF', DSC_UF, ERR_MSG_INVALIDO);
      Gerador.wCampoCNPJCPF('M08', 'CNPJ      ', Finclui.FCNPJ, CODIGO_BRASIL);
      Gerador.wCampoCNPJCPF('M09', 'CNPJMatriz', Finclui.FCNPJMatriz, CODIGO_BRASIL);
      Gerador.wCampo(tcStr, 'M10', 'IE        ', 00, 14, 1, SomenteNumeros(Finclui.FIE), DSC_IE);
      if not ValidarIE(Finclui.FIE, Finclui.FUF) then
        Gerador.wAlerta('M10', 'IE', DSC_IE, ERR_MSG_INVALIDO);
      Gerador.wGrupo('DFe');
      Gerador.wCampo(tcStr, 'M11a', 'mod', 02, 02, 1, Finclui.FDFe.Fmodelo, DSC_MOD);
      Gerador.wCampo(tcStr, 'M11b', 'sit', 001, 001, 1, tpSitToStr(Finclui.FDFe.Fsit), DSC_TPAMB);
      Gerador.wGrupo('/DFe');
      Gerador.wGrupo('/inclui');
    end;
    if Fexclui.FUF <> '' then
    begin
      Gerador.wGrupo('exclui');
      Gerador.wCampo(tcStr, 'M13', 'UF  ', 02, 02, 1, Fexclui.FUF, DSC_UF);
      if not ValidarUF(Fexclui.FUF) then
        Gerador.wAlerta('M13', 'UF', DSC_UF, ERR_MSG_INVALIDO);
      Gerador.wCampoCNPJCPF('M14', 'CNPJ', Fexclui.FCNPJ, CODIGO_BRASIL);
      Gerador.wGrupo('/exclui');
    end;
    Gerador.wGrupo('/AtuCadEmiDFe');
  end;
  Result := (Gerador.ListaDeAlertas.Count = 0);
end;

end.

