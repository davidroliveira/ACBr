using System;
using System.ComponentModel;
using System.Drawing;
using System.Runtime.InteropServices;

namespace ACBrFramework.IBGE
{
	[ToolboxBitmap(typeof(ToolboxIcons), @"ACBrFramework.IBGE.ico.bmp")]
	public sealed class ACBrIBGE : ACBrComponent, IDisposable
	{
        #region Events

        public event EventHandler<EventArgs> OnBuscaEfetuada
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

		#endregion Events

		#region Fields

		private readonly ACBrEventHandler<ACBrIBGEInterop.OnBuscaEfetuadaCallback> onBuscaEfetuada;
		private Cidade[] cidades;

		#endregion Fields

		#region Constructor

		public ACBrIBGE()
		{
			onBuscaEfetuada = new ACBrEventHandler<ACBrIBGEInterop.OnBuscaEfetuadaCallback>(this, OnBuscaEfetuadaCallback, ACBrIBGEInterop.IBGE_SetOnBuscaEfetuada);
		}

		#endregion Constructor

		#region Properties

		[Browsable(false)]
		public Cidade[] Cidades
		{
			get
			{
				if (cidades == null) CarregaCidades();
				return cidades;
			}
		}

		#endregion Properties

		#region Methods

		public void BuscarPorCodigo(int codigo)
		{
			cidades = null;
			int ret = ACBrIBGEInterop.IBGE_BuscarPorCodigo(Handle, codigo);
			CheckResult(ret);
		}

        public void BuscarPorNome(string nome, string uf = "", bool exata = false)
		{
			cidades = null;
			int ret = ACBrIBGEInterop.IBGE_BuscarPorNome(Handle, nome.ToUTF8(), uf.ToUTF8(), exata);
			CheckResult(ret);
		}

		private void CarregaCidades()
		{
			int count = ACBrIBGEInterop.IBGE_Cidades_GetCount(Handle);
			CheckResult(count);

			cidades = new Cidade[count];

			for (int i = 0; i < count; i++)
			{
				var cidadeRec = new ACBrIBGEInterop.CidadeRec();
				int ret = ACBrIBGEInterop.IBGE_Cidades_GetItem(Handle, ref cidadeRec, i);
				CheckResult(ret);

				Cidade cidade = new Cidade();
				cidade.Municipio = cidadeRec.Municipio.FromUTF8();
				cidade.CodMunicio = cidadeRec.CodMunicio;
				cidade.UF = cidadeRec.UF.FromUTF8();
				cidade.CodUF = cidadeRec.CodUF;
				cidade.Area = cidadeRec.Area;

				cidades[i] = cidade;
			}
		}

		#region Callback EventHandlers

		[AllowReversePInvokeCalls]
		private void OnBuscaEfetuadaCallback()
		{
			if (onBuscaEfetuada.IsAssigned)
			{
				onBuscaEfetuada.Raise();
			}
		}

		#endregion Callback EventHandlers

		#region Override Methods

		protected internal override void OnInitialize()
		{
			CallCreate(ACBrIBGEInterop.IBGE_Create);
		}

		protected internal override void CheckResult(int ret)
		{
			switch (ret)
			{
				case -1:

					const int BUFFER_LEN = 1024;
					string error = GetString(ACBrIBGEInterop.IBGE_GetUltimoErro, BUFFER_LEN);
					throw new ACBrException(error);

				case -2:

					throw new ACBrException("ACBr IBGE não inicializado.");
			}
		}

		protected override void OnDisposing()
		{
			if (this.Handle != IntPtr.Zero)
			{
				CallDestroy(ACBrIBGEInterop.IBGE_Destroy);
			}
		}

		#endregion Override Methods

		#endregion Methods
	}
}