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

public interface ACBrETQInterop extends InteropLib {

	public static final ACBrETQInterop INSTANCE = (ACBrETQInterop)
			Native.synchronizedLibrary((Library) Native.loadLibrary(InteropLib.JNA_LIBRARY_NAME, ACBrETQInterop.class));

	// Tipos de dados
	public interface GravaLogCallback extends com.sun.jna.Callback {
		boolean invoke(String linha);
	}

	// Funções
	int ETQ_Ativar(int etqHandle);
	int ETQ_CarregarImagem(int etqHandle, String imagem, String nomeImagem, boolean flipped);
	int ETQ_CarregarImagemStream(int etqHandle, byte[] imagem, int size, String nomeImagem, boolean flipped, String tipo);
	int ETQ_Class_Ativar(int etqHandle);
	int ETQ_Class_CarregarImagem(int etqHandle, byte[] imagem, int size, String nomeImagem, boolean flipped, String tipo);
	int ETQ_Class_Desativar(int etqHandle);
	int ETQ_Class_FinalizarEtiqueta(int etqHandle, int copias, int avancoEtq);
	int ETQ_Class_GetAdicionarComandoP(int etqHandle);
	int ETQ_Class_GetArqLOG(int ecfHandle, ByteBuffer buffer, int bufferLen);
	int ETQ_Class_GetAtivo(int etqHandle);
	int ETQ_Class_GetAvanco(int etqHandle);
	int ETQ_Class_GetCmd(int ecfHandle, ByteBuffer buffer, int bufferLen);
	int ETQ_Class_GetDPI(int etqHandle);
	int ETQ_Class_GetEtqFinalizada(int etqHandle);
	int ETQ_Class_GetEtqInicializada(int etqHandle);
	int ETQ_Class_GetLimparMemoria(int etqHandle);
	int ETQ_Class_GetListaCmd(int ecfHandle, ByteBuffer buffer, int bufferLen, int index);
	int ETQ_Class_GetListaCmdCount(int etqHandle);
	int ETQ_Class_GetModeloStr(int ecfHandle, ByteBuffer buffer, int bufferLen);
	int ETQ_Class_GetTemperatura(int etqHandle);
	int ETQ_Class_GetUnidade(int etqHandle);
	int ETQ_Class_GravaLog(int etqHandle, String log, boolean traduz);
	int ETQ_Class_Imprimir(int etqHandle, int copias, int avancoEtq);
	int ETQ_Class_ImprimirBarras(int etqHandle, int orientacao, String tipoBarras, String larguraBarraLarga, String larguraBarraFina, int vertical, int horizontal, String texto, int alturaCodBarras, int exibeCodigo);
	int ETQ_Class_ImprimirCaixa(int etqHandle, int vertical, int horizontal, int largura, int altura, int espessuraVertical, int espessuraHorizontal);
	int ETQ_Class_ImprimirImagem(int etqHandle, int multiplicadorImagem, int vertical, int horizontal, String nomeImagem);
	int ETQ_Class_ImprimirLinha(int etqHandle, int vertical, int horizontal, int largura, int altura);
	int ETQ_Class_ImprimirTexto(int etqHandle, int orientacao, int fonte, int multiplicadorH, int multiplicadorV, int vertical, int horizontal, String texto, int subFonte, boolean imprimirReverso);
	int ETQ_Class_IniciarEtiqueta(int etqHandle);
	int ETQ_Class_SetAdicionarComandoP(int etqHandle, boolean value);
	int ETQ_Class_SetArqLOG(int ecfHandle, String value);
	int ETQ_Class_SetAtivo(int etqHandle, boolean value);
	int ETQ_Class_SetAvanco(int etqHandle, int value);
	int ETQ_Class_SetCmd(int ecfHandle, String cmd);
	int ETQ_Class_SetDPI(int etqHandle, int value);
	int ETQ_Class_SetLimparMemoria(int etqHandle, boolean value);
	int ETQ_Class_SetListaCmd(int ecfHandle, String cmd[], int count);
	int ETQ_Class_SetTemperatura(int etqHandle, int value);
	int ETQ_Class_SetUnidade(int etqHandle, int value);
	int ETQ_Create(IntByReference etqHandle);
	int ETQ_Desativar(int etqHandle);
	int ETQ_Destroy(int etqHandle);
	int ETQ_FinalizarEtiqueta(int etqHandle, int copias, int avancoEtq);
	int ETQ_GetAdicionarComandoP(int etqHandle);
	int ETQ_GetArqLOG(int ecfHandle, ByteBuffer buffer, int bufferLen);
	int ETQ_GetAtivo(int etqHandle);
	int ETQ_GetAvanco(int etqHandle);
	int ETQ_GetDPI(int etqHandle);
	int ETQ_GetEtqFinalizada(int etqHandle);
	int ETQ_GetEtqInicializada(int etqHandle);
	int ETQ_GetLimparMemoria(int etqHandle);
	int ETQ_GetModelo(int etqHandle);
	int ETQ_GetModeloStr(int ecfHandle, ByteBuffer buffer, int bufferLen);
	int ETQ_GetPorta(int ecfHandle, ByteBuffer buffer, int bufferLen);
	int ETQ_GetTemperatura(int etqHandle);
	int ETQ_GetUltimoErro(int etqHandle, ByteBuffer buffer, int bufferLen);
	int ETQ_GetUnidade(int etqHandle);
	int ETQ_Imprimir(int etqHandle, int copias, int avancoEtq);
	int ETQ_ImprimirBarras(int etqHandle, int orientacao, String tipoBarras, String larguraBarraLarga, String larguraBarraFina, int vertical, int horizontal, String texto, int alturaCodBarras, int exibeCodigo);
	int ETQ_ImprimirCaixa(int etqHandle, int vertical, int horizontal, int largura, int altura, int espessuraVertical, int espessuraHorizontal);
	int ETQ_ImprimirImagem(int etqHandle, int multiplicadorImagem, int vertical, int horizontal, String nomeImagem);
	int ETQ_ImprimirLinha(int etqHandle, int vertical, int horizontal, int largura, int altura);
	int ETQ_ImprimirTexto(int etqHandle, int orientacao, int fonte, int multiplicadorH, int multiplicadorV, int vertical, int horizontal, String texto, int subFonte, boolean imprimirReverso);
	int ETQ_IniciarEtiqueta(int etqHandle);
	int ETQ_SetAdicionarComandoP(int etqHandle, boolean value);
	int ETQ_SetArqLOG(int ecfHandle, String value);
	int ETQ_SetAtivo(int etqHandle, boolean value);
	int ETQ_SetAvanco(int etqHandle, int value);
	int ETQ_SetDPI(int etqHandle, int value);
	int ETQ_SetLimparMemoria(int etqHandle, boolean value);
	int ETQ_SetModelo(int etqHandle, int value);
	int ETQ_SetOnGravarLog(int etqHandle, ACBrETQInterop.GravaLogCallback method);
	int ETQ_SetPorta(int ecfHandle, String value);
	int ETQ_SetTemperatura(int etqHandle, int value);
	int ETQ_SetUnidade(int etqHandle, int value);
}
