using System;

namespace ACBrFramework.Sintegra
{
	public sealed class SintegraRegistro60M
	{
		public int CRO { get; set; }

		public int NumOrdem { get; set; }

		public decimal VendaBruta { get; set; }

		public string ModeloDoc { get; set; }

		public decimal ValorGT { get; set; }

		public int CRZ { get; set; }

		public int CooFinal { get; set; }

		public int CooInicial { get; set; }

		public string NumSerie { get; set; }

		public DateTime Emissao { get; set; }
	}
}