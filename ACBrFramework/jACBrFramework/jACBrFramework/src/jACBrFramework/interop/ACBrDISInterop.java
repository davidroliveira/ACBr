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

public interface ACBrDISInterop extends InteropLib {

	public static final ACBrDISInterop INSTANCE = (ACBrDISInterop)
			Native.synchronizedLibrary((Library) Native.loadLibrary(InteropLib.JNA_LIBRARY_NAME, ACBrDISInterop.class));

	// Tipos de dados
	public interface AtualizaCallback extends com.sun.jna.Callback {
		void invoke(int linha,String textoVisivel);
	}

	// Funções
	int DIS_Ativar(int disHandle);
	int DIS_Continuar(int disHandle);
	int DIS_ContinuarLinha(int disHandle, int Linha);
	int DIS_Create(IntByReference disHandle);
	int DIS_Desativar(int disHandle);
	int DIS_Destroy(int disHandle);
	int DIS_Escrever(int disHandle, String AText);
	int DIS_ExibirLinha(int disHandle, int Linha, String AText);
	int DIS_ExibirLinhaAlinhamento(int disHandle, int Linha, String AText, int Alinhamento);
	int DIS_ExibirLinhaEfeito(int disHandle, int Linha, String AText, int Efeito);
	int DIS_GetAlinhamento(int disHandle);
	int DIS_GetAtivo(int disHandle);
	int DIS_GetColunas(int disHandle);
	int DIS_GetCursor(int disHandle, IntByReference x, IntByReference y);
	int DIS_GetIntervalo(int disHandle);
	int DIS_GetIntervaloEnvioBytes(int disHandle);
	int DIS_GetLinhasCount(int disHandle);
	int DIS_GetModelo(int disHandle);
	int DIS_GetModeloStr(int disHandle, ByteBuffer buffer, int bufferLen);
	int DIS_GetPassos(int disHandle);
	int DIS_GetRemoveAcentos(int disHandle);
	int DIS_GetTrabalhando(int disHandle);
	int DIS_GetUltimoErro(int disHandle, ByteBuffer buffer, int bufferLen);
	int DIS_LimparDisplay(int disHandle);
	int DIS_LimparLinha(int disHandle, int Linha);
	int DIS_Parar(int disHandle);
	int DIS_PararLinha(int disHandle, int Linha);
	int DIS_PosicionarCursor(int disHandle, int Linha, int Coluna);
	int DIS_RolarLinha(int disHandle, int Linha, int Efeito);
	int DIS_SetAlinhamento(int disHandle, int value);
	int DIS_SetColunas(int disHandle, int value);
	int DIS_SetIntervalo(int disHandle, int value);
	int DIS_SetIntervaloEnvioBytes(int disHandle, int value);
	int DIS_SetLinhasCount(int disHandle, int value);
	int DIS_SetModelo(int disHandle, int modelo);
	int DIS_SetOnAtualiza(int disHandle, ACBrDISInterop.AtualizaCallback method);
	int DIS_SetPassos(int disHandle, int value);
	int DIS_SetRemoveAcentos(int disHandle, boolean value);
}
