namespace ACBrFramework.Sped
{
	public class Registro1700
	{
		#region Constructor

		public Registro1700()
		{
			Registro1710 = new RegistroList<Registro1710>();
		}

		#endregion Constructor

		#region Properties

		public Dispositivo COD_DISP { get; set; }

		public string COD_MOD { get; set; }

		public string SER { get; set; }

		public string SUB { get; set; }

		public string NUM_DOC_INI { get; set; }

		public string NUM_DOC_FIN { get; set; }

		public string NUM_AUT { get; set; }

		public RegistroList<Registro1710> Registro1710 { get; private set; }

		#endregion Properties
	}
}