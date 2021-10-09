program ACBrMonitor;


uses
  QForms,
  SysUtils,
  {$IFDEF MSWINDOWS}
  Windows,
  {$ENDIF}
  ACBrMonitor1 in 'ACBrMonitor1.pas' {FrmACBrMonitor},
  DoECFUnit in 'DoECFUnit.pas';

var ArqFlagAberto : String ;
    FHandle,N     : Integer ;
    Buffer        : Pointer ;
    B             : Byte ;

{$R *.res}

begin
  {$IFDEF MSWINDOWS}
   FHandle := CreateMutex(nil, True, 'ACBrMonitor');
   if GetLastError = ERROR_ALREADY_EXISTS then
   begin
      Application.MessageBox('O programa ACBrMonitor já está em execução',
                             'ATENÇÃO !!',[smbOK],smsWarning) ;
      Application.Terminate ;
   end;
  {$ENDIF}
  Application.Initialize;
  Application.Title := 'ACBrMonitor';

  try
     try
       { Tenta criar arquivo em modo Exclusivo, se NAO conseguir já está rodando }
       B        := 65 ;
       Buffer   := @B ;
       ArqFlagAberto := ExtractFilePath(Application.ExeName) + 'ACBRMONITOR_ABERTO.TXT' ;

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

       Application.CreateForm(TFrmACBrMonitor, FrmACBrMonitor);
  Application.Run;
     except
         Application.MessageBox('O programa ACBrMonitor já está em execução',
                                'ATENÇÃO !!',[smbOK],smsWarning) ;
     end;
  finally

    FileClose( FHandle );

    if FHandle > 0 then
       SysUtils.DeleteFile(ArqFlagAberto);
  end ;
end.

