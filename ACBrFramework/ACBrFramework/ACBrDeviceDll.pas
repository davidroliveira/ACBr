unit ACBrDeviceDll;

interface

uses
  SysUtils,
  Classes,
  ACBrECF,
  ACBrBAL,
  ACBrLCB,
  ACBrDIS,
  ACBrPosPrinter,
  ACBrETQ,
  ACBrDevice,
  ACBrHandlers,
  ACBrUtil;

{%region Declaração da funções}

function DEV_GetPorta(const deviceHandle: PDeviceHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_SetPorta(const deviceHandle: PDeviceHandle; const Porta: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_GetBaud(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_SetBaud(const deviceHandle: PDeviceHandle; const Baud: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_GetDataBits(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_SetDataBits(const deviceHandle: PDeviceHandle;
  const DataBits: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_GetParity(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_SetParity(const deviceHandle: PDeviceHandle;
  const Parity: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_GetStopBits(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_SetStopBits(const deviceHandle: PDeviceHandle;
  const StopBits: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_GetHandShake(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_SetHandShake(const deviceHandle: PDeviceHandle;
  const HandShake: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_GetHardFlow(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_SetHardFlow(const deviceHandle: PDeviceHandle;
  const HardFlow: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_GetSoftFlow(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_SetSoftFlow(const deviceHandle: PDeviceHandle;
  const SoftFlow: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_GetTimeOut(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_SetTimeOut(const deviceHandle: PDeviceHandle;
  const TimeOut: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_GetMaxBandwidth(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_SetMaxBandwidth(const deviceHandle: PDeviceHandle;
  const MaxBandwidth: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_GetProcessMessages(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function DEV_SetProcessMessages(const deviceHandle: PDeviceHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;

function GetDevice(const deviceHandle: PDeviceHandle): TACBrDevice;

{%endregion}

implementation

function DEV_GetPorta(const deviceHandle: PDeviceHandle; Buffer: PChar;
  const BufferLen: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
var
  StrTmp: string;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    StrTmp := GetDevice(deviceHandle).Porta;
    StrPLCopy(Buffer, StrTmp, BufferLen);
    Result := length(StrTmp);
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_SetPorta(const deviceHandle: PDeviceHandle; const Porta: PChar): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    GetDevice(deviceHandle).Porta := Porta;
    Result := 0;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_GetBaud(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := GetDevice(deviceHandle).Baud;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_SetBaud(const deviceHandle: PDeviceHandle; const Baud: integer): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    GetDevice(deviceHandle).Baud := Baud;
    Result := 0;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_GetDataBits(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := GetDevice(deviceHandle).Data;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_SetDataBits(const deviceHandle: PDeviceHandle;
  const DataBits: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    GetDevice(deviceHandle).Data := DataBits;
    Result := 0;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_GetParity(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(GetDevice(deviceHandle).Parity);
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_SetParity(const deviceHandle: PDeviceHandle;
  const Parity: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    GetDevice(deviceHandle).Parity := TACBrSerialParity(Parity);
    Result := 0;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_GetStopBits(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(GetDevice(deviceHandle).Stop);
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_SetStopBits(const deviceHandle: PDeviceHandle;
  const StopBits: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    GetDevice(deviceHandle).Stop := TACBrSerialStop(StopBits);
    Result := 0;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_GetHandShake(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(GetDevice(deviceHandle).HandShake);
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_SetHandShake(const deviceHandle: PDeviceHandle;
  const HandShake: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    GetDevice(deviceHandle).HandShake := TACBrHandShake(HandShake);
    Result := 0;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_GetHardFlow(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(GetDevice(deviceHandle).HardFlow);
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_SetHardFlow(const deviceHandle: PDeviceHandle;
  const HardFlow: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    GetDevice(deviceHandle).HardFlow := HardFlow;
    Result := 0;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_GetSoftFlow(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := integer(GetDevice(deviceHandle).SoftFlow);
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_SetSoftFlow(const deviceHandle: PDeviceHandle;
  const SoftFlow: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    GetDevice(deviceHandle).SoftFlow := SoftFlow;
    Result := 0;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_GetTimeOut(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := GetDevice(deviceHandle).TimeOut;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_SetTimeOut(const deviceHandle: PDeviceHandle;
  const TimeOut: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    GetDevice(deviceHandle).TimeOut := TimeOut;
    Result := 0;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_GetMaxBandwidth(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := GetDevice(deviceHandle).MaxBandwidth;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_SetMaxBandwidth(const deviceHandle: PDeviceHandle;
  const MaxBandwidth: integer): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    GetDevice(deviceHandle).MaxBandwidth := MaxBandwidth;
    Result := 0;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_GetProcessMessages(const deviceHandle: PDeviceHandle): integer;
 {$IFDEF STDCALL} stdcall; {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    if GetDevice(deviceHandle).ProcessMessages then
      Result := 1
    else
      Result := 0;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function DEV_SetProcessMessages(const deviceHandle: PDeviceHandle;
  const Value: boolean): integer; {$IFDEF STDCALL} stdcall;
 {$ENDIF} {$IFDEF CDECL} cdecl; {$ENDIF} export;
begin

  if (deviceHandle = nil) then
  begin
    Result := -2;
    Exit;
  end;

  try
    GetDevice(deviceHandle).ProcessMessages := Value;
    Result := 0;
  except
    on Exception: Exception do
    begin
      deviceHandle^.UltimoErro := Exception.Message;
      Result := -1;
    end
  end;

end;

function GetDevice(const deviceHandle: PDeviceHandle): TACBrDevice;
begin

  if (deviceHandle^.Component is TACBrECF) then
    Result := TACBrECF(deviceHandle^.Component).Device
  else if (deviceHandle^.Component is TACBrBAL) then
    Result := TACBrBAL(deviceHandle^.Component).Device
  else if (deviceHandle^.Component is TACBrLCB) then
    Result := TACBrLCB(deviceHandle^.Component).Device
  else if (deviceHandle^.Component is TACBrDIS) then
    Result := TACBrDIS(deviceHandle^.Component).Device
  else if (deviceHandle^.Component is TACBrPosPrinter) then
    Result := TACBrPosPrinter(deviceHandle^.Component).Device
  else if (deviceHandle^.Component is TACBrETQ) then
    Result := TACBrETQ(deviceHandle^.Component).Device;

end;

end.
