using System;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Runtime.InteropServices;

namespace ACBrFramework.ETQ
{
	[ToolboxBitmap(typeof(ToolboxIcons), @"ACBrFramework.Serial.ETQ.ico.bmp")]
	[TypeConverter(typeof(ACBrExpandableObjectConverter))]
	public class ACBrETQ : ACBrComponent
	{
		#region Fields

		private readonly ACBrEventHandler<LogEventArgs, ACBrETQInterop.GravaLogCallback> onGravarLog;

		#endregion Fields

		#region Events

		public event EventHandler<LogEventArgs> OnGravarLog
		{
			add { onGravarLog.Add(value); }
			remove { onGravarLog.Remove(value); }
		}

		#endregion Events

		#region Constructors

		public ACBrETQ()
		{
			onGravarLog = new ACBrEventHandler<LogEventArgs, ACBrETQInterop.GravaLogCallback>(this, OnGravarLogCallback, ACBrETQInterop.ETQ_SetOnGravarLog);
		}

		#endregion Constructors

		#region Propriedades

		[Category("Configutações ACBrETQ")]
		public ACBrDevice Device { get; private set; }

		[Browsable(false)]
		public ACBrETQClass ETQ { get; private set; }

		[Browsable(false)]
		public string[] ListaCmd
		{
			get { return GetStringArray(ACBrETQInterop.ETQ_GetListaCmd, ACBrETQInterop.ETQ_GetListaCmdCount); }
			set { SetStringArray(ACBrETQInterop.ETQ_SetListaCmd, value); }
		}

		[Browsable(false)]
		public string ModeloStr
		{
			get { return GetString(ACBrETQInterop.ETQ_GetModeloStr); }
		}

		[Browsable(false)]
		public bool EtqInicializada
		{
			get { return GetBool(ACBrETQInterop.ETQ_GetEtqInicializada); }
		}

		[Browsable(false)]
		public bool EtqFinalizada
		{
			get { return GetBool(ACBrETQInterop.ETQ_GetEtqFinalizada); }
		}

		[Category("Propriedades")]
		public ETQUnidade Unidade
		{
			get { return (ETQUnidade)GetInt32(ACBrETQInterop.ETQ_GetUnidade); }
			set { SetInt32(ACBrETQInterop.ETQ_SetUnidade, (int)value); }
		}

		[Category("Configutações ACBrETQ")]
		public ETQModelo Modelo
		{
			get { return (ETQModelo)GetInt32(ACBrETQInterop.ETQ_GetModelo); }
			set { SetInt32(ACBrETQInterop.ETQ_SetModelo, (int)value); }
		}

		[Category("Propriedades")]
		public EtqBackFeed BackFeed
		{
			get { return (EtqBackFeed)GetInt32(ACBrETQInterop.ETQ_GetBackFeed); }
			set { SetInt32(ACBrETQInterop.ETQ_SetBackFeed, (int)value); }
		}

		[Category("Propriedades")]
		public bool LimparMemoria
		{
			get { return GetBool(ACBrETQInterop.ETQ_GetLimparMemoria); }
			set { SetBool(ACBrETQInterop.ETQ_SetLimparMemoria, value); }
		}

		[Category("Propriedades")]
		public int Temperatura
		{
			get { return GetInt32(ACBrETQInterop.ETQ_GetTemperatura); }
			set { SetInt32(ACBrETQInterop.ETQ_SetTemperatura, value); }
		}

		[Category("Propriedades")]
		public int Velocidade
		{
			get { return GetInt32(ACBrETQInterop.ETQ_GetVelocidade); }
			set { SetInt32(ACBrETQInterop.ETQ_SetVelocidade, value); }
		}

		[Category("Propriedades")]
		public EtqOrigem Origem
		{
			get { return (EtqOrigem)GetInt32(ACBrETQInterop.ETQ_GetOrigem); }
			set { SetInt32(ACBrETQInterop.ETQ_SetOrigem, (int)value); }
		}

		[Category("Propriedades")]
		public ETQDPI DPI
		{
			get { return (ETQDPI)GetInt32(ACBrETQInterop.ETQ_GetDPI); }
			set { SetInt32(ACBrETQInterop.ETQ_SetDPI, (int)value); }
		}

		[Category("Propriedades")]
		public int Avanco
		{
			get { return GetInt32(ACBrETQInterop.ETQ_GetAvanco); }
			set { SetInt32(ACBrETQInterop.ETQ_SetAvanco, value); }
		}

		[Category("Propriedades")]
		public string ArqLOG
		{
			get { return GetString(ACBrETQInterop.ETQ_GetArqLOG); }
			set { SetString(ACBrETQInterop.ETQ_SetArqLOG, value); }
		}

		[Category("Configutações ACBrETQ")]
		public string Porta
		{
			get { return GetString(ACBrETQInterop.ETQ_GetPorta); }
			set { SetString(ACBrETQInterop.ETQ_SetPorta, value); }
		}

		[Category("Propriedades")]
		public bool Ativo
		{
			get { return GetBool(ACBrETQInterop.ETQ_GetAtivo); }
			set { SetBool(ACBrETQInterop.ETQ_SetAtivo, value); }
		}

		#endregion Propriedades

		#region Methods

		public void Ativar()
		{
			var ret = ACBrETQInterop.ETQ_Ativar(Handle);
			CheckResult(ret);
		}

		public void Desativar()
		{
			var ret = ACBrETQInterop.ETQ_Desativar(Handle);
			CheckResult(ret);
		}

		public void ImprimirTexto(EtqOrientacao orientacao, int fonte,
									int multiplicadorH, int multiplicadorV, int vertical, int horizontal,
									string texto, int subFonte = 0, bool imprimirReverso = false)
		{
			var ret = ACBrETQInterop.ETQ_ImprimirTexto(Handle, (int)orientacao, fonte, multiplicadorH,
															multiplicadorV, vertical, horizontal, texto.ToUTF8(),
															subFonte, imprimirReverso);
			CheckResult(ret);
		}

		public void ImprimirBarras(EtqOrientacao orientacao, string tipoBarras,
			string larguraBarraLarga, string larguraBarraFina, int vertical, int horizontal, string texto,
			int alturaCodBarras, ETQBarraExibeCodigo exibeCodigo = ETQBarraExibeCodigo.Padrao)
		{
			var ret = ACBrETQInterop.ETQ_ImprimirBarras(Handle, (int)orientacao, tipoBarras.ToUTF8(),
															larguraBarraLarga.ToUTF8(), larguraBarraFina.ToUTF8(),
															vertical, horizontal, texto.ToUTF8(), alturaCodBarras,
															(int)exibeCodigo);
			CheckResult(ret);
		}

		public void ImprimirLinha(int vertical, int horizontal, int largura, int altura)
		{
			var ret = ACBrETQInterop.ETQ_ImprimirLinha(Handle, vertical, horizontal, largura, altura);
			CheckResult(ret);
		}

		public void ImprimirCaixa(int vertical, int horizontal, int largura, int altura, int espessuraVertical, int espessuraHorizontal)
		{
			var ret = ACBrETQInterop.ETQ_ImprimirCaixa(Handle, vertical, horizontal, largura, altura, espessuraVertical, espessuraHorizontal);
			CheckResult(ret);
		}

		public void ImprimirImagem(int multiplicadorImagem, int vertical, int horizontal, string nomeImagem)
		{
			var ret = ACBrETQInterop.ETQ_ImprimirImagem(Handle, multiplicadorImagem, vertical, horizontal, nomeImagem.ToUTF8());
			CheckResult(ret);
		}

		public void CarregarImagem(string imagem, string nomeImagem, bool flipped = true)
		{
			var ret = ACBrETQInterop.ETQ_CarregarImagem(Handle, imagem.ToUTF8(), nomeImagem.ToUTF8(), flipped);
			CheckResult(ret);
		}

		public void CarregarImagem(Image imagem, string nomeImagem, bool flipped = true, string tipo = "BMP")
		{
			var array = imagem.ToByteArray();
			var ret = ACBrETQInterop.ETQ_CarregarImagemStream(Handle, array, array.Length, nomeImagem.ToUTF8(), flipped, tipo);
			CheckResult(ret);
		}

		public void CarregarImagem(Stream imagem, string nomeImagem, bool flipped = true, string tipo = "BMP")
		{
			var array = imagem.ReadToEnd();
			var ret = ACBrETQInterop.ETQ_CarregarImagemStream(Handle, array, array.Length, nomeImagem.ToUTF8(), flipped, tipo);
			CheckResult(ret);
		}

		public void IniciarEtiqueta()
		{
			var ret = ACBrETQInterop.ETQ_IniciarEtiqueta(Handle);
			CheckResult(ret);
		}

		public void FinalizarEtiqueta(int copias = 1, int avancoEtq = 0)
		{
			var ret = ACBrETQInterop.ETQ_FinalizarEtiqueta(Handle, copias, avancoEtq);
			CheckResult(ret);
		}

		public void Imprimir(int copias = 1, int avancoEtq = 0)
		{
			var ret = ACBrETQInterop.ETQ_Imprimir(Handle, copias, avancoEtq);
			CheckResult(ret);
		}

		#region Callback EventHandlers

		[AllowReversePInvokeCalls]
		private bool OnGravarLogCallback(string linha)
		{
			if (!onGravarLog.IsAssigned) return false;

			var log = new LogEventArgs(linha);
			onGravarLog.Raise(log);
			return log.Tratado;
		}

		#endregion Callback EventHandlers

		#region Override Methods

		protected internal override void OnInitialize()
		{
			CallCreate(ACBrETQInterop.ETQ_Create);
			Device = new ACBrDevice(this);
			ETQ = new ACBrETQClass(this);
		}

		protected internal override void CheckResult(int ret)
		{
			switch (ret)
			{
				case -1:

					var error = GetString(ACBrETQInterop.ETQ_GetUltimoErro);
					throw new ACBrException(error);

				case -2:

					throw new ACBrException("ACBr ECF não inicializado.");
			}
		}

		protected override void OnDisposing()
		{
			if (Handle != IntPtr.Zero)
			{
				CallDestroy(ACBrETQInterop.ETQ_Destroy);
			}
		}

		#endregion Override Methods

		#endregion Methods
	}
}