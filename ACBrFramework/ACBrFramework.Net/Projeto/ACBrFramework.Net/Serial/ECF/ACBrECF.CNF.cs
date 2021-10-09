using System;
using System.Runtime.InteropServices;

namespace ACBrFramework.ECF
{
	public partial class ACBrECF
	{
		#region Comprovantes Não Fiscal

		public ComprovanteNaoFiscal AchaCNFDescricao(string descricao, bool buscaExata = true, bool ignoreCase = true)
		{
			ACBrECFInterop.ComprovanteNaoFiscalRec record = new ACBrECFInterop.ComprovanteNaoFiscalRec();
			int ret = ACBrECFInterop.ECF_AchaCNFDescricao(this.Handle, ref record, ToUTF8(descricao), buscaExata,
				ignoreCase);
			CheckResult(ret);

			if (ret == 0)
				return null;
			else
			{
				ComprovanteNaoFiscal comprovanteNaoFiscal = new ComprovanteNaoFiscal();
				comprovanteNaoFiscal.Indice = FromUTF8(record.Indice);
				comprovanteNaoFiscal.Descricao = FromUTF8(record.Descricao);
				comprovanteNaoFiscal.PermiteVinculado = record.PermiteVinculado;
				comprovanteNaoFiscal.FormaPagamento = FromUTF8(record.FormaPagamento);
				comprovanteNaoFiscal.Total = Convert.ToDecimal(record.Total);
				comprovanteNaoFiscal.Contador = record.Contador;

				int count = GetInt32(ACBrECFInterop.ECF_GetCNFCount);
				CheckResult(count);
				CarregaComprovantesNaoFiscais(count);

				return comprovanteNaoFiscal;
			}
		}

		public void CarregaComprovantesNaoFiscais()
		{
			int count = ACBrECFInterop.ECF_CarregaComprovantesNaoFiscais(this.Handle);
			CheckResult(count);

			CarregaComprovantesNaoFiscais(count);
		}

		private void CarregaComprovantesNaoFiscais(int count)
		{
			comprovantesNaoFiscais = new ComprovanteNaoFiscal[count];
			for (int i = 0; i < count; i++)
			{
				var record = new ACBrECFInterop.ComprovanteNaoFiscalRec();
				int ret = ACBrECFInterop.ECF_GetComprovanteNaoFiscal(this.Handle, ref record, i);
				CheckResult(ret);

				ComprovanteNaoFiscal comprovanteNaoFiscal = new ComprovanteNaoFiscal();
				comprovanteNaoFiscal.Indice = FromUTF8(record.Indice);
				comprovanteNaoFiscal.Descricao = FromUTF8(record.Descricao);
				comprovanteNaoFiscal.PermiteVinculado = record.PermiteVinculado;
				comprovanteNaoFiscal.FormaPagamento = FromUTF8(record.FormaPagamento);
				comprovanteNaoFiscal.Total = Convert.ToDecimal(record.Total);
				comprovanteNaoFiscal.Contador = record.Contador;

				comprovantesNaoFiscais[i] = comprovanteNaoFiscal;
			}
		}

		public void LerTotaisComprovanteNaoFiscal()
		{
			int count = ACBrECFInterop.ECF_LerTotaisComprovanteNaoFiscal(this.Handle);
			CheckResult(count);

			CarregaComprovantesNaoFiscais(count);
		}

		public void ProgramaComprovanteNaoFiscal(string descricao, string tipo, string posicao = "")
		{
			if (string.IsNullOrEmpty(tipo)) throw new ArgumentException();

			int ret = ACBrECFInterop.ECF_ProgramaComprovanteNaoFiscal(this.Handle, ToUTF8(descricao), ToUTF8(tipo),
				ToUTF8(posicao));
			CheckResult(ret);
		}

		public void AbreNaoFiscal(string cpfCnpj = "", string nome = "", string endereco = "")
		{
			int ret = ACBrECFInterop.ECF_AbreNaoFiscal(this.Handle, ToUTF8(cpfCnpj), ToUTF8(nome), ToUTF8(endereco));
			CheckResult(ret);
		}

		public void RegistraItemNaoFiscal(string codCNF, [MarshalAs(UnmanagedType.Currency)] decimal value,
			string obs = "")
		{
			int ret = ACBrECFInterop.ECF_RegistraItemNaoFiscal(this.Handle, ToUTF8(codCNF), (double)value, ToUTF8(obs));
			CheckResult(ret);
		}

		public void SubtotalizaNaoFiscal([MarshalAs(UnmanagedType.Currency)] decimal descontoAcrescimo,
			string mensagemRodape = "")
		{
			int ret = ACBrECFInterop.ECF_SubtotalizaNaoFiscal(this.Handle, (double)descontoAcrescimo,
				ToUTF8(mensagemRodape));
			CheckResult(ret);
		}

		public void EfetuaPagamentoNaoFiscal(string codFormaPagto, [MarshalAs(UnmanagedType.Currency)] decimal valor,
			string observacao = "", bool imprimeVinculado = false)
		{
			int ret = ACBrECFInterop.ECF_EfetuaPagamentoNaoFiscal(this.Handle, codFormaPagto, (double)valor, observacao,
				imprimeVinculado);
			CheckResult(ret);
		}

		public void FechaNaoFiscal(string observacao = "", int IndiceBMP = 0)
		{
			int ret = ACBrECFInterop.ECF_FechaNaoFiscal(this.Handle, ToUTF8(observacao), IndiceBMP);
			CheckResult(ret);
		}

		public void CancelaNaoFiscal()
		{
			int ret = ACBrECFInterop.ECF_CancelaNaoFiscal(this.Handle);
			CheckResult(ret);
		}

		#endregion Comprovantes Não Fiscal
	}
}