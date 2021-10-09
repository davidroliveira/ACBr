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

public interface ACBrCEPInterop extends InteropLib {

	public static final ACBrCEPInterop INSTANCE = (ACBrCEPInterop)
			Native.synchronizedLibrary((Library) Native.loadLibrary(InteropLib.JNA_LIBRARY_NAME, ACBrCEPInterop.class));

	// Tipos de dados
	public interface AntesAbrirHTTPCallback extends com.sun.jna.Callback {
		String invoke(String url);
	}
	public interface NoArgumentCallback extends com.sun.jna.Callback {
		void invoke();
	}

	// Funções
	int CEP_BuscarPorCEP(int cepHandle, String value);
	int CEP_BuscarPorLogradouro(int cepHandle, String cidade, String tipo, String logradouro, String uf, String bairro);
	int CEP_Create(IntByReference cepHandle);
	int CEP_Destroy(int cepHandle);
	int CEP_Endereco_GetBairro(int cepHandle, int endHandle, ByteBuffer buffer, int bufferLen);
	int CEP_Endereco_GetCEP(int cepHandle, int endHandle, ByteBuffer buffer, int bufferLen);
	int CEP_Endereco_GetComplemento(int cepHandle, int endHandle, ByteBuffer buffer, int bufferLen);
	int CEP_Endereco_GetIBGE_Municipio(int cepHandle, int endHandle, ByteBuffer buffer, int bufferLen);
	int CEP_Endereco_GetIBGE_UF(int cepHandle, int endHandle, ByteBuffer buffer, int bufferLen);
	int CEP_Endereco_GetLogradouro(int cepHandle, int endHandle, ByteBuffer buffer, int bufferLen);
	int CEP_Endereco_GetMunicipio(int cepHandle, int endHandle, ByteBuffer buffer, int bufferLen);
	int CEP_Endereco_GetTipo_Logradouro(int cepHandle, int endHandle, ByteBuffer buffer, int bufferLen);
	int CEP_Endereco_GetUF(int cepHandle, int endHandle, ByteBuffer buffer, int bufferLen);
	int CEP_Endereco_SetBairro(int cepHandle, int endHandle, String value);
	int CEP_Endereco_SetCEP(int cepHandle, int endHandle, String value);
	int CEP_Endereco_SetComplemento(int cepHandle, int endHandle, String value);
	int CEP_Endereco_SetIBGE_Municipio(int cepHandle, int endHandle, String value);
	int CEP_Endereco_SetLogradouro(int cepHandle, int endHandle, String value);
	int CEP_Endereco_SetMunicipio(int cepHandle, int endHandle, String value);
	int CEP_Endereco_SetTipo_Logradouro(int cepHandle, int endHandle, String value);
	int CEP_Endereco_SetUF(int cepHandle, int endHandle, String value);
	int CEP_Enderecos_GetCount(int cepHandle, int endsHandle);
	int CEP_Enderecos_GetItem(int cepHandle, int endsHandle, int index, IntByReference endHandle);
	int CEP_GetChaveAcesso(int cepHandle, ByteBuffer buffer, int bufferLen);
	int CEP_GetEnderecos(int cepHandle, IntByReference endsHandle);
	int CEP_GetParseText(int cepHandle);
	int CEP_GetProxyHost(int cepHandle, ByteBuffer buffer, int bufferLen);
	int CEP_GetProxyPass(int cepHandle, ByteBuffer buffer, int bufferLen);
	int CEP_GetProxyPort(int cepHandle, ByteBuffer buffer, int bufferLen);
	int CEP_GetProxyUser(int cepHandle, ByteBuffer buffer, int bufferLen);
	int CEP_GetSenha(int cepHandle, ByteBuffer buffer, int bufferLen);
	int CEP_GetUltimoErro(int cepHandle, ByteBuffer buffer, int bufferLen);
	int CEP_GetURL(int cepHandle, ByteBuffer buffer, int bufferLen);
	int CEP_GetUsuario(int cepHandle, ByteBuffer buffer, int bufferLen);
	int CEP_GetWebService(int cepHandle);
	int CEP_LerConfiguracoesProxy(int cepHandle);
	int CEP_SetChaveAcesso(int cepHandle, String value);
	int CEP_SetOnAntesAbrirHTTP(int cepHandle, ACBrCEPInterop.AntesAbrirHTTPCallback method);
	int CEP_SetOnBuscaEfetuada(int cepHandle, ACBrCEPInterop.NoArgumentCallback method);
	int CEP_SetParseText(int cepHandle, boolean value);
	int CEP_SetProxyHost(int cepHandle, String value);
	int CEP_SetProxyPass(int cepHandle, String value);
	int CEP_SetProxyPort(int cepHandle, String value);
	int CEP_SetProxyUser(int cepHandle, String value);
	int CEP_SetSenha(int cepHandle, String value);
	int CEP_SetUsuario(int cepHandle, String value);
	int CEP_SetWebService(int cepHandle, int value);
}
