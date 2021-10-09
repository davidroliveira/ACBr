/**
 * ACBrFramework DefExporter
 * Este arquivo foi gerado automaticamente - não altere
 * This file was generated automatically - don't change it.
 **/

package jACBrFramework.interop;
import jACBrFramework.InteropLib;
import com.sun.jna.*;
import com.sun.jna.ptr.*;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.List;

public interface ACBrRFDInterop extends InteropLib {

	public static final ACBrRFDInterop INSTANCE = (ACBrRFDInterop)
			Native.synchronizedLibrary((Library) Native.loadLibrary(InteropLib.JNA_LIBRARY_NAME, ACBrRFDInterop.class));

	// Tipos de dados
	public interface OnCalcEADCallback extends com.sun.jna.Callback {
		void invoke(String Arquivo);
	}
	public interface OnCalcHashLogCallback extends com.sun.jna.Callback {
		String invoke(String Linha);
	}
	public interface OnGetKeyCallback extends com.sun.jna.Callback {
		String invoke();
	}

	// Funções
	int RFD_AbreCupom(int rfdHandle);
	int RFD_AchaRFDID(int rfdHandle, String value, ByteBuffer buffer, int bufferLen);
	int RFD_Ativar(int rfdHandle);
	int RFD_CancelaCupom(int rfdHandle, int value);
	int RFD_CancelaItemVendido(int rfdHandle, int value);
	int RFD_Create(IntByReference rfdHandle);
	int RFD_CriarArqRFDID(int rfdHandle, String value);
	int RFD_Desativar(int rfdHandle);
	int RFD_Destroy(int rfdHandle);
	int RFD_Documento(int rfdHandle, String value);
	int RFD_EfetuaPagamento(int rfdHandle, String descricao, double valor);
	int RFD_FechaCupom(int rfdHandle);
	int RFD_GetArqINI(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetArqReducaoZ(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetArqRFD(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetArqRFDID(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetAtivo(int rfdHandle);
	int RFD_GetAtoCotepe(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetCONT_CNPJ(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetCONT_CROCadastro(int rfdHandle, IntByReference value);
	int RFD_GetCONT_DataHoraCadastro(int rfdHandle, DoubleByReference value);
	int RFD_GetCONT_Endereco(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetCONT_GTCadastro(int rfdHandle, DoubleByReference value);
	int RFD_GetCONT_IE(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetCONT_NumUsuario(int rfdHandle, IntByReference value);
	int RFD_GetCONT_RazaoSocial(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetDiaMov(int rfdHandle, DoubleByReference value);
	int RFD_GetDirECF(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetDirECFLog(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetDirECFMes(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetDirRFD(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetECF_CROAtual(int rfdHandl);
	int RFD_GetECF_DataHoraSwBasico(int rfdHandle, DoubleByReference value);
	int RFD_GetECF_RFDID(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetIgnoraEcfMfd(int rfdHandle);
	int RFD_GetSH_CNPJ(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetSH_COO(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetSH_IE(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetSH_IM(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetSH_Linha1(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetSH_Linha2(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetSH_NomeAplicativo(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetSH_NumeroAplicativo(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetSH_VersaoAplicativo(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GetUltimoErro(int rfdHandle, ByteBuffer buffer, int bufferLen);
	int RFD_GravarINI(int rfdHandle);
	int RFD_LerINI(int rfdHandle);
	int RFD_NomeArqRFD(int rfdHandle, double value, ByteBuffer buffer, int bufferLen);
	int RFD_ReducaoZ(int rfdHandle, String value);
	int RFD_SetAtivo(int rfdHandle, boolean value);
	int RFD_SetAtoCotepe(int rfdHandle, String value);
	int RFD_SetCONT_CNPJ(int rfdHandle, String value);
	int RFD_SetCONT_CROCadastro(int rfdHandle, int value);
	int RFD_SetCONT_DataHoraCadastro(int rfdHandle, double value);
	int RFD_SetCONT_Endereco(int rfdHandle, String value);
	int RFD_SetCONT_GTCadastro(int rfdHandle, double value);
	int RFD_SetCONT_IE(int rfdHandle, String value);
	int RFD_SetCONT_NumUsuario(int rfdHandle, int value);
	int RFD_SetCONT_RazaoSocial(int rfdHandle, String value);
	int RFD_SetDirRFD(int rfdHandle, String value);
	int RFD_SetECF(int rfdHandle, int ecfHandle);
	int RFD_SetECF_CROAtual(int rfdHandle, int value);
	int RFD_SetECF_DataHoraSwBasico(int rfdHandle, double value);
	int RFD_SetECF_RFDID(int rfdHandle, String value);
	int RFD_SetIgnoraEcfMfd(int rfdHandle, boolean value);
	int RFD_SetOnCalcEAD(int rfdHandle, ACBrRFDInterop.OnCalcEADCallback method);
	int RFD_SetOnCalcHashLog(int rfdHandle, ACBrRFDInterop.OnCalcHashLogCallback method);
	int RFD_SetOnGetKeyHashLog(int rfdHandle, ACBrRFDInterop.OnGetKeyCallback method);
	int RFD_SetOnGetKeyRSA(int rfdHandle, ACBrRFDInterop.OnGetKeyCallback method);
	int RFD_SetSH_CNPJ(int rfdHandle, String value);
	int RFD_SetSH_COO(int rfdHandle, String value);
	int RFD_SetSH_IE(int rfdHandle, String value);
	int RFD_SetSH_IM(int rfdHandle, String value);
	int RFD_SetSH_Linha1(int rfdHandle, String value);
	int RFD_SetSH_Linha2(int rfdHandle, String value);
	int RFD_SetSH_NomeAplicativo(int rfdHandle, String value);
	int RFD_SetSH_NumeroAplicativo(int rfdHandle, String value);
	int RFD_SetSH_VersaoAplicativo(int rfdHandle, String value);
	int RFD_SubTotalizaCupom(int rfdHandle, double value);
	int RFD_VendeItem(int rfdHandle, String codigo, String descricao, double Qtd, double ValorUnitario, String Unidade, double ValorDescAcres, String Aliquota);
	int RFD_VerificaParametros(int rfdHandle);
}
