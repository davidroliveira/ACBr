{******************************************************************************}
{ Projeto: ACBr Monitor                                                        }
{  Executavel multiplataforma que faz uso do conjunto de componentes ACBr para }
{ criar uma interface de comunicação com equipamentos de automacao comercial.  }
{                                                                              }
{ Direitos Autorais Reservados (c) 2006 Daniel Simoes de Almeida               }
{                                                                              }
{  Você pode obter a última versão desse arquivo na página do Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{$DEFINE VisualCLX}
{$I ACBr.inc}

unit DoECFUnit ;

interface
Uses Classes, TypInfo, SysUtils, ACBrMonitor1 ;

Procedure DoECF( Cmd : TACBrCmd ) ;
Function PegaAliquotas : String ;
Function PegaFormasPagamento : String ;
Function PegaComprovantesNaoFiscais : String ;
Function PegaUnidadesMedida : String ;
Procedure StringToMemo( AString : String; var Memo : TStringList );

implementation
uses ACBrECF, ACBrUtil, ACBrECFClass, StrUtils;

Procedure DoECF( Cmd : TACBrCmd ) ;
Var wDescricao : String ;
    Linhas     : TStringList ;
    Linha      : String ;
    FPG        : TACBrECFFormaPagamento ;
    ICMS       : TACBrECFAliquota ;
    CNF        : TACBrECFComprovanteNaoFiscal ;
begin
  with FrmACBrMonitor.ACBrECF1 do
  begin
     try
        if Cmd.Metodo = 'ativar' then  { Ativa o ecf }
         begin
           Ativar ;
           FrmACBrMonitor.AvaliaEstadoTsECF ;
         end

        else if Cmd.Metodo = 'desativar' then
         begin
           Desativar ;
           FrmACBrMonitor.AvaliaEstadoTsECF ;
         end

        else if Cmd.Metodo = 'ativo' then
           Cmd.Resposta := BoolToStr(Ativo, true)

        else if Cmd.Metodo = 'colunas' then
           Cmd.Resposta := IntToStr( Colunas )

        else if Cmd.Metodo = 'comandoenviado' then
           Cmd.Resposta := ComandoEnviado

        else if Cmd.Metodo = 'respostacomando' then
           Cmd.Resposta := RespostaComando

        else if Cmd.Metodo = 'modelostr' then
           Cmd.Resposta := ModeloStr

        else if Cmd.Metodo = 'modelo' then
           Cmd.Resposta := GetEnumName(TypeInfo(TACBrECFModelo),Integer(Modelo))

        else if Cmd.Metodo = 'porta' then
           Cmd.Resposta := Porta

        else if Cmd.Metodo = 'datahora' then
           Cmd.Resposta := FormatDateTime('dd/mm/yy hh:nn:ss', DataHora )

        else if Cmd.Metodo = 'numcupom' then
           Cmd.Resposta := NumCupom

        else if Cmd.Metodo = 'numloja' then
           Cmd.Resposta := NumLoja

        else if Cmd.Metodo = 'numcro' then
           Cmd.Resposta := NumCRO

        else if Cmd.Metodo = 'numecf' then
           Cmd.Resposta := NumECF

        else if Cmd.Metodo = 'numserie' then
           Cmd.Resposta := NumSerie

        else if Cmd.Metodo = 'numversao' then
           Cmd.Resposta := NumVersao

        else if Cmd.Metodo = 'aliquotas' then
           Cmd.Resposta := PegaAliquotas

        else if Cmd.Metodo = 'carregaaliquotas' then
         begin
           CarregaAliquotas ;
           Cmd.Resposta := PegaAliquotas ;
         end

        else if Cmd.Metodo = 'programaaliquota' then
            ProgramaAliquota( StringToFloat( Cmd.Params(0) ), {% Aliquota }
                              padL(Cmd.Params(1),1,'T')[1],  { Tipo: char(T, S)}
                              Cmd.Params(2) )                   { Posicao = '' }

        else if Cmd.Metodo = 'achaicmsaliquota' then
         begin
           ICMS := AchaICMSAliquota( StringToFloat( Cmd.Params(0) ),{% Aliquota}
                                     padL(Cmd.Params(1),1)[1]) ;  { Tipo = ' ' }
           if ICMS <> nil then
              Cmd.Resposta := padL(ICMS.Indice,4) +
                              ICMS.Tipo +
                              FormatFloat('##0.00', ICMS.Aliquota )
           else
              raise Exception.Create('Aliquota: '+
                                     Trim(cmd.Params(0)+' '+cmd.Params(1))+
                                     ' não encontrada');
         end

        else if Cmd.Metodo = 'formaspagamento' then
           Cmd.Resposta := PegaFormasPagamento

        else if Cmd.Metodo = 'carregaformaspagamento' then
         begin
           CarregaFormasPagamento ;
           Cmd.Resposta := PegaFormasPagamento
         end

        else if Cmd.Metodo = 'programaformapagamento' then
         begin
            wDescricao := Cmd.Params(0) ;
            ProgramaFormaPagamento( wDescricao ,              { Descricao }
                   StrToBool( PadL(Cmd.Params(1),1,'1')[1] ), {Permitevinculado}
                   Cmd.Params(2) ) ;                          { Posicao = '' }
         end

        else if Cmd.Metodo = 'achafpgdescricao' then
         begin
           FPG := AchaFPGDescricao(cmd.Params(0)) ;
           if FPG <> nil then
              Cmd.Resposta := padL( FPG.Indice,4)+
                              IfThen(FPG.PermiteVinculado,'V',' ')+
                              padL( FPG.Descricao, 30)
           else
              raise Exception.Create('Forma de Pagamento: '+Trim(cmd.Params(0))+
                                     ' não encontrada');
         end

        else if Cmd.Metodo = 'comprovantesnaofiscais' then
           Cmd.Resposta := PegaComprovantesNaoFiscais

        else if Cmd.Metodo = 'carregacomprovantesnaofiscais' then
         begin
           CarregaComprovantesNaoFiscais ;
           Cmd.Resposta := PegaComprovantesNaoFiscais
         end

        else if Cmd.Metodo = 'programacomprovantenaofiscal' then
         begin
            wDescricao := Cmd.Params(0) ;
            ProgramaComprovanteNaoFiscal( wDescricao,           { Descricao }
                                          Cmd.Params(1),        { Tipo = '' }
                                          Cmd.Params(2) );      { Posicao = '' }
         end

        else if Cmd.Metodo = 'achacnfdescricao' then
         begin
           CNF := AchaCNFDescricao( cmd.Params(0) ) ;
           if CNF <> nil then
              Cmd.Resposta := padL( CNF.Indice,4) +
                              IfThen(CNF.PermiteVinculado,'V',' ')+
                              padL( CNF.Descricao,30) +
                              padL( CNF.FormaPagamento,4) 
           else
              raise Exception.Create('Comprovante Não Fiscal: '+Trim(cmd.Params(0))+
                                     ' não encontrado');
         end

        else if Cmd.Metodo = 'unidadesmedida' then
           Cmd.Resposta := PegaUnidadesMedida

        else if Cmd.Metodo = 'carregaunidadesmedida' then
         begin
           CarregaUnidadesMedida ;
           Cmd.Resposta := PegaUnidadesMedida ;
         end 

        else if Cmd.Metodo = 'programaunidademedida' then
         begin
            wDescricao := Cmd.Params(0) ;
            ProgramaUnidadeMedida( wDescricao ) ;
         end

        else if Cmd.Metodo = 'testapodeabrircupom' then
           TestaPodeAbrirCupom

        else if Cmd.Metodo = 'abrecupom' then
           AbreCupom( Cmd.Params(0) )

        else if Cmd.Metodo = 'vendeitem' then
           VendeItem( Cmd.Params(0), Cmd.Params(1),           { Cod, Descricao }
                      Trim(Cmd.Params(2)),                          { Aliquota }
                      StringToFloat( Cmd.Params(3)),                     { Qtd }
                      StringToFloat( Cmd.Params(4)),                  { P.Unit }
                      StringToFloatDef( Cmd.Params(5), 0),          { Descondo }
                      Cmd.Params(6) )                                     { Un }

        else if Cmd.Metodo = 'subtotalizacupom' then
           SubtotalizaCupom( StringToFloatDef( Cmd.Params(0), 0),  {Acresc/Desc}
                             Cmd.Params(1) )                  { Msg.Rodape = ''}

        else if Cmd.Metodo = 'efetuapagamento' then
           EfetuaPagamento( Cmd.Params(0),                 { CodFormaPagamento }
                            StringToFloat( Cmd.Params(1)),             { Valor }
                            Cmd.Params(2),                        { Observacao }
                            StrToBoolDef(Cmd.Params(3),false) ){ Imp.Vinculado }

        else if Cmd.Metodo = 'fechacupom' then
           FechaCupom( Cmd.Params(0) )

        else if Cmd.Metodo = 'cancelacupom' then
           CancelaCupom

        else if Cmd.Metodo = 'cancelaitemvendido' then
           CancelaItemVendido( StrToInt(Cmd.Params(0) ) )            { NumItem }

        else if Cmd.Metodo = 'subtotal' then
           Cmd.Resposta := FloatToStr( Subtotal )

        else if Cmd.Metodo = 'totalpago' then
           Cmd.Resposta := FloatToStr( TotalPago )

        else if Cmd.Metodo = 'leiturax' then
           LeituraX

        else if Cmd.Metodo = 'reducaoz' then
           ReducaoZ( StringToDateTimeDef(Cmd.Params(0),0) )

        else if Cmd.Metodo = 'poucopapel' then
           Cmd.Resposta := BoolToStr( PoucoPapel, true )

        else if Cmd.Metodo = 'horarioverao' then
           Cmd.Resposta := BoolToStr( HorarioVerao, true )

        else if Cmd.Metodo = 'arredonda' then
           Cmd.Resposta := BoolToStr( Arredonda, true )

        else if Cmd.Metodo = 'estado' then
           Cmd.Resposta := GetEnumName(TypeInfo(TACBrECFEstado),Integer(Estado))

        else if Cmd.Metodo = 'abregaveta' then
           AbreGaveta

        else if Cmd.Metodo = 'gavetaaberta' then
           Cmd.Resposta := BoolToStr( GavetaAberta, true )

        else if Cmd.Metodo = 'imprimecheque' then
           ImprimeCheque( Cmd.Params(0),                               { Banco }
                          StringToFloat(Cmd.Params(1)),                   { Valor }
                          Cmd.Params(2),                          { Favorecido }
                          Cmd.Params(3),                              { Cidade }
                          StringToDateTime(Cmd.Params(4)),                {Data}
                          Cmd.Params(5) )                         { Observação }

        else if Cmd.Metodo = 'cancelaimpressaocheque' then
           CancelaImpressaoCheque

        else if Cmd.Metodo = 'chequepronto' then
           Cmd.Resposta := BoolToStr( ChequePronto, true )

        else if Cmd.Metodo = 'mudahorarioverao' then
           if Cmd.Params(0) <> '' then
              MudaHorarioVerao( StrToBool(Cmd.Params(0)) )
           else
              MudaHorarioVerao( not HorarioVerao )

        else if Cmd.Metodo = 'mudaarredondamento' then
           MudaArredondamento( StrToBoolDef(Cmd.Params(0),True) )

        else if Cmd.Metodo = 'preparatef' then
           PreparaTEF

        else if Cmd.Metodo = 'corrigeestadoerro' then
           CorrigeEstadoErro

        else if Cmd.Metodo = 'abrerelatoriogerencial' then
           AbreRelatorioGerencial

        else if Cmd.Metodo = 'relatoriogerencial' then
         begin
           Linhas := TStringList.Create ;
           try
              StringToMemo( Cmd.Params(0), Linhas ); {Linha separadas por | (pipe)}
              RelatorioGerencial( Linhas,
                                  StrToIntDef(Cmd.Params(1),1) );       { Vias }
           finally
              Linhas.Free ;
           end ;
         end

        else if Cmd.Metodo = 'linharelatoriogerencial' then
         begin
           Linha := StringReplace( Cmd.Params(0),'|',#10,[rfReplaceAll]) ;
           LinhaRelatorioGerencial( Linha )                    { Linha }
         end 

        else if Cmd.Metodo = 'abrecupomvinculado' then
           if StringToFloatDef(Cmd.Params(3),-99) <> -99 then { Param 4 é valor ? }
              AbreCupomVinculado( Cmd.Params(0),                         { COO }
                                  Cmd.Params(1),               { CodFormaPagto }
                                  Cmd.Params(2),     { CodComprovanteNaoFiscal }
                                  StringToFloat( Cmd.Params(3) ) )     { Valor }
           else
              AbreCupomVinculado( Cmd.Params(0),                         { COO }
                                  Cmd.Params(1),               { CodFormaPagto }
                                  StringToFloat( Cmd.Params(2) ) )     { Valor }

        else if Cmd.Metodo = 'linhacupomvinculado' then
         begin
           Linha := StringReplace( Cmd.Params(0),'|',#10,[rfReplaceAll]) ;
           LinhaCupomVinculado( Linha )                    { Linha }
         end 

        else if Cmd.Metodo = 'cupomvinculado' then
         begin
           Linhas := TStringList.Create ;
           try
              StringToMemo( Cmd.Params(0), Linhas ); {Linha separadas por | (pipe)}

              if StringToFloatDef(Cmd.Params(3),-99) <> -99 then { Param 4 é valor ? }
                 CupomVinculado( Cmd.Params(0),                          { COO }
                                 Cmd.Params(1),                { CodFormaPagto }
                                 Cmd.Params(2),      { CodComprovanteNaoFiscal }
                                 StringToFloat( Cmd.Params(3) ),       { Valor }
                                 Linhas )
              else
                 CupomVinculado( Cmd.Params(0),                          { COO }
                                 Cmd.Params(1),                { CodFormaPagto }
                                 StringToFloat( Cmd.Params(2) ),       { Valor }
                                 Linhas )
           finally
              Linhas.Free ;
           end ;
         end

        else if Cmd.Metodo = 'fecharelatorio' then
           FechaRelatorio

        else if Cmd.Metodo = 'leituramemoriafiscal' then
           if pos('/',Cmd.Params(0)) > 0 then
              LeituraMemoriaFiscal( StringToDateTime(Cmd.Params(0)),{Dt.Inicial}
                                    StringToDateTime(Cmd.Params(1)) ) {Dt.Final}
           else
              LeituraMemoriaFiscal( StrToInt(Cmd.Params(0)),  { ReducaoInicial }
                                    StrToInt(Cmd.Params(1)) )   { ReducaoFinal }

        else if Cmd.Metodo = 'leituramemoriafiscalserial' then
         begin
           Linhas := TStringList.Create ;
           try
              if pos('/',Cmd.Params(0)) > 0 then
                 LeituraMemoriaFiscalSerial(
                     StringToDateTime(Cmd.Params(0)),             { Dt.Inicial }
                     StringToDateTime(Cmd.Params(1)),               { Dt.Final }
                     Linhas )                                        { Retorno }
              else
                 LeituraMemoriaFiscalSerial(
                     StrToInt(Cmd.Params(0)),                 { ReducaoInicial }
                     StrToInt(Cmd.Params(1)),                   { ReducaoFinal }
                     Linhas ) ;                                      { Retorno }

              Cmd.Resposta := Linhas.Text ;
           finally
              Linhas.Free ;
           end ;
         end

        else if Cmd.Metodo = 'enviacomando' then
           if Cmd.Params(1) <> '' then
              EnviaComando(Cmd.Params(0),StrToInt(Cmd.Params(1)))
           else
              EnviaComando(Cmd.Params(0))

        ELSE
           raise Exception.Create('Comando inválido ('+Cmd.Comando+')') ;

     finally
        if Length( Cmd.Resposta ) = 0 then
           Cmd.Resposta := RespostaComando ;
     end ;
  end ;
end ;

{------------------------------------------------------------------------------}
Function PegaAliquotas : String ;
Var I : Integer ;
begin
  Result := '' ;
  with FrmACBrMonitor.ACBrECF1 do
  begin
     if Aliquotas.Count < 1 then
        CarregaAliquotas ;
        
     for I := 0 to Aliquotas.Count -1 do
        Result := Result + padL(Aliquotas[I].Indice,4) +
                           Aliquotas[I].Tipo +
                           FormatFloat('##0.00', Aliquotas[I].Aliquota ) + '|' ;

     if Result <> '' then
        Result := copy(Result,1,Length(Result)-1) ;
  end ;
end ;

{------------------------------------------------------------------------------}
Function PegaFormasPagamento : String ;
Var I : Integer ;
    Vinc : Char ;
begin
  Result := '' ;
  with FrmACBrMonitor.ACBrECF1 do
  begin
     if FormasPagamento.Count < 1 then
        CarregaFormasPagamento ;

     for I := 0 to FormasPagamento.Count -1 do
     begin
        Vinc := ' ' ;
        if FormasPagamento[I].PermiteVinculado then
           Vinc := 'V' ;

        Result := Result + padL( FormasPagamento[I].Indice,4) + Vinc +
                           padL( FormasPagamento[I].Descricao, 30) + '|' ;
     end ;

     if Result <> '' then
        Result := copy(Result,1,Length(Result)-1) ;
  end ;
end ;

{------------------------------------------------------------------------------}
Function PegaComprovantesNaoFiscais : String ;
Var I : Integer ;
    Vinc : Char ;
begin
  Result := '' ;
  with FrmACBrMonitor.ACBrECF1 do
  begin
     if ComprovantesNaoFiscais.Count < 1 then
        CarregaComprovantesNaoFiscais ;

     for I := 0 to ComprovantesNaoFiscais.Count -1 do
     begin
        Vinc := ' ' ;
        if ComprovantesNaoFiscais[I].PermiteVinculado then
           Vinc := 'V' ;

        Result := Result + padL( ComprovantesNaoFiscais[I].Indice,4) + Vinc +
                           padL( ComprovantesNaoFiscais[I].Descricao,30) +
                           padL( ComprovantesNaoFiscais[I].FormaPagamento,4) + '|' ;
     end ;

     if Result <> '' then
        Result := copy(Result,1,Length(Result)-1) ;
  end ;
end ;

{------------------------------------------------------------------------------}
Function PegaUnidadesMedida : String ;
Var I : Integer ;
begin
  Result := '' ;
  with FrmACBrMonitor.ACBrECF1 do
  begin
     if UnidadesMedida.Count < 1 then
        CarregaUnidadesMedida ;

     for I := 0 to UnidadesMedida.Count -1 do
        Result := Result + padL( UnidadesMedida[I].Indice,4) +
                           padL( UnidadesMedida[I].Descricao,4) + '|' ;

     if Result <> '' then
        Result := copy(Result,1,Length(Result)-1) ;
  end ;
end ;

{------------------------------------------------------------------------------}
Procedure StringToMemo( AString : String; var Memo : TStringList );
begin
  AString   := StringReplace(AString,#13+#10,'|',[rfReplaceAll]) ;
  AString   := StringReplace(AString,#10,'|',[rfReplaceAll]) ;
  Memo.Text := StringReplace(AString,'|',sLineBreak,[rfReplaceAll]) ;
end ;

(*
  published
     property TimeOut : Integer read GetTimeOut write SetTimeOut
                 default cTimeout ;
     property DescricaoGrande : Boolean read GetDescricaoGrande
                 write SetDescricaoGrande default false ;

     property Operador   : String read GetOperador   write SetOperador ;
     property MsgAguarde : String read GetMsgAguarde write SetMsgAguarde ;
     property ExibeMensagem : Boolean read GetExibeMensagem write SetExibeMensagem
                 default true ;
     property TempoInicioMsg : Integer read  GetTempoInicioMsg
                 write SetTempoInicioMsg default cTempoInicioMsg ;
     property ArredondaPorQtd : Boolean read GetArredondaPorQtd
                 write SetArredondaPorQtd default false ;
     property BloqueiaMouseTeclado : Boolean read  GetBloqueiaMouseTeclado
                 write SetBloqueiaMouseTeclado default true ;
     property MsgPoucoPapel : Integer read  GetMsgPoucoPapel
                 write SetMsgPoucoPapel  default cMsgPoucoPapel ;
     property MsgRelatorio : String read  GetMsgRelatorio
                 write SetMsgRelatorio ;
     property PausaRelatorio : Integer read  GetPausaRelatorio
                 write SetPausaRelatorio default cPausaRelatorio ;
     property MsgPausaRelatorio : String read  GetMsgPausaRelatorio
                 write SetMsgPausaRelatorio ;
     property LinhasEntreCupons : Integer read  GetLinhasEntreCupons
                 write SetLinhasEntreCupons default cLinhasEntreCupons ;
*)
end.


