using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Text;

namespace ACBrFramework.EAD
{
	#region COM Interop

	/* NOTAS para COM INTEROP
	 * H? um modo de compila??o com a diretiva COM_INTEROP que inseri atributos e c?digo espec?fico
	 * para a DLL ser exportada para COM (ActiveX)
	 *
	 * O modelo COM possui alguma limita??es/diferen?as em rela??o ao modelo .NET
	 * Inserir os #if COM_INTEROP para prover implementa??es distintas nas modifica??es necess?rias para COM:
	 *
	 * - Inserir atributos ComVisible(true), Guid("xxx") e ClassInterface(ClassInterfaceType.AutoDual) em todas as classes envolvidas
	 *
	 * - Propriedades/m?todos que usam "Decimal" devem incluir o atributo MarshalAs(UnmanagedType.Currency)
	 *   usar [return: ...] para retornos de m?todos e propriedades ou [param: ...] para o set de propriedades
	 *
	 * - M?todos que recebem array como par?metros devem fazer como "ref".
	 *   Propriedades s? podem retornar arrays, nunca receber.
	 *
	 * - Overload n?o ? permitido. M?todos com mesmos nomes devem ser renomeados.
	 *   ? poss?vel usar par?metros default, simplificando a necessidade de Overload
	 *
	 * - Generic n?o deve ser usado. Todas as classes Generic devem ser re-escritas como classes espec?ficas
	 *
	 * - Eventos precisam de uma Interface com as declara??es dos m?todos (eventos) com o atributo [InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
	 *   A classe que declara os eventos precisa do atributo [ComSourceInterfaces(typeof(INomeDaInterface))]
	 *   Nenhum delegate dever? ser Generic, precisam ser re-escritos.
	 *
	 *   OBS: Por padr?o o modelo .Net recebe os eventos com a assinatura void(object sender, EventArgs e)
	 *   O modelo COM n?o precisa desses par?metros. Assim o delegate EventHandler foi redefinido para uma assinatura void()
	 *   Outros EventArgs devem seguir a assitarua COM void(MyEventArg e) ao inv?s da assinatura .NET void(object sender, MyEventArgs e)
	 * */

#if COM_INTEROP

	#region IDispatch Interface

	#region Documentation

	/// <summary>
	/// Interface contendo os eventos publicados pelo componente COM
	/// </summary>

	#endregion Documentation

	[ComVisible(true)]
	[Guid("566764AC-08FC-4946-81A6-CBDA2BEB5801")]
	[InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
	public interface IACBrEADEvents
	{
		[DispId(1)]
		void OnGetChavePublica(ChaveEventArgs e);

		[DispId(2)]
		void OnGetChavePrivada(ChaveEventArgs e);
	}

	#endregion IDispatch Interface

	#region Delegates

	#region Comments

	///os componentes COM n?o suportam Generics
	///Estas s?o implementa??es espec?ficas de delegates que no .Net s?o representados como EventHandler<T>

	#endregion Comments

	public delegate void ChaveEventHandler(ChaveEventArgs e);

	#endregion Delegates

#endif

	#endregion COM Interop

	#region COM Interop Attributes

#if COM_INTEROP

	[ComVisible(true)]
	[Guid("E694C7C6-5C00-4F73-B091-6CF27AAD0682")]
	[ComSourceInterfaces(typeof(IACBrEADEvents))]
	[ClassInterface(ClassInterfaceType.AutoDual)]
#endif

	#endregion COM Interop Attributes

	[ToolboxBitmap(typeof(ToolboxIcons), @"ACBrFramework.EAD.ico.bmp")]
	public class ACBrEAD : ACBrComponent, IDisposable
	{
		#region Events

#if COM_INTEROP

		public event ChaveEventHandler OnGetChavePublica
#else

		public event EventHandler<ChaveEventArgs> OnGetChavePublica
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
			[ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add
			{
				onGetChavePublica.Add(value);
			}

			#region COM_INTEROP

#if COM_INTEROP
			[ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove
			{
				onGetChavePublica.Remove(value);
			}
		}

#if COM_INTEROP

		public event ChaveEventHandler OnGetChavePrivada
#else

		public event EventHandler<ChaveEventArgs> OnGetChavePrivada
#endif
		{
			#region COM_INTEROP

#if COM_INTEROP
			[ComVisible(false)]
#endif

			#endregion COM_INTEROP

			add
			{
				onGetChavePrivada.Add(value);
			}

			#region COM_INTEROP

#if COM_INTEROP
			[ComVisible(false)]
#endif

			#endregion COM_INTEROP

			remove
			{
				onGetChavePrivada.Remove(value);
			}
		}

		#endregion Events

		#region Fields

		private readonly ACBrEventHandler<ChaveEventArgs, ACBrEADInterop.GetChavePublicaCallback> onGetChavePublica;
		private readonly ACBrEventHandler<ChaveEventArgs, ACBrEADInterop.GetChavePrivadaCallback> onGetChavePrivada;

		#endregion Fields

		#region Constructor

		public ACBrEAD()
		{
			onGetChavePrivada = new ACBrEventHandler<ChaveEventArgs, ACBrEADInterop.GetChavePrivadaCallback>(this, OnGetChavePrivadaCallBack, ACBrEADInterop.EAD_SetOnGetChavePrivada);
			onGetChavePublica = new ACBrEventHandler<ChaveEventArgs, ACBrEADInterop.GetChavePublicaCallback>(this, OnGetChavePublicaCallBack, ACBrEADInterop.EAD_SetOnGetChavePublica);
		}

		#endregion Constructor

		#region Properties

		[Category("Geral")]
		public string OpenSSL_Version
		{
			get
			{
				return GetString(ACBrEADInterop.EAD_GetOpenSSL_Version);
			}
		}

		[Category("Geral")]
		public string About
		{
			get
			{
				return GetAbout(ACBrEADInterop.EAD_GetAbout);
			}
		}

		#endregion Properties

		#region Methods

		#region Fun??es

		public void GerarChaves(out string ChavePublica, out string ChavePrivada)
		{
			const int BUFFER_LEN = 1024;
			var ChavePUB = new StringBuilder(BUFFER_LEN);
			var ChavePRI = new StringBuilder(BUFFER_LEN);

			var ret = ACBrEADInterop.EAD_GerarChaves(this.Handle, ChavePUB, ChavePRI, BUFFER_LEN);
			CheckResult(ret);

			ChavePublica = FromUTF8(ChavePUB);
			ChavePrivada = FromUTF8(ChavePRI);
		}

		public void CalcularModuloeExpoente(out string Modulo, out string Expoente)
		{
			const int BUFFER_LEN = 1024;
			var Mod = new StringBuilder(BUFFER_LEN);
			var Expo = new StringBuilder(BUFFER_LEN);

			var ret = ACBrEADInterop.EAD_CalcularModuloeExpoente(this.Handle, Mod, Expo, BUFFER_LEN);
			CheckResult(ret);

			Modulo = FromUTF8(Mod);
			Expoente = FromUTF8(Expo);
		}

		public void GerarXMLeECFc(string NomeSH)
		{
			GerarXMLeECFc(ToUTF8(NomeSH), null);
		}

		public void GerarXMLeECFc(string NomeSH, string CaminhoArquivo)
		{
			var ret = ACBrEADInterop.EAD_GerarXMLeECFc(this.Handle, ToUTF8(NomeSH), ToUTF8(CaminhoArquivo));
			CheckResult(ret);
		}

		public string ConverteXMLeECFcParaOpenSSL(string Arquivo)
		{
			const int BUFFER_LEN = 512;
			var ChavePUB = new StringBuilder(BUFFER_LEN);
			var ret = ACBrEADInterop.EAD_ConverteXMLeECFcParaOpenSSL(this.Handle, ToUTF8(Arquivo), ChavePUB, BUFFER_LEN);
			CheckResult(ret);
			return ChavePUB.ToString();
		}

		public string CalcularHashArquivo(string Arquivo, EADDigest HashType)
		{
			const int BUFFER_LEN = 128;
			var Hash = new StringBuilder(BUFFER_LEN);
			var ret = ACBrEADInterop.EAD_CalcularHashArquivo(Handle, ToUTF8(Arquivo), (int)HashType, Hash, BUFFER_LEN);
			CheckResult(ret);
			return Hash.ToString();
		}

		#region COM_INTEROP

#if COM_INTEROP

		[ComVisible(false)]
#endif

		#endregion COM_INTEROP

		public List<string> CalcularHash(List<string> Astring, EADDigest HashType)
		{
			var retorno = new List<string>();
			retorno.AddRange(CalcularHash(Astring.ToArray(), HashType));
			return retorno;
		}

		public string[] CalcularHash(string[] AString, EADDigest HashType)
		{
			var Retorno = new string[AString.Length];

			for (var i = 0; i < AString.Length; i++)
			{
				Retorno[i] = CalcularHash(AString[i], HashType);
			}

			return Retorno;
		}

		public string CalcularHash(string AString, EADDigest HashType)
		{
			const int BUFFER_LEN = 128;
			var Hash = new StringBuilder(BUFFER_LEN);
			var ret = ACBrEADInterop.EAD_CalcularHash(Handle, ToUTF8(AString), (int)HashType, Hash, BUFFER_LEN);
			CheckResult(ret);
			return Hash.ToString();
		}

		public string CalcularEADArquivo(string Arquivo)
		{
			const int BUFFER_LEN = 256;
			var EAD = new StringBuilder(BUFFER_LEN);
			var ret = ACBrEADInterop.EAD_CalcularEADArquivo(Handle, ToUTF8(Arquivo), EAD, BUFFER_LEN);
			CheckResult(ret);
			return EAD.ToString();
		}

		#region COM_INTEROP

#if COM_INTEROP

		[ComVisible(false)]
#endif

		#endregion COM_INTEROP

		public string CalcularEAD(List<string> AString)
		{
			return CalcularEAD(AString.ToArray());
		}

		public string CalcularEAD(string[] AString)
		{
			const int BUFFER_LEN = 256;
			var EAD = new StringBuilder(BUFFER_LEN);
			var ret = ACBrEADInterop.EAD_CalcularEAD(Handle, ToUTF8(AString), EAD, BUFFER_LEN);
			CheckResult(ret);
			return EAD.ToString();
		}

		public string CalcularChavePublica()
		{
			const int BUFFER_LEN = 512;
			var ChavePUB = new StringBuilder(BUFFER_LEN);
			var ret = ACBrEADInterop.EAD_CalcularChavePublica(this.Handle, ChavePUB, BUFFER_LEN);
			CheckResult(ret);
			return ChavePUB.ToString();
		}

		public string AssinarArquivoComEAD(string Arquivo, bool Remover)
		{
			const int BUFFER_LEN = 256;
			var EAD = new StringBuilder(BUFFER_LEN);
			var ret = ACBrEADInterop.EAD_AssinarArquivoComEAD(this.Handle, ToUTF8(Arquivo), Remover, EAD, BUFFER_LEN);
			CheckResult(ret);
			return EAD.ToString();
		}

		public bool VerificarEADArquivo(string Arquivo)
		{
			var ret = ACBrEADInterop.EAD_VerificarEADArquivo(this.Handle, ToUTF8(Arquivo));
			CheckResult(ret);

			return Convert.ToBoolean(ret);
		}

		public bool VerificarEAD(string AString)
		{
			var ret = ACBrEADInterop.EAD_VerificarEAD(this.Handle, ToUTF8(AString));
			CheckResult(ret);

			return Convert.ToBoolean(ret);
		}

		public void RemoveEADArquivo(string Arquivo)
		{
			var ret = ACBrEADInterop.EAD_RemoveEADArquivo(Handle, ToUTF8(Arquivo));
			CheckResult(ret);
		}

		public string MD5FromFile(string Arquivo)
		{
			const int BUFFER_LEN = 256;
			var MD5 = new StringBuilder(BUFFER_LEN);
			var ret = ACBrEADInterop.EAD_MD5FromFile(Handle, ToUTF8(Arquivo), MD5, BUFFER_LEN);
			CheckResult(ret);
			return MD5.ToString();
		}

		public string MD5FromString(string AString)
		{
			const int BUFFER_LEN = 256;
			var MD5 = new StringBuilder(BUFFER_LEN);
			var ret = ACBrEADInterop.EAD_MD5FromString(Handle, ToUTF8(AString), MD5, BUFFER_LEN);
			CheckResult(ret);
			return MD5.ToString();
		}

		#endregion Fun??es

		#region EventHandlers

		[AllowReversePInvokeCalls]
		private string OnGetChavePublicaCallBack()
		{
			var e = new ChaveEventArgs();

			if (onGetChavePublica.IsAssigned)
				onGetChavePublica.Raise(e);

			return e.Chave;
		}

		[AllowReversePInvokeCalls]
		private string OnGetChavePrivadaCallBack()
		{
			var e = new ChaveEventArgs();

			if (onGetChavePrivada.IsAssigned)
				onGetChavePrivada.Raise(e);

			return e.Chave;
		}

		#endregion EventHandlers

		#region Override Methods

		protected internal override void OnInitialize()
		{
			CallCreate(ACBrEADInterop.EAD_Create);
		}

		protected internal override void CheckResult(int ret)
		{
			switch (ret)
			{
				case -1:

					var error = GetString(ACBrEADInterop.EAD_GetUltimoErro);
					throw new ACBrException(error);

				case -2:

					throw new ACBrException("ACBr EAD n?o inicializado.");
			}
		}

		protected override void OnDisposing()
		{
			if (this.Handle != IntPtr.Zero)
			{
				CallDestroy(ACBrEADInterop.EAD_Destroy);
			}
		}

		#endregion Override Methods

		#endregion Methods
	}
}