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

public interface ACBrIBGEInterop extends InteropLib {

	public static final ACBrIBGEInterop INSTANCE = (ACBrIBGEInterop)
			Native.synchronizedLibrary((Library) Native.loadLibrary(InteropLib.JNA_LIBRARY_NAME, ACBrIBGEInterop.class));

	// Tipos de dados
	public static class CidadeRec extends Structure {
		public byte[] Municipio = new byte[51];
		public int CodMunicio;
		public byte[] UF = new byte[3];
		public int CodUF;
		public double Area;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("Municipio" , "CodMunicio" , "UF" , "CodUF" , "Area");
		}

		public static class ByReference extends CidadeRec implements Structure.ByReference { }
		public static class ByValue extends CidadeRec implements Structure.ByValue { }
	}

	public interface OnBuscaEfetuadaCallback extends com.sun.jna.Callback {
		void invoke();
	}

	// Funções
	int IBGE_BuscarPorCodigo(int ibgeHandle, int codigo);
	int IBGE_BuscarPorNome(int ibgeHandle, String cidade, String uf, boolean exata);
	int IBGE_Cidades_GetCount(int ibgeHandle);
	int IBGE_Cidades_GetItem(int ibgeHandle, ACBrIBGEInterop.CidadeRec.ByReference cidadeRec, int index);
	int IBGE_Create(IntByReference ibgeHandle);
	int IBGE_Destroy(int ibgeHandle);
	int IBGE_GetUltimoErro(int ibgeHandle, ByteBuffer buffer, int bufferLen);
	int IBGE_SetOnBuscaEfetuada(int ibgeHandle, ACBrIBGEInterop.OnBuscaEfetuadaCallback method);
}
