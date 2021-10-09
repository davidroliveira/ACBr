using System;

namespace ACBrFramework.ECF
{
	public partial class ACBrECF
	{
		#region Métodos DAV

		public void DAV_Abrir(DateTime emissao, string decrdocumento, string numero, string situacao, string vendedor,
			string observacao, string cpfCnpj, string nome, string endereco,
			string numFabricacao = "", string marca = "", string modelo = "", string ano = "", string placa = "",
			string renavam = "", int indice = 0)
		{
			int ret = ACBrECFInterop.ECF_DAV_Abrir(this.Handle, emissao.ToOADate(), ToUTF8(decrdocumento),
				ToUTF8(numero), ToUTF8(situacao), ToUTF8(vendedor), ToUTF8(observacao),
				ToUTF8(cpfCnpj), ToUTF8(nome), ToUTF8(endereco), ToUTF8(numFabricacao), ToUTF8(marca),
				ToUTF8(modelo), ToUTF8(ano), ToUTF8(placa), ToUTF8(renavam), indice);

			CheckResult(ret);
		}

		public void DAV_RegistrarItem(string codigo, string descricao, string unidade, decimal quantidade,
			decimal vlrunitario, decimal desconto, decimal acrescimo, bool cancelado)
		{
			int ret = ACBrECFInterop.ECF_DAV_RegistrarItem(this.Handle, ToUTF8(codigo), ToUTF8(descricao),
				ToUTF8(unidade),
				(double)quantidade, (double)vlrunitario, (double)desconto, (double)acrescimo, cancelado);
			CheckResult(ret);
		}

		public void DAV_Fechar(string observacao, decimal desconto = 0, decimal acrescimo = 0)
		{
			int ret = ACBrECFInterop.ECF_DAV_Fechar(this.Handle, ToUTF8(observacao), (double)desconto,
				(double)acrescimo);
			CheckResult(ret);
		}

#if COM_INTEROP

        public void PafMF_RelDAVEmitidos(ref DAVs[] DAVs, string TituloRelatorio, int IndiceRelatorio)
#else

		public void PafMF_RelDAVEmitidos(DAVs[] DAVs, string TituloRelatorio, int IndiceRelatorio)
#endif
		{
			ACBrECFInterop.DaVsRec[] record = new ACBrECFInterop.DaVsRec[DAVs.Length];
			for (int i = 0; i < DAVs.Length; i++)
			{
				record[i].Numero = DAVs[i].Numero;
				record[i].COO_Cupom = DAVs[i].COO_Cupom;
				record[i].COO_Dav = DAVs[i].COO_Dav;
				record[i].Titulo = DAVs[i].Titulo;
				record[i].DtEmissao = DAVs[i].DtEmissao.ToOADate();
				record[i].Valor = Convert.ToDouble(DAVs[i].Valor);
			}

			int ret = ACBrECFInterop.ECF_PafMF_RelDAVEmitidos(this.Handle, record, DAVs.Length, ToUTF8(TituloRelatorio),
				IndiceRelatorio);
			CheckResult(ret);
		}

		#endregion Métodos DAV
	}
}