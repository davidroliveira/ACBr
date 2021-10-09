unit ACBrTERShellby;

interface

uses windows, classes, SysUtils,ACBrTERtcpClass,ACBrTERtcp;


type

    TACBrTERShellby = class(TACBrTERtcpClass)
    private
      TerminaisInstalados:array[0..32] of char;
      procedure LeBase(arq:string);
    public
      function LeBuf(terminal:integer):char;
      Constructor Create(AOwner: TComponent);override;
      Destructor Destroy; Override;
      procedure InitCompleto(Terminal:integer; cliPorta:integer);override;
      Procedure InitAPI;override;

      Procedure PosicionaCursor( pLinha, pColuna : integer; Terminal : integer = 0; cliPorta:integer=0 ); override;
      Procedure LimpaTela( Terminal : integer = 0 ; cliPorta:integer=0); override;
      Procedure EnviaString( pTexto : String;cliPorta:integer; Terminal : integer = 0 ); override;

    end;


implementation

uses IniFiles;


function ConfigLpt(Endereco, Timeout: Word): Boolean; stdcall; external 'WTechLpt.dll';
procedure Dll_Close(); stdcall; external 'WTechLpt.dll';
procedure Dll_PosCur(Terminal, Lin, Col: Byte); stdcall; external 'WTechLpt.dll';
procedure Dll_Clear(Terminal: Byte); stdcall; external 'WTechLpt.dll';
procedure Dll_Echo(Terminal: Byte; Dado: Char); stdcall; external 'WTechLpt.dll';
procedure Dll_Display(Terminal: Byte; Dado: string); stdcall; external 'WTechLpt.dll';
procedure Dll_Aciona(Terminal, Dado: Byte); stdcall; external 'WTechLpt.dll';
function Dll_Get(Terminal: Byte): Char; stdcall; external 'WTechLpt.dll';
function Dll_Status(Terminal: Byte): Byte; stdcall; external 'WTechLpt.dll';
function Dll_Print(Terminal: Byte; Dado: Char): Byte; stdcall; external 'WTechLpt.dll';
function Dll_Serial(Terminal: Byte; Dado: Char): Byte; stdcall; external 'WTechLpt.dll';


{ TACBrTERShellby } //mFunctions

constructor TACBrTERShellby.Create(AOwner: TComponent);
begin
  inherited;
  tACBrTERTcp(fpOwner).Porta := '3f8';
  leBase(GetCurrentDir+'\Shellby_base1.ini');
  leBase(GetCurrentDir+'\Shellby_base2.ini');
  leBase(GetCurrentDir+'\Shellby_base3.ini');
  leBase(GetCurrentDir+'\Shellby_base4.ini');
  TipoTerminal := terTerminalTCP;
  fpModeloStr := 'Shellby';
  fpModelo := terShellby;
end;

destructor TACBrTERShellby.Destroy;
begin
  Dll_Close();
  inherited;
end;

procedure TACBrTERShellby.EnviaString(pTexto: String;cliPorta:integer; Terminal: integer);
begin
  inherited;
  Dll_Display(terminal,pTexto);
end;

procedure TACBrTERShellby.InitAPI;
var I,X: Integer;
begin
  inherited;
  with TACBrTERTcp(fpOwner) do
  if not ConfigLpt( StrToInt('$'+porta)  , TimeoutInicializacao ) then
     raise exception.create('Não abriu porta de comunicação: '+Porta);

  for I := 0 to high(TerminaisInstalados) - 1 do
     if TerminaisInstalados[I]='S' then
     begin
        x :=i;
        DoConectaClass('127.0.0.1',0, X);
     end;
end;

procedure TACBrTERShellby.InitCompleto(Terminal: integer; cliPorta:integer);
begin
  inherited;
end;

procedure TACBrTERShellby.LeBase(arq: string);
var nrTer:Integer;
    i,x:integer;
    s:string;
begin
  with tIniFile.create( arq ) do
  try
    // Monta lista de terminais configurados
    nrTer := readInteger('Base','NTerminais',0);
    for I := 0 to nrTer - 1 do
    begin
      s:= readString('Base',IntToStr(i),'');
      s:= copy(s,3,2);
      x := strToIntDef(s,0);
      TerminaisInstalados[x] := 'S';
    end;
      
  finally
    free;
  end;
end;

function TACBrTERShellby.LeBuf(terminal: integer): char;
begin
  result := Dll_Get(Terminal);
  if ord(result)>0 then
     DoRecebeClass(result,'127.0.0.1',0,terminal );
end;

procedure TACBrTERShellby.LimpaTela(Terminal: integer=0; cliPorta:integer=0);
begin
  inherited;
  Dll_Clear(terminal);

end;

procedure TACBrTERShellby.PosicionaCursor(pLinha, pColuna:integer; Terminal: integer=0; cliPorta:integer=0);
begin
  inherited;
  Dll_PosCur(terminal,pLinha,pColuna);

end;

end.
