unit ACBrTERtcpGertec;

interface

uses Classes,SysUtils,ACBrTERTcp,ACBrTERTcpClass,ACBrTERGertecUnit;


type



   TACBrTERTcpGertec = class(TACBrTerTcpClass)
     protected
       FListaIPs:TStringList;
       function GetIdPMTG(terminal:integer):TACBrTERGertecIdent;
     public
       procedure DoChecaConectadoEvent(sender:TObject;pIP:string;var nTerm:integer; var conectado:boolean);

       function EncodeString(cod:TACBrTERDecodeString):string;override;
       function DecodeString(texto:string):TACBrTERDecodeString;override;
       constructor Create(AOwner: TComponent);override;
       Destructor Destroy;override;

       Procedure EnviaString( pTexto : String;cliPorta:integer; Terminal : integer  ); override;
       Procedure LimpaTela( Terminal:integer ; cliPorta:integer=0 ); override;
       Procedure PosicionaCursor( pLinha, pColuna : integer; Terminal: integer; cliPorta:integer=0 ); override;
       Procedure BackSpace( Terminal:integer  ); override;
   end;

implementation



var FPMTG : TGertec_mt720_Control;

procedure TACBrTERTcpGertec.BackSpace(Terminal: integer);
begin
  inherited;
  FPMTG.EnviaBackSpace( GetIdPMTG(terminal).id );
end;

Constructor TACBrTERTcpGertec.Create( AOwner: TComponent );
Begin
    Inherited Create( AOwner );
    FListaIPs:=TStringList.create;
    if not assigned(FPMTG) then
       FPMTG := TGertec_mt720_Control.create(self);
//    FPMTG.Execute;
    TipoTerminal := terTerminalTCP;
    fpModeloStr := 'Gertec';
    fpModelo := terGertec;
    FPMTG.onChecaConectado :=DoChecaConectadoEvent;
    FPMTG.Init;

End;


function TACBrTERTcpGertec.DecodeString(texto: string): TACBrTERDecodeString;
begin
     result.Texto := Texto;
end;

destructor TACBrTERTcpGertec.Destroy;
begin
  FListaIPs.free;
  inherited;
end;


procedure TACBrTERTcpGertec.DoChecaConectadoEvent(sender: TObject; pIP: string;
  var nTerm:integer; var conectado: boolean);
begin
  nTerm := GetTerminal(pIP);
  conectado := nTerm>=0;
  if nTerm<0 then
     begin
       nTerm := FListaIPs.IndexOf(pIP);
       if nTerm<=0 then
       begin
          FListaIPs.add(pIP);
          nTerm := FListaIPs.count;
       end;
     end;

end;

function TACBrTERTcpGertec.EncodeString(cod: TACBrTERDecodeString): string;
begin
     result := cod.Texto;
end;

procedure TACBrTERTcpGertec.EnviaString(pTexto: String;cliPorta:integer; Terminal: integer);
begin
  inherited;
  FPMTG.EnviaPalavra(pTexto, GetIdPMTG(Terminal).id  );
end;



function TACBrTERTcpGertec.GetIdPMTG(terminal: integer): TACBrTERGertecIdent;
begin
    result.Terminal := Terminal;
    result.ip := getIP(terminal);
    result.ID := FPMTG.GetId(result.ip);
end;

procedure TACBrTERTcpGertec.LimpaTela(Terminal: integer; cliPorta:integer=0);
begin
  inherited;
  FPMTG.LimpaDisplay(GetIdPMTG(Terminal).id  );
end;

procedure TACBrTERTcpGertec.PosicionaCursor(pLinha, pColuna, Terminal: integer; cliPorta:integer=0);
begin
  inherited;
  FPMTG.PosicionaCursor( pLinha+1,pColuna+1, GetIdPMTG(Terminal).id  );
end;



initialization

finalization
  FreeAndNil(FPMTG );

end.
