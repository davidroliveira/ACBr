using System;

namespace ACBrFramework.Sped
{
	public class RegistroC700
	{
		#region Constructor

		public RegistroC700()
		{
			RegistroC790 = new RegistroList<RegistroC790>();
		}

		#endregion Constructor

		#region Properties

		public string COD_MOD { get; set; }

		public string SER { get; set; }

		public int NRO_ORD_INI { get; set; }

		public int NRO_ORD_FIN { get; set; }

		public DateTime DT_DOC_INI { get; set; }

		public DateTime DT_DOC_FIN { get; set; }

		public string NOM_MEST { get; set; }

		public string CHV_COD_DIG { get; set; }

		public RegistroList<RegistroC790> RegistroC790 { get; private set; }

		#endregion Properties
	}
}