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

public interface ACBrSMSInterop extends InteropLib {

	public static final ACBrSMSInterop INSTANCE = (ACBrSMSInterop)
			Native.synchronizedLibrary((Library) Native.loadLibrary(InteropLib.JNA_LIBRARY_NAME, ACBrSMSInterop.class));

	// Tipos de dados
	public static class MSGRec extends Structure implements Structure.ByValue {
		public byte[] Telefone = new byte[13];
		public byte[] Message = new byte[321];

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("Telefone" , "Message");
		}

		public static class ByReference extends MSGRec implements Structure.ByReference { }
		public static class ByValue extends MSGRec implements Structure.ByValue { }
	}

	public interface OnProgressoCallback extends com.sun.jna.Callback {
		void invoke(int AAtual,int ATotal);
	}

	// Funções
	int SMS_Ativar(int smsHandle);
	int SMS_Create(IntByReference smsHandle);
	int SMS_Desativar(int smsHandle);
	int SMS_Destroy(int smsHandle);
	int SMS_EnviarSMS(int smsHandle, String telefone, String menssagem, ByteBuffer buffer, int bufferLen);
	int SMS_EnviarSMSLote(int smsHandle, int msgHandle, ByteBuffer buffer, int bufferLen);
	int SMS_GetAtivo(int smsHandle);
	int SMS_GetATResult(int smsHandle);
	int SMS_GetATTimeOut(int smsHandle);
	int SMS_GetBandejasSimCard(int smsHandle);
	int SMS_GetEmLinha(int smsHandle);
	int SMS_GetEstadoSincronismo(int smsHandle);
	int SMS_GetFabricante(int smsHandle, ByteBuffer buffer, int bufferLen);
	int SMS_GetFirmware(int smsHandle, ByteBuffer buffer, int bufferLen);
	int SMS_GetIMEI(int smsHandle, ByteBuffer buffer, int bufferLen);
	int SMS_GetIMSI(int smsHandle, ByteBuffer buffer, int bufferLen);
	int SMS_GetIntervaloEntreMensagens(int smsHandle);
	int SMS_GetModelo(int smsHandle);
	int SMS_GetModeloModem(int smsHandle, ByteBuffer buffer, int bufferLen);
	int SMS_GetNivelSinal(int smsHandle, DoubleByReference nivel);
	int SMS_GetOperadora(int smsHandle, ByteBuffer buffer, int bufferLen);
	int SMS_GetQuebraMensagens(int smsHandle);
	int SMS_GetRecebeConfirmacao(int smsHandle);
	int SMS_GetSimCard(int smsHandle);
	int SMS_GetUltimaResposta(int smsHandle, ByteBuffer buffer, int bufferLen);
	int SMS_GetUltimoComando(int smsHandle, ByteBuffer buffer, int bufferLen);
	int SMS_GetUltimoErro(int smsHandle, ByteBuffer buffer, int bufferLen);
	int SMS_ListarMensagens(int smsHandle, int filtro, String path);
	int SMS_MSG_Create(IntByReference msgHandle);
	int SMS_MSG_Destroy(int msgHandle);
	int SMS_MSG_GetMensagem(int msgHandle, ByteBuffer buffer, int bufferLen);
	int SMS_MSG_GetTelefone(int msgHandle, ByteBuffer buffer, int bufferLen);
	int SMS_MSG_GetUltimoErro(int msgHandle, ByteBuffer buffer, int bufferLen);
	int SMS_MSG_SetMensagem(int msgHandle, String value);
	int SMS_MSG_SetTelefone(int msgHandle, String value);
	int SMS_MSGC_Add(int msgcHandle, int msgHandle);
	int SMS_MSGC_Clear(int msgcHandle);
	int SMS_MSGC_Create(IntByReference msgcHandle);
	int SMS_MSGC_Destroy(int msgcHandle);
	int SMS_MSGC_GetMSG(int msgcHandle, int msgHandle, int index);
	int SMS_MSGC_GetUltimoErro(int msgcHandle, ByteBuffer buffer, int bufferLen);
	int SMS_MSGC_LoadFromFrile(int msgcHandle, String arquivo);
	int SMS_MSGC_Remove(int msgcHandle, int msgHandle);
	int SMS_SetAtivo(int smsHandle, boolean ativo);
	int SMS_SetATResult(int smsHandle, boolean ativo);
	int SMS_SetATTimeOut(int smsHandle, int timeout);
	int SMS_SetIntervaloEntreMensagens(int smsHandle, int intervalo);
	int SMS_SetModelo(int smsHandle, int modelo);
	int SMS_SetOnProgresso(int smsHandle, ACBrSMSInterop.OnProgressoCallback method);
	int SMS_SetQuebraMensagens(int smsHandle, boolean quebra);
	int SMS_SetRecebeConfirmacao(int smsHandle, boolean quebra);
	int SMS_TrocarBandeja(int smsHandle, int sim);
}
