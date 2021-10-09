unit ACBrTERWtechlpt;

interface

uses windows, classes, ACBrTERtcpClass,ACBrTER;


type

    TACBrTERWtechlpt = class(TACBrTERtcpClass)

    public

    end;


implementation


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


end.
