using ACBrFramework.AAC;
using ACBrFramework.EAD;
using ACBrFramework.RFD;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;

namespace ACBrFramework.ECF
{
	#region COM Interop

	/* NOTAS para COM INTEROP
     * Há um modo de compilação com a diretiva COM_INTEROP que inseri atributos e código específico
     * para a DLL ser exportada para COM (ActiveX)
     *
     * O modelo COM possui alguma limitações/diferenças em relação ao modelo .NET
     * Inserir os #if COM_INTEROP para prover implementações distintas nas modificações necessárias para COM:
     *
     * - Inserir atributos ComVisible(true), Guid("xxx") e ClassInterface(ClassInterfaceType.AutoDual) em todas as classes envolvidas
     *
     * - Propriedades/métodos que usam "Decimal" devem incluir o atributo MarshalAs(UnmanagedType.Currency)
     *   usar [return: ...] para retornos de métodos e propriedades ou [param: ...] para o set de propriedades
     *
     * - Métodos que recebem array como parâmetros devem fazer como "ref".
     *   Propriedades só podem retornar arrays, nunca receber.
     *
     * - Overload não é permitido. Métodos com mesmos nomes devem ser renomeados.
     *   É possível usar parâmetros default, simplificando a necessidade de Overload
     *
     * - Generic não deve ser usado. Todas as classes Generic devem ser re-escritas como classes específicas
     *
     * - Eventos precisam de uma Interface com as declarações dos métodos (eventos) com o atributo [InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
     *   A classe que declara os eventos precisa do atributo [ComSourceInterfaces(typeof(INomeDaInterface))]
     *   Nenhum delegate deverá ser Generic, precisam ser re-escritos.
     *
     *   OBS: Por padrão o modelo .Net recebe os eventos com a assinatura void(object sender, EventArgs e)
     *   O modelo COM não precisa desses parâmetros. Assim o delegate EventHandler foi redefinido para uma assinatura void()
     *   Outros EventArgs devem seguir a assitarua COM void(MyEventArg e) ao invés da assinatura .NET void(object sender, MyEventArgs e)
     * */

#if COM_INTEROP

	#region IDispatch Interface

	#region Documentation

    /// <summary>
    /// Interface contendo os eventos publicados pelo componente COM
    /// </summary>

	#endregion Documentation

    [ComVisible(true)]
    [Guid("EB11262D-1650-41D0-8235-4774384C6631")]
    [InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
    public interface IACBrECFEvents
    {
        [DispId(1)]
        void OnMsgPoucoPapel();

        [DispId(2)]
        void OnAguardandoRespostaChange();

        [DispId(3)]
        void OnAntesAbreCupom(AbreCupomEventArgs e);

        [DispId(4)]
        void OnAntesAbreCupomVinculado();

        [DispId(5)]
        void OnAntesAbreNaoFiscal(AbreCupomEventArgs e);

        [DispId(6)]
        void OnAntesAbreRelatorioGerencial(RelatorioGerencialEventArgs e);

        [DispId(7)]
        void OnAntesCancelaCupom();

        [DispId(8)]
        void OnAntesCancelaItemNaoFiscal(CancelaItemEventArgs e);

        [DispId(9)]
        void OnAntesCancelaItemVendido(CancelaItemEventArgs e);

        [DispId(10)]
        void OnAntesCancelaNaoFiscal();

        [DispId(11)]
        void OnAntesEfetuaPagamento(EfetuaPagamentoEventArgs e);

        [DispId(12)]
        void OnAntesEfetuaPagamentoNaoFiscal(EfetuaPagamentoEventArgs e);

        [DispId(13)]
        void OnAntesFechaCupom(FechaCupomEventArgs e);

        [DispId(14)]
        void OnAntesFechaNaoFiscal(FechaCupomEventArgs e);

        [DispId(15)]
        void OnAntesFechaRelatorio();

        [DispId(16)]
        void OnAntesLeituraX();

        [DispId(17)]
        void OnAntesReducaoZ();

        [DispId(18)]
        void OnAntesSangria(SangriaSuprimentoEventArgs e);

        [DispId(19)]
        void OnAntesSubtotalizaCupom(SubtotalizaCupomEventArgs e);

        [DispId(20)]
        void OnAntesSubtotalizaNaoFiscal(SubtotalizaCupomEventArgs e);

        [DispId(21)]
        void OnAntesSuprimento(SangriaSuprimentoEventArgs e);

        [DispId(22)]
        void OnAntesVendeItem(VendeItemEventArgs e);

        [DispId(23)]
        void OnBobinaAdicionaLinhas(BobinaAdicionaLinhasEventArgs e);

        [DispId(24)]
        void OnChangeEstado(ChangeEstadoEventArgs e);

        //[DispId(25)]
        //void OnChequeEstado(ChequeEstadoEventArgs e);

        [DispId(26)]
        void OnDepoisAbreCupom(AbreCupomEventArgs e);

        [DispId(27)]
        void OnDepoisAbreCupomVinculado();

        [DispId(28)]
        void OnDepoisAbreNaoFiscal(AbreCupomEventArgs e);

        [DispId(29)]
        void OnDepoisAbreRelatorioGerencial(RelatorioGerencialEventArgs e);

        [DispId(30)]
        void OnDepoisCancelaCupom();

        [DispId(31)]
        void OnDepoisCancelaItemNaoFiscal(CancelaItemEventArgs e);

        [DispId(32)]
        void OnDepoisCancelaItemVendido(CancelaItemEventArgs e);

        [DispId(33)]
        void OnDepoisCancelaNaoFiscal();

        [DispId(34)]
        void OnDepoisEfetuaPagamento(EfetuaPagamentoEventArgs e);

        [DispId(35)]
        void OnDepoisEfetuaPagamentoNaoFiscal(EfetuaPagamentoEventArgs e);

        [DispId(36)]
        void OnDepoisFechaCupom(FechaCupomEventArgs e);

        [DispId(37)]
        void OnDepoisFechaNaoFiscal(FechaCupomEventArgs e);

        [DispId(38)]
        void OnDepoisFechaRelatorio();

        [DispId(39)]
        void OnDepoisLeituraX();

        [DispId(40)]
        void OnDepoisReducaoZ();

        [DispId(41)]
        void OnDepoisSangria(SangriaSuprimentoEventArgs e);

        [DispId(42)]
        void OnDepoisSubtotalizaCupom(SubtotalizaCupomEventArgs e);

        [DispId(43)]
        void OnDepoisSubtotalizaNaoFiscal(SubtotalizaCupomEventArgs e);

        [DispId(44)]
        void OnDepoisSuprimento(SangriaSuprimentoEventArgs e);

        [DispId(45)]
        void OnDepoisVendeItem(VendeItemEventArgs e);

        [DispId(46)]
        void OnErrorAbreCupom(ErrorEventArgs e);

        [DispId(47)]
        void OnErrorAbreCupomVinculado(ErrorEventArgs e);

        [DispId(48)]
        void OnErrorAbreNaoFiscal(ErrorEventArgs e);

        [DispId(49)]
        void OnErrorAbreRelatorioGerencial(ErrorRelatorioEventArgs e);

        [DispId(50)]
        void OnErrorCancelaCupom(ErrorEventArgs e);

        [DispId(51)]
        void OnErrorCancelaItemNaoFiscal(ErrorEventArgs e);

        [DispId(52)]
        void OnErrorCancelaItemVendido(ErrorEventArgs e);

        [DispId(53)]
        void OnErrorCancelaNaoFiscal(ErrorEventArgs e);

        [DispId(54)]
        void OnErrorEfetuaPagamento(ErrorEventArgs e);

        [DispId(55)]
        void OnErrorEfetuaPagamentoNaoFiscal(ErrorEventArgs e);

        [DispId(56)]
        void OnErrorFechaCupom(ErrorEventArgs e);

        [DispId(57)]
        void OnErrorFechaNaoFiscal(ErrorEventArgs e);

        [DispId(58)]
        void OnErrorFechaRelatorio(ErrorEventArgs e);

        [DispId(59)]
        void OnErrorLeituraX(ErrorEventArgs e);

        [DispId(60)]
        void OnErrorReducaoZ(ErrorEventArgs e);

        [DispId(61)]
        void OnErrorSangria(ErrorEventArgs e);

        [DispId(62)]
        void OnErrorSemPapel();

        [DispId(63)]
        void OnErrorSubtotalizaCupom(ErrorEventArgs e);

        [DispId(64)]
        void OnErrorSubtotalizaNaoFiscal(ErrorEventArgs e);

        [DispId(65)]
        void OnErrorSuprimento(ErrorEventArgs e);

        [DispId(66)]
        void OnErrorVendeItem(ErrorEventArgs e);

        [DispId(67)]
        void OnMsgAguarde(MsgEventArgs e);

        [DispId(68)]
        void OnMsgRetentar(MsgRetentarEventArgs e);

        //[DispId(69)]
        //void OnPAFCalcEAD(PAFCalcEADEventArgs e);

        //[DispId(70)]
        //void OnPAFGetKeyRSA(ChaveEventArgs e);
    }

	#endregion IDispatch Interface

	#region Delegates

	#region Comments

    ///os componentes COM não suportam Generics
    ///Estas são implementações específicas de delegates que no .Net são representados como EventHandler<T>

	#endregion Comments

    public delegate void AbreCupomEventHandler(AbreCupomEventArgs e);

    public delegate void RelatorioGerencialEventHandler(RelatorioGerencialEventArgs e);

    public delegate void CancelaItemEventHandler(CancelaItemEventArgs e);

    public delegate void BobinaAdicionaLinhasEventHandler(BobinaAdicionaLinhasEventArgs e);

    public delegate void EfetuaPagamentoEventHandler(EfetuaPagamentoEventArgs e);

    public delegate void FechaCupomEventHandler(FechaCupomEventArgs e);

    public delegate void SangriaSuprimentoEventHandler(SangriaSuprimentoEventArgs e);

    public delegate void SubtotalizaCupomEventHandler(SubtotalizaCupomEventArgs e);

    public delegate void VendeItemEventHandler(VendeItemEventArgs e);

    public delegate void ChangeEstadoEventHandler(ChangeEstadoEventArgs e);

    public delegate void ChequeEstadoEventHandler(ChequeEstadoEventArgs e);

    public delegate void OnErrorEventHandler(ErrorEventArgs e);

    public delegate void OnErrorRelatorioEventHandler(ErrorRelatorioEventArgs e);

    public delegate void OnMsgEventHandler(MsgEventArgs e);

    public delegate void OnMsgRetentarEventHandler(MsgRetentarEventArgs e);

    public delegate void OnPAFCalcEADEventHandler(PAFCalcEADEventArgs e);

    public delegate void ChaveEventHandler(ChaveEventArgs e);

	#endregion Delegates

#endif

	#endregion COM Interop

	#region COM Interop Attributes

#if COM_INTEROP

    [ComVisible(true)]
    [Guid("7F5440D4-8D62-441B-9251-E911437D5F8F")]
    [ComSourceInterfaces(typeof(IACBrECFEvents))]
    [ClassInterface(ClassInterfaceType.AutoDual)]
#endif

	#endregion COM Interop Attributes

	[ToolboxBitmap(typeof(ToolboxIcons), @"ACBrFramework.Serial.ECF.ico.bmp")]
	[TypeConverter(typeof(ACBrExpandableObjectConverter))]
	public partial class ACBrECF : ACBrComponent, IACBrECF
	{
		#region Events

#if COM_INTEROP
        public event EventHandler OnMsgPoucoPapel
#else

		public event EventHandler<EventArgs> OnMsgPoucoPapel
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onMsgPoucoPapel.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onMsgPoucoPapel.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnAguardandoRespostaChange
#else

		public event EventHandler<EventArgs> OnAguardandoRespostaChange
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAguardandoRespostaChange.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAguardandoRespostaChange.Remove(value); }
		}

#if COM_INTEROP

        public event AbreCupomEventHandler OnAntesAbreCupom
#else

		public event EventHandler<AbreCupomEventArgs> OnAntesAbreCupom
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesAbreCupom.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesAbreCupom.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnAntesAbreCupomVinculado
#else

		public event EventHandler<EventArgs> OnAntesAbreCupomVinculado
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesAbreCupomVinculado.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesAbreCupomVinculado.Remove(value); }
		}

#if COM_INTEROP

        public event AbreCupomEventHandler OnAntesAbreNaoFiscal
#else

		public event EventHandler<AbreCupomEventArgs> OnAntesAbreNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesAbreNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesAbreNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event RelatorioGerencialEventHandler OnAntesAbreRelatorioGerencial
#else

		public event EventHandler<RelatorioGerencialEventArgs> OnAntesAbreRelatorioGerencial
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesAbreRelatorioGerencial.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesAbreRelatorioGerencial.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnAntesCancelaCupom
#else

		public event EventHandler<EventArgs> OnAntesCancelaCupom
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesCancelaCupom.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesCancelaCupom.Remove(value); }
		}

#if COM_INTEROP
        public event CancelaItemEventHandler OnAntesCancelaItemNaoFiscal
#else

		public event EventHandler<CancelaItemEventArgs> OnAntesCancelaItemNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesCancelaItemNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesCancelaItemNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event CancelaItemEventHandler OnAntesCancelaItemVendido
#else

		public event EventHandler<CancelaItemEventArgs> OnAntesCancelaItemVendido
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesCancelaItemVendido.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesCancelaItemVendido.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnAntesCancelaNaoFiscal
#else

		public event EventHandler<EventArgs> OnAntesCancelaNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesCancelaNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesCancelaNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event EfetuaPagamentoEventHandler OnAntesEfetuaPagamento
#else

		public event EventHandler<EfetuaPagamentoEventArgs> OnAntesEfetuaPagamento
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesEfetuaPagamento.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesEfetuaPagamento.Remove(value); }
		}

#if COM_INTEROP

        public event EfetuaPagamentoEventHandler OnAntesEfetuaPagamentoNaoFiscal
#else

		public event EventHandler<EfetuaPagamentoEventArgs> OnAntesEfetuaPagamentoNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesEfetuaPagamentoNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesEfetuaPagamentoNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event FechaCupomEventHandler OnAntesFechaCupom
#else

		public event EventHandler<FechaCupomEventArgs> OnAntesFechaCupom
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesFechaCupom.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesFechaCupom.Remove(value); }
		}

#if COM_INTEROP

        public event FechaCupomEventHandler OnAntesFechaNaoFiscal
#else

		public event EventHandler<FechaCupomEventArgs> OnAntesFechaNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesFechaNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesFechaNaoFiscal.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnAntesFechaRelatorio
#else

		public event EventHandler<EventArgs> OnAntesFechaRelatorio
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesFechaRelatorio.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesFechaRelatorio.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnAntesLeituraX
#else

		public event EventHandler<EventArgs> OnAntesLeituraX
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesLeituraX.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesLeituraX.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnAntesReducaoZ
#else

		public event EventHandler<EventArgs> OnAntesReducaoZ
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesReducaoZ.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesReducaoZ.Remove(value); }
		}

#if COM_INTEROP

        public event SangriaSuprimentoEventHandler OnAntesSangria
#else

		public event EventHandler<SangriaSuprimentoEventArgs> OnAntesSangria
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesSangria.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesSangria.Remove(value); }
		}

#if COM_INTEROP

        public event SubtotalizaCupomEventHandler OnAntesSubtotalizaCupom
#else

		public event EventHandler<SubtotalizaCupomEventArgs> OnAntesSubtotalizaCupom
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesSubtotalizaCupom.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesSubtotalizaCupom.Remove(value); }
		}

#if COM_INTEROP

        public event SubtotalizaCupomEventHandler OnAntesSubtotalizaNaoFiscal
#else

		public event EventHandler<SubtotalizaCupomEventArgs> OnAntesSubtotalizaNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesSubtotalizaNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesSubtotalizaNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event SangriaSuprimentoEventHandler OnAntesSuprimento
#else

		public event EventHandler<SangriaSuprimentoEventArgs> OnAntesSuprimento
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesSuprimento.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesSuprimento.Remove(value); }
		}

#if COM_INTEROP

        public event VendeItemEventHandler OnAntesVendeItem
#else

		public event EventHandler<VendeItemEventArgs> OnAntesVendeItem
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onAntesVendeItem.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onAntesVendeItem.Remove(value); }
		}

#if COM_INTEROP

        public event BobinaAdicionaLinhasEventHandler OnBobinaAdicionaLinhas
#else

		public event EventHandler<BobinaAdicionaLinhasEventArgs> OnBobinaAdicionaLinhas
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onBobinaAdicionaLinhas.Add(value); }
#if COM_INTEROP
            [ComVisible(false)]
#endif
			remove { onBobinaAdicionaLinhas.Remove(value); }
		}

#if COM_INTEROP

        public event ChangeEstadoEventHandler OnChangeEstado
#else

		public event EventHandler<ChangeEstadoEventArgs> OnChangeEstado
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onChangeEstado.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onChangeEstado.Remove(value); }
		}

#if COM_INTEROP

        public event ChequeEstadoEventHandler OnChequeEstado
#else

		public event EventHandler<ChequeEstadoEventArgs> OnChequeEstado
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onChequeEstado.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onChequeEstado.Remove(value); }
		}

#if COM_INTEROP

        public event AbreCupomEventHandler OnDepoisAbreCupom
#else

		public event EventHandler<AbreCupomEventArgs> OnDepoisAbreCupom
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisAbreCupom.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisAbreCupom.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnDepoisAbreCupomVinculado
#else

		public event EventHandler<EventArgs> OnDepoisAbreCupomVinculado
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisAbreCupomVinculado.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisAbreCupomVinculado.Remove(value); }
		}

#if COM_INTEROP

        public event AbreCupomEventHandler OnDepoisAbreNaoFiscal
#else

		public event EventHandler<AbreCupomEventArgs> OnDepoisAbreNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisAbreNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisAbreNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event RelatorioGerencialEventHandler OnDepoisAbreRelatorioGerencial
#else

		public event EventHandler<RelatorioGerencialEventArgs> OnDepoisAbreRelatorioGerencial
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisAbreRelatorioGerencial.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisAbreRelatorioGerencial.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnDepoisCancelaCupom
#else

		public event EventHandler<EventArgs> OnDepoisCancelaCupom
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisCancelaCupom.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisCancelaCupom.Remove(value); }
		}

#if COM_INTEROP

        public event CancelaItemEventHandler OnDepoisCancelaItemNaoFiscal
#else

		public event EventHandler<CancelaItemEventArgs> OnDepoisCancelaItemNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisCancelaItemNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisCancelaItemNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event CancelaItemEventHandler OnDepoisCancelaItemVendido
#else

		public event EventHandler<CancelaItemEventArgs> OnDepoisCancelaItemVendido
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisCancelaItemVendido.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisCancelaItemVendido.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnDepoisCancelaNaoFiscal
#else

		public event EventHandler<EventArgs> OnDepoisCancelaNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisCancelaNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisCancelaNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event EfetuaPagamentoEventHandler OnDepoisEfetuaPagamento
#else

		public event EventHandler<EfetuaPagamentoEventArgs> OnDepoisEfetuaPagamento
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisEfetuaPagamento.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisEfetuaPagamento.Remove(value); }
		}

#if COM_INTEROP

        public event EfetuaPagamentoEventHandler OnDepoisEfetuaPagamentoNaoFiscal
#else

		public event EventHandler<EfetuaPagamentoEventArgs> OnDepoisEfetuaPagamentoNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisEfetuaPagamentoNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisEfetuaPagamentoNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event FechaCupomEventHandler OnDepoisFechaCupom
#else

		public event EventHandler<FechaCupomEventArgs> OnDepoisFechaCupom
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisFechaCupom.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisFechaCupom.Remove(value); }
		}

#if COM_INTEROP

        public event FechaCupomEventHandler OnDepoisFechaNaoFiscal
#else

		public event EventHandler<FechaCupomEventArgs> OnDepoisFechaNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisFechaNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisFechaNaoFiscal.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnDepoisFechaRelatorio
#else

		public event EventHandler<EventArgs> OnDepoisFechaRelatorio
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisFechaRelatorio.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisFechaRelatorio.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnDepoisLeituraX
#else

		public event EventHandler<EventArgs> OnDepoisLeituraX
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisLeituraX.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisLeituraX.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnDepoisReducaoZ
#else

		public event EventHandler<EventArgs> OnDepoisReducaoZ
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisReducaoZ.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisReducaoZ.Remove(value); }
		}

#if COM_INTEROP

        public event SangriaSuprimentoEventHandler OnDepoisSangria
#else

		public event EventHandler<SangriaSuprimentoEventArgs> OnDepoisSangria
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisSangria.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisSangria.Remove(value); }
		}

#if COM_INTEROP

        public event SubtotalizaCupomEventHandler OnDepoisSubtotalizaCupom
#else

		public event EventHandler<SubtotalizaCupomEventArgs> OnDepoisSubtotalizaCupom
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisSubtotalizaCupom.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisSubtotalizaCupom.Remove(value); }
		}

#if COM_INTEROP

        public event SubtotalizaCupomEventHandler OnDepoisSubtotalizaNaoFiscal
#else

		public event EventHandler<SubtotalizaCupomEventArgs> OnDepoisSubtotalizaNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisSubtotalizaNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisSubtotalizaNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event SangriaSuprimentoEventHandler OnDepoisSuprimento
#else

		public event EventHandler<SangriaSuprimentoEventArgs> OnDepoisSuprimento
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisSuprimento.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisSuprimento.Remove(value); }
		}

#if COM_INTEROP

        public event VendeItemEventHandler OnDepoisVendeItem
#else

		public event EventHandler<VendeItemEventArgs> OnDepoisVendeItem
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onDepoisVendeItem.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onDepoisVendeItem.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorAbreCupom
#else

		public event EventHandler<ErrorEventArgs> OnErrorAbreCupom
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorAbreCupom.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorAbreCupom.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorAbreCupomVinculado
#else

		public event EventHandler<ErrorEventArgs> OnErrorAbreCupomVinculado
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorAbreCupomVinculado.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorAbreCupomVinculado.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorAbreNaoFiscal
#else

		public event EventHandler<ErrorEventArgs> OnErrorAbreNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorAbreNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorAbreNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorRelatorioEventHandler OnErrorAbreRelatorioGerencial
#else

		public event EventHandler<ErrorRelatorioEventArgs> OnErrorAbreRelatorioGerencial
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorAbreRelatorioGerencial.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorAbreRelatorioGerencial.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorCancelaCupom
#else

		public event EventHandler<ErrorEventArgs> OnErrorCancelaCupom
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorCancelaCupom.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorCancelaCupom.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorCancelaItemNaoFiscal
#else

		public event EventHandler<ErrorEventArgs> OnErrorCancelaItemNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorCancelaItemNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorCancelaItemNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorCancelaItemVendido
#else

		public event EventHandler<ErrorEventArgs> OnErrorCancelaItemVendido
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorCancelaItemVendido.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorCancelaItemVendido.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorCancelaNaoFiscal
#else

		public event EventHandler<ErrorEventArgs> OnErrorCancelaNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorCancelaNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorCancelaNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorEfetuaPagamento
#else

		public event EventHandler<ErrorEventArgs> OnErrorEfetuaPagamento
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorEfetuaPagamento.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorEfetuaPagamento.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorEfetuaPagamentoNaoFiscal
#else

		public event EventHandler<ErrorEventArgs> OnErrorEfetuaPagamentoNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorEfetuaPagamentoNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorEfetuaPagamentoNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorFechaCupom
#else

		public event EventHandler<ErrorEventArgs> OnErrorFechaCupom
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorFechaCupom.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorFechaCupom.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorFechaNaoFiscal
#else

		public event EventHandler<ErrorEventArgs> OnErrorFechaNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorFechaNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorFechaNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorFechaRelatorio
#else

		public event EventHandler<ErrorEventArgs> OnErrorFechaRelatorio
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorFechaRelatorio.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorFechaRelatorio.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorLeituraX
#else

		public event EventHandler<ErrorEventArgs> OnErrorLeituraX
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorLeituraX.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorLeituraX.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorReducaoZ
#else

		public event EventHandler<ErrorEventArgs> OnErrorReducaoZ
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorReducaoZ.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorReducaoZ.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorSangria
#else

		public event EventHandler<ErrorEventArgs> OnErrorSangria
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorSangria.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorSangria.Remove(value); }
		}

#if COM_INTEROP
        public event EventHandler OnErrorSemPapel
#else

		public event EventHandler<EventArgs> OnErrorSemPapel
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorSemPapel.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorSemPapel.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorSubtotalizaCupom
#else

		public event EventHandler<ErrorEventArgs> OnErrorSubtotalizaCupom
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorSubtotalizaCupom.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorSubtotalizaCupom.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorSubtotalizaNaoFiscal
#else

		public event EventHandler<ErrorEventArgs> OnErrorSubtotalizaNaoFiscal
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorSubtotalizaNaoFiscal.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorSubtotalizaNaoFiscal.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorSuprimento
#else

		public event EventHandler<ErrorEventArgs> OnErrorSuprimento
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorSuprimento.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorSuprimento.Remove(value); }
		}

#if COM_INTEROP

        public event OnErrorEventHandler OnErrorVendeItem
#else

		public event EventHandler<ErrorEventArgs> OnErrorVendeItem
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onErrorVendeItem.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onErrorVendeItem.Remove(value); }
		}

#if COM_INTEROP

        public event OnMsgEventHandler OnMsgAguarde
#else

		public event EventHandler<MsgEventArgs> OnMsgAguarde
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onMsgAguarde.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onMsgAguarde.Remove(value); }
		}

#if COM_INTEROP

        public event OnMsgRetentarEventHandler OnMsgRetentar
#else

		public event EventHandler<MsgRetentarEventArgs> OnMsgRetentar
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onMsgRetentar.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onMsgRetentar.Remove(value); }
		}

#if COM_INTEROP

        public event OnPAFCalcEADEventHandler OnPAFCalcEAD
#else

		public event EventHandler<PAFCalcEADEventArgs> OnPAFCalcEAD
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onPAFCalcEAD.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onPAFCalcEAD.Remove(value); }
		}

#if COM_INTEROP

        public event ChaveEventHandler OnPAFGetKeyRSA
#else

		public event EventHandler<ChaveEventArgs> OnPAFGetKeyRSA
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add { onPAFGetKeyRSA.Add(value); }

			#region COM_INTEROP

#if COM_INTEROP
            [ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove { onPAFGetKeyRSA.Remove(value); }
		}

		#endregion Events

		#region Fields

		private Aliquota[] aliquotas;
		private FormaPagamento[] formasPagamento;
		private ComprovanteNaoFiscal[] comprovantesNaoFiscais;
		private RelatorioGerencial[] relatoriosGerenciais;
		private ACBrAAC aac;
		private ACBrEAD ead;
		internal ACBrRFD rfd;

		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onMsgPoucoPapel;
		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onAguardandoRespostaChange;
		private readonly ACBrEventHandler<AbreCupomEventArgs, ACBrECFInterop.AbreCupomCallback> onAntesAbreCupom;
		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onAntesAbreCupomVinculado;
		private readonly ACBrEventHandler<AbreCupomEventArgs, ACBrECFInterop.AbreCupomCallback> onAntesAbreNaoFiscal;

		private readonly ACBrEventHandler<RelatorioGerencialEventArgs, ACBrECFInterop.RelatorioGerencialCallback>
			onAntesAbreRelatorioGerencial;

		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onAntesCancelaCupom;

		private readonly ACBrEventHandler<CancelaItemEventArgs, ACBrECFInterop.CancelaItemCallback>
			onAntesCancelaItemNaoFiscal;

		private readonly ACBrEventHandler<CancelaItemEventArgs, ACBrECFInterop.CancelaItemCallback>
			onAntesCancelaItemVendido;

		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onAntesCancelaNaoFiscal;

		private readonly ACBrEventHandler<EfetuaPagamentoEventArgs, ACBrECFInterop.EfetuaPagamentoCallback>
			onAntesEfetuaPagamento;

		private readonly ACBrEventHandler<EfetuaPagamentoEventArgs, ACBrECFInterop.EfetuaPagamentoCallback>
			onAntesEfetuaPagamentoNaoFiscal;

		private readonly ACBrEventHandler<FechaCupomEventArgs, ACBrECFInterop.FechaCupomCallback> onAntesFechaCupom;
		private readonly ACBrEventHandler<FechaCupomEventArgs, ACBrECFInterop.FechaCupomCallback> onAntesFechaNaoFiscal;
		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onAntesFechaRelatorio;
		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onAntesLeituraX;
		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onAntesReducaoZ;

		private readonly ACBrEventHandler<SangriaSuprimentoEventArgs, ACBrECFInterop.SangriaSuprimentoCallback>
			onAntesSangria;

		private readonly ACBrEventHandler<SubtotalizaCupomEventArgs, ACBrECFInterop.SubtotalizaCupomCallback>
			onAntesSubtotalizaCupom;

		private readonly ACBrEventHandler<SubtotalizaCupomEventArgs, ACBrECFInterop.SubtotalizaCupomCallback>
			onAntesSubtotalizaNaoFiscal;

		private readonly ACBrEventHandler<SangriaSuprimentoEventArgs, ACBrECFInterop.SangriaSuprimentoCallback>
			onAntesSuprimento;

		private readonly ACBrEventHandler<VendeItemEventArgs, ACBrECFInterop.VendeItemCallback> onAntesVendeItem;

		private readonly ACBrEventHandler<BobinaAdicionaLinhasEventArgs, ACBrECFInterop.BobinaAdicionaLinhasCallback>
			onBobinaAdicionaLinhas;

		private readonly ACBrEventHandler<ChangeEstadoEventArgs, ACBrECFInterop.ChangeEstadoCallback> onChangeEstado;
		private readonly ACBrEventHandler<ChequeEstadoEventArgs, ACBrECFInterop.ChequeEstadoCallback> onChequeEstado;
		private readonly ACBrEventHandler<AbreCupomEventArgs, ACBrECFInterop.AbreCupomCallback> onDepoisAbreCupom;
		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onDepoisAbreCupomVinculado;
		private readonly ACBrEventHandler<AbreCupomEventArgs, ACBrECFInterop.AbreCupomCallback> onDepoisAbreNaoFiscal;

		private readonly ACBrEventHandler<RelatorioGerencialEventArgs, ACBrECFInterop.RelatorioGerencialCallback>
			onDepoisAbreRelatorioGerencial;

		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onDepoisCancelaCupom;

		private readonly ACBrEventHandler<CancelaItemEventArgs, ACBrECFInterop.CancelaItemCallback>
			onDepoisCancelaItemNaoFiscal;

		private readonly ACBrEventHandler<CancelaItemEventArgs, ACBrECFInterop.CancelaItemCallback>
			onDepoisCancelaItemVendido;

		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onDepoisCancelaNaoFiscal;

		private readonly ACBrEventHandler<EfetuaPagamentoEventArgs, ACBrECFInterop.EfetuaPagamentoCallback>
			onDepoisEfetuaPagamento;

		private readonly ACBrEventHandler<EfetuaPagamentoEventArgs, ACBrECFInterop.EfetuaPagamentoCallback>
			onDepoisEfetuaPagamentoNaoFiscal;

		private readonly ACBrEventHandler<FechaCupomEventArgs, ACBrECFInterop.FechaCupomCallback> onDepoisFechaCupom;
		private readonly ACBrEventHandler<FechaCupomEventArgs, ACBrECFInterop.FechaCupomCallback> onDepoisFechaNaoFiscal;
		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onDepoisFechaRelatorio;
		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onDepoisLeituraX;
		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onDepoisReducaoZ;

		private readonly ACBrEventHandler<SangriaSuprimentoEventArgs, ACBrECFInterop.SangriaSuprimentoCallback>
			onDepoisSangria;

		private readonly ACBrEventHandler<SubtotalizaCupomEventArgs, ACBrECFInterop.SubtotalizaCupomCallback>
			onDepoisSubtotalizaCupom;

		private readonly ACBrEventHandler<SubtotalizaCupomEventArgs, ACBrECFInterop.SubtotalizaCupomCallback>
			onDepoisSubtotalizaNaoFiscal;

		private readonly ACBrEventHandler<SangriaSuprimentoEventArgs, ACBrECFInterop.SangriaSuprimentoCallback>
			onDepoisSuprimento;

		private readonly ACBrEventHandler<VendeItemEventArgs, ACBrECFInterop.VendeItemCallback> onDepoisVendeItem;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorAbreCupom;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorAbreCupomVinculado;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorAbreNaoFiscal;

		private readonly ACBrEventHandler<ErrorRelatorioEventArgs, ACBrECFInterop.ErrorRelatorioCallback>
			onErrorAbreRelatorioGerencial;

		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorCancelaCupom;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorCancelaItemNaoFiscal;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorCancelaItemVendido;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorCancelaNaoFiscal;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorEfetuaPagamento;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorEfetuaPagamentoNaoFiscal;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorFechaCupom;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorFechaNaoFiscal;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorFechaRelatorio;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorLeituraX;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorReducaoZ;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorSangria;
		private readonly ACBrEventHandler<ACBrECFInterop.Callback> onErrorSemPapel;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorSubtotalizaCupom;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorSubtotalizaNaoFiscal;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorSuprimento;
		private readonly ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback> onErrorVendeItem;

		private readonly ACBrEventHandler<MsgEventArgs, ACBrECFInterop.MsgCallback> onMsgAguarde;
		private readonly ACBrEventHandler<MsgRetentarEventArgs, ACBrECFInterop.MsgRetentarCallback> onMsgRetentar;
		private readonly ACBrEventHandler<PAFCalcEADEventArgs, ACBrECFInterop.PafCalcEadCallback> onPAFCalcEAD;
		private readonly ACBrEventHandler<ChaveEventArgs, ACBrECFInterop.ChaveCallback> onPAFGetKeyRSA;

		#endregion Fields

		#region Constructor

		public ACBrECF()
		{
			onMsgPoucoPapel = new ACBrEventHandler<ACBrECFInterop.Callback>(this, OnMsgPoucoPapelCallback,
				ACBrECFInterop.ECF_SetOnMsgPoucoPapel);
			onAguardandoRespostaChange = new ACBrEventHandler<ACBrECFInterop.Callback>(this,
				OnAguardandoRespostaChangeCallback, ACBrECFInterop.ECF_SetOnAguardandoRespostaChange);
			onAntesAbreCupom = new ACBrEventHandler<AbreCupomEventArgs, ACBrECFInterop.AbreCupomCallback>(this,
				OnAntesAbreCupomCallback, ACBrECFInterop.ECF_SetOnAntesAbreCupom);
			onAntesAbreCupomVinculado = new ACBrEventHandler<ACBrECFInterop.Callback>(this,
				OnAntesAbreCupomVinculadoCallback, ACBrECFInterop.ECF_SetOnAntesAbreCupomVinculado);
			onAntesAbreNaoFiscal = new ACBrEventHandler<AbreCupomEventArgs, ACBrECFInterop.AbreCupomCallback>(this,
				OnAntesAbreNaoFiscalCallback, ACBrECFInterop.ECF_SetOnAntesAbreNaoFiscal);
			onAntesAbreRelatorioGerencial =
				new ACBrEventHandler<RelatorioGerencialEventArgs, ACBrECFInterop.RelatorioGerencialCallback>(this,
					OnAntesAbreRelatorioGerencialCallback, ACBrECFInterop.ECF_SetOnAntesAbreRelatorioGerencial);
			onAntesCancelaCupom = new ACBrEventHandler<ACBrECFInterop.Callback>(this, OnAntesCancelaCupomCallback,
				ACBrECFInterop.ECF_SetOnAntesCancelaCupom);
			onAntesCancelaItemNaoFiscal =
				new ACBrEventHandler<CancelaItemEventArgs, ACBrECFInterop.CancelaItemCallback>(this,
					OnAntesCancelaItemNaoFiscalCallback, ACBrECFInterop.ECF_SetOnAntesCancelaItemNaoFiscal);
			onAntesCancelaItemVendido =
				new ACBrEventHandler<CancelaItemEventArgs, ACBrECFInterop.CancelaItemCallback>(this,
					OnAntesCancelaItemVendidoCallback, ACBrECFInterop.ECF_SetOnAntesCancelaItemVendido);
			onAntesCancelaNaoFiscal = new ACBrEventHandler<ACBrECFInterop.Callback>(this,
				OnAntesCancelaNaoFiscalCallback, ACBrECFInterop.ECF_SetOnAntesCancelaNaoFiscal);
			onAntesEfetuaPagamento =
				new ACBrEventHandler<EfetuaPagamentoEventArgs, ACBrECFInterop.EfetuaPagamentoCallback>(this,
					OnAntesEfetuaPagamentoCallback, ACBrECFInterop.ECF_SetOnAntesEfetuaPagamento);
			onAntesEfetuaPagamentoNaoFiscal =
				new ACBrEventHandler<EfetuaPagamentoEventArgs, ACBrECFInterop.EfetuaPagamentoCallback>(this,
					OnAntesEfetuaPagamentoNaoFiscalCallback, ACBrECFInterop.ECF_SetOnAntesEfetuaPagamentoNaoFiscal);
			onAntesFechaCupom = new ACBrEventHandler<FechaCupomEventArgs, ACBrECFInterop.FechaCupomCallback>(this,
				OnAntesFechaCupomCallback, ACBrECFInterop.ECF_SetOnAntesFechaCupom);
			onAntesFechaNaoFiscal = new ACBrEventHandler<FechaCupomEventArgs, ACBrECFInterop.FechaCupomCallback>(this,
				OnAntesFechaNaoFiscalCallback, ACBrECFInterop.ECF_SetOnAntesFechaNaoFiscal);
			onAntesFechaRelatorio = new ACBrEventHandler<ACBrECFInterop.Callback>(this, OnAntesFechaRelatorioCallback,
				ACBrECFInterop.ECF_SetOnAntesFechaRelatorio);
			onAntesLeituraX = new ACBrEventHandler<ACBrECFInterop.Callback>(this, OnAntesLeituraXCallback,
				ACBrECFInterop.ECF_SetOnAntesLeituraX);
			onAntesReducaoZ = new ACBrEventHandler<ACBrECFInterop.Callback>(this, OnAntesReducaoZCallback,
				ACBrECFInterop.ECF_SetOnAntesReducaoZ);
			onAntesSangria =
				new ACBrEventHandler<SangriaSuprimentoEventArgs, ACBrECFInterop.SangriaSuprimentoCallback>(this,
					OnAntesSangriaCallback, ACBrECFInterop.ECF_SetOnAntesSangria);
			onAntesSubtotalizaCupom =
				new ACBrEventHandler<SubtotalizaCupomEventArgs, ACBrECFInterop.SubtotalizaCupomCallback>(this,
					OnAntesSubtotalizaCupomCallback, ACBrECFInterop.ECF_SetOnAntesSubtotalizaCupom);
			onAntesSubtotalizaNaoFiscal =
				new ACBrEventHandler<SubtotalizaCupomEventArgs, ACBrECFInterop.SubtotalizaCupomCallback>(this,
					OnAntesSubtotalizaNaoFiscalCallback, ACBrECFInterop.ECF_SetOnAntesSubtotalizaCupom);
			onAntesSuprimento =
				new ACBrEventHandler<SangriaSuprimentoEventArgs, ACBrECFInterop.SangriaSuprimentoCallback>(this,
					OnAntesSuprimentoCallback, ACBrECFInterop.ECF_SetOnAntesSuprimento);
			onAntesVendeItem = new ACBrEventHandler<VendeItemEventArgs, ACBrECFInterop.VendeItemCallback>(this,
				OnAntesVendeItemCallback, ACBrECFInterop.ECF_SetOnAntesVendeItem);
			onBobinaAdicionaLinhas =
				new ACBrEventHandler<BobinaAdicionaLinhasEventArgs, ACBrECFInterop.BobinaAdicionaLinhasCallback>(this,
					OnBobinaAdicionaLinhasCallback, ACBrECFInterop.ECF_SetOnBobinaAdicionaLinhas);
			onChangeEstado = new ACBrEventHandler<ChangeEstadoEventArgs, ACBrECFInterop.ChangeEstadoCallback>(this,
				OnChangeEstadoCallback, ACBrECFInterop.ECF_SetOnChangeEstado);
			onChequeEstado = new ACBrEventHandler<ChequeEstadoEventArgs, ACBrECFInterop.ChequeEstadoCallback>(this,
				OnChequeEstadoCallback, ACBrECFInterop.ECF_SetOnChequeEstado);
			onDepoisAbreCupom = new ACBrEventHandler<AbreCupomEventArgs, ACBrECFInterop.AbreCupomCallback>(this,
				OnDepoisAbreCupomCallback, ACBrECFInterop.ECF_SetOnDepoisAbreCupom);
			onDepoisAbreCupomVinculado = new ACBrEventHandler<ACBrECFInterop.Callback>(this,
				OnDepoisAbreCupomVinculadoCallback, ACBrECFInterop.ECF_SetOnDepoisAbreCupomVinculado);
			onDepoisAbreNaoFiscal = new ACBrEventHandler<AbreCupomEventArgs, ACBrECFInterop.AbreCupomCallback>(this,
				OnDepoisAbreNaoFiscalCallback, ACBrECFInterop.ECF_SetOnDepoisAbreNaoFiscal);
			onDepoisAbreRelatorioGerencial =
				new ACBrEventHandler<RelatorioGerencialEventArgs, ACBrECFInterop.RelatorioGerencialCallback>(this,
					OnDepoisAbreRelatorioGerencialCallback, ACBrECFInterop.ECF_SetOnDepoisAbreRelatorioGerencial);
			onDepoisCancelaCupom = new ACBrEventHandler<ACBrECFInterop.Callback>(this, OnDepoisCancelaCupomCallback,
				ACBrECFInterop.ECF_SetOnDepoisCancelaCupom);
			onDepoisCancelaItemNaoFiscal =
				new ACBrEventHandler<CancelaItemEventArgs, ACBrECFInterop.CancelaItemCallback>(this,
					OnDepoisCancelaItemNaoFiscalCallback, ACBrECFInterop.ECF_SetOnDepoisCancelaItemNaoFiscal);
			onDepoisCancelaItemVendido =
				new ACBrEventHandler<CancelaItemEventArgs, ACBrECFInterop.CancelaItemCallback>(this,
					OnDepoisCancelaItemVendidoCallback, ACBrECFInterop.ECF_SetOnDepoisCancelaItemVendido);
			onDepoisCancelaNaoFiscal = new ACBrEventHandler<ACBrECFInterop.Callback>(this,
				OnDepoisCancelaNaoFiscalCallback, ACBrECFInterop.ECF_SetOnDepoisCancelaNaoFiscal);
			onDepoisEfetuaPagamento =
				new ACBrEventHandler<EfetuaPagamentoEventArgs, ACBrECFInterop.EfetuaPagamentoCallback>(this,
					OnDepoisEfetuaPagamentoCallback, ACBrECFInterop.ECF_SetOnDepoisEfetuaPagamento);
			onDepoisEfetuaPagamentoNaoFiscal =
				new ACBrEventHandler<EfetuaPagamentoEventArgs, ACBrECFInterop.EfetuaPagamentoCallback>(this,
					OnDepoisEfetuaPagamentoNaoFiscalCallback, ACBrECFInterop.ECF_SetOnDepoisEfetuaPagamentoNaoFiscal);
			onDepoisFechaCupom = new ACBrEventHandler<FechaCupomEventArgs, ACBrECFInterop.FechaCupomCallback>(this,
				OnDepoisFechaCupomCallback, ACBrECFInterop.ECF_SetOnDepoisFechaCupom);
			onDepoisFechaNaoFiscal = new ACBrEventHandler<FechaCupomEventArgs, ACBrECFInterop.FechaCupomCallback>(this,
				OnDepoisFechaNaoFiscalCallback, ACBrECFInterop.ECF_SetOnDepoisFechaNaoFiscal);
			onDepoisFechaRelatorio = new ACBrEventHandler<ACBrECFInterop.Callback>(this, OnDepoisFechaRelatorioCallback,
				ACBrECFInterop.ECF_SetOnDepoisFechaRelatorio);
			onDepoisLeituraX = new ACBrEventHandler<ACBrECFInterop.Callback>(this, OnDepoisLeituraXCallback,
				ACBrECFInterop.ECF_SetOnDepoisLeituraX);
			onDepoisReducaoZ = new ACBrEventHandler<ACBrECFInterop.Callback>(this, OnDepoisReducaoZCallback,
				ACBrECFInterop.ECF_SetOnDepoisReducaoZ);
			onDepoisSangria =
				new ACBrEventHandler<SangriaSuprimentoEventArgs, ACBrECFInterop.SangriaSuprimentoCallback>(this,
					OnDepoisSangriaCallback, ACBrECFInterop.ECF_SetOnDepoisSangria);
			onDepoisSubtotalizaCupom =
				new ACBrEventHandler<SubtotalizaCupomEventArgs, ACBrECFInterop.SubtotalizaCupomCallback>(this,
					OnDepoisSubtotalizaCupomCallback, ACBrECFInterop.ECF_SetOnDepoisSubtotalizaCupom);
			onDepoisSubtotalizaNaoFiscal =
				new ACBrEventHandler<SubtotalizaCupomEventArgs, ACBrECFInterop.SubtotalizaCupomCallback>(this,
					OnDepoisSubtotalizaNaoFiscalCallback, ACBrECFInterop.ECF_SetOnDepoisSubtotalizaCupom);
			onDepoisSuprimento =
				new ACBrEventHandler<SangriaSuprimentoEventArgs, ACBrECFInterop.SangriaSuprimentoCallback>(this,
					OnDepoisSuprimentoCallback, ACBrECFInterop.ECF_SetOnDepoisSuprimento);
			onDepoisVendeItem = new ACBrEventHandler<VendeItemEventArgs, ACBrECFInterop.VendeItemCallback>(this,
				OnDepoisVendeItemCallback, ACBrECFInterop.ECF_SetOnDepoisVendeItem);
			onErrorAbreCupom = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorAbreCupomCallback, ACBrECFInterop.ECF_SetOnErrorAbreCupom);
			onErrorAbreCupomVinculado = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorAbreCupomVinculadoCallback, ACBrECFInterop.ECF_SetOnErrorAbreCupomVinculado);
			onErrorAbreNaoFiscal = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorAbreNaoFiscalCallback, ACBrECFInterop.ECF_SetOnErrorAbreNaoFiscal);
			onErrorAbreRelatorioGerencial =
				new ACBrEventHandler<ErrorRelatorioEventArgs, ACBrECFInterop.ErrorRelatorioCallback>(this,
					OnErrorAbreRelatorioGerencialCallback, ACBrECFInterop.ECF_SetOnErrorAbreRelatorioGerencial);
			onErrorCancelaCupom = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorCancelaCupomCallback, ACBrECFInterop.ECF_SetOnErrorCancelaCupom);
			onErrorCancelaItemNaoFiscal = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorCancelaItemNaoFiscalCallback, ACBrECFInterop.ECF_SetOnErrorCancelaItemNaoFiscal);
			onErrorCancelaItemVendido = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorCancelaItemVendidoCallback, ACBrECFInterop.ECF_SetOnErrorCancelaItemVendido);
			onErrorCancelaNaoFiscal = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorCancelaNaoFiscalCallback, ACBrECFInterop.ECF_SetOnErrorCancelaNaoFiscal);
			onErrorEfetuaPagamento = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorEfetuaPagamentoCallback, ACBrECFInterop.ECF_SetOnErrorEfetuaPagamento);
			onErrorEfetuaPagamentoNaoFiscal = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorEfetuaPagamentoNaoFiscalCallback, ACBrECFInterop.ECF_SetOnErrorEfetuaPagamentoNaoFiscal);
			onErrorFechaCupom = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorFechaCupomCallback, ACBrECFInterop.ECF_SetOnErrorFechaCupom);
			onErrorFechaNaoFiscal = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorFechaNaoFiscalCallback, ACBrECFInterop.ECF_SetOnErrorFechaNaoFiscal);
			onErrorFechaRelatorio = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorFechaRelatorioCallback, ACBrECFInterop.ECF_SetOnErrorFechaRelatorio);
			onErrorLeituraX = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorLeituraXCallback, ACBrECFInterop.ECF_SetOnErrorLeituraX);
			onErrorReducaoZ = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorReducaoZCallback, ACBrECFInterop.ECF_SetOnErrorReducaoZ);
			onErrorSangria = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorSangriaCallback, ACBrECFInterop.ECF_SetOnErrorSangria);
			onErrorSemPapel = new ACBrEventHandler<ACBrECFInterop.Callback>(this, OnErrorSemPapelCallback,
				ACBrECFInterop.ECF_SetOnErrorSemPapel);
			onErrorSubtotalizaCupom = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorSubtotalizaCupomCallback, ACBrECFInterop.ECF_SetOnErrorSubtotalizaCupom);
			onErrorSubtotalizaNaoFiscal = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorSubtotalizaNaoFiscalCallback, ACBrECFInterop.ECF_SetOnErrorSubtotalizaCupom);
			onErrorSuprimento = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorSuprimentoCallback, ACBrECFInterop.ECF_SetOnErrorSuprimento);
			onErrorVendeItem = new ACBrEventHandler<ErrorEventArgs, ACBrECFInterop.ErrorCallback>(this,
				OnErrorVendeItemCallback, ACBrECFInterop.ECF_SetOnErrorVendeItem);
			onMsgAguarde = new ACBrEventHandler<MsgEventArgs, ACBrECFInterop.MsgCallback>(this, OnMsgAguardeCallback,
				ACBrECFInterop.ECF_SetOnMsgAguarde);
			onMsgRetentar = new ACBrEventHandler<MsgRetentarEventArgs, ACBrECFInterop.MsgRetentarCallback>(this,
				OnMsgRetentarCallback, ACBrECFInterop.ECF_SetOnMsgRetentar);
			onPAFCalcEAD = new ACBrEventHandler<PAFCalcEADEventArgs, ACBrECFInterop.PafCalcEadCallback>(this,
				OnPAFCalcEADCallback, ACBrECFInterop.ECF_SetOnPAFCalcEAD);
			onPAFGetKeyRSA = new ACBrEventHandler<ChaveEventArgs, ACBrECFInterop.ChaveCallback>(this,
				OnPAFGetKeyRSACallback, ACBrECFInterop.ECF_SetOnPAFGetKeyRSA);
		}

		#endregion Constructor

		#region Properties

		#region Visiveis

		[Category("Configutações ECF")]
		public ModeloECF Modelo
		{
			get { return (ModeloECF)GetInt32(ACBrECFInterop.ECF_GetModelo); }
			set { SetInt32(ACBrECFInterop.ECF_SetModelo, (int)value); }
		}

		[Category("Configutações ECF")]
		public ACBrDevice Device { get; private set; }

		[Category("Propriedades")]
		public int MaxLinhasBuffer
		{
			get { return GetInt32(ACBrECFInterop.ECF_GetMaxLinhasBuffer); }
			set { SetInt32(ACBrECFInterop.ECF_SetMaxLinhasBuffer, value); }
		}

		[Category("Propriedades")]
		public bool DescricaoGrande
		{
			get { return GetBool(ACBrECFInterop.ECF_GetDescricaoGrande); }
			set { SetBool(ACBrECFInterop.ECF_SetDescricaoGrande, value); }
		}

		[Category("Propriedades")]
		public bool Retentar
		{
			get { return GetBool(ACBrECFInterop.ECF_GetReTentar); }
			set { SetBool(ACBrECFInterop.ECF_SetReTentar, value); }
		}

		[Category("Propriedades")]
		public bool ControlePorta
		{
			get { return GetBool(ACBrECFInterop.ECF_GetControlePorta); }
			set { SetBool(ACBrECFInterop.ECF_SetControlePorta, value); }
		}

		[Category("Propriedades")]
		public bool GavetaSinalInvertido
		{
			get { return GetBool(ACBrECFInterop.ECF_GetGavetaSinalInvertido); }
			set { SetBool(ACBrECFInterop.ECF_SetGavetaSinalInvertido, value); }
		}

		[Category("Propriedades")]
		public bool ArredondaPorQtd
		{
			get { return GetBool(ACBrECFInterop.ECF_GetArredondaPorQtd); }
			set { SetBool(ACBrECFInterop.ECF_SetArredondaPorQtd, value); }
		}

		[Category("Propriedades")]
		public bool ArredondaItemMFD
		{
			get { return GetBool(ACBrECFInterop.ECF_GetArredondaItemMFD); }
			set { SetBool(ACBrECFInterop.ECF_SetArredondaItemMFD, value); }
		}

		[Category("Propriedades")]
		public bool IgnorarTagsFormatacao
		{
			get { return GetBool(ACBrECFInterop.ECF_GetIgnorarTagsFormatacao); }
			set { SetBool(ACBrECFInterop.ECF_SetIgnorarTagsFormatacao, value); }
		}

		[Category("Propriedades")]
		public int PausaRelatorio
		{
			get { return GetInt32(ACBrECFInterop.ECF_GetPausaRelatorio); }
			set { SetInt32(ACBrECFInterop.ECF_SetPausaRelatorio, value); }
		}

		[Category("Propriedades")]
		public int PaginaDeCodigo
		{
			get { return GetInt32(ACBrECFInterop.ECF_GetPaginaDeCodigo); }
			set { SetInt32(ACBrECFInterop.ECF_SetPaginaDeCodigo, value); }
		}

		[Category("Propriedades")]
		public string About
		{
			get { return GetAbout(ACBrECFInterop.ECF_GetAbout); }
		}

		[Category("Propriedades")]
		public string ArqLOG
		{
			get { return GetString(ACBrECFInterop.ECF_GetArqLOG); }
			set { SetString(ACBrECFInterop.ECF_SetArqLOG, value); }
		}

		[Category("Propriedades")]
		public string Operador
		{
			get { return GetString(ACBrECFInterop.ECF_GetOperador); }
			set { SetString(ACBrECFInterop.ECF_SetOperador, value); }
		}

		[Category("Propriedades")]
		public string[] MemoParams
		{
			get { return GetStringArray(ACBrECFInterop.ECF_GetMemoParams, ACBrECFInterop.ECF_GetMemoParamsCount); }
			set { SetStringArray(ACBrECFInterop.ECF_SetMemoParams, value); }
		}

		[Category("Propriedades")]
		public int LinhasEntreCupons
		{
			get { return GetInt32(ACBrECFInterop.ECF_GetLinhasEntreCupons); }
			set { SetInt32(ACBrECFInterop.ECF_SetLinhasEntreCupons, value); }
		}

		[Category("Propriedades")]
		public int DecimaisPreco
		{
			get { return GetInt32(ACBrECFInterop.ECF_GetDecimaisPreco); }
			set { SetInt32(ACBrECFInterop.ECF_SetDecimaisPreco, value); }
		}

		[Category("Propriedades")]
		public int DecimaisQtd
		{
			get { return GetInt32(ACBrECFInterop.ECF_GetDecimaisQtd); }
			set { SetInt32(ACBrECFInterop.ECF_SetDecimaisQtd, value); }
		}

		[Browsable(true)]
		[Category("Rodape")]
		public Rodape InfoRodapeCupom { get; private set; }

		[Category("Rodape")]
		public bool QuebraLinhaRodape
		{
			get { return GetBool(ACBrECFInterop.ECF_GetQuebraLinhaRodape); }
			set { SetBool(ACBrECFInterop.ECF_SetQuebraLinhaRodape, value); }
		}

		[Browsable(true)]
		[Category("ConfigBarras")]
		public ConfigBarras ConfigBarras { get; private set; }

		#endregion Visiveis

		#region Componentes ACBr

		[Category("Componentes ACBr")]
		public ACBrAAC AAC
		{
			get { return aac; }
			set
			{
				if (value == null)
				{
					var ret = ACBrECFInterop.ECF_SetAAC(Handle, IntPtr.Zero);
					CheckResult(ret);

					aac = null;
				}
				else
				{
					var ret = ACBrECFInterop.ECF_SetAAC(Handle, value.Handle);
					CheckResult(ret);

					aac = value;
				}
			}
		}

		[Category("Componentes ACBr")]
		public ACBrEAD EAD
		{
			get { return ead; }
			set
			{
				if (value == null)
				{
					var ret = ACBrECFInterop.ECF_SetEAD(Handle, IntPtr.Zero);
					CheckResult(ret);

					ead = null;
				}
				else
				{
					var ret = ACBrECFInterop.ECF_SetEAD(Handle, value.Handle);
					CheckResult(ret);

					ead = value;
				}
			}
		}

		[Category("Componentes ACBr")]
		public ACBrRFD RFD
		{
			get { return rfd; }
			set
			{
				if (value == rfd)
					return;

				if (value == null && rfd != null)
				{
					var ret = ACBrECFInterop.ECF_SetRFD(Handle, IntPtr.Zero);
					CheckResult(ret);
				}
				else
				{
					var ret = ACBrECFInterop.ECF_SetRFD(Handle, value.Handle);
					CheckResult(ret);
				}

				if (value != null)
					value.ecf = this;
				else
					rfd.ecf = null;

				rfd = value;
			}
		}

		#endregion Componentes ACBr

		#region Propriedades Não-visiveis

		[Browsable(false)]
		public bool Ativo
		{
			get { return GetBool(ACBrECFInterop.ECF_GetAtivo); }
		}

		[Browsable(false)]
		public DateTime DataHoraUltimaReducaoZ
		{
			get { return GetDateTime(ACBrECFInterop.ECF_GetDataHoraUltimaReducaoZ); }
		}

		[Browsable(false)]
		public int Colunas
		{
			get { return GetInt32(ACBrECFInterop.ECF_GetColunas); }
		}

		[Browsable(false)]
		public bool AguardandoResposta
		{
			get { return GetBool(ACBrECFInterop.ECF_GetAguardandoResposta); }
		}

		[Browsable(false)]
		public string ComandoLog
		{
			get { return GetString(ACBrECFInterop.ECF_GetComandoLog); }
			set { SetString(ACBrECFInterop.ECF_SetComandoLog, value); }
		}

		[Browsable(false)]
		public bool AguardaImpressao
		{
			get { return GetBool(ACBrECFInterop.ECF_GetAguardaImpressao); }
			set { SetBool(ACBrECFInterop.ECF_SetAguardaImpressao, value); }
		}

		[Browsable(false)]
		public string ModeloStr
		{
			get { return GetString(ACBrECFInterop.ECF_GetModeloStr); }
		}

		[Browsable(false)]
		public string RFDID
		{
			get { return GetString(ACBrECFInterop.ECF_GetRFDID); }
		}

		[Browsable(false)]
		public DateTime DataHora
		{
			get { return GetDateTime(ACBrECFInterop.ECF_GetDataHora); }
		}

		[Browsable(false)]
		public string NumCupom
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumCupom); }
		}

		[Browsable(false)]
		public string NumCOO
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumCOO); }
		}

		[Browsable(false)]
		public string NumLoja
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumLoja); }
		}

		[Browsable(false)]
		public string NumECF
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumECF); }
		}

		[Browsable(false)]
		public string NumSerie
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumSerie); }
		}

		[Browsable(false)]
		public string NumSerieMFD
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumSerieMFD); }
		}

		[Browsable(false)]
		public string NumVersao
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumVersao); }
		}

		[Browsable(false)]
		public DateTime DataMovimento
		{
			get { return GetDateTime(ACBrECFInterop.ECF_GetDataMovimento); }
		}

		[Browsable(false)]
		public DateTime DataHoraSB
		{
			get { return GetDateTime(ACBrECFInterop.ECF_GetDataHoraSB); }
		}

		[Browsable(false)]
		public string CNPJ
		{
			get { return GetString(ACBrECFInterop.ECF_GetCNPJ); }
		}

		[Browsable(false)]
		public string IE
		{
			get { return GetString(ACBrECFInterop.ECF_GetIE); }
		}

		[Browsable(false)]
		public string IM
		{
			get { return GetString(ACBrECFInterop.ECF_GetIM); }
		}

		[Browsable(false)]
		public string Cliche
		{
			get { return GetString(ACBrECFInterop.ECF_GetCliche); }
		}

		[Browsable(false)]
		public string UsuarioAtual
		{
			get { return GetString(ACBrECFInterop.ECF_GetUsuarioAtual); }
		}

		[Browsable(false)]
		public string SubModeloECF
		{
			get { return GetString(ACBrECFInterop.ECF_GetSubModeloECF); }
		}

		[Browsable(false)]
		public string PAF
		{
			get { return GetString(ACBrECFInterop.ECF_GetPAF); }
		}

		[Browsable(false)]
		public string NumCRZ
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumCRZ); }
		}

		[Browsable(false)]
		public string NumCRO
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumCRO); }
		}

		[Browsable(false)]
		public string NumCCF
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumCCF); }
		}

		[Browsable(false)]
		public string NumGNF
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumGNF); }
		}

		[Browsable(false)]
		public string NumGRG
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumGRG); }
		}

		[Browsable(false)]
		public string NumCDC
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumCDC); }
		}

		[Browsable(false)]
		public string NumCOOInicial
		{
			get { return GetString(ACBrECFInterop.ECF_GetNumCOOInicial); }
		}

		[Browsable(false)]
		public string ComandoEnviado
		{
			get { return GetString(ACBrECFInterop.ECF_GetComandoEnviado); }
		}

		[Browsable(false)]
		public string RespostaComando
		{
			get { return GetString(ACBrECFInterop.ECF_GetRespostaComando); }
		}

		[Browsable(false)]
		public decimal VendaBruta
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetVendaBruta); }
		}

		[Browsable(false)]
		public decimal GrandeTotal
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetGrandeTotal); }
		}

		[Browsable(false)]
		public decimal TotalCancelamentos
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalCancelamentos); }
		}

		[Browsable(false)]
		public decimal TotalDescontos
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalDescontos); }
		}

		[Browsable(false)]
		public decimal TotalAcrescimos
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalAcrescimos); }
		}

		[Browsable(false)]
		public decimal TotalTroco
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalTroco); }
		}

		[Browsable(false)]
		public decimal TotalSubstituicaoTributaria
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalSubstituicaoTributaria); }
		}

		[Browsable(false)]
		public decimal TotalNaoTributado
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalNaoTributado); }
		}

		[Browsable(false)]
		public decimal TotalIsencao
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalIsencao); }
		}

		[Browsable(false)]
		public decimal TotalCancelamentosISSQN
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalCancelamentosISSQN); }
		}

		[Browsable(false)]
		public decimal TotalDescontosISSQN
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalDescontosISSQN); }
		}

		[Browsable(false)]
		public decimal TotalAcrescimosISSQN
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalAcrescimosISSQN); }
		}

		[Browsable(false)]
		public decimal TotalSubstituicaoTributariaISSQN
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalSubstituicaoTributariaISSQN); }
		}

		[Browsable(false)]
		public decimal TotalNaoTributadoISSQN
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalNaoTributadoISSQN); }
		}

		[Browsable(false)]
		public decimal TotalIsencaoISSQN
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalIsencaoISSQN); }
		}

		[Browsable(false)]
		public decimal TotalNaoFiscal
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalNaoFiscal); }
		}

		[Browsable(false)]
		public int NumUltItem
		{
			get { return GetInt32(ACBrECFInterop.ECF_GetNumUltItem); }
		}

		[Browsable(false)]
		public bool PoucoPapel
		{
			get { return GetBool(ACBrECFInterop.ECF_GetPoucoPapel); }
		}

		[Browsable(false)]
		public EstadoECF Estado
		{
			get { return (EstadoECF)GetInt32(ACBrECFInterop.ECF_GetEstado); }
		}

		[Browsable(false)]
		public bool HorarioVerao
		{
			get { return GetBool(ACBrECFInterop.ECF_GetHorarioVerao); }
		}

		[Browsable(false)]
		public bool Arredonda
		{
			get { return GetBool(ACBrECFInterop.ECF_GetArredonda); }
		}

		[Browsable(false)]
		public bool Termica
		{
			get { return GetBool(ACBrECFInterop.ECF_GetTermica); }
		}

		[Browsable(false)]
		public bool MFD
		{
			get { return GetBool(ACBrECFInterop.ECF_GetMFD); }
		}

		[Browsable(false)]
		public string MFAdicional
		{
			get { return GetString(ACBrECFInterop.ECF_GetMFAdicional); }
		}

		[Browsable(false)]
		public bool IdentificaConsumidorRodape
		{
			get { return GetBool(ACBrECFInterop.ECF_GetIdentificaConsumidorRodape); }
		}

		[Browsable(false)]
		public bool ParamDescontoISSQN
		{
			get { return GetBool(ACBrECFInterop.ECF_GetParamDescontoISSQN); }
		}

		[Browsable(false)]
		public decimal SubTotal
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetSubTotal); }
		}

		[Browsable(false)]
		public decimal TotalPago
		{
			#region COM_INTEROP

#if COM_INTEROP
            [return: MarshalAs(UnmanagedType.Currency)]
#endif

			#endregion COM_INTEROP

			get { return GetDecimal(ACBrECFInterop.ECF_GetTotalPago); }
		}

		[Browsable(false)]
		public bool GavetaAberta
		{
			get { return GetBool(ACBrECFInterop.ECF_GetGavetaAberta); }
		}

		[Browsable(false)]
		public bool ChequePronto
		{
			get { return GetBool(ACBrECFInterop.ECF_GetChequePronto); }
		}

		[Browsable(false)]
		public int IntervaloAposComando
		{
			get { return GetInt32(ACBrECFInterop.ECF_GetIntervaloAposComando); }
			set { SetInt32(ACBrECFInterop.ECF_SetIntervaloAposComando, value); }
		}

		[Browsable(false)]
		public Aliquota[] Aliquotas
		{
			get
			{
				if (aliquotas == null) CarregaAliquotas();
				return (Aliquota[])aliquotas.Clone();
			}
		}

		[Browsable(false)]
		public FormaPagamento[] FormasPagamento
		{
			get
			{
				if (formasPagamento == null) CarregaFormasPagamento();
				return (FormaPagamento[])formasPagamento;
			}
		}

		[Browsable(false)]
		public RelatorioGerencial[] RelatoriosGerenciais
		{
			get
			{
				if (relatoriosGerenciais == null) CarregaRelatoriosGerenciais();
				return (RelatorioGerencial[])relatoriosGerenciais;
			}
		}

		[Browsable(false)]
		public ComprovanteNaoFiscal[] ComprovantesNaoFiscais
		{
			get
			{
				if (comprovantesNaoFiscais == null) CarregaComprovantesNaoFiscais();
				return (ComprovanteNaoFiscal[])comprovantesNaoFiscais;
			}
		}

		[Browsable(false)]
		public Consumidor Consumidor { get; private set; }

		[Browsable(false)]
		public DadosReducaoZClass DadosReducaoZClass { get; private set; }

		#endregion Propriedades Não-visiveis

		#endregion Properties

		#region Methods

		#region Métodos Ativar/Desativar

		public void Ativar()
		{
			var ret = ACBrECFInterop.ECF_Ativar(Handle);
			CheckResult(ret);
		}

		public void Desativar()
		{
			var ret = ACBrECFInterop.ECF_Desativar(Handle);
			CheckResult(ret);
		}

		#endregion Métodos Ativar/Desativar

		#region Métodos ECF

		public bool AcharECF(bool Modelo = true, bool Porta = true, int TimeOut = 3)
		{
			var ret = ACBrECFInterop.ECF_AcharECF(Handle, Modelo, Porta, TimeOut);
			CheckResult(ret);

			return Convert.ToBoolean(ret);
		}

		public bool AcharPorta(int TimeOut = 3)
		{
			var ret = ACBrECFInterop.ECF_AcharPorta(Handle, TimeOut);
			CheckResult(ret);

			return Convert.ToBoolean(ret);
		}

		public bool EmLinha(int timeOut = 1)
		{
			var ret = ACBrECFInterop.ECF_GetEmLinha(Handle, timeOut);
			CheckResult(ret);

			return Convert.ToBoolean(ret);
		}

		public void PulaLinhas(int numLinhas)
		{
			var ret = ACBrECFInterop.ECF_PulaLinhas(Handle, numLinhas);
			CheckResult(ret);
		}

		public void CortaPapel(bool corteParcial = false)
		{
			var ret = ACBrECFInterop.ECF_CortaPapel(Handle, corteParcial);
			CheckResult(ret);
		}

		public void CorrigeEstadoErro(bool reducaoZ = true)
		{
			var ret = ACBrECFInterop.ECF_CorrigeEstadoErro(Handle, reducaoZ);
			CheckResult(ret);
		}

		public void MudaHorarioVerao()
		{
			var ret = ACBrECFInterop.ECF_MudaHorarioVerao(Handle);
			CheckResult(ret);
		}

		public void MudaArredondamento(bool arredonda)
		{
			var ret = ACBrECFInterop.ECF_MudaArredondamento(Handle, arredonda);
		}

		public void PreparaTEF()
		{
			var ret = ACBrECFInterop.ECF_PreparaTEF(Handle);
			CheckResult(ret);

			CarregaAliquotas(GetInt32(ACBrECFInterop.ECF_GetALCount));
			CarregaFormasPagamento(GetInt32(ACBrECFInterop.ECF_GetFPGCount));
			CarregaComprovantesNaoFiscais(GetInt32(ACBrECFInterop.ECF_GetCNFCount));
		}

		public void TestaPodeAbrirCupom()
		{
			var ret = ACBrECFInterop.ECF_TestaPodeAbrirCupom(Handle);
			CheckResult(ret);
		}

		public string EnviaComando(string cmd, int timeout = -1)
		{
			var bufferlen = 512;
			var buffer = new StringBuilder(bufferlen);

			var ret = ACBrECFInterop.ECF_EnviaComando(Handle, ToUTF8(cmd), timeout, buffer, bufferlen);
			CheckResult(ret);

			return FromUTF8(buffer.ToString());
		}

		#endregion Métodos ECF

		#region Métodos Cheque

		public void ImprimeCheque(string Banco, [MarshalAs(UnmanagedType.Currency)] decimal Valor, string Favorecido,
			string Cidade, DateTime Data, string Observacao = "")
		{
			var ret = ACBrECFInterop.ECF_ImprimeCheque(Handle, ToUTF8(Banco), Convert.ToDouble(Valor),
				ToUTF8(Favorecido), ToUTF8(Cidade), Data.ToOADate(), ToUTF8(Observacao));
			CheckResult(ret);
		}

		public void CancelaImpressaoCheque()
		{
			var ret = ACBrECFInterop.ECF_CancelaImpressaoCheque(Handle);
			CheckResult(ret);
		}

		public string LeituraCMC7()
		{
			var bufferlen = 256;
			var buffer = new StringBuilder(bufferlen);

			var ret = ACBrECFInterop.ECF_LeituraCMC7(Handle, buffer, bufferlen);
			CheckResult(ret);

			return FromUTF8(buffer.ToString());
		}

		#endregion Métodos Cheque

		#region Leitura Memoria Fiscal

#if COM_INTEROP

        public void LeituraMemoriaFiscalPorCRZ(int reducaoInicial, int reducaoFinal, bool simplificada = false)
#else

		public void LeituraMemoriaFiscal(int reducaoInicial, int reducaoFinal, bool simplificada = false)
#endif
		{
			var ret = ACBrECFInterop.ECF_LeituraMemoriaFiscalReducao(Handle, reducaoInicial, reducaoFinal,
				simplificada);
			CheckResult(ret);
		}

#if COM_INTEROP

        public void LeituraMemoriaFiscalPorData(DateTime dataInicial, DateTime dataFinal, bool simplificada = false)
#else

		public void LeituraMemoriaFiscal(DateTime dataInicial, DateTime dataFinal, bool simplificada = false)
#endif
		{
			var ret = ACBrECFInterop.ECF_LeituraMemoriaFiscalData(Handle, dataInicial.ToOADate(),
				dataFinal.ToOADate(), simplificada);
			CheckResult(ret);
		}

#if COM_INTEROP

        public string LeituraMemoriaFiscalSerialPorCRZ(int reducaoInicial, int reducaoFinal, bool simplificada = false)
#else

		public string LeituraMemoriaFiscalSerial(int reducaoInicial, int reducaoFinal, bool simplificada = false)
#endif
		{
			const int LEN = 10 * 1024;
			var buffer = new StringBuilder(LEN);

			var ret = ACBrECFInterop.ECF_LeituraMemoriaFiscalSerialReducao(Handle, reducaoInicial, reducaoFinal,
				simplificada, buffer, LEN);
			CheckResult(ret);

			buffer.Length = ret;
			return FromUTF8(buffer);
		}

#if COM_INTEROP

        public string LeituraMemoriaFiscalSerialPorData(DateTime dataInicial, DateTime dataFinal, bool simplificada = false)
#else

		public string LeituraMemoriaFiscalSerial(DateTime dataInicial, DateTime dataFinal, bool simplificada = false)
#endif
		{
			const int LEN = 10 * 1024;
			var buffer = new StringBuilder(LEN);

			var ret = ACBrECFInterop.ECF_LeituraMemoriaFiscalSerialData(Handle, dataInicial.ToOADate(),
				dataFinal.ToOADate(), simplificada, buffer, LEN);
			CheckResult(ret);

			buffer.Length = ret;
			return FromUTF8(buffer);
		}

#if COM_INTEROP

        public void LeituraMemoriaFiscalSerialPorCRZ(int reducaoInicial, int reducaoFinal, string nomeArquivo, bool simplificada = false)
#else

		public void LeituraMemoriaFiscalSerial(int reducaoInicial, int reducaoFinal, string nomeArquivo,
			bool simplificada = false)
#endif
		{
			var ret = ACBrECFInterop.ECF_LeituraMemoriaFiscalArquivoReducao(Handle, reducaoInicial, reducaoFinal,
				ToUTF8(nomeArquivo), simplificada);
			CheckResult(ret);
		}

#if COM_INTEROP

        public void LeituraMemoriaFiscalSerialPorData(DateTime dataInicial, DateTime dataFinal, string nomeArquivo, bool simplificada = false)
#else

		public void LeituraMemoriaFiscalSerial(DateTime dataInicial, DateTime dataFinal, string nomeArquivo,
			bool simplificada = false)
#endif
		{
			var ret = ACBrECFInterop.ECF_LeituraMemoriaFiscalArquivoData(Handle, dataInicial.ToOADate(),
				dataFinal.ToOADate(), ToUTF8(nomeArquivo), simplificada);
			CheckResult(ret);
		}

		#endregion Leitura Memoria Fiscal

		#region Cupom Vinculado

#if !COM_INTEROP

		public void AbreCupomVinculado(int coo, string codFormaPagto, decimal valor)
		{
			var cooStr = string.Format("{0:000000}", coo);
			AbreCupomVinculado(cooStr, codFormaPagto, valor);
		}

#endif

		public void AbreCupomVinculado(string coo, string codFormaPagto,
			[MarshalAs(UnmanagedType.Currency)] decimal valor)
		{
			var ret = ACBrECFInterop.ECF_AbreCupomVinculado(Handle, ToUTF8(coo), ToUTF8(codFormaPagto),
				(double)valor);
			CheckResult(ret);
		}

#if COM_INTEROP

        public void AbreCupomVinculadoCNF(string coo, string codFormaPagto, string codComprovanteNaoFiscal, [MarshalAs(UnmanagedType.Currency)] decimal valor)
#else

		public void AbreCupomVinculado(string coo, string codFormaPagto, string codComprovanteNaoFiscal, decimal valor)
#endif
		{
			var ret = ACBrECFInterop.ECF_AbreCupomVinculadoCNF(Handle, ToUTF8(coo), ToUTF8(codFormaPagto),
				ToUTF8(codComprovanteNaoFiscal), (double)valor);
			CheckResult(ret);
		}

#if !COM_INTEROP

		public void LinhaCupomVinculado(string[] linhas)
		{
			foreach (var linha in linhas)
				LinhaCupomVinculado(linha);
		}

#endif

		public void LinhaCupomVinculado(string linha)
		{
			var ret = ACBrECFInterop.ECF_LinhaCupomVinculado(Handle, ToUTF8(linha));
			CheckResult(ret);
		}

		public void ReimpressaoVinculado()
		{
			var ret = ACBrECFInterop.ECF_ReimpressaoVinculado(Handle);
			CheckResult(ret);
		}

		public void SegundaViaVinculado()
		{
			var ret = ACBrECFInterop.ECF_SegundaViaVinculado(Handle);
			CheckResult(ret);
		}

		#endregion Cupom Vinculado

		#region Relatório Gerencial

		public void AbreRelatorioGerencial(int indice = 0)
		{
			var ret = ACBrECFInterop.ECF_AbreRelatorioGerencial(Handle, indice);
			CheckResult(ret);
		}

		#region COM_INTEROP

#if COM_INTEROP

        [ComVisible(false)]
#endif

		#endregion COM_INTEROP

		public void LinhaRelatorioGerencial(string[] linhas, int indiceBMP = 0)
		{
			foreach (var linha in linhas)
			{
				LinhaRelatorioGerencial(linha, indiceBMP);
			}
		}

		public void LinhaRelatorioGerencial(string linha, int indiceBMP = 0)
		{
			var ret = ACBrECFInterop.ECF_LinhaRelatorioGerencial(Handle, ToUTF8(linha), indiceBMP);
			CheckResult(ret);
		}

		public void ProgramaRelatoriosGerenciais(string descricao, string posicao = "")
		{
			var ret = ACBrECFInterop.ECF_ProgramaRelatoriosGerenciais(Handle, ToUTF8(descricao), ToUTF8(posicao));
			CheckResult(ret);
		}

		public void CarregaRelatoriosGerenciais()
		{
			var count = ACBrECFInterop.ECF_CarregaRelatoriosGerenciais(Handle);
			CheckResult(count);

			CarregaRelatoriosGerenciais(count);
		}

		public void LerTotaisRelatoriosGerenciais()
		{
			var count = ACBrECFInterop.ECF_LerTotaisRelatoriosGerenciais(Handle);
			CheckResult(count);

			CarregaRelatoriosGerenciais(count);
		}

		private void CarregaRelatoriosGerenciais(int count)
		{
			relatoriosGerenciais = new RelatorioGerencial[count];

			for (var i = 0; i < count; i++)
			{
				var record = new ACBrECFInterop.RelatorioGerencialRec();
				var ret = ACBrECFInterop.ECF_GetRelatoriosGerenciais(Handle, ref record, i);
				CheckResult(ret);

				var relatorio = new RelatorioGerencial()
				{
					Indice = FromUTF8(record.Indice),
					Descricao = FromUTF8(record.Descricao),
					Contador = record.Contador
				};

				relatoriosGerenciais[i] = relatorio;
			}
		}

		#region COM_INTEROP

#if COM_INTEROP

        [ComVisible(false)]
#endif

		#endregion COM_INTEROP

		public void RelatorioGerencial(List<string> relatorio, int vias = 1, int indice = 0)
		{
			RelatorioGerencial(relatorio.ToArray(), vias, indice);
		}

		#region COM_INTEROP

#if COM_INTEROP

        [ComVisible(false)]
#endif

		#endregion COM_INTEROP

		public void RelatorioGerencial(IEnumerable<string> relatorio, int vias = 1, int indice = 0)
		{
			RelatorioGerencial(relatorio.ToArray(), vias, indice);
		}

		public void RelatorioGerencial(string[] relatorio, int vias = 1, int indice = 0)
		{
			var ret = ACBrECFInterop.ECF_RelatorioGerencial(Handle, ToUTF8(relatorio), relatorio.Length, vias,
				indice);
			CheckResult(ret);
		}

		public void FechaRelatorio()
		{
			var ret = ACBrECFInterop.ECF_FechaRelatorio(Handle);
			CheckResult(ret);
		}

		#endregion Relatório Gerencial

		#region Alíquotas

		public void CarregaAliquotas()
		{
			var count = ACBrECFInterop.ECF_CarregaAliquotas(Handle);
			CheckResult(count);

			CarregaAliquotas(count);
		}

		private void CarregaAliquotas(int count)
		{
			aliquotas = new Aliquota[count];

			for (var i = 0; i < count; i++)
			{
				var record = new ACBrECFInterop.AliquotaRec();
				var ret = ACBrECFInterop.ECF_GetAliquota(Handle, ref record, i);
				CheckResult(ret);

				var aliquota = new Aliquota();
				aliquota.Indice = FromUTF8(record.Indice);
				aliquota.ValorAliquota = Convert.ToDecimal(record.Aliquota);
				aliquota.Sequencia = record.Sequencia;
				aliquota.Tipo = record.Tipo.ToString();
				aliquota.Total = Convert.ToDecimal(record.Total);

				aliquotas[i] = aliquota;
			}
		}

		public void LerTotaisAliquota()
		{
			var count = ACBrECFInterop.ECF_LerTotaisAliquota(Handle);
			CheckResult(count);

			CarregaAliquotas(count);
		}

		public void ProgramaAliquota([MarshalAs(UnmanagedType.Currency)] decimal aliquota, string tipo,
			string posicao = "")
		{
			if (string.IsNullOrEmpty(tipo)) throw new ArgumentException();

			var ret = ACBrECFInterop.ECF_ProgramaAliquota(Handle, (double)aliquota, tipo[0], posicao);
			CheckResult(ret);
		}

		#endregion Alíquotas

		#region Formas de Pagto

		public FormaPagamento AchaFPGDescricao(string descricao, bool buscaExata = true, bool ignoreCase = true)
		{
			var FormaRec = new ACBrECFInterop.FormaPagamentoRec();
			var ret = ACBrECFInterop.ECF_AchaFPGDescricao(Handle, ToUTF8(descricao), buscaExata, ignoreCase,
				ref FormaRec);
			CheckResult(ret);

			if (ret == 0)
				return null;

			var forma = new FormaPagamento
			{
				Data = DateTime.FromOADate(FormaRec.Data),
				Descricao = FromUTF8(FormaRec.Descricao),
				Indice = FromUTF8(FormaRec.Indice),
				PermiteVinculado = FormaRec.PermiteVinculado,
				TipoDoc = FromUTF8(FormaRec.TipoDoc),
				Total = Convert.ToDecimal(FormaRec.Total)
			};

			var count = GetInt32(ACBrECFInterop.ECF_GetFPGCount);
			CheckResult(count);
			CarregaFormasPagamento(count);

			return forma;
		}

		public FormaPagamento AchaFPGIndice(string indice)
		{
			var FormaRec = new ACBrECFInterop.FormaPagamentoRec();
			var ret = ACBrECFInterop.ECF_AchaFPGIndice(Handle, ToUTF8(indice), ref FormaRec);
			CheckResult(ret);

			if (ret == 0)
				return null;

			var Forma = new FormaPagamento
			{
				Data = DateTime.FromOADate(FormaRec.Data),
				Descricao = FromUTF8(FormaRec.Descricao),
				Indice = FromUTF8(FormaRec.Indice),
				PermiteVinculado = FormaRec.PermiteVinculado,
				TipoDoc = FromUTF8(FormaRec.TipoDoc),
				Total = Convert.ToDecimal(FormaRec.Total)
			};

			var count = GetInt32(ACBrECFInterop.ECF_GetFPGCount);
			CheckResult(count);
			CarregaFormasPagamento(count);
			return Forma;
		}

		public void CarregaFormasPagamento()
		{
			var count = ACBrECFInterop.ECF_CarregaFormasPagamento(Handle);
			CheckResult(count);

			CarregaFormasPagamento(count);
		}

		private void CarregaFormasPagamento(int count)
		{
			formasPagamento = new FormaPagamento[count];
			for (var i = 0; i < count; i++)
			{
				var record = new ACBrECFInterop.FormaPagamentoRec();
				var ret = ACBrECFInterop.ECF_GetFormaPagamento(Handle, ref record, i);
				CheckResult(ret);

				var formaPagamento = new FormaPagamento
				{
					Indice = FromUTF8(record.Indice),
					Descricao = FromUTF8(record.Descricao),
					PermiteVinculado = record.PermiteVinculado,
					Total = Convert.ToDecimal(record.Total),
					Data = DateTime.FromOADate(record.Data),
					TipoDoc = FromUTF8(record.TipoDoc)
				};

				formasPagamento[i] = formaPagamento;
			}
		}

		public void LerTotaisFormaPagamento()
		{
			var count = ACBrECFInterop.ECF_LerTotaisFormaPagamento(Handle);
			CheckResult(count);

			CarregaFormasPagamento(count);
		}

		public void ProgramaFormaPagamento(string descricao, bool permiteVinculado, string posicao = "")
		{
			var ret = ACBrECFInterop.ECF_ProgramaFormaPagamento(Handle, ToUTF8(descricao), permiteVinculado,
				ToUTF8(posicao));
			CheckResult(ret);
		}

		#endregion Formas de Pagto

		#region Suprimento e Sangria

		public void Suprimento([MarshalAs(UnmanagedType.Currency)] decimal valor, string obs,
			string DescricaoCNF = "SUPRIMENTO", string DescricaoFPG = "DINHEIRO", int indicebmp = 0)
		{
			var ret = ACBrECFInterop.ECF_Suprimento(Handle, (double)valor, ToUTF8(obs), ToUTF8(DescricaoCNF),
				ToUTF8(DescricaoFPG), indicebmp);
			CheckResult(ret);
		}

		public void Sangria([MarshalAs(UnmanagedType.Currency)] decimal valor, string obs,
			string DescricaoCNF = "SANGRIA", string DescricaoFPG = "DINHEIRO", int indicebmp = 0)
		{
			var ret = ACBrECFInterop.ECF_Sangria(Handle, (double)valor, ToUTF8(obs), ToUTF8(DescricaoCNF),
				ToUTF8(DescricaoFPG), indicebmp);
			CheckResult(ret);
		}

		#endregion Suprimento e Sangria

		#region Gaveta

		public void AbreGaveta()
		{
			var ret = ACBrECFInterop.ECF_AbreGaveta(Handle);
			CheckResult(ret);
		}

		#endregion Gaveta

		#region Programação

		public void IdentificaPAF(string nomeVersao, string md5)
		{
			var ret = ACBrECFInterop.ECF_IdentificaPAF(Handle, ToUTF8(nomeVersao), ToUTF8(md5));
			CheckResult(ret);
		}

		#endregion Programação

		#region Override Methods

		protected internal override void OnInitialize()
		{
			CallCreate(ACBrECFInterop.ECF_Create);
			Device = new ACBrDevice(this);
			InfoRodapeCupom = new Rodape(this);
			ConfigBarras = new ConfigBarras(this);
			Consumidor = new Consumidor(this);
			DadosReducaoZClass = new DadosReducaoZClass(this);
		}

		protected internal override void CheckResult(int ret)
		{
			switch (ret)
			{
				case -1:

					var error = GetString(ACBrECFInterop.ECF_GetUltimoErro);
					throw new ACBrException(error);

				case -2:

					throw new ACBrException("ACBr ECF não inicializado.");
			}
		}

		protected override void OnDisposing()
		{
			if (Handle != IntPtr.Zero)
			{
				if (Ativo) Desativar();

				if (rfd != null)
				{
					if (rfd.Ativo) rfd.Desativar();

					var orfd = rfd;
					rfd = null;

					if (orfd.ECF != null) orfd.ECF = null;
				}

				CallDestroy(ACBrECFInterop.ECF_Destroy);
			}
		}

		#endregion Override Methods

		#region Callback EventHandlers

		[AllowReversePInvokeCalls]
		private void OnMsgPoucoPapelCallback()
		{
			if (onMsgPoucoPapel.IsAssigned)
			{
				onMsgPoucoPapel.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAguardandoRespostaChangeCallback()
		{
			if (onAguardandoRespostaChange.IsAssigned)
			{
				onAguardandoRespostaChange.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesAbreCupomCallback(string CPF_CNPJ, string Nome, string Endereco)
		{
			if (onAntesAbreCupom.IsAssigned)
			{
				var e = new AbreCupomEventArgs(FromUTF8(CPF_CNPJ), FromUTF8(Nome), FromUTF8(Endereco));
				onAntesAbreCupom.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesAbreCupomVinculadoCallback()
		{
			if (onAntesAbreCupomVinculado.IsAssigned)
			{
				onAntesAbreCupomVinculado.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesAbreNaoFiscalCallback(string CPF_CNPJ, string Nome, string Endereco)
		{
			if (onAntesAbreNaoFiscal.IsAssigned)
			{
				var e = new AbreCupomEventArgs(FromUTF8(CPF_CNPJ), FromUTF8(Nome), FromUTF8(Endereco));
				onAntesAbreNaoFiscal.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesAbreRelatorioGerencialCallback(int Indice)
		{
			if (onAntesAbreRelatorioGerencial.IsAssigned)
			{
				var e = new RelatorioGerencialEventArgs(Indice);
				onAntesAbreRelatorioGerencial.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesCancelaCupomCallback()
		{
			if (onAntesCancelaCupom.IsAssigned)
			{
				onAntesCancelaCupom.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesCancelaItemNaoFiscalCallback(int NumItem)
		{
			if (onAntesCancelaItemNaoFiscal.IsAssigned)
			{
				var e = new CancelaItemEventArgs(NumItem);
				onAntesCancelaItemNaoFiscal.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesCancelaItemVendidoCallback(int NumItem)
		{
			if (onAntesCancelaItemVendido.IsAssigned)
			{
				var e = new CancelaItemEventArgs(NumItem);
				onAntesCancelaItemVendido.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesCancelaNaoFiscalCallback()
		{
			if (onAntesCancelaNaoFiscal.IsAssigned)
			{
				onAntesCancelaNaoFiscal.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesEfetuaPagamentoCallback(string CodFormaPagto, double Valor, string Observacao,
			bool ImprimeVinculado)
		{
			if (onAntesEfetuaPagamento.IsAssigned)
			{
				var e = new EfetuaPagamentoEventArgs(FromUTF8(CodFormaPagto),
					Convert.ToDecimal(Valor), FromUTF8(Observacao), ImprimeVinculado);
				onAntesEfetuaPagamento.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesEfetuaPagamentoNaoFiscalCallback(string CodFormaPagto, double Valor, string Observacao,
			bool ImprimeVinculado)
		{
			if (onAntesEfetuaPagamentoNaoFiscal.IsAssigned)
			{
				var e = new EfetuaPagamentoEventArgs(FromUTF8(CodFormaPagto),
					Convert.ToDecimal(Valor), FromUTF8(Observacao), ImprimeVinculado);
				onAntesEfetuaPagamentoNaoFiscal.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesFechaCupomCallback(string Observacao, int IndiceBMP)
		{
			if (onAntesFechaCupom.IsAssigned)
			{
				var e = new FechaCupomEventArgs(FromUTF8(Observacao), IndiceBMP);
				onAntesFechaCupom.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesFechaNaoFiscalCallback(string Observacao, int IndiceBMP)
		{
			if (onAntesFechaNaoFiscal.IsAssigned)
			{
				var e = new FechaCupomEventArgs(FromUTF8(Observacao), IndiceBMP);
				onAntesFechaNaoFiscal.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesFechaRelatorioCallback()
		{
			if (onAntesFechaRelatorio.IsAssigned)
			{
				onAntesFechaRelatorio.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesLeituraXCallback()
		{
			if (onAntesLeituraX.IsAssigned)
			{
				onAntesLeituraX.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesReducaoZCallback()
		{
			if (onAntesReducaoZ.IsAssigned)
			{
				onAntesReducaoZ.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesSangriaCallback(double Valor, string Obs, string DescricaoCNF, string DescricaoFPG)
		{
			if (onAntesSangria.IsAssigned)
			{
				var e = new SangriaSuprimentoEventArgs(Convert.ToDecimal(Valor), FromUTF8(Obs),
					FromUTF8(DescricaoCNF), FromUTF8(DescricaoFPG));
				onAntesSangria.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesSubtotalizaCupomCallback(double DescontoAcrescimo, string MensagemRodape)
		{
			if (onAntesSubtotalizaCupom.IsAssigned)
			{
				var e = new SubtotalizaCupomEventArgs(Convert.ToDecimal(DescontoAcrescimo),
					FromUTF8(MensagemRodape));
				onAntesSubtotalizaCupom.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesSubtotalizaNaoFiscalCallback(double DescontoAcrescimo, string MensagemRodape)
		{
			if (onAntesSubtotalizaNaoFiscal.IsAssigned)
			{
				var e = new SubtotalizaCupomEventArgs(Convert.ToDecimal(DescontoAcrescimo),
					FromUTF8(MensagemRodape));
				onAntesSubtotalizaNaoFiscal.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesSuprimentoCallback(double Valor, string Obs, string DescricaoCNF, string DescricaoFPG)
		{
			if (onAntesSuprimento.IsAssigned)
			{
				var e = new SangriaSuprimentoEventArgs(Convert.ToDecimal(Valor), FromUTF8(Obs),
					FromUTF8(DescricaoCNF), FromUTF8(DescricaoFPG));
				onAntesSuprimento.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnAntesVendeItemCallback(string Codigo, string Descricao, string AliquotaICMS,
			double Qtd, double ValorUnitario, double ValorDescontoAcrescimo, string Unidade,
			string TipoDescontoAcrescimo, string DescontoAcrescimo)
		{
			if (onAntesVendeItem.IsAssigned)
			{
				var e = new VendeItemEventArgs(FromUTF8(Codigo), FromUTF8(Descricao),
					FromUTF8(AliquotaICMS),
					Convert.ToDecimal(Qtd), Convert.ToDecimal(ValorUnitario), Convert.ToDecimal(ValorDescontoAcrescimo),
					FromUTF8(Unidade),
					FromUTF8(TipoDescontoAcrescimo), FromUTF8(DescontoAcrescimo));
				onAntesVendeItem.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnBobinaAdicionaLinhasCallback(string Linhas, string Operacao)
		{
			if (onBobinaAdicionaLinhas.IsAssigned)
			{
				var e = new BobinaAdicionaLinhasEventArgs(FromUTF8(Linhas), FromUTF8(Operacao));
				onBobinaAdicionaLinhas.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnChangeEstadoCallback(int EstadoAnterior, int EstadoAtual)
		{
			if (onChangeEstado.IsAssigned)
			{
				var e = new ChangeEstadoEventArgs((EstadoECF)EstadoAnterior, (EstadoECF)EstadoAtual);
				onChangeEstado.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private bool OnChequeEstadoCallback(int EstadoAtual)
		{
			var e = new ChequeEstadoEventArgs((CHQEstado)EstadoAtual);

			if (onChequeEstado.IsAssigned)
				onChequeEstado.Raise(e);

			return e.Continuar;
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisAbreCupomCallback(string CPF_CNPJ, string Nome, string Endereco)
		{
			if (onDepoisAbreCupom.IsAssigned)
			{
				var e = new AbreCupomEventArgs(FromUTF8(CPF_CNPJ), FromUTF8(Nome), FromUTF8(Endereco));
				onDepoisAbreCupom.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisAbreCupomVinculadoCallback()
		{
			if (onDepoisAbreCupomVinculado.IsAssigned)
			{
				onDepoisAbreCupomVinculado.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisAbreNaoFiscalCallback(string CPF_CNPJ, string Nome, string Endereco)
		{
			if (onDepoisAbreNaoFiscal.IsAssigned)
			{
				var e = new AbreCupomEventArgs(FromUTF8(CPF_CNPJ), FromUTF8(Nome), FromUTF8(Endereco));
				onDepoisAbreNaoFiscal.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisAbreRelatorioGerencialCallback(int Indice)
		{
			if (onDepoisAbreRelatorioGerencial.IsAssigned)
			{
				var e = new RelatorioGerencialEventArgs(Indice);
				onDepoisAbreRelatorioGerencial.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisCancelaCupomCallback()
		{
			if (onDepoisCancelaCupom.IsAssigned)
			{
				onDepoisCancelaCupom.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisCancelaItemNaoFiscalCallback(int NumItem)
		{
			if (onDepoisCancelaItemNaoFiscal.IsAssigned)
			{
				var e = new CancelaItemEventArgs(NumItem);
				onDepoisCancelaItemNaoFiscal.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisCancelaItemVendidoCallback(int NumItem)
		{
			if (onDepoisCancelaItemVendido.IsAssigned)
			{
				var e = new CancelaItemEventArgs(NumItem);
				onDepoisCancelaItemVendido.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisCancelaNaoFiscalCallback()
		{
			if (onDepoisCancelaNaoFiscal.IsAssigned)
			{
				onDepoisCancelaNaoFiscal.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisEfetuaPagamentoCallback(string CodFormaPagto, double Valor, string Observacao,
			bool ImprimeVinculado)
		{
			if (onDepoisEfetuaPagamento.IsAssigned)
			{
				var e = new EfetuaPagamentoEventArgs(FromUTF8(CodFormaPagto),
					Convert.ToDecimal(Valor), FromUTF8(Observacao), ImprimeVinculado);
				onDepoisEfetuaPagamento.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisEfetuaPagamentoNaoFiscalCallback(string CodFormaPagto, double Valor, string Observacao,
			bool ImprimeVinculado)
		{
			if (onDepoisEfetuaPagamentoNaoFiscal.IsAssigned)
			{
				var e = new EfetuaPagamentoEventArgs(FromUTF8(CodFormaPagto),
					Convert.ToDecimal(Valor), FromUTF8(Observacao), ImprimeVinculado);
				onDepoisEfetuaPagamentoNaoFiscal.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisFechaCupomCallback(string Observacao, int IndiceBMP)
		{
			if (onDepoisFechaCupom.IsAssigned)
			{
				var e = new FechaCupomEventArgs(FromUTF8(Observacao), IndiceBMP);
				onDepoisFechaCupom.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisFechaNaoFiscalCallback(string Observacao, int IndiceBMP)
		{
			if (onDepoisFechaNaoFiscal.IsAssigned)
			{
				var e = new FechaCupomEventArgs(FromUTF8(Observacao), IndiceBMP);
				onDepoisFechaNaoFiscal.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisFechaRelatorioCallback()
		{
			if (onDepoisFechaRelatorio.IsAssigned)
			{
				onDepoisFechaRelatorio.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisLeituraXCallback()
		{
			if (onDepoisLeituraX.IsAssigned)
			{
				onDepoisLeituraX.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisReducaoZCallback()
		{
			if (onDepoisReducaoZ.IsAssigned)
			{
				onDepoisReducaoZ.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisSangriaCallback(double Valor, string Obs, string DescricaoCNF, string DescricaoFPG)
		{
			if (onDepoisSangria.IsAssigned)
			{
				var e = new SangriaSuprimentoEventArgs(Convert.ToDecimal(Valor), FromUTF8(Obs),
					FromUTF8(DescricaoCNF), FromUTF8(DescricaoFPG));
				onDepoisSangria.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisSubtotalizaCupomCallback(double DescontoAcrescimo, string MensagemRodape)
		{
			if (onDepoisSubtotalizaCupom.IsAssigned)
			{
				var e = new SubtotalizaCupomEventArgs(Convert.ToDecimal(DescontoAcrescimo),
					FromUTF8(MensagemRodape));
				onDepoisSubtotalizaCupom.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisSubtotalizaNaoFiscalCallback(double DescontoAcrescimo, string MensagemRodape)
		{
			if (onDepoisSubtotalizaNaoFiscal.IsAssigned)
			{
				var e = new SubtotalizaCupomEventArgs(Convert.ToDecimal(DescontoAcrescimo),
					FromUTF8(MensagemRodape));
				onDepoisSubtotalizaNaoFiscal.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisSuprimentoCallback(double Valor, string Obs, string DescricaoCNF, string DescricaoFPG)
		{
			if (onDepoisSuprimento.IsAssigned)
			{
				var e = new SangriaSuprimentoEventArgs(Convert.ToDecimal(Valor), FromUTF8(Obs),
					FromUTF8(DescricaoCNF), FromUTF8(DescricaoFPG));
				onDepoisSuprimento.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private void OnDepoisVendeItemCallback(string Codigo, string Descricao, string AliquotaICMS,
			double Qtd, double ValorUnitario, double ValorDescontoAcrescimo, string Unidade,
			string TipoDescontoAcrescimo, string DescontoAcrescimo)
		{
			if (onDepoisVendeItem.IsAssigned)
			{
				var e = new VendeItemEventArgs(FromUTF8(Codigo), FromUTF8(Descricao),
					FromUTF8(AliquotaICMS),
					Convert.ToDecimal(Qtd), Convert.ToDecimal(ValorUnitario), Convert.ToDecimal(ValorDescontoAcrescimo),
					FromUTF8(Unidade),
					FromUTF8(TipoDescontoAcrescimo), FromUTF8(DescontoAcrescimo));
				onDepoisVendeItem.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorAbreCupomCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorAbreCupom.IsAssigned)
				onErrorAbreCupom.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorAbreCupomVinculadoCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorAbreCupomVinculado.IsAssigned)
				onErrorAbreCupomVinculado.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorAbreNaoFiscalCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorAbreNaoFiscal.IsAssigned)
				onErrorAbreNaoFiscal.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorAbreRelatorioGerencialCallback(int Indice)
		{
			var e = new ErrorRelatorioEventArgs(Indice);

			if (onErrorAbreRelatorioGerencial.IsAssigned)
				onErrorAbreRelatorioGerencial.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorCancelaCupomCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorCancelaCupom.IsAssigned)
				onErrorCancelaCupom.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorCancelaItemNaoFiscalCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorCancelaItemNaoFiscal.IsAssigned)
				onErrorCancelaItemNaoFiscal.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorCancelaItemVendidoCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorCancelaItemVendido.IsAssigned)
				onErrorCancelaItemVendido.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorCancelaNaoFiscalCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorCancelaNaoFiscal.IsAssigned)
				onErrorCancelaNaoFiscal.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorEfetuaPagamentoCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorEfetuaPagamento.IsAssigned)
				onErrorEfetuaPagamento.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorEfetuaPagamentoNaoFiscalCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorEfetuaPagamentoNaoFiscal.IsAssigned)
				onErrorEfetuaPagamentoNaoFiscal.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorFechaCupomCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorFechaCupom.IsAssigned)
				onErrorFechaCupom.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorFechaNaoFiscalCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorFechaNaoFiscal.IsAssigned)
				onErrorFechaNaoFiscal.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorFechaRelatorioCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorFechaRelatorio.IsAssigned)
				onErrorFechaRelatorio.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorLeituraXCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorLeituraX.IsAssigned)
				onErrorLeituraX.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorReducaoZCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorReducaoZ.IsAssigned)
				onErrorReducaoZ.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorSangriaCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorSangria.IsAssigned)
				onErrorSangria.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private void OnErrorSemPapelCallback()
		{
			if (onErrorSemPapel.IsAssigned)
				onErrorSemPapel.Raise();
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorSubtotalizaCupomCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorSubtotalizaCupom.IsAssigned)
				onErrorSubtotalizaCupom.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorSubtotalizaNaoFiscalCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorSubtotalizaNaoFiscal.IsAssigned)
				onErrorSubtotalizaNaoFiscal.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorSuprimentoCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorSuprimento.IsAssigned)
				onErrorSuprimento.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private bool OnErrorVendeItemCallback()
		{
			var e = new ErrorEventArgs();

			if (onErrorVendeItem.IsAssigned)
				onErrorVendeItem.Raise(e);

			return e.Tratado;
		}

		[AllowReversePInvokeCalls]
		private void OnMsgAguardeCallback(string mensagem)
		{
			if (onMsgAguarde.IsAssigned)
			{
				var e = new MsgEventArgs(FromUTF8(mensagem));
				onMsgAguarde.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private bool OnMsgRetentarCallback(string mensagem, string situacao)
		{
			var e = new MsgRetentarEventArgs(FromUTF8(mensagem), FromUTF8(situacao));

			if (onMsgRetentar.IsAssigned)
				onMsgRetentar.Raise(e);

			return e.Result;
		}

		[AllowReversePInvokeCalls]
		private void OnPAFCalcEADCallback(string arquivo)
		{
			if (onPAFCalcEAD.IsAssigned)
			{
				var e = new PAFCalcEADEventArgs(FromUTF8(arquivo));
				onPAFCalcEAD.Raise(e);
			}
		}

		[AllowReversePInvokeCalls]
		private string OnPAFGetKeyRSACallback()
		{
			var e = new ChaveEventArgs();

			if (onPAFGetKeyRSA.IsAssigned)
				onPAFGetKeyRSA.Raise(e);

			return ToUTF8(e.Chave);
		}

		#endregion Callback EventHandlers

		#endregion Methods
	}
}