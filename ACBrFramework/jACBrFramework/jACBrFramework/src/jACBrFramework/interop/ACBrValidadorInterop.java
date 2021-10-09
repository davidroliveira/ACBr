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

public interface ACBrValidadorInterop extends InteropLib {

	public static final ACBrValidadorInterop INSTANCE = (ACBrValidadorInterop)
			Native.synchronizedLibrary((Library) Native.loadLibrary(InteropLib.JNA_LIBRARY_NAME, ACBrValidadorInterop.class));

	// Tipos de dados
	public interface OnMsgErroCallback extends com.sun.jna.Callback {
		void invoke(String Mensagem);
	}

	// Funções
	int VAL_Create(IntByReference valHandle);
	int VAL_Destroy(int valHandle);
	int VAL_Formatar(int valHandle, ByteBuffer buffer, int bufferLen);
	int VAL_FormatarCEP(int valHandle, String documento, ByteBuffer buffer, int bufferLen);
	int VAL_FormatarCheque(int valHandle, String documento, ByteBuffer buffer, int bufferLen);
	int VAL_FormatarCNPJ(int valHandle, String documento, ByteBuffer buffer, int bufferLen);
	int VAL_FormatarCPF(int valHandle, String documento, ByteBuffer buffer, int bufferLen);
	int VAL_FormatarIE(int valHandle, String ie, String uf, ByteBuffer buffer, int bufferLen);
	int VAL_FormatarPIS(int valHandle, String documento, ByteBuffer buffer, int bufferLen);
	int VAL_FormatarSUFRAMA(int valHandle, String documento, ByteBuffer buffer, int bufferLen);
	int VAL_GetAjustarTamanho(int valHandle);
	int VAL_GetComplemento(int valHandle, ByteBuffer buffer, int bufferLen);
	int VAL_GetDigitoCalculado(int valHandle, ByteBuffer buffer, int bufferLen);
	int VAL_GetDoctoValidado(int valHandle, ByteBuffer buffer, int bufferLen);
	int VAL_GetDocumento(int valHandle, ByteBuffer buffer, int bufferLen);
	int VAL_GetExibeDigitoCorreto(int valHandle);
	int VAL_GetIgnorarChar(int valHandle, ByteBuffer buffer, int bufferLen);
	int VAL_GetMsgErro(int valHandle, ByteBuffer buffer, int bufferLen);
	int VAL_GetPermiteVazio(int valHandle);
	int VAL_GetRaiseExcept(int valHandle);
	int VAL_GetTipoDocto(int valHandle);
	int VAL_GetUltimoErro(int valHandle, ByteBuffer buffer, int bufferLen);
	int VAL_Modulo_Calcular(int valHandle);
	int VAL_Modulo_CalculoPadrao(int valHandle);
	int VAL_Modulo_GetDigitoFinal(int valHandle);
	int VAL_Modulo_GetDocumento(int valHandle, ByteBuffer buffer, int bufferLen);
	int VAL_Modulo_GetFormulaDigito(int valHandle);
	int VAL_Modulo_GetModuloFinal(int valHandle);
	int VAL_Modulo_GetMultiplicadorAtual(int valHandle);
	int VAL_Modulo_GetMultiplicadorFinal(int valHandle);
	int VAL_Modulo_GetMultiplicadorInicial(int valHandle);
	int VAL_Modulo_GetSomaDigitos(int valHandle);
	int VAL_Modulo_SetDocumento(int valHandle, String documento);
	int VAL_Modulo_SetFormulaDigito(int valHandle, int value);
	int VAL_Modulo_SetMultiplicadorAtual(int valHandle, int value);
	int VAL_Modulo_SetMultiplicadorFinal(int valHandle, int value);
	int VAL_Modulo_SetMultiplicadorInicial(int valHandle, int value);
	int VAL_SetAjustarTamanho(int valHandle, boolean ajustar);
	int VAL_SetComplemento(int valHandle, String complemento);
	int VAL_SetDocumento(int valHandle, String documento);
	int VAL_SetExibeDigitoCorreto(int valHandle, boolean exibe);
	int VAL_SetIgnorarChar(int valHandle, String ignorar);
	int VAL_SetOnMsgErro(int valHandle, ACBrValidadorInterop.OnMsgErroCallback method);
	int VAL_SetPermiteVazio(int valHandle, boolean permite);
	int VAL_SetRaiseExcept(int valHandle, boolean permite);
	int VAL_SetTipoDocto(int valHandle, int doc);
	int VAL_Validar(int valHandle);
}
