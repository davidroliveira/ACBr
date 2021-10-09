program ACBrMonitor;


uses
  QForms,
  SysUtils,
  {$IFDEF MSWINDOWS}
  Windows,
  {$ENDIF}
  ACBrMonitor1 in 'ACBrMonitor1.pas' {FrmACBrMonitor},
  DoECFUnit in 'DoECFUnit.pas',
  {$IFDEF MSWINDOWS}
  sndkey32 in 'sndkey32.pas',
  {$ENDIF}
  QTrayIcon in 'QTrayIcon.pas',
  Sobre in 'Sobre.pas' {frmSobre};

{$IFNDEF MSWINDOWS}
var
    FHandle, N    : Integer ;
    ArqFlagAberto : String ;
    Buffer        : Pointer ;
    B             : Byte ;
{$ENDIF}

{$R *.res}

begin
  {$IFDEF MSWINDOWS}
   CreateMutex(nil, True, 'ACBrMonitor');
   if GetLastError = ERROR_ALREADY_EXISTS then
   begin
      Application.MessageBox('O programa ACBrMonitor já está em execução',
                             'ATENÇÃO !!',[smbOK],smsWarning) ;
      Application.Terminate ;
   end;
  {$ELSE}
   FHandle := 0 ;
  {$ENDIF}
  Application.Initialize;
  Application.Title := 'ACBrMonitor';

  {$IFNDEF MSWINDOWS}
  try
     try
       { Tenta criar arquivo em modo Exclusivo, se NAO conseguir já está rodando }
       B        := 65 ;
       Buffer   := @B ;
       ArqFlagAberto := ExtractFilePath(Application.ExeName) + 'ACBrMonitor_Aberto.tmp' ;

       if FileExists( ArqFlagAberto ) then
          FHandle := FileOpen( ArqFlagAberto, fmOpenReadWrite + fmShareExclusive )
       else
          FHandle := FileCreate( ArqFlagAberto, fmOpenReadWrite + fmShareExclusive );
       if FHandle < 0 then
          raise Exception.Create('Erro abrindo');
       N := FileSeek( FHandle, 0, 0 )  ;
       if N < 0 then
          raise Exception.Create('Erro seek');
       N := FileWrite(Fhandle, Buffer^, 1) ;
       if N < 0 then
          raise Exception.Create('Erro ao escrever');

     except
         if Application.MessageBox('O programa ACBrMonitor já está em execução'+
                                   'Deseja realmente abrir novamente o ACBrMonitor ?',
                                   'ATENÇÃO !!',[smbYes,smbNo],smsWarning) <> smbYes then
            raise
         else
            SysUtils.DeleteFile(ArqFlagAberto);
     end;
  {$ENDIF}
  Application.CreateForm(TFrmACBrMonitor, FrmACBrMonitor);
  Application.Run;
  {$IFNDEF MSWINDOWS}
  finally
    FileClose( FHandle );
    if FHandle > 0 then
       SysUtils.DeleteFile(ArqFlagAberto);
  end ;
  {$ENDIF}
end.

