using System;
using System.ComponentModel;
using System.Drawing;
using System.Runtime.InteropServices;

namespace ACBrFramework.CEP
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
	[Guid("2AE56737-2137-46F7-9FCA-A97B7864D6EA")]
	[InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
	public interface IACBrCEPEvents
	{
		[DispId(1)]
		void OnBuscaEfetuada();

		[DispId(2)]
		void OnAntesAbrirHTTP(AntesAbrirHTTPEventArgs e);
	}

	#endregion IDispatch Interface

	#region Delegates

	#region Comments

	///os componentes COM não suportam Generics
	///Estas são implementações específicas de delegates que no .Net são representados como EventHandler<T>

	#endregion Comments

	public delegate void OnAntesAbrirHTTPEventHandler(AntesAbrirHTTPEventArgs e);

	#endregion Delegates

#endif

	#endregion COM Interop

	#region COM Interop Attributes

#if COM_INTEROP

	[ComVisible(true)]
	[Guid("7133AB1C-B5E8-4EF0-8432-3DD0F083E56A")]
	[ComSourceInterfaces(typeof(IACBrCEPEvents))]
	[ClassInterface(ClassInterfaceType.AutoDual)]
#endif

	#endregion COM Interop Attributes

	[ToolboxBitmap(typeof(ToolboxIcons), @"ACBrFramework.CEP.ico.bmp")]
	public class ACBrCEP : ACBrComponent, IDisposable
	{
		#region Events

#if COM_INTEROP

		public event EventHandler OnBuscaEfetuada
#else

		public event EventHandler<EventArgs> OnBuscaEfetuada
#endif
		{
			add
			{
				onBuscaEfetuada.Add(value);
			}
			remove
			{
				onBuscaEfetuada.Remove(value);
			}
		}

#if COM_INTEROP

		public event OnAntesAbrirHTTPEventHandler OnAntesAbrirHTTP
#else

		public event EventHandler<AntesAbrirHTTPEventArgs> OnAntesAbrirHTTP
#endif

		{
			add
			{
				onAntesAbrirHTTP.Add(value);
			}
			remove
			{
				onAntesAbrirHTTP.Remove(value);
			}
		}

		#endregion Events

		#region Fields

		private Enderecos enderecos;
		private readonly ACBrEventHandler<ACBrCEPInterop.NoArgumentCallback> onBuscaEfetuada;
		private readonly ACBrEventHandler<AntesAbrirHTTPEventArgs, ACBrCEPInterop.AntesAbrirHTTPCallback> onAntesAbrirHTTP;

		#endregion Fields

		#region Constructor

		public ACBrCEP()
		{
			onBuscaEfetuada = new ACBrEventHandler<ACBrCEPInterop.NoArgumentCallback>(this, OnBuscaEfetuadaCallback, ACBrCEPInterop.CEP_SetOnBuscaEfetuada);
			onAntesAbrirHTTP = new ACBrEventHandler<AntesAbrirHTTPEventArgs, ACBrCEPInterop.AntesAbrirHTTPCallback>(this, OnAntesAbrirHTTPCallback, ACBrCEPInterop.CEP_SetOnAntesAbrirHTTP);
		}

		#endregion Constructor

		#region Properties

		[Category("Dados de Acesso")]
		public string ChaveAcesso
		{
			get
			{
				return GetString(ACBrCEPInterop.CEP_GetChaveAcesso);
			}
			set
			{
				SetString(ACBrCEPInterop.CEP_SetChaveAcesso, value);
			}
		}

		[Category("Dados de Acesso")]
		public string Usuario
		{
			get
			{
				return GetString(ACBrCEPInterop.CEP_GetUsuario);
			}
			set
			{
				SetString(ACBrCEPInterop.CEP_SetUsuario, value);
			}
		}

		[Category("Dados de Acesso")]
		public string Senha
		{
			get
			{
				return GetString(ACBrCEPInterop.CEP_GetSenha);
			}
			set
			{
				SetString(ACBrCEPInterop.CEP_SetSenha, value);
			}
		}

		[Category("Geral")]
		public string URL
		{
			get
			{
				return GetString(ACBrCEPInterop.CEP_GetURL);
			}
		}

		[Category("Geral")]
		public CEPWebService WebService
		{
			get
			{
				return (CEPWebService)GetInt32(ACBrCEPInterop.CEP_GetWebService);
			}
			set
			{
				SetInt32(ACBrCEPInterop.CEP_SetWebService, (int)value);
			}
		}

		[Category("Geral")]
		public bool ParseText
		{
			get
			{
				return GetBool(ACBrCEPInterop.CEP_GetParseText);
			}
			set
			{
				SetBool(ACBrCEPInterop.CEP_SetParseText, value);
			}
		}

		[Category("Proxy")]
		public string ProxyUser
		{
			get
			{
				return GetString(ACBrCEPInterop.CEP_GetProxyUser);
			}
			set
			{
				SetString(ACBrCEPInterop.CEP_SetProxyUser, value);
			}
		}

		[Category("Proxy")]
		public string ProxyPass
		{
			get
			{
				return GetString(ACBrCEPInterop.CEP_GetProxyPass);
			}
			set
			{
				SetString(ACBrCEPInterop.CEP_SetProxyPass, value);
			}
		}

		[Category("Proxy")]
		public string ProxyHost
		{
			get
			{
				return GetString(ACBrCEPInterop.CEP_GetProxyHost);
			}
			set
			{
				SetString(ACBrCEPInterop.CEP_SetProxyHost, value);
			}
		}

		[Category("Proxy")]
		public string ProxyPort
		{
			get
			{
				return GetString(ACBrCEPInterop.CEP_GetProxyPort);
			}
			set
			{
				SetString(ACBrCEPInterop.CEP_SetProxyPort, value);
			}
		}

		[Browsable(false)]
		public Enderecos Enderecos
		{
			get
			{
				if (enderecos == null)
				{
					IntPtr composedComponent;
					int ret = ACBrCEPInterop.CEP_GetEnderecos(this.Handle, out composedComponent);
					CheckResult(ret);

					enderecos = new Enderecos(this, composedComponent);

					return enderecos;
				}
				else
					return enderecos;
			}
		}

		#endregion Properties

		#region Methods

		#region Funções

		public bool LerConfiguracoesProxy()
		{
			int ret = ACBrCEPInterop.CEP_LerConfiguracoesProxy(Handle);
			CheckResult(ret);

			return Convert.ToBoolean(ret);
		}

		public int BuscarPorCEP(string cep)
		{
			int ret = ACBrCEPInterop.CEP_BuscarPorCEP(Handle, ToUTF8(cep));
			CheckResult(ret);

			return ret;
		}

		public int BuscarPorLogradouro(string cidade, string tipo, string logradouro, string uf, string bairro)
		{
			int ret = ACBrCEPInterop.CEP_BuscarPorLogradouro(Handle, ToUTF8(cidade), ToUTF8(tipo), ToUTF8(logradouro), ToUTF8(uf), ToUTF8(bairro));
			CheckResult(ret);

			return ret;
		}

		#endregion Funções

		#region Callback EventHandlers

		[AllowReversePInvokeCalls]
		private void OnBuscaEfetuadaCallback()
		{
			if (onBuscaEfetuada.IsAssigned)
			{
				onBuscaEfetuada.Raise();
			}
		}

		[AllowReversePInvokeCalls]
		private string OnAntesAbrirHTTPCallback(string url)
		{
			AntesAbrirHTTPEventArgs e = new AntesAbrirHTTPEventArgs(url);

			if (onAntesAbrirHTTP.IsAssigned)
				onAntesAbrirHTTP.Raise(e);

			return ToUTF8(e.AURL);
		}

		#endregion Callback EventHandlers

		#region Override Methods

		protected internal override void OnInitialize()
		{
			CallCreate(ACBrCEPInterop.CEP_Create);
		}

		protected internal override void CheckResult(int ret)
		{
			switch (ret)
			{
				case -1:

					string error = GetString(ACBrCEPInterop.CEP_GetUltimoErro);
					throw new ACBrException(error);

				case -2:

					throw new ACBrException("ACBrCEP não inicializado.");
			}
		}

		protected override void OnDisposing()
		{
			if (Handle != IntPtr.Zero)
			{
				CallDestroy(ACBrCEPInterop.CEP_Destroy);
			}
		}

		#endregion Override Methods

		#endregion Methods
	}
}