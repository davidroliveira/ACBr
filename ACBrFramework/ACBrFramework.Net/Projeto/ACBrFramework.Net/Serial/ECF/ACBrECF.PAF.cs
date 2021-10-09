using ACBrFramework.AAC;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ACBrFramework.ECF
{
	public partial class ACBrECF
	{
		#region PAF Relatorios

#if COM_INTEROP
        public void PafMF_RelMeiosPagamento(ref FormaPagamento[] formasPagamento, string TituloRelatorio, int indiceRelatorio)
#else

		public void PafMF_RelMeiosPagamento(FormaPagamento[] formasPagamento, string tituloRelatorio,
				int indiceRelatorio)
#endif
		{
			var record = new ACBrECFInterop.FormaPagamentoRec[formasPagamento.Length];
			for (var i = 0; i < formasPagamento.Length; i++)
			{
				record[i].Indice = formasPagamento[i].Indice;
				record[i].Descricao = ToUTF8(formasPagamento[i].Descricao);
				record[i].PermiteVinculado = formasPagamento[i].PermiteVinculado;
				record[i].Total = Convert.ToDouble(formasPagamento[i].Total);
				record[i].Data = formasPagamento[i].Data.ToOADate();
				record[i].TipoDoc = ToUTF8(formasPagamento[i].TipoDoc);
			}

			var ret = ACBrECFInterop.ECF_PafMF_RelMeiosPagamento(this.Handle, record, record.Length,
				ToUTF8(tituloRelatorio), indiceRelatorio);
			CheckResult(ret);
		}

#if !COM_INTEROP

		public void PafMF_RelMeiosPagamento(IEnumerable<FormaPagamento> formasPagamento, string TituloRelatorio,
			int indiceRelatorio)
		{
			PafMF_RelMeiosPagamento(formasPagamento.ToArray(), TituloRelatorio, indiceRelatorio);
		}

#endif

		public void PafMF_RelIdentificacaoPafECF(IdenticacaoPaf identificacaoPAF = null, int indiceRelatorio = 0)
		{
			IdenticacaoPaf identificaPAF;

			if (identificacaoPAF == null)
				identificaPAF = this.AAC.IdentPaf;
			else
				identificaPAF = identificacaoPAF;

			var ret = ACBrECFInterop.ECF_PafMF_RelIdentificacaoPafECF(this.Handle, identificaPAF.Handle, indiceRelatorio);
			CheckResult(ret);
		}

		public void PafMF_RelParametrosConfiguracao(InfoPaf infoPAF = null, int indiceRelatorio = 1)
		{
			var info = infoPAF ?? this.AAC.IdentPaf.Paf;

			var ret = ACBrECFInterop.ECF_PafMF_RelParametrosConfiguracao(this.Handle, info.Handle, indiceRelatorio);
			CheckResult(ret);
		}

#if COM_INTEROP
        public void PafMF_RelParametrosConfiguracao2(string perfil, int indiceRelatorio = 1)
#else

		public void PafMF_RelParametrosConfiguracao(string perfil, int indiceRelatorio = 1)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_RelParametrosConfiguracao2(this.Handle, perfil.ToUTF8(), indiceRelatorio);
			CheckResult(ret);
		}

		#endregion PAF Relatorios

		#region PAF

		public void PafMF_GerarCAT52(DateTime DataInicial, DateTime DataFinal, string CaminhoArquivo)
		{
			var ret = ACBrECFInterop.ECF_PafMF_GerarCAT52(this.Handle, DataInicial.ToOADate(), DataFinal.ToOADate(),
				ToUTF8(CaminhoArquivo));
			CheckResult(ret);
		}

		public void PafMF_LX_Impressao()
		{
			var ret = ACBrECFInterop.ECF_PafMF_LX_Impressao(this.Handle);
			CheckResult(ret);
		}

		public void DoAtualizarValorGT()
		{
			var ret = ACBrECFInterop.ECF_DoAtualizarValorGT(Handle);
			CheckResult(ret);
		}

		public void DoVerificaValorGT()
		{
			var ret = ACBrECFInterop.ECF_DoVerificaValorGT(this.Handle);
			CheckResult(ret);
		}

		public void PafMF_ArqMF_Binario(string pathArquivo, bool assinar)
		{
			var ret = ACBrECFInterop.ECF_PafMF_ArqMF_Binario(Handle, ToUTF8(pathArquivo), assinar);
			CheckResult(ret);
		}

		public void PafMF_ArqMFD_Binario(string pathArquivo, DateTime dataInicial, DateTime dataFinal, bool assinar)
		{
			var ret = ACBrECFInterop.ECF_PafMF_ArqMFD_Binario(Handle, ToUTF8(pathArquivo), dataInicial.ToOADate(),
				dataFinal.ToOADate(), assinar);
			CheckResult(ret);
		}

		public string GetRodapePaf()
		{
			return GetString(ACBrECFInterop.ECF_GetRodapePaf);
		}

		#endregion PAF

		#region PAF Arquivos

		public void ArquivoMF_Binario_DLL(string pathArquivo)
		{
			var ret = ACBrECFInterop.ECF_ArquivoMF_Binario_DLL(Handle, ToUTF8(pathArquivo));
			CheckResult(ret);
		}

		public void ArquivoMFD_Binario_DLL(string pathArquivo)
		{
			var ret = ACBrECFInterop.ECF_ArquivoMFD_Binario_DLL(Handle, ToUTF8(pathArquivo));
			CheckResult(ret);
		}

		public void ArquivoMFD_Binario_DLL(string pathArquivo, DateTime dataInicial, DateTime dataFinal)
		{
			var ret = ACBrECFInterop.ECF_ArquivoMFD_Binario_DLL_Data(Handle, ToUTF8(pathArquivo), dataInicial.ToOADate(),
				dataFinal.ToOADate());
			CheckResult(ret);
		}

		public void ArquivoMFD_Binario_DLL(string pathArquivo, int cooInicial, int cooFinal)
		{
			var ret = ACBrECFInterop.ECF_ArquivoMFD_Binario_DLL_COO(Handle, ToUTF8(pathArquivo), cooInicial, cooFinal);
			CheckResult(ret);
		}

		public void ArquivoMFD_DLL(DateTime DataInicial, DateTime DataFinal, string CaminhoArquivo,
			FinalizaArqMFD Finaliza = FinalizaArqMFD.MFD, params TipoDocumento[] Documentos)
		{
			var docs = Documentos.Length > 0 ? Array.ConvertAll(Documentos, value => (int)value) : new[] { (int)TipoDocumento.Todos };

			var ret = ACBrECFInterop.ECF_ArquivoMFD_DLL(Handle, DataInicial.ToOADate(), DataFinal.ToOADate(),
				ToUTF8(CaminhoArquivo), docs, docs.Length, (int)Finaliza);

			CheckResult(ret);
		}

		public void ArquivoMFD_DLL(int COOInicial, int COOFinal, string CaminhoArquivo,
			FinalizaArqMFD Finaliza = FinalizaArqMFD.MFD, TipoContador TipoContador = TipoContador.COO,
			params TipoDocumento[] Documentos)
		{
			var docs = Documentos.Length > 0 ? Array.ConvertAll(Documentos, value => (int)value) : new[] { (int)TipoDocumento.Todos };

			var ret = ACBrECFInterop.ECF_ArquivoMFD_DLL_COO(Handle, COOInicial, COOFinal, ToUTF8(CaminhoArquivo), docs,
				docs.Length, (int)Finaliza, (int)TipoContador);
			CheckResult(ret);
		}

		#endregion PAF Arquivos

		#region PAF LMFC

#if COM_INTEROP

        public void PafMF_LMFC_Cotepe1704PorData(DateTime DataInicial, DateTime DataFinal, string CaminhoArquivo)
#else

		public void PafMF_LMFC_Cotepe1704(DateTime DataInicial, DateTime DataFinal, string CaminhoArquivo)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_LMFC_Cotepe1704(this.Handle, DataInicial.ToOADate(), DataFinal.ToOADate(),
				ToUTF8(CaminhoArquivo));
			CheckResult(ret);
		}

#if COM_INTEROP

        public void PafMF_LMFC_Cotepe1704PorCRZ(int CRZInicial, int CRZFinal, string CaminhoArquivo)
#else

		public void PafMF_LMFC_Cotepe1704(int CRZInicial, int CRZFinal, string CaminhoArquivo)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_LMFC_Cotepe1704_CRZ(this.Handle, CRZInicial, CRZFinal,
				ToUTF8(CaminhoArquivo));
			CheckResult(ret);
		}

#if COM_INTEROP

        public void PafMF_LMFC_EspelhoPorData(DateTime DataInicial, DateTime DataFinal, string CaminhoArquivo)
#else

		public void PafMF_LMFC_Espelho(DateTime DataInicial, DateTime DataFinal, string CaminhoArquivo)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_LMFC_Espelho(this.Handle, DataInicial.ToOADate(), DataFinal.ToOADate(),
				ToUTF8(CaminhoArquivo));
			CheckResult(ret);
		}

#if COM_INTEROP

        public void PafMF_LMFC_EspelhoPorCRZ(int CRZInicial, int CRZFinal, string CaminhoArquivo)
#else

		public void PafMF_LMFC_Espelho(int CRZInicial, int CRZFinal, string CaminhoArquivo)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_LMFC_Espelho_CRZ(this.Handle, CRZInicial, CRZFinal,
				ToUTF8(CaminhoArquivo));
			CheckResult(ret);
		}

#if COM_INTEROP

        public void PafMF_LMFC_ImpressaoPorData(DateTime DataInicial, DateTime DataFinal)
#else

		public void PafMF_LMFC_Impressao(DateTime DataInicial, DateTime DataFinal)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_LMFC_Impressao(this.Handle, DataInicial.ToOADate(), DataFinal.ToOADate());
			CheckResult(ret);
		}

#if COM_INTEROP

        public void PafMF_LMFC_ImpressaoPorCRZ(int CRZInicial, int CRZFinal)
#else

		public void PafMF_LMFC_Impressao(int CRZInicial, int CRZFinal)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_LMFC_Impressao_CRZ(this.Handle, CRZInicial, CRZFinal);
			CheckResult(ret);
		}

		#endregion PAF LMFC

		#region PAF LMFS

#if COM_INTEROP

        public void PafMF_LMFS_EspelhoPorData(DateTime DataInicial, DateTime DataFinal, string CaminhoArquivo)
#else

		public void PafMF_LMFS_Espelho(DateTime DataInicial, DateTime DataFinal, string CaminhoArquivo)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_LMFS_Espelho(this.Handle, DataInicial.ToOADate(), DataFinal.ToOADate(),
				ToUTF8(CaminhoArquivo));
			CheckResult(ret);
		}

#if COM_INTEROP

        public void PafMF_LMFS_EspelhoPorCRZ(int CRZInicial, int CRZFinal, string CaminhoArquivo)
#else

		public void PafMF_LMFS_Espelho(int CRZInicial, int CRZFinal, string CaminhoArquivo)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_LMFS_Espelho_CRZ(this.Handle, CRZInicial, CRZFinal,
				ToUTF8(CaminhoArquivo));
			CheckResult(ret);
		}

#if COM_INTEROP

        public void PafMF_LMFS_ImpressaoPorData(DateTime DataInicial, DateTime DataFinal)
#else

		public void PafMF_LMFS_Impressao(DateTime DataInicial, DateTime DataFinal)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_LMFS_Impressao(this.Handle, DataInicial.ToOADate(), DataFinal.ToOADate());
			CheckResult(ret);
		}

#if COM_INTEROP

        public void PafMF_LMFS_ImpressaoPorCRZ(int CRZInicial, int CRZFinal)
#else

		public void PafMF_LMFS_Impressao(int CRZInicial, int CRZFinal)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_LMFS_Impressao_CRZ(this.Handle, CRZInicial, CRZFinal);
			CheckResult(ret);
		}

		#endregion PAF LMFS

		#region PAF Espelho MFD

#if COM_INTEROP

        public void PafMF_MFD_Cotepe1704PorData(DateTime DataInicial, DateTime DataFinal, string CaminhoArquivo)
#else

		public void PafMF_MFD_Cotepe1704(DateTime DataInicial, DateTime DataFinal, string CaminhoArquivo)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_MFD_Cotepe1704(this.Handle, DataInicial.ToOADate(), DataFinal.ToOADate(),
				ToUTF8(CaminhoArquivo));
			CheckResult(ret);
		}

#if COM_INTEROP

        public void PafMF_MFD_Cotepe1704PorCOO(int COOInicial, int COOFinal, string CaminhoArquivo)
#else

		public void PafMF_MFD_Cotepe1704(int COOInicial, int COOFinal, string CaminhoArquivo)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_MFD_Cotepe1704_COO(this.Handle, COOInicial, COOFinal,
				ToUTF8(CaminhoArquivo));
			CheckResult(ret);
		}

		#endregion PAF Espelho MFD

		#region PAF Arq. MFD

#if COM_INTEROP

        public void PafMF_MFD_EspelhoPorData(DateTime DataInicial, DateTime DataFinal, string CaminhoArquivo)
#else

		public void PafMF_MFD_Espelho(DateTime DataInicial, DateTime DataFinal, string CaminhoArquivo)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_MFD_Espelho(this.Handle, DataInicial.ToOADate(), DataFinal.ToOADate(),
				ToUTF8(CaminhoArquivo));
			CheckResult(ret);
		}

#if COM_INTEROP

        public void PafMF_MFD_EspelhoPorCOO(int COOInicial, int COOFinal, string CaminhoArquivo)
#else

		public void PafMF_MFD_Espelho(int COOInicial, int COOFinal, string CaminhoArquivo)
#endif
		{
			var ret = ACBrECFInterop.ECF_PafMF_MFD_Espelho_COO(this.Handle, COOInicial, COOFinal, ToUTF8(CaminhoArquivo));
			CheckResult(ret);
		}

		#endregion PAF Arq. MFD
	}
}