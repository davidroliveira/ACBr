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

public interface ACBrCNIEEInterop extends InteropLib {

	public static final ACBrCNIEEInterop INSTANCE = (ACBrCNIEEInterop)
			Native.synchronizedLibrary((Library) Native.loadLibrary(InteropLib.JNA_LIBRARY_NAME, ACBrCNIEEInterop.class));

	// Tipos de dados
	public static class CNIEERegistroRec extends Structure implements Structure.ByValue {
		public byte[] Marca = new byte[3];
		public byte[] Modelo = new byte[3];
		public byte[] Versao = new byte[3];
		public byte[] Tipo = new byte[11];
		public byte[] MarcaDescr = new byte[31];
		public byte[] ModeloDescr = new byte[31];
		public byte[] VersaoSB = new byte[21];
		public int QtLacreSL;
		public int QTLacreFab;
		public byte[] MFD = new byte[4];
		public byte[] LacreMFD = new byte[4];
		public byte[] AtoAprovacao = new byte[26];
		public byte[] AtoRegistro = new byte[26];
		public byte[] FormatoNumero = new byte[21];

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("Marca" , "Modelo" , "Versao" , "Tipo" , "MarcaDescr" , "ModeloDescr" , "VersaoSB" , "QtLacreSL" , "QTLacreFab" , "MFD" , "LacreMFD" , "AtoAprovacao" , "AtoRegistro" , "FormatoNumero");
		}

		public static class ByReference extends CNIEERegistroRec implements Structure.ByReference { }
		public static class ByValue extends CNIEERegistroRec implements Structure.ByValue { }
	}


	// Funções
	int CNIEE_AbrirTabela(int cnieeHandle);
	int CNIEE_BuscarECF(int cnieeHandle, ACBrCNIEEInterop.CNIEERegistroRec Registro, String marca, String modelo, String versaosb);
	int CNIEE_Create(IntByReference cnieeHandle);
	int CNIEE_Destroy(int cnieeHandle);
	int CNIEE_DownloadTabela(int cnieeHandle);
	int CNIEE_Exportar(int cnieeHandle, String path, String delimitador, int tipo);
	int CNIEE_GetArquivo(int cnieeHandle, ByteBuffer buffer, int bufferLen);
	int CNIEE_GetParseText(int cnieeHandle);
	int CNIEE_GetProxyHost(int cnieeHandle, ByteBuffer buffer, int bufferLen);
	int CNIEE_GetProxyPass(int cnieeHandle, ByteBuffer buffer, int bufferLen);
	int CNIEE_GetProxyPort(int cnieeHandle, ByteBuffer buffer, int bufferLen);
	int CNIEE_GetProxyUser(int cnieeHandle, ByteBuffer buffer, int bufferLen);
	int CNIEE_GetRegistro(int cnieeHandle, ACBrCNIEEInterop.CNIEERegistroRec Registro, int index);
	int CNIEE_GetRegistroCount(int cnieeHandle);
	int CNIEE_GetUltimoErro(int cnieeHandle, ByteBuffer buffer, int bufferLen);
	int CNIEE_GetURLDownload(int cnieeHandle, ByteBuffer buffer, int bufferLen);
	int CNIEE_GetVersaoArquivo(int cnieeHandle, ByteBuffer buffer, int bufferLen);
	int CNIEE_LerConfiguracoesProxy(int cnieeHandle);
	int CNIEE_SetArquivo(int cnieeHandle, String arquivo);
	int CNIEE_SetParseText(int cnieeHandle, boolean parseText);
	int CNIEE_SetProxyHost(int cnieeHandle, String proxyHost);
	int CNIEE_SetProxyPass(int cnieeHandle, String proxyPass);
	int CNIEE_SetProxyPort(int cnieeHandle, String proxyPort);
	int CNIEE_SetProxyUser(int cnieeHandle, String proxyUser);
	int CNIEE_SetURLDownload(int cnieeHandle, String urlDownload);
}
