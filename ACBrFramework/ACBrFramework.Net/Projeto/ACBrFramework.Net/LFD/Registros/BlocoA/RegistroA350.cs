using System;

namespace ACBrFramework.LFD
{
	public class RegistroA350
	{
		#region Constructor

		public RegistroA350()
		{
			RegistroA360 = new RegistroList<RegistroA360>();
		}

		#endregion Constructor

		#region Properties

		public string CPF_CONS { get; set; }

		public string CNPJ_CONS { get; set; }

		public string COD_MOD { get; set; }

		public SituacaoDocto COD_SIT { get; set; }

		public int ECF_CX { get; set; }

		public string ECF_FAB { get; set; }

		public int CRO { get; set; }

		public int CRZ { get; set; }

		public string NUM_DOC { get; set; }

		public DateTime DT_DOC { get; set; }

		public string COP { get; set; }

		public decimal VL_DOC { get; set; }

		public decimal VL_CANC_ISS { get; set; }

		public decimal VL_CANC_ICMS { get; set; }

		public decimal VL_DESC_ISS { get; set; }

		public decimal VL_DESC_ICMS { get; set; }

		public decimal VL_ACMO_ISS { get; set; }

		public decimal VL_ACMO_ICMS { get; set; }

		public decimal VL_BC_ISS { get; set; }

		public decimal VL_ISS { get; set; }

		public decimal VL_ISN_ISS { get; set; }

		public decimal VL_NT_ISS { get; set; }

		public decimal VL_RET_ISS { get; set; }

		public RegistroList<RegistroA360> RegistroA360 { get; private set; }

		#endregion Properties
	}
}