namespace ACBrFramework.ETQ
{
	public class ACBrETQClass : ACBrComposedComponent
	{
		#region Constructors

		internal ACBrETQClass(ACBrComponent owner)
			: base(owner)
		{
		}

		#endregion Constructors

		#region Propriedades

		public string ModeloStr
		{
			get { return GetString(ACBrETQInterop.ETQ_Class_GetModeloStr); }
		}

		public int Temperatura
		{
			get { return GetInt32(ACBrETQInterop.ETQ_Class_GetTemperatura); }
			set { SetInt32(ACBrETQInterop.ETQ_Class_SetTemperatura, value); }
		}

		public int Velocidade
		{
			get { return GetInt32(ACBrETQInterop.ETQ_Class_GetVelocidade); }
			set { SetInt32(ACBrETQInterop.ETQ_Class_SetVelocidade, value); }
		}

		public int Avanco
		{
			get { return GetInt32(ACBrETQInterop.ETQ_Class_GetAvanco); }
			set { SetInt32(ACBrETQInterop.ETQ_Class_SetAvanco, value); }
		}

		public ETQUnidade Unidade
		{
			get { return (ETQUnidade)GetInt32(ACBrETQInterop.ETQ_Class_GetUnidade); }
			set { SetInt32(ACBrETQInterop.ETQ_Class_SetUnidade, (int)value); }
		}

		public ETQDPI DPI
		{
			get { return (ETQDPI)GetInt32(ACBrETQInterop.ETQ_Class_GetDPI); }
			set { SetInt32(ACBrETQInterop.ETQ_Class_SetDPI, (int)value); }
		}

		public EtqBackFeed BackFeed
		{
			get { return (EtqBackFeed)GetInt32(ACBrETQInterop.ETQ_Class_GetBackFeed); }
			set { SetInt32(ACBrETQInterop.ETQ_Class_SetBackFeed, (int)value); }
		}

		public EtqOrigem Origem
		{
			get { return (EtqOrigem)GetInt32(ACBrETQInterop.ETQ_Class_GetOrigem); }
			set { SetInt32(ACBrETQInterop.ETQ_Class_SetOrigem, (int)value); }
		}

		#endregion Propriedades
	}
}