unit ACBrTERGertecUnit;



interface



uses  Classes,Windows, SysUtils,Winsock, messages,
      SyncObjs;






Const IDvLive = 2;

Const IDvGetSetupTCP = 8;
Const IDvGetExSetupTCP = 84;

Const IDvBackSpace = 34;
Const IDvCarRet = 36;
Const IDvLineFeed = 38;
Const IDvFormFeed = 40;
Const IDvGoToXY = 42;
Const IDvGoToXYRef = 44;
Const IDvDispStr = 52;
Const IDvDispCh = 54;
Const IDvDispClrLn = 56;
Const IDvSetEditString = 48;
Const IDbGetEditString = 50;
Const IDbReadEditString = 45;

Const IDcGetCharTerm = 29;
Const IDvSetEnableKey = 16;
Const IDbGetEnableKey = 18;
Const IDvSetCapsLock = 22;
Const IDbGetCapsLock = 24;
Const IDvSetNumLock = 26;
Const IDbGetNumLock = 28;
Const IDvReset = 20;
Const IDvSetBeep = 94;
Const IDvSetBeepKey = 96;

Const IDvSetEnableSerial = 58;
Const IDbGetEnableSerial = 60;
Const IDbSetSetupSerial = 66;
Const IDvGetSetupSerial = 68;
Const IDbGetBinSerial = 61;

Const IDvSetCard = 10;
Const IDbGetCard = 12;
Const IDbReadBuffCard = 13;



type

TOnRecebeChar = procedure(sender:TObject; loParam:DWORD; key:Char) of object;


TTABSOCK = packed record
    TSOCK: array [0..255] of DWORD;
end;

type
TSetupTCP = packed record
    microT_IP: DWORD; // Endereço IP do terminal
    server_IP: DWORD; // Endereço IP do servidor
    msknet_IP: DWORD; // Máscara de rede
    bDHCP: DWORD; // 1 = IP dinâmico, 0 = IP fixo
end;

type TExSetupTCP = packed record
    gateway: DWORD; // IP do gateway
    nameserver: DWORD; // IP do servidor de nomes
    myname: array [1..16] of BYTE; // Nome do terminal
end;

type TSetupSerial = packed record
    baud: DWORD; // Baud Rate: 1200 a 115.200
    bits: WORD; // Data Bits
    parity: WORD; // Paridade
    stops: WORD; // Stop Bits
    handshaking: BYTE; // 0 = Sem Hand Shaking, 1 = RTS/CTS
end;

type ARG_COM_SETUPSERIAL = packed record
    com: BYTE;
    Setup: TSetupSerial;
end;

type ARG_CARD = packed record
    card: array [0..128] of BYTE;
    status: DWORD;
end;


//  DECLARAÇÃO DE FUNÇÕES E ROTINAS

// INICIALIZAÇÃO E FINALIZAÇÃO
function Gertec_mt_startserver(mywhnd: HWND; conecmsg: DWORD; commumsg: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_startserver';
procedure Gertec_mt_finishserver; far; stdcall; external 'pmtg.dll' name 'mt_finishserver';
function Gertec_mt_connectlist: TTABSOCK; far; stdcall; external 'pmtg.dll' name 'mt_connectlist';

// FUNÇÕES DE TRATAMENTO DE IP
function Gertec_mt_inet_ntoa_inv(oip: DWORD): PChar; far; stdcall; external 'pmtg.dll' name 'mt_inet_ntoa_inv';
function Gertec_mt_inet_addr_inv(oip: String): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_inet_addr_inv';

// COMANDOS BÁSICOS PARA O TERMINAL
function Gertec_mt_sendlive(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_sendlive';
function Gertec_mt_restart(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_restart';
function Gertec_mt_ftpmode(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_ftpmode';

// REDE
function Gertec_mt_sendconfig(id: DWORD; var config: TSetupTCP): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_sendconfig';
function Gertec_mt_reqconfig(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_reqconfig';
function Gertec_mt_getconfig(id: DWORD; var config: TSetupTCP): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_getconfig';
function Gertec_mt_sendexconfig(id: DWORD; var configex: TExSetupTCP): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_sendexconfig';
function Gertec_mt_reqexconfig(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_reqexconfig';
function Gertec_mt_getexconfig(id: DWORD; var configex: TExSetupTCP): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_getexconfig';

// DISPLAY
function Gertec_mt_backspace(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_backspace';
function Gertec_mt_carret(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_carret';
function Gertec_mt_linefeed(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_linefeed';
function Gertec_mt_formfeed(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_formfeed';
function Gertec_mt_gotoxy(id: DWORD; lin: DWORD; col: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_gotoxy';
function Gertec_mt_gotoxyref(id: DWORD; lin: DWORD; col: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_gotoxyref';
function Gertec_mt_dispstr(id: DWORD; var str: BYTE): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_dispstr';
function Gertec_mt_dispch(id: DWORD; ch: BYTE): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_dispch';
function Gertec_mt_dispclrln(id: DWORD; lin: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_dispclrln';
function Gertec_mt_seteditstring(id: DWORD; var str: BYTE; OnOff: DWORD; PassWord: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_seteditstring';
function Gertec_mt_geteditstring(id: DWORD; var str: BYTE): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_geteditstring';
function Gertec_mt_reqeditstring(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_reqeditstring';

// TECLADO
function Gertec_mt_setenablekey(id: DWORD; OnOff: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_setenablekey';
function Gertec_mt_getenablekey(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_getenablekey';
function Gertec_mt_setcapslock(id: DWORD; OnOff: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_setcapslock';
function Gertec_mt_getcapslock(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_getcapslock';
function Gertec_mt_setnumlock(id: DWORD; OnOff: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_setnumlock';
function Gertec_mt_getnumlock(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_getnumlock';
function Gertec_mt_reset(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_reset';
function Gertec_mt_setbeep(id: DWORD; OnOff: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_setbeep';
function Gertec_mt_setbeepkey(id: DWORD; OnOff: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_setbeepkey';
function Gertec_mt_getkey(id: DWORD; var buf: BYTE): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_getkey';
function Gertec_mt_programkbd(id: DWORD; var codigo: BYTE): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_programkbd';

// SERIAL
function Gertec_mt_setenableserial(id: DWORD; COM: BYTE; OnOff: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_setenableserial';
function Gertec_mt_getenableserial(id: DWORD; COM: BYTE): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_getenableserial';
function Gertec_mt_sendbinserial(id: DWORD; COM: BYTE; var bin: BYTE; tam: BYTE): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_sendbinserial';
function Gertec_mt_sendconfigserial(id: DWORD; var config: ARG_COM_SETUPSERIAL): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_sendconfigserial';
function Gertec_mt_reqconfigserial(id: DWORD; COM: BYTE): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_reqconfigserial';
function Gertec_mt_getconfigserial(id: DWORD; var config: ARG_COM_SETUPSERIAL): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_getconfigserial';
function Gertec_mt_getserial(id: DWORD; var sercom: DWORD; var buf: array of BYTE): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_getserial';
function Gertec_mt_settermserial(id: DWORD; COM: DWORD; TERM: DWORD; OnOff: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_settermserial';

// CARTÃO
function Gertec_mt_sendsetcard(id: DWORD; OnOff: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_sendsetcard';
function Gertec_mt_reqgetcard(id: DWORD): DWORD; far; stdcall; external 'pmtg.dll' name 'mt_reqgetcard';
function Gertec_mt_getcardbuf(id: DWORD; var cardbuf: ARG_CARD): DWORD; far; stdcall;  external 'pmtg.dll' name 'mt_getcardbuf';


function Gertec_mt720_retorna_IP(id: DWORD): String;
function Gertec_mt720_compara(buf: String): BYTE;
function Gertec_mt720_converte(str: String): BYTE;



type


   PACBrTERGertecIdent = ^TACBrTERGertecIdent;
   TACBrTERGertecIdent = record
       Ip:string;
       Terminal:Integer;
       Id:Integer;
   end;
   TACBrTERGertecListItem = class(TCollectionItem)
     public
       Dados:TACBrTERGertecIdent;
   end;

   TACBrTERGertecLists = class(TCollection)
   private
    function GetItems(idx: Integer): TACBrTERGertecListItem;
    procedure SetItems(idx: integer; const Value: TACBrTERGertecListItem);
    function add():TACBrTERGertecListItem;
   public
     property items[idx:integer]: TACBrTERGertecListItem read Getitems write Setitems;
   end;


const
COMUNICATION_MSG = WM_USER+1;
CONNECT_MSG = WM_USER+2;


type
     TGertec_mt720_ChecaConectadoEvent=procedure (sender:TObject;pIP:string;var nTerm:integer; var conectado:boolean) of object;

     TGertec_mt720_Control = class(TObject)
      private
        fHWnd: HWND;
        //FCriticalSection: TCriticalSection;
        fpOwner:TObject;
        FGertecList:TACBrTERGertecLists;
        FonChecaConectado: TGertec_mt720_ChecaConectadoEvent;
        function ChecaConectado(msg:DWORD;LOParam: DWORD):TACBrTERGertecIdent;
        procedure SetonChecaConectado(
        const Value: TGertec_mt720_ChecaConectadoEvent);
      protected
        procedure WndMethod(var Msg: TMessage); virtual;
      public
        procedure DoRecebeChar(key:char;idTerm:word);
        function FindTerminal(id:integer):TACBrTERGertecIdent;
        function GetId(ip:string):integer;
        Function CheckTerminal(id:integer):boolean; // true - conectado

        procedure DoIDvLive(LOParam:DWORD);virtual;
        procedure DoIDvGetSetupTCP(LOParam:DWORD;ipCliente,ipServer,MaskNet:string;IpDinamico:boolean);virtual;
        procedure DoIDvGetExSetupTCP(LOParam:DWORD; gateware, nameserver, myname: string);virtual;
        procedure DoIDvBackSpace(LOParam:DWORD);virtual;
        procedure DoIDvCarRet(LOParam:DWORD);virtual;
        procedure DoIDvFormFeed(LOParam:DWORD);virtual;
        procedure DoIDvLineFeed(LOParam:DWORD);virtual;
        procedure DoIDcGetCharTerm(LOParam:DWORD;key:char);virtual;
        procedure DoIDvSetEnableKey(LParamLo:DWORD);virtual;
        procedure DoIDbGetEnableKey(LParamLo:DWORD);virtual;

        constructor Create(AOwner: TObject);
        destructor Destroy; override;
        function Init:boolean;

        procedure EnviaIDvLive(i:DWORD);
        procedure EnviaIDvLiveAll();
        function EnviaPalavra(texto:string;id:Word):boolean;
        function EnviaChar(ch:Char;id:Word):boolean;
        function EnviaBackSpace(id:word):boolean;
        function LimpaLinha(Linha:integer;id:word):boolean;
        Function LimpaDisplay(id:word):boolean;
        procedure AtivaTeclado(id:word);
        procedure DesativaTeclado(id:word);
        function PosicionaCursor(Linha:integer;Coluna:integer; id:word):boolean;

     public
        property onChecaConectado:TGertec_mt720_ChecaConectadoEvent read FonChecaConectado write SetonChecaConectado;

     end;





var
       Gertec_mt720_tabcon: TTABSOCK;
       Gertec_mt720_auxIP: TINADDR;



Implementation


uses ACBrTERTcpGertec, ACBrTERTcpClass, ACBrTERtcp ;


// AUXILIAR

//********************************************************************************************************
// Função: retorna_IP
//********************************************************************************************************
//
// Data de Criação: 20/12/2007
//
// Descrição: Transforma o ID de um terminal em um endereço IP
//
//********************************************************************************************************

function Gertec_mt720_retorna_IP(id: DWORD): String;
begin
    // Recebe o id dos terminais conectados.
    Gertec_mt720_tabcon := Gertec_mt_connectlist;
    // Transforma o ID em um endereço válido.
    Gertec_mt720_auxIP.S_addr := Gertec_mt720_tabcon.TSOCK[id];
    // Formata para um endereço de IP pontuado.
    result := (inet_ntoa(Gertec_mt720_auxIP) {+ ' - ' + IntToStr(id)});
end;

//********************************************************************************************************
// Função: compara
//********************************************************************************************************
//
// Data de Criação: 20/12/2007
//
// Descrição: Verifica se o usuário digitou valores válidos ('0' até '9' e de 'A' até 'F')
//
//********************************************************************************************************

function Gertec_mt720_compara(buf: String): BYTE;
begin
    if (buf = '0') OR (buf = '1') OR (buf = '2') OR (buf = '3') OR (buf = '4') OR (buf = '5') OR (buf = '6') OR (buf = '7') OR (buf = '8') OR (buf = '9') OR (buf = 'a') OR (buf = 'b') OR (buf = 'c') OR (buf = 'd') OR (buf = 'e') OR (buf = 'f') OR (buf = 'A') OR (buf = 'B') OR (buf = 'C') OR (buf = 'D') OR (buf = 'E') OR (buf = 'F') then
    begin
       result := 1;
    end
    else
    begin
       result := 0;
    end;
end;

//********************************************************************************************************
// Função: converte
//********************************************************************************************************
//
// Data de Criação: 20/12/2007
//
// Descrição: Converte os números de decimal para hexadecimal
//
//********************************************************************************************************

function Gertec_mt720_converte(str: String): BYTE;
var
    str1: String;
    str1a: INTEGER;
    str2: String;
    str2a: INTEGER;
    soma: INTEGER;
begin
    str1 := (Copy(str, 1, 1));
    str2 := (Copy(str, 2, 1));

    str1a := 0;
    str2a := 0;

    if (str1 = '0') then
        str1a := 0
    else if (str1 = '1') then
        str1a := 16
    else if (str1 = '2') then
        str1a := 32
    else if (str1 = '3') then
        str1a := 48
    else if (str1 = '4') then
        str1a := 64
    else if (str1 = '5') then
        str1a := 80
    else if (str1 = '6') then
        str1a := 96
    else if (str1 = '7') then
        str1a := 112
    else if (str1 = '8') then
        str1a := 128
    else if (str1 = '9') then
        str1a := 144
    else if (str1 = 'a') then
        str1a := 160
    else if (str1 = 'b') then
        str1a := 176
    else if (str1 = 'c') then
        str1a := 192
    else if (str1 = 'd') then
        str1a := 208
    else if (str1 = 'e') then
        str1a := 224
    else if (str1 = 'f') then
        str1a := 240;

    if (str2 = '0') then
        str2a := 0
    else if (str2 = '1') then
        str2a := 1
    else if (str2 = '2') then
        str2a := 2
    else if (str2 = '3') then
        str2a := 3
    else if (str2 = '4') then
        str2a := 4
    else if (str2 = '5') then
        str2a := 5
    else if (str2 = '6') then
        str2a := 6
    else if (str2 = '7') then
        str2a := 7
    else if (str2 = '8') then
        str2a := 8
    else if (str2 = '9') then
        str2a := 9
    else if (str2 = 'a') then
        str2a := 10
    else if (str2 = 'A') then
        str2a := 10
    else if (str2 = 'b') then
        str2a := 11
    else if (str2 = 'B') then
        str2a := 11
    else if (str2 = 'c') then
        str2a := 12
    else if (str2 = 'C') then
        str2a := 12
    else if (str1 = 'd') then
        str2a := 13
    else if (str2 = 'D') then
        str2a := 13
    else if (str2 = 'e') then
        str2a := 14
    else if (str2 = 'E') then
        str2a := 14
    else if (str2 = 'f') then
        str2a := 15
    else if (str2 = 'F') then
        str2a := 15;

    soma := str1a + str2a;

    result := soma;
end;



{ TGertec_mt720_Control }

procedure TGertec_mt720_Control.AtivaTeclado(id: word);
begin
   Gertec_mt_setenablekey(id,1);
end;

function TGertec_mt720_Control.CheckTerminal(id: integer): boolean;
begin
    Gertec_mt720_tabcon := Gertec_mt_connectlist;
    result := (Gertec_mt720_tabcon.TSOCK[id] <> 0) ;
end;

constructor TGertec_mt720_Control.Create(AOwner: TObject);
begin

    If (AOwner=nil) or (Not ( AOwner.InheritsFrom( TACBrTERtcpGertec ) )) Then
        Raise Exception.Create( 'Essa Classe deve ser instanciada por TACBrTERClassGertec' );

  inherited create;
  //FCriticalSection := TCriticalSection.Create;

  fpOwner := AOwner;
  FGertecList:=TACBrTERGertecLists.create(TACBrTERGertecListItem);
  fHWnd := AllocateHWnd(WndMethod);
end;

procedure TGertec_mt720_Control.DesativaTeclado(id: word);
begin
   Gertec_mt_setenablekey(id,0);
end;

destructor TGertec_mt720_Control.Destroy;
begin
  Gertec_mt_finishserver();
  DeallocateHWnd(fHWnd);
  freeAndNil(FGertecList);
  //FreeAndNil(FCriticalSection);
  inherited;
end;




procedure TGertec_mt720_Control.DoIDbGetEnableKey(LParamLo: DWORD);
begin

end;

procedure TGertec_mt720_Control.DoIDcGetCharTerm(LOParam: DWORD; key: char);
begin
//   EnviaChar(key,LOParam );
   DoRecebeChar(key,LOParam);
end;

procedure TGertec_mt720_Control.DoIDvBackSpace(LOParam: DWORD);
begin
   DoRecebeChar(char(VK_BACK),LOParam);
end;

procedure TGertec_mt720_Control.DoIDvCarRet(LOParam: DWORD);
begin

end;

procedure TGertec_mt720_Control.DoIDvFormFeed(LOParam: DWORD);
begin

end;

procedure TGertec_mt720_Control.DoIDvGetExSetupTCP(LOParam: DWORD; gateware,
  nameserver, myname: string);
begin

end;

procedure TGertec_mt720_Control.DoIDvGetSetupTCP(LOParam: DWORD; ipCliente,
  ipServer, MaskNet: string; IpDinamico: boolean);
begin

end;

procedure TGertec_mt720_Control.DoIDvLineFeed(LOParam: DWORD);
begin

end;

procedure TGertec_mt720_Control.DoIDvLive(LOParam: DWORD);
begin

end;

function TGertec_mt720_Control.ChecaConectado(msg:DWORD; LOParam: DWORD):TACBrTERGertecIdent;
var t:TACBrTERGertecIdent;
    nTerm:integer;
    conectado:boolean;
begin
   t.ip := Gertec_mt720_retorna_IP(LOParam);
   if t.ip='0.0.0.0' then exit;

   t.Id := LOParam;{GetId(t.ip)};
   conectado := not (msg = CONNECT_MSG);
   FonChecaConectado(self,t.ip,nTerm,conectado);
   t.Terminal := nTerm;

   //   if not Conectado then
   if msg= CONNECT_MSG then
   begin
         TACBrTERTcpGertec(fpOwner).DoConectaClass(t.ip,0,nTerm);
         t.Terminal := nTerm;
         with FGertecList.Add do
            Dados := t;
   end;
   result := t;
end;

procedure TGertec_mt720_Control.DoIDvSetEnableKey(LParamLo: DWORD);
begin

end;

procedure TGertec_mt720_Control.DoRecebeChar(key: char; idTerm: word);
var t:TACBrTERGertecIdent;
begin
   t := ChecaConectado(0,idTerm);
   TACBrTERTcpGertec(fpOwner).DoRecebeClass(key,t.Ip,0,t.id);
end;

function TGertec_mt720_Control.EnviaBackSpace(id: word): boolean;
begin
  result := Gertec_mt_backspace(id)>0;
end;

function TGertec_mt720_Control.EnviaChar(ch: Char; id: Word): boolean;
var
    buf: array [0..1] of BYTE;
begin
        StrPCopy(@buf,ch);
        result := Gertec_mt_dispch(id, buf[0]) >0;
end;

procedure TGertec_mt720_Control.EnviaIDvLive(i: DWORD);
begin
    Gertec_mt720_tabcon := Gertec_mt_connectlist;
    if (Gertec_mt720_tabcon.TSOCK[i] <> 0) then
       Gertec_mt_sendlive(i);
end;

procedure TGertec_mt720_Control.EnviaIDvLiveAll;
var i:integer;
begin
    Gertec_mt720_tabcon := Gertec_mt_connectlist;
    i := 0;
    while (i < 255) do
    begin
        if (Gertec_mt720_tabcon.TSOCK[i] <> 0) then
        begin
            Gertec_mt_sendlive(i);
            Sleep(1);
        end;
        i := i + 1;
    end;

end;

function TGertec_mt720_Control.EnviaPalavra(texto: string; id: Word):boolean;
var
    buf: array [0..255] of BYTE;
begin
        fillchar(buf,sizeof(buf),#0);
        StrPCopy(@buf,Texto);
        result := Gertec_mt_dispstr(id, buf[0]) >0;
end;

function TGertec_mt720_Control.FindTerminal(id: integer): TACBrTERGertecIdent;
var i:integer;
begin
//  FCriticalSection.Acquire;
  try
  result.Ip:='';
  for I := 0 to FGertecList.Count - 1 do
  begin
    if FGertecList.items[I].Dados.ID=id then
       begin
         result := FGertecList.items[I].Dados;
         exit;
       end;
  end;
  finally
//   FCriticalSection.Release;
  end;
end;


function TGertec_mt720_Control.GetId(ip: string): integer;
var i : Integer;
    s:string;
begin
    result := 0;
    Gertec_mt720_tabcon := Gertec_mt_connectlist;
    for I := 0 to 254 do
      if (Gertec_mt720_tabcon.TSOCK[i] <> 0) then
      begin
        Gertec_mt720_auxIP.S_addr := Gertec_mt720_tabcon.TSOCK[i];
        s := inet_ntoa(Gertec_mt720_auxIP);
        if sametext(s,ip) then
         begin
           result := I;
           exit;
         end;
      end;

end;

function TGertec_mt720_Control.Init:boolean;
begin
    result := Gertec_mt_startserver(fHWnd , CONNECT_MSG , COMUNICATION_MSG) = 1
end;

function TGertec_mt720_Control.LimpaDisplay(id: word): boolean;
begin
        result := Gertec_mt_formfeed(id) >0;
end;

function TGertec_mt720_Control.LimpaLinha(Linha: integer; id: word):boolean;
begin
  result := Gertec_mt_dispclrln(id, Linha) >0;
end;

function TGertec_mt720_Control.PosicionaCursor(Linha, Coluna: integer;
  id: word):boolean;                                
begin
   result :=  Gertec_mt_gotoxy(id, linha, coluna)>0;
end;


procedure TGertec_mt720_Control.SetonChecaConectado(
  const Value: TGertec_mt720_ChecaConectadoEvent);
begin
  FonChecaConectado := Value;
end;

procedure TGertec_mt720_Control.WndMethod(var Msg: TMessage);
var
    config: TSetupTCP;
    configex: TExSetupTCP;
    buf: array [0..255] of BYTE;
    handled:boolean;
begin

      Handled := false;

      if  msg.Msg = CONNECT_MSG  then
      begin  // mensagem enviada pelo microterminal;
         ChecaConectado(msg.Msg,Msg.LParamLo )  ;// um terminal se conectou;
//         Handled := true;
      end;

      if (Msg.Msg = COMUNICATION_MSG) then
      begin
      Handled := true;

      case Msg.WParam of
        IDvLive:
        begin
            // Escreve na lista de logs
            EnviaIDvLive( Msg.LParamLo );
            DoIDvLive(  Msg.LParamLo );
        end;

        IDvGetSetupTCP:
        begin
            // Recebe os dados enviados pelo terminal
            Gertec_mt_getconfig(Msg.LParamLo, config);

            // Cada edit recebe sua respctiva configuração de rede
            DoIDvGetSetupTCP( Msg.LParamLo,Gertec_mt_inet_ntoa_inv(config.microT_IP),
                              Gertec_mt_inet_ntoa_inv(config.server_IP),
                              Gertec_mt_inet_ntoa_inv(config.msknet_IP),
                              config.bDHCP = 1
                             );

        end;

        // IDvGetExSetupTCP
        IDvGetExSetupTCP:
        begin
            // Recebe os dados enviados pelo terminal
            Gertec_mt_getexconfig(Msg.LParamLo, configex);

            // Cada edit recebe sua respctiva configuração de rede
            DoIDvGetExSetupTCP( Msg.LParamLo,
                  Gertec_mt_inet_ntoa_inv(configex.gateway),
                  Gertec_mt_inet_ntoa_inv(configex.nameserver),
                  PChar(@configex.myname));
        end;

        // IDvBackSpace
        IDvBackSpace:
        begin
            DoIDvBackSpace(Msg.LParamLo);
        end;

        // IDvCarRet
        IDvCarRet:
        begin
            DoIDvCarRet(Msg.LParamLo);
        end;

        // IDvFormFeed
        IDvFormFeed:
        begin
            DoIDvFormFeed(Msg.LParamLo);
        end;

        // IDvLineFeed
        IDvLineFeed:
        begin
            DoIDvLineFeed(Msg.LParamLo);
        end;

{        // IDvGoToXY
        else if (Message.WParam = IDvGoToXY) then
        begin
            // Escreve na lista de logs
            ListReceive.Items.Add('IDvGoToXY - Linha: ' + edtGoToXY1.Text + ' / Cloluna: ' + edtGoToXY2.Text + ' - ' + retorna_IP(Message.LParamLo));
        end

        // IDvGoToXYRef
        else if (Message.WParam = IDvGoToXYRef) then
        begin
            // Escreve na lista de logs
            ListReceive.Items.Add('IDvGoToXYRef - Linha: ' + edtGoToXYRef1.Text + ' / Cloluna: ' + edtGoToXYRef2.Text + ' - ' + retorna_IP(Message.LParamLo));
        end

        // IDvDispStr
        else if (Message.WParam = IDvDispStr) then
        begin
            // Escreve na lista de logs
            ListReceive.Items.Add('IDvDispStr - ' + edtDispStr.Text + ' - ' + retorna_IP(Message.LParamLo));
        end

        // IDvDispClrLn
        else if (Message.WParam = IDvDispClrLn) then
        begin
            // Escreve na lista de logs
            ListReceive.Items.Add('IDvDispClrLn - ' + edtDispClrLn.Text + ' - ' + retorna_IP(Message.LParamLo));
        end

        // IDvSetEditString
        else if (Message.WParam = IDvSetEditString) then
        begin
            // Escreve na lista de logs
            ListReceive.Items.Add('IDvSetEditString - ' + edtString.Text + ' - ' + retorna_IP(Message.LParamLo));
        end

        // IDbGetEditString
        else if (Message.WParam = IDbGetEditString) then
        begin
            // Busca o endereço IP do ID correspondente
            retorna_IP(Message.LParamLo);
            // Escreve na lista de logs
            ListReceive.Items.Add('IDbGetEditString - ' + IntToStr(Message.LParamHi) + ' - ' + retorna_IP(Message.LParamLo));
        end

        // IDbReadEditString
        else if (Message.WParam = IDbReadEditString) then
        begin
            // Recebe os dados enviados pelo terminal
            mt_geteditstring(Message.LParamLo, buf[0]);
            // Converte BYTE (variável buf) para String (variável str)
            str := PChar(@buf);
            // Busca o endereço IP do ID correspondente
            retorna_IP(Message.LParamLo);
            // Escreve na lista de logs
            ListReceive.Items.Add('IDbReadEditString - ' + str + ' - ' + retorna_IP(Message.LParamLo));
        end

 }       // IDcGetCharTerm
        IDcGetCharTerm:
        begin
            // Recebe uma tecla do terminal
            Gertec_mt_getkey(Msg.LParamLo, buf[0]);
{            if (chkEco.Checked = True) then
            begin
                mt_dispch(Message.LParamLo,buf[0]);
            end;
            }
            // Busca o endereço IP do ID correspondente
            DoIDcGetCharTerm(Msg.LParamLo,chr(buf[0]));
        end;

        // IDvSetEnableKey
        IDvSetEnableKey:
        begin
            DoIDvSetEnableKey(Msg.LParamLo);
        end;

        // IDbGetEnableKey
        IDbGetEnableKey:
        begin
            DoIDbGetEnableKey(Msg.LParamLo);
        end;

{        // IDvSetCapsLock
        else if (Message.WParam = IDvSetCapsLock) then
        begin
            // Escreve na lista de logs
            ListReceive.Items.Add('IDvSetCapsLock - ' + retorna_IP(Message.LParamLo));
        end

        // IDbGetCapsLock
        else if (Message.WParam = IDbGetCapsLock) then
        begin
            // Busca o endereço IP do ID correspondente
            retorna_IP(Message.LParamLo);
            // Escreve na lista de logs
            ListReceive.Items.Add('IDbGetCapsLock - ' + IntToStr(Message.LParamHi) + ' - ' + retorna_IP(Message.LParamLo));
        end

        // IDvSetNumLock
        else if (Message.WParam = IDvSetNumLock) then
        begin
            // Escreve na lista de logs
            ListReceive.Items.Add('IDvSetNumLock - ' + retorna_IP(Message.LParamLo));
        end

        // IDbGetNumLock
        else if (Message.WParam = IDbGetNumLock) then
        begin
            // Busca o endereço IP do ID correspondente
            retorna_IP(Message.LParamLo);
            // Escreve na lista de logs
            ListReceive.Items.Add('IDbGetNumLock - ' + IntToStr(Message.LParamHi) + ' - ' + retorna_IP(Message.LParamLo));
        end

        // IDvReset
        else if (Message.WParam = IDvReset) then
        begin
            // Escreve na lista de logs
            ListReceive.Items.Add('IDvReset - ' + retorna_IP(Message.LParamLo));
        end

        // IDvSetBeep
        else if (Message.WParam = IDvSetBeep) then
        begin
            // Escreve na lista de logs
            ListReceive.Items.Add('IDvSetBeep - ' + retorna_IP(Message.LParamLo));
        end

        // IDvSetBeepKey
        else if (Message.WParam = IDvSetBeepKey) then
        begin
            // Escreve na lista de logs
            ListReceive.Items.Add('IDvSetBeepKey - ' + retorna_IP(Message.LParamLo));
        end

        // IDvSetEnableSerial
        else if (Message.WParam = IDvSetEnableSerial) then
        begin
            // Escreve na lista de logs
            ListReceive.Items.Add('IDvSetEnableSerial - ' + retorna_IP(Message.LParamLo));
        end

        // IDbGetEnableSerial
        else if (Message.WParam = IDbGetEnableSerial) then
        begin
            // Busca o endereço IP do ID correspondente
            retorna_IP(Message.LParamLo);
            // Escreve na lista de logs
            ListReceive.Items.Add('IDbGetEnableSerial - ' + IntToStr(Message.LParamHi) + ' - ' + retorna_IP(Message.LParamLo));
        end

        // IDvGetSetupSerial
        else if (Message.WParam = IDvGetSetupSerial) then
        begin
            // Recebe as configurações enviadas pelo terminal
            mt_getconfigserial(Message.LParamLo, configserial);

            // Cada combo recebe sua respctiva configuração de serial
            cbBaud.Text := IntToStr(configserial.Setup.baud);
            cbBits.Text := IntToStr(configserial.Setup.bits);

            if configserial.Setup.parity = 0 then
                cbParidade.Text := 'Nenhum'
            else if configserial.Setup.parity = 1 then
                cbParidade.Text := 'Impar'
            else if configserial.Setup.parity = 2 then
                cbParidade.Text := 'Par'
            else if configserial.Setup.parity = 3 then
                cbParidade.Text := 'Marca'
            else if configserial.Setup.parity = 4 then
                cbParidade.Text := 'Espaço';

            cbStop.Text := IntToStr(configserial.Setup.stops);

            if configserial.Setup.handshaking = 0 then
                cbHand.Text := 'Nenhum'
            else if configserial.Setup.handshaking = 1 then
                cbHand.Text := 'CTS / RTS';

            // Escreve na lista de logs
            ListReceive.Items.Add('IDvGetSetupSerial - ' + retorna_IP(Message.LParamLo));
        end

        // IDbGetBinSerial
        else if (Message.WParam = IDbGetBinSerial) then
        begin
            porta := cbPorta.ItemIndex;
            mt_getserial(Message.LParamLo,porta,buf[0]);

            // Escreve na lista de logs
            ListReceive.Items.Add('IDbGetBinSerial - ' + PChar(@buf) + ' - ' + retorna_IP(Message.LParamLo));
        end

        // IDvSetCard
        else if (Message.WParam = IDvSetCard) then
        begin
            // Escreve na lista de logs
            ListReceive.Items.Add('IDvSetCard - ' + retorna_IP(Message.LParamLo));
        end

        // IDbGetCard
        else if (Message.WParam = IDbGetCard) then
        begin
            // Busca o endereço IP do ID correspondente
            retorna_IP(Message.LParamLo);
            // Escreve na lista de logs
            ListReceive.Items.Add('IDbGetCard - ' + IntToStr(Message.LParamHi) + ' - ' + retorna_IP(Message.LParamLo));
        end

        // IDbReadBuffCard
        else if (Message.WParam = IDbReadBuffCard) then
        begin
            // Recebe os dados enviados pelo terminal
            mt_getcardbuf(Message.LParamLo,configcard);
            // Converte BYTE (variável buf) para String (variável str)
            str := PChar(@configcard.card);
            edtCartao.Text := str;
            // Escreve na lista de logs
            ListReceive.Items.Add('IDbReadBuffCard - ' + str + ' - ' + retorna_IP(Message.LParamLo));
        end;

    end else
 }



    else
      begin
        handled := false;
      end;
      end;
    end;

    if not Handled then
         Msg.Result := DefWindowProc(fHWnd, Msg.Msg, Msg.WParam, Msg.LParam);


end;

{ TACBrTERGertecList }

function TACBrTERGertecLists.add: TACBrTERGertecListItem;
begin
   result := TACBrTERGertecListItem(inherited add());
end;

function TACBrTERGertecLists.GetItems(idx: Integer): TACBrTERGertecListItem;
begin
   result := TACBrTERGertecListItem(inherited Items[idx]);
end;

procedure TACBrTERGertecLists.SetItems(idx: integer;
  const Value: TACBrTERGertecListItem);
begin
  inherited Items[idx] := Value;
end;




end.
