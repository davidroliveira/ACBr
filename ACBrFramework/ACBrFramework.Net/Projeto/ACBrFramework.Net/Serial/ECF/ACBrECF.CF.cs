using System.Runtime.InteropServices;

namespace ACBrFramework.ECF
{
	public partial class ACBrECF
	{
		#region Cupom Fiscal

		public void IdentificaConsumidor(string cpfCnpj, string nome, string endereco)
		{
			var ret = ACBrECFInterop.ECF_IdentificaConsumidor(this.Handle, ToUTF8(cpfCnpj), ToUTF8(nome),
				ToUTF8(endereco));
			CheckResult(ret);
		}

		public void IdentificaOperador(string nome)
		{
			var ret = ACBrECFInterop.ECF_IdentificaOperador(this.Handle, ToUTF8(nome));
			CheckResult(ret);
		}

		public void AbreCupom(string cpfCnpj = "", string nome = "", string endereco = "", bool ModoPreVenda = false)
		{
			var ret = ACBrECFInterop.ECF_AbreCupom(this.Handle, ToUTF8(cpfCnpj), ToUTF8(nome), ToUTF8(endereco),
				ModoPreVenda);
			CheckResult(ret);
		}

		public void LegendaInmetroProximoItem()
		{
			var ret = ACBrECFInterop.ECF_LegendaInmetroProximoItem(this.Handle);
			CheckResult(ret);
		}

#if COM_INTEROP
        public void VendeItem(string codigo, string descricao, string aliquotaICMS, [MarshalAs(UnmanagedType.Currency)]decimal qtd, [MarshalAs(UnmanagedType.Currency)]decimal valorUnitario, [MarshalAs(UnmanagedType.Currency)]decimal descontoPorc = 0M, string unidade = "UN", string tipoDescontoAcrescimo = "%", string descontoAcrescimo = "D", int CodDepartamento = -1)
#else

		public void VendeItem(string codigo, string descricao, string aliquotaICMS, decimal qtd, decimal valorUnitario,
			decimal descontoPorc = 0M, string unidade = "UN",
			string tipoDescontoAcrescimo = "%", string descontoAcrescimo = "D", int codDepartamento = -1)
#endif
		{
			var ret = ACBrECFInterop.ECF_VendeItem(Handle, ToUTF8(codigo), ToUTF8(descricao), ToUTF8(aliquotaICMS),
				(double)qtd, (double)valorUnitario, (double)descontoPorc, ToUTF8(unidade),
				ToUTF8(tipoDescontoAcrescimo), ToUTF8(descontoAcrescimo), codDepartamento);
			CheckResult(ret);
		}

#if COM_INTEROP
        public void VendeItemEx(string codigo, string descricao, string aliquotaICMS, [MarshalAs(UnmanagedType.Currency)] decimal qtd,
			[MarshalAs(UnmanagedType.Currency)] decimal valorUnitario, [MarshalAs(UnmanagedType.Currency)] decimal descontoPorc = 0M,
			string unidade = "UN", string tipoDescontoAcrescimo = "%", string descontoAcrescimo = "D",
			int CodDepartamento = -1, string EAN13 = "", int CasasDecimaisQtde = 0, int CasasDecimaisValor = 0,
			char ArredondaTrunca = 'A', string NCM = "", string CFOP = "", string InformacaoAdicional = "",
			[MarshalAs(UnmanagedType.Currency)] decimal TotalDosTributos = 0M, int OrigemProduto = 0, string CST_ICMS = "",
			int ModalidadeBCICMS = 0, [MarshalAs(UnmanagedType.Currency)] decimal PercentualReducaoBCICMS = 0M,
			string CSOSN = "", [MarshalAs(UnmanagedType.Currency)] decimal valorBaseCalculoSn = 0M,
			[MarshalAs(UnmanagedType.Currency)] decimal ValorICMSRetidoSN = 0M, [MarshalAs(UnmanagedType.Currency)] decimal AliquotaCalculoCreditoSN = 0M,
			[MarshalAs(UnmanagedType.Currency)] decimal ValorCreditoICMSSN = 0M, string ItemListaServico = "", string CodigoISS = "",
			string NaturezaOperacaoISS = "", int IndicadorIncentivoFiscalISS = 1, string CodigoIBGE = "", int ModalidadeBCICMSST = 0,
			[MarshalAs(UnmanagedType.Currency)] decimal PercentualMargemICMSST = 0M, [MarshalAs(UnmanagedType.Currency)] decimal PercentualReducaoBCICMSST = 0M,
			[MarshalAs(UnmanagedType.Currency)] decimal ValorReducaoBCICMSST = 0M, [MarshalAs(UnmanagedType.Currency)] decimal AliquotaICMSST = 0M,
			[MarshalAs(UnmanagedType.Currency)] decimal ValorICMSST = 0M, [MarshalAs(UnmanagedType.Currency)] decimal ValorICMSDesonerado = 0M,
			int MotivoDesoneracaoICMS = 9, string CST_PIS = "", [MarshalAs(UnmanagedType.Currency)]decimal BaseCalculoPIS = 0M,
			[MarshalAs(UnmanagedType.Currency)]decimal AliquotaPIS = 0M, [MarshalAs(UnmanagedType.Currency)]decimal ValorPIS = 0M,
			[MarshalAs(UnmanagedType.Currency)] decimal QuantidadeVendidaPIS = 0M, [MarshalAs(UnmanagedType.Currency)]decimal ValorAliquotaPIS = 0M,
			string CST_COFINS = "", [MarshalAs(UnmanagedType.Currency)]decimal BaseCalculoCOFINS = 0M, [MarshalAs(UnmanagedType.Currency)]decimal AliquotaCOFINS = 0M,
			[MarshalAs(UnmanagedType.Currency)]decimal ValorCOFINS = 0M, [MarshalAs(UnmanagedType.Currency)]decimal QuantidadeVendidaCOFINS = 0M,
			[MarshalAs(UnmanagedType.Currency)]decimal ValorAliquotaCOFINS = 0M, string CEST = "")
#else

		public void VendeItemEx(string codigo, string descricao, string aliquotaICMS, decimal qtd,
			decimal valorUnitario, decimal descontoPorc = 0M,
			string unidade = "UN", string tipoDescontoAcrescimo = "%", string descontoAcrescimo = "D",
			int CodDepartamento = -1, string EAN13 = "", int CasasDecimaisQtde = 0, int CasasDecimaisValor = 0,
			char ArredondaTrunca = 'A', string NCM = "", string CFOP = "", string InformacaoAdicional = "",
			decimal TotalDosTributos = 0M, int OrigemProduto = 0, string CST_ICMS = "",
			int ModalidadeBCICMS = 0, decimal PercentualReducaoBCICMS = 0M,
			string CSOSN = "", decimal valorBaseCalculoSn = 0M,
			decimal ValorICMSRetidoSN = 0M, decimal AliquotaCalculoCreditoSN = 0M,
			decimal ValorCreditoICMSSN = 0M, string ItemListaServico = "", string CodigoISS = "",
			string NaturezaOperacaoISS = "", int IndicadorIncentivoFiscalISS = 1, string CodigoIBGE = "",
			int ModalidadeBCICMSST = 0,
			decimal PercentualMargemICMSST = 0M, decimal PercentualReducaoBCICMSST = 0M,
			decimal ValorReducaoBCICMSST = 0M, decimal AliquotaICMSST = 0M,
			decimal ValorICMSST = 0M, decimal ValorICMSDesonerado = 0M,
			int MotivoDesoneracaoICMS = 9, string CST_PIS = "", decimal BaseCalculoPIS = 0M,
			decimal AliquotaPIS = 0M, decimal ValorPIS = 0M,
			decimal QuantidadeVendidaPIS = 0M, decimal ValorAliquotaPIS = 0M,
			string CST_COFINS = "", decimal BaseCalculoCOFINS = 0M, decimal AliquotaCOFINS = 0M,
			decimal ValorCOFINS = 0M, decimal QuantidadeVendidaCOFINS = 0M,
			decimal ValorAliquotaCOFINS = 0M, string CEST = "")
#endif
		{
			var ret = ACBrECFInterop.ECF_VendeItemEx(this.Handle, ToUTF8(codigo), ToUTF8(descricao),
				ToUTF8(aliquotaICMS), (double)qtd,
				(double)valorUnitario, (double)descontoPorc, ToUTF8(unidade), ToUTF8(tipoDescontoAcrescimo),
				ToUTF8(descontoAcrescimo), CodDepartamento, ToUTF8(EAN13), CasasDecimaisQtde, CasasDecimaisValor,
				ArredondaTrunca, ToUTF8(NCM), ToUTF8(CFOP), ToUTF8(InformacaoAdicional),
				(double)TotalDosTributos, OrigemProduto, ToUTF8(CST_ICMS), ModalidadeBCICMS,
				(double)PercentualReducaoBCICMS, ToUTF8(CSOSN), (double)valorBaseCalculoSn, (double)ValorICMSRetidoSN,
				(double)AliquotaCalculoCreditoSN, (double)ValorCreditoICMSSN, ToUTF8(ItemListaServico),
				ToUTF8(CodigoISS), ToUTF8(NaturezaOperacaoISS), IndicadorIncentivoFiscalISS,
				ToUTF8(CodigoIBGE), ModalidadeBCICMSST, (double)PercentualMargemICMSST,
				(double)PercentualReducaoBCICMSST,
				(double)ValorReducaoBCICMSST, (double)AliquotaICMSST, (double)ValorICMSST,
				(double)ValorICMSDesonerado,
				MotivoDesoneracaoICMS, ToUTF8(CST_PIS), (double)BaseCalculoPIS, (double)AliquotaPIS, (double)ValorPIS,
				(double)QuantidadeVendidaPIS,
				(double)ValorAliquotaPIS, ToUTF8(CST_COFINS), (double)BaseCalculoCOFINS,
				(double)AliquotaCOFINS, (double)ValorCOFINS, (double)QuantidadeVendidaCOFINS,
				(double)ValorAliquotaCOFINS, ToUTF8(CEST));
			CheckResult(ret);
		}

		public void DescontoAcrescimoItemAnterior([MarshalAs(UnmanagedType.Currency)] decimal valorDesconto,
			string descontoAcrescimo, string tipodescontoAcrescimo = "%", int item = 0)
		{
			var ret = ACBrECFInterop.ECF_DescontoAcrescimoItemAnterior(this.Handle, (double)valorDesconto,
				ToUTF8(descontoAcrescimo), ToUTF8(tipodescontoAcrescimo), item);
			CheckResult(ret);
		}

		public void SubtotalizaCupom([MarshalAs(UnmanagedType.Currency)] decimal descontoAcrescimo = 0M,
			string mensagemRodape = "")
		{
			var ret = ACBrECFInterop.ECF_SubtotalizaCupom(this.Handle, (double)descontoAcrescimo,
				ToUTF8(mensagemRodape));
			CheckResult(ret);
		}

		public void EfetuaPagamento(string codFormaPagto, [MarshalAs(UnmanagedType.Currency)] decimal valor,
			string observacao = "",
			bool imprimeVinculado = false, int codMeioPagamento = 0)
		{
			var ret = ACBrECFInterop.ECF_EfetuaPagamento(this.Handle, ToUTF8(codFormaPagto), (double)valor,
				ToUTF8(observacao), imprimeVinculado, codMeioPagamento);
			CheckResult(ret);
		}

		public void EstornaPagamento(string codFormaPagtoEstornar, string codFormaPagtoEfetivar, double valor,
			string observacao)
		{
			var ret = ACBrECFInterop.ECF_EstornaPagamento(this.Handle, ToUTF8(codFormaPagtoEstornar),
				ToUTF8(codFormaPagtoEfetivar), valor, ToUTF8(observacao));
			CheckResult(ret);
		}

		public void FechaCupom(string observacao = "")
		{
			var ret = ACBrECFInterop.ECF_FechaCupom(this.Handle, ToUTF8(observacao));
			CheckResult(ret);
		}

		public void CancelaCupom(int numCooCancelar = 0)
		{
			var ret = ACBrECFInterop.ECF_CancelaCupom(this.Handle, numCooCancelar);
			CheckResult(ret);
		}

		public void CancelaItemVendido(int numItem)
		{
			var ret = ACBrECFInterop.ECF_CancelaItemVendido(this.Handle, numItem);
			CheckResult(ret);
		}

		public void CancelaItemVendidoParcial(int numItem, [MarshalAs(UnmanagedType.Currency)] decimal quantidade)
		{
			var ret = ACBrECFInterop.ECF_CancelaItemVendidoParcial(this.Handle, numItem, (double)quantidade);
			CheckResult(ret);
		}

		public void CancelaDescontoAcrescimoItem(int numItem)
		{
			var ret = ACBrECFInterop.ECF_CancelaDescontoAcrescimoItem(this.Handle, numItem);
		}

		public void CancelaDescontoAcrescimoSubTotal(string tipoAcrescimoDesconto)
		{
			var ret = ACBrECFInterop.ECF_CancelaDescontoAcrescimoSubTotal(this.Handle, tipoAcrescimoDesconto[0]);
			CheckResult(ret);
		}

		#endregion Cupom Fiscal
	}
}