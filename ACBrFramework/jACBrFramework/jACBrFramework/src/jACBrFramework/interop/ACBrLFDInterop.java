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

public interface ACBrLFDInterop extends InteropLib {

	public static final ACBrLFDInterop INSTANCE = (ACBrLFDInterop)
			Native.synchronizedLibrary((Library) Native.loadLibrary(InteropLib.JNA_LIBRARY_NAME, ACBrLFDInterop.class));

	// Tipos de dados
	public static class Bloco0Registro0000 extends Structure implements Structure.ByValue {
		public int COD_VER;
		public int COD_FIN;
		public double DT_INI;
		public double DT_FIN;
		public byte[] NOME = new byte[101];
		public byte[] CNPJ = new byte[15];
		public byte[] UF = new byte[3];
		public byte[] IE = new byte[15];
		public int COD_MUN;
		public byte[] IM = new byte[15];
		public byte[] SUFRAMA = new byte[10];
		public int COD_CONTEUDO;
		public byte[] FANTASIA = new byte[101];
		public int NIRE;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("COD_VER" , "COD_FIN" , "DT_INI" , "DT_FIN" , "NOME" , "CNPJ" , "UF" , "IE" , "COD_MUN" , "IM" , "SUFRAMA" , "COD_CONTEUDO" , "FANTASIA" , "NIRE");
		}

		public static class ByReference extends Bloco0Registro0000 implements Structure.ByReference { }
		public static class ByValue extends Bloco0Registro0000 implements Structure.ByValue { }
	}

	public static class Bloco0Registro0001 extends Structure implements Structure.ByValue {
		public int IND_MOV;
		public int COD_MUN;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("IND_MOV" , "COD_MUN");
		}

		public static class ByReference extends Bloco0Registro0001 implements Structure.ByReference { }
		public static class ByValue extends Bloco0Registro0001 implements Structure.ByValue { }
	}

	public static class Bloco0Registro0005 extends Structure implements Structure.ByValue {
		public byte[] NOMERESP = new byte[61];
		public int COD_ASS;
		public byte[] CPFRESP = new byte[12];
		public byte[] CEP = new byte[9];
		public byte[] ENDERECO = new byte[61];
		public byte[] NUM = new byte[11];
		public byte[] COMPL = new byte[61];
		public byte[] BAIRRO = new byte[61];
		public byte[] CEP_CP = new byte[9];
		public int CP;
		public byte[] FONE = new byte[11];
		public byte[] FAX = new byte[11];
		public byte[] EMAIL = new byte[151];

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("NOMERESP" , "COD_ASS" , "CPFRESP" , "CEP" , "ENDERECO" , "NUM" , "COMPL" , "BAIRRO" , "CEP_CP" , "CP" , "FONE" , "FAX" , "EMAIL");
		}

		public static class ByReference extends Bloco0Registro0005 implements Structure.ByReference { }
		public static class ByValue extends Bloco0Registro0005 implements Structure.ByValue { }
	}

	public static class Bloco0Registro0025 extends Structure implements Structure.ByValue {
		public int CODBF_ICMS;
		public int CODBF_ISS;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("CODBF_ICMS" , "CODBF_ISS");
		}

		public static class ByReference extends Bloco0Registro0025 implements Structure.ByReference { }
		public static class ByValue extends Bloco0Registro0025 implements Structure.ByValue { }
	}

	public static class Bloco0Registro0100 extends Structure implements Structure.ByValue {
		public byte[] NOME = new byte[101];
		public byte[] CPF = new byte[12];
		public byte[] CRC = new byte[16];
		public byte[] CNPJ = new byte[15];
		public byte[] CEP = new byte[9];
		public byte[] CEP_CP = new byte[9];
		public byte[] CP = new byte[9];
		public byte[] ENDERECO = new byte[61];
		public byte[] NUM = new byte[11];
		public byte[] COMPL = new byte[61];
		public byte[] BAIRRO = new byte[61];
		public byte[] UF = new byte[2];
		public byte[] FONE = new byte[11];
		public byte[] FAX = new byte[11];
		public byte[] EMAIL = new byte[151];
		public int COD_MUN;
		public byte[] COD_ASS = new byte[1];

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("NOME" , "CPF" , "CRC" , "CNPJ" , "CEP" , "CEP_CP" , "CP" , "ENDERECO" , "NUM" , "COMPL" , "BAIRRO" , "UF" , "FONE" , "FAX" , "EMAIL" , "COD_MUN" , "COD_ASS");
		}

		public static class ByReference extends Bloco0Registro0100 implements Structure.ByReference { }
		public static class ByValue extends Bloco0Registro0100 implements Structure.ByValue { }
	}

	public static class Bloco0Registro0150 extends Structure implements Structure.ByValue {
		public byte[] COD_PART = new byte[61];
		public byte[] NOME = new byte[101];
		public byte[] COD_PAIS = new byte[6];
		public byte[] CNPJ = new byte[15];
		public byte[] CPF = new byte[12];
		public byte[] IE_ST = new byte[15];
		public byte[] IE = new byte[15];
		public byte[] IM = new byte[15];
		public int COD_MUN;
		public byte[] SUFRAMA = new byte[10];
		public byte[] ENDERECO = new byte[61];
		public byte[] NUM = new byte[11];
		public byte[] COMPL = new byte[61];
		public byte[] BAIRRO = new byte[61];
		public byte[] UF = new byte[2];

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("COD_PART" , "NOME" , "COD_PAIS" , "CNPJ" , "CPF" , "IE_ST" , "IE" , "IM" , "COD_MUN" , "SUFRAMA" , "ENDERECO" , "NUM" , "COMPL" , "BAIRRO" , "UF");
		}

		public static class ByReference extends Bloco0Registro0150 implements Structure.ByReference { }
		public static class ByValue extends Bloco0Registro0150 implements Structure.ByValue { }
	}

	public static class Bloco0Registro0175 extends Structure implements Structure.ByValue {
		public byte[] CEP = new byte[9];
		public byte[] ENDERECO = new byte[61];
		public byte[] NUM = new byte[11];
		public byte[] COMPL = new byte[61];
		public byte[] BAIRRO = new byte[61];
		public byte[] CEP_CP = new byte[9];
		public byte[] CP = new byte[9];
		public byte[] FONE = new byte[11];
		public byte[] FAX = new byte[11];

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("CEP" , "ENDERECO" , "NUM" , "COMPL" , "BAIRRO" , "CEP_CP" , "CP" , "FONE" , "FAX");
		}

		public static class ByReference extends Bloco0Registro0175 implements Structure.ByReference { }
		public static class ByValue extends Bloco0Registro0175 implements Structure.ByValue { }
	}

	public static class Bloco0Registro0200 extends Structure implements Structure.ByValue {
		public byte[] COD_ITEM = new byte[61];
		public byte[] DESCR_ITEM = new byte[201];
		public byte[] COD_GEN = new byte[3];
		public byte[] COD_LST = new byte[5];

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("COD_ITEM" , "DESCR_ITEM" , "COD_GEN" , "COD_LST");
		}

		public static class ByReference extends Bloco0Registro0200 implements Structure.ByReference { }
		public static class ByValue extends Bloco0Registro0200 implements Structure.ByValue { }
	}

	public static class Bloco0Registro0205 extends Structure implements Structure.ByValue {
		public byte[] DESCR_ANT_ITEM = new byte[201];
		public double DT_INI;
		public double DT_FIN;
		public byte[] COD_ANT_ITEM = new byte[61];

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("DESCR_ANT_ITEM" , "DT_INI" , "DT_FIN" , "COD_ANT_ITEM");
		}

		public static class ByReference extends Bloco0Registro0205 implements Structure.ByReference { }
		public static class ByValue extends Bloco0Registro0205 implements Structure.ByValue { }
	}

	public static class Bloco0Registro0210 extends Structure implements Structure.ByValue {
		public byte[] UNID_ITEM = new byte[7];
		public byte[] COD_ITEM_COMP = new byte[61];
		public double QTD_COMP;
		public byte[] UNID_COMP = new byte[7];
		public double PERDA_COMP;
		public double DT_INI_COMP;
		public double DT_FIN_COMP;
		public int IND_ALT;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("UNID_ITEM" , "COD_ITEM_COMP" , "QTD_COMP" , "UNID_COMP" , "PERDA_COMP" , "DT_INI_COMP" , "DT_FIN_COMP" , "IND_ALT");
		}

		public static class ByReference extends Bloco0Registro0210 implements Structure.ByReference { }
		public static class ByValue extends Bloco0Registro0210 implements Structure.ByValue { }
	}

	public static class Bloco9Registro9001 extends Structure implements Structure.ByValue {
		public int IND_MOV;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("IND_MOV");
		}

		public static class ByReference extends Bloco9Registro9001 implements Structure.ByReference { }
		public static class ByValue extends Bloco9Registro9001 implements Structure.ByValue { }
	}

	public static class Bloco9Registro9900 extends Structure implements Structure.ByValue {
		public byte[] REG_BLC = new byte[5];
		public int QTD_REG_BLC;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("REG_BLC" , "QTD_REG_BLC");
		}

		public static class ByReference extends Bloco9Registro9900 implements Structure.ByReference { }
		public static class ByValue extends Bloco9Registro9900 implements Structure.ByValue { }
	}

	public static class BlocoARegistroA001 extends Structure implements Structure.ByValue {
		public int IND_MOV;
		public int COD_MUN;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("IND_MOV" , "COD_MUN");
		}

		public static class ByReference extends BlocoARegistroA001 implements Structure.ByReference { }
		public static class ByValue extends BlocoARegistroA001 implements Structure.ByValue { }
	}

	public static class BlocoARegistroA350 extends Structure implements Structure.ByValue {
		public byte[] CPF_CONS = new byte[12];
		public byte[] CNPJ_CONS = new byte[15];
		public byte[] COD_MOD = new byte[3];
		public int COD_SIT;
		public int ECF_CX;
		public byte[] ECF_FAB = new byte[21];
		public int CRO;
		public int CRZ;
		public int NUM_DOC;
		public double DT_DOC;
		public byte[] COP = new byte[4];
		public double VL_DOC;
		public double VL_CANC_ISS;
		public double VL_CANC_ICMS;
		public double VL_DESC_ISS;
		public double VL_DESC_ICMS;
		public double VL_ACMO_ISS;
		public double VL_ACMO_ICMS;
		public double VL_BC_ISS;
		public double VL_ISS;
		public double VL_ISN_ISS;
		public double VL_NT_ISS;
		public double VL_RET_ISS;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("CPF_CONS" , "CNPJ_CONS" , "COD_MOD" , "COD_SIT" , "ECF_CX" , "ECF_FAB" , "CRO" , "CRZ" , "NUM_DOC" , "DT_DOC" , "COP" , "VL_DOC" , "VL_CANC_ISS" , "VL_CANC_ICMS" , "VL_DESC_ISS" , "VL_DESC_ICMS" , "VL_ACMO_ISS" , "VL_ACMO_ICMS" , "VL_BC_ISS" , "VL_ISS" , "VL_ISN_ISS" , "VL_NT_ISS" , "VL_RET_ISS");
		}

		public static class ByReference extends BlocoARegistroA350 implements Structure.ByReference { }
		public static class ByValue extends BlocoARegistroA350 implements Structure.ByValue { }
	}

	public static class BlocoARegistroA360 extends Structure implements Structure.ByValue {
		public int NUM_ITEM;
		public byte[] COD_ITEM = new byte[61];
		public byte[] UNID = new byte[11];
		public double VL_UNIT;
		public double QTD;
		public int QTDCANC;
		public double VL_DESC_I;
		public double VL_ACMO_I;
		public double VL_CANC_I;
		public double VL_ITEM;
		public byte[] CTISS = new byte[3];
		public double VL_BC_ISS_I;
		public double ALIQ_ISS;
		public double VL_ISS_I;
		public double VL_ISN_ISS_I;
		public double VL_NT_ISS_I;
		public double VL_RT_ISS_I;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("NUM_ITEM" , "COD_ITEM" , "UNID" , "VL_UNIT" , "QTD" , "QTDCANC" , "VL_DESC_I" , "VL_ACMO_I" , "VL_CANC_I" , "VL_ITEM" , "CTISS" , "VL_BC_ISS_I" , "ALIQ_ISS" , "VL_ISS_I" , "VL_ISN_ISS_I" , "VL_NT_ISS_I" , "VL_RT_ISS_I");
		}

		public static class ByReference extends BlocoARegistroA360 implements Structure.ByReference { }
		public static class ByValue extends BlocoARegistroA360 implements Structure.ByValue { }
	}

	public static class BlocoCRegistroC001 extends Structure implements Structure.ByValue {
		public int IND_MOV;
		public int COD_MUN;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("IND_MOV" , "COD_MUN");
		}

		public static class ByReference extends BlocoCRegistroC001 implements Structure.ByReference { }
		public static class ByValue extends BlocoCRegistroC001 implements Structure.ByValue { }
	}

	public static class BlocoCRegistroC020 extends Structure implements Structure.ByValue {
		public int IND_OPER;
		public int IND_EMIT;
		public byte[] COD_PART = new byte[61];
		public byte[] COD_MOD = new byte[3];
		public int COD_SIT;
		public byte[] SER = new byte[3];
		public int NUM_DOC;
		public byte[] CHV_NFE = new byte[45];
		public double DT_EMIS;
		public double DT_DOC;
		public byte[] COD_NAT = new byte[12];
		public int IND_PGTO;
		public double VL_DOC;
		public double VL_DESC;
		public double VL_ACMO;
		public double VL_MERC;
		public int IND_FRT;
		public double VL_FRT;
		public double VL_SEG;
		public double VL_OUT_DA;
		public double VL_BC_ICMS;
		public double VL_ICMS;
		public double VL_BC_ST;
		public double VL_ICMS_ST;
		public double VL_AT;
		public double VL_IPI;
		public byte[] COD_INF_OBS = new byte[12];

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("IND_OPER" , "IND_EMIT" , "COD_PART" , "COD_MOD" , "COD_SIT" , "SER" , "NUM_DOC" , "CHV_NFE" , "DT_EMIS" , "DT_DOC" , "COD_NAT" , "IND_PGTO" , "VL_DOC" , "VL_DESC" , "VL_ACMO" , "VL_MERC" , "IND_FRT" , "VL_FRT" , "VL_SEG" , "VL_OUT_DA" , "VL_BC_ICMS" , "VL_ICMS" , "VL_BC_ST" , "VL_ICMS_ST" , "VL_AT" , "VL_IPI" , "COD_INF_OBS");
		}

		public static class ByReference extends BlocoCRegistroC020 implements Structure.ByReference { }
		public static class ByValue extends BlocoCRegistroC020 implements Structure.ByValue { }
	}

	public static class BlocoCRegistroC550 extends Structure implements Structure.ByValue {
		public byte[] CPF_CONS = new byte[12];
		public byte[] CNPJ_CONS = new byte[15];
		public byte[] COD_MOD = new byte[3];
		public int COD_SIT;
		public byte[] SER = new byte[21];
		public byte[] SUB = new byte[21];
		public int NUM_DOC;
		public double DT_DOC;
		public byte[] COP = new byte[61];
		public double VL_DOC;
		public double VL_DESC;
		public double VL_ACMO;
		public double VL_MERC;
		public double VL_BC_ICMS;
		public double VL_ICMS;
		public byte[] COD_INF_OBS = new byte[61];

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("CPF_CONS" , "CNPJ_CONS" , "COD_MOD" , "COD_SIT" , "SER" , "SUB" , "NUM_DOC" , "DT_DOC" , "COP" , "VL_DOC" , "VL_DESC" , "VL_ACMO" , "VL_MERC" , "VL_BC_ICMS" , "VL_ICMS" , "COD_INF_OBS");
		}

		public static class ByReference extends BlocoCRegistroC550 implements Structure.ByReference { }
		public static class ByValue extends BlocoCRegistroC550 implements Structure.ByValue { }
	}

	public static class BlocoCRegistroC555 extends Structure implements Structure.ByValue {
		public int NUM_ITEM;
		public byte[] COD_ITEM = new byte[61];
		public byte[] UNID = new byte[15];
		public double VL_UNIT;
		public double QTD;
		public double VL_DESC_I;
		public double VL_ACMO_I;
		public double VL_ITEM;
		public byte[] CST = new byte[4];
		public byte[] CFOP = new byte[5];
		public double VL_BC_ICMS_I;
		public double ALIQ_ICMS;
		public double VL_ICMS_I;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("NUM_ITEM" , "COD_ITEM" , "UNID" , "VL_UNIT" , "QTD" , "VL_DESC_I" , "VL_ACMO_I" , "VL_ITEM" , "CST" , "CFOP" , "VL_BC_ICMS_I" , "ALIQ_ICMS" , "VL_ICMS_I");
		}

		public static class ByReference extends BlocoCRegistroC555 implements Structure.ByReference { }
		public static class ByValue extends BlocoCRegistroC555 implements Structure.ByValue { }
	}

	public static class BlocoCRegistroC600 extends Structure implements Structure.ByValue {
		public byte[] CPF_CONS = new byte[12];
		public byte[] CNPJ_CONS = new byte[15];
		public byte[] COD_MOD = new byte[3];
		public int COD_SIT;
		public int ECF_CX;
		public byte[] ECF_FAB = new byte[21];
		public int CRO;
		public int CRZ;
		public int NUM_DOC;
		public double DT_DOC;
		public byte[] COP = new byte[21];
		public double VL_DOC;
		public double VL_CANC_ICMS;
		public double VL_DESC_ICMS;
		public double VL_ACMO_ICMS;
		public double VL_CANC_ISS;
		public double VL_DESC_ISS;
		public double VL_ACMO_ISS;
		public double VL_BC_ICMS;
		public double VL_ICMS;
		public double VL_ISN;
		public double VL_NT;
		public double VL_ST;
		public double VL_ISS;
		public double VL_ICMS_ST;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("CPF_CONS" , "CNPJ_CONS" , "COD_MOD" , "COD_SIT" , "ECF_CX" , "ECF_FAB" , "CRO" , "CRZ" , "NUM_DOC" , "DT_DOC" , "COP" , "VL_DOC" , "VL_CANC_ICMS" , "VL_DESC_ICMS" , "VL_ACMO_ICMS" , "VL_CANC_ISS" , "VL_DESC_ISS" , "VL_ACMO_ISS" , "VL_BC_ICMS" , "VL_ICMS" , "VL_ISN" , "VL_NT" , "VL_ST" , "VL_ISS" , "VL_ICMS_ST");
		}

		public static class ByReference extends BlocoCRegistroC600 implements Structure.ByReference { }
		public static class ByValue extends BlocoCRegistroC600 implements Structure.ByValue { }
	}

	public static class BlocoCRegistroC605 extends Structure implements Structure.ByValue {
		public int NUM_ITEM;
		public byte[] COD_ITEM = new byte[61];
		public byte[] UNID = new byte[15];
		public double VL_UNIT;
		public double QTD;
		public double QTD_CANC_I;
		public double VL_ITEM;
		public double VL_DESC_I;
		public double VL_CANC_I;
		public double VL_ACMO_I;
		public double VL_ISS;
		public byte[] CST = new byte[4];
		public byte[] CFOP = new byte[5];
		public double VL_BC_ICMS_I;
		public double ALIQ_ICMS;
		public double VL_ICMS_I;
		public double VL_ISN_I;
		public double VL_NT_I;
		public double VL_ST_I;
		public double VL_ICMS_ST_I;

		@Override
		protected List<String> getFieldOrder() {
			return Arrays.asList("NUM_ITEM" , "COD_ITEM" , "UNID" , "VL_UNIT" , "QTD" , "QTD_CANC_I" , "VL_ITEM" , "VL_DESC_I" , "VL_CANC_I" , "VL_ACMO_I" , "VL_ISS" , "CST" , "CFOP" , "VL_BC_ICMS_I" , "ALIQ_ICMS" , "VL_ICMS_I" , "VL_ISN_I" , "VL_NT_I" , "VL_ST_I" , "VL_ICMS_ST_I");
		}

		public static class ByReference extends BlocoCRegistroC605 implements Structure.ByReference { }
		public static class ByValue extends BlocoCRegistroC605 implements Structure.ByValue { }
	}

	public interface StringCallback extends com.sun.jna.Callback {
		void invoke(String Mensagem);
	}

	// Funções
	int LFD_Bloco_0_GetDT_FIN(int lfdHandle, DoubleByReference dtFin);
	int LFD_Bloco_0_GetDT_INI(int lfdHandle, DoubleByReference dtIni);
	int LFD_Bloco_0_GetGravado(int lfdHandle);
	int LFD_Bloco_0_Registro0000New(int lfdHandle, ACBrLFDInterop.Bloco0Registro0000 registro0000);
	int LFD_Bloco_0_Registro0001New(int lfdHandle, ACBrLFDInterop.Bloco0Registro0001 registro0001);
	int LFD_Bloco_0_Registro0005New(int lfdHandle, ACBrLFDInterop.Bloco0Registro0005 registro0005);
	int LFD_Bloco_0_Registro0025New(int lfdHandle, ACBrLFDInterop.Bloco0Registro0025 registro0025);
	int LFD_Bloco_0_Registro0100New(int lfdHandle, ACBrLFDInterop.Bloco0Registro0100 registro0100);
	int LFD_Bloco_0_Registro0150New(int lfdHandle, ACBrLFDInterop.Bloco0Registro0150 registro0150);
	int LFD_Bloco_0_Registro0175New(int lfdHandle, ACBrLFDInterop.Bloco0Registro0175 registro0175);
	int LFD_Bloco_0_Registro0200New(int lfdHandle, ACBrLFDInterop.Bloco0Registro0200 registro0200);
	int LFD_Bloco_0_Registro0205New(int lfdHandle, ACBrLFDInterop.Bloco0Registro0205 registro0205);
	int LFD_Bloco_0_Registro0210New(int lfdHandle, ACBrLFDInterop.Bloco0Registro0210 registro0210);
	int LFD_Bloco_0_Registro0990_GetQTD_LIN_0(int lfdHandle);
	int LFD_Bloco_0_SetDT_FIN(int lfdHandle, double dtFin);
	int LFD_Bloco_0_SetDT_INI(int lfdHandle, double dtIni);
	int LFD_Bloco_9_GetDT_FIN(int lfdHandle, DoubleByReference dtFin);
	int LFD_Bloco_9_GetDT_INI(int lfdHandle, DoubleByReference dtIni);
	int LFD_Bloco_9_GetGravado(int lfdHandle);
	int LFD_Bloco_9_Registro9001New(int lfdHandle, ACBrLFDInterop.Bloco9Registro9001 registro9001);
	int LFD_Bloco_9_Registro9900New(int lfdHandle, ACBrLFDInterop.Bloco9Registro9900 registro9900);
	int LFD_Bloco_9_Registro9990_GetQTD_LIN_9(int lfdHandle);
	int LFD_Bloco_9_Registro9999_GetQTD_LIN(int lfdHandle);
	int LFD_Bloco_9_SetDT_FIN(int lfdHandle, double dtFin);
	int LFD_Bloco_9_SetDT_INI(int lfdHandle, double dtIni);
	int LFD_Bloco_A_GetDT_FIN(int lfdHandle, DoubleByReference dtFin);
	int LFD_Bloco_A_GetDT_INI(int lfdHandle, DoubleByReference dtIni);
	int LFD_Bloco_A_GetGravado(int lfdHandle);
	int LFD_Bloco_A_RegistroA001New(int lfdHandle, ACBrLFDInterop.BlocoARegistroA001 registroA001);
	int LFD_Bloco_A_RegistroA350New(int lfdHandle, ACBrLFDInterop.BlocoARegistroA350 registroA350);
	int LFD_Bloco_A_RegistroA360New(int lfdHandle, ACBrLFDInterop.BlocoARegistroA360 registroA360);
	int LFD_Bloco_A_RegistroA990_GetQTD_LIN_A(int lfdHandle);
	int LFD_Bloco_A_SetDT_FIN(int lfdHandle, double dtFin);
	int LFD_Bloco_A_SetDT_INI(int lfdHandle, double dtIni);
	int LFD_Bloco_C_GetDT_FIN(int lfdHandle, DoubleByReference dtFin);
	int LFD_Bloco_C_GetDT_INI(int lfdHandle, DoubleByReference dtIni);
	int LFD_Bloco_C_GetGravado(int lfdHandle);
	int LFD_Bloco_C_RegistroC001New(int lfdHandle, ACBrLFDInterop.BlocoCRegistroC001 registroC001);
	int LFD_Bloco_C_RegistroC020New(int lfdHandle, ACBrLFDInterop.BlocoCRegistroC020 registroC020);
	int LFD_Bloco_C_RegistroC550New(int lfdHandle, ACBrLFDInterop.BlocoCRegistroC550 registroC550);
	int LFD_Bloco_C_RegistroC555New(int lfdHandle, ACBrLFDInterop.BlocoCRegistroC555 registroC555);
	int LFD_Bloco_C_RegistroC600New(int lfdHandle, ACBrLFDInterop.BlocoCRegistroC600 registroC600);
	int LFD_Bloco_C_RegistroC605New(int lfdHandle, ACBrLFDInterop.BlocoCRegistroC605 registroC605);
	int LFD_Bloco_C_RegistroC990_GetQTD_LIN_C(int lfdHandle);
	int LFD_Bloco_C_SetDT_FIN(int lfdHandle, double dtFin);
	int LFD_Bloco_C_SetDT_INI(int lfdHandle, double dtIni);
	int LFD_Create(IntByReference lfdHandle);
	int LFD_Destroy(int lfdHandle);
	int LFD_GetAbout(int lfdHandle, ByteBuffer buffer, int bufferLen);
	int LFD_GetArquivo(int lfdHandle, ByteBuffer buffer, int bufferLen);
	int LFD_GetCurMascara(int lfdHandle, ByteBuffer buffer, int bufferLen);
	int LFD_GetDelimitador(int lfdHandle, ByteBuffer buffer, int bufferLen);
	int LFD_GetDT_FIN(int lfdHandle, DoubleByReference data);
	int LFD_GetDT_INI(int lfdHandle, DoubleByReference data);
	int LFD_GetLinhasBuffer(int lfdHandle);
	int LFD_GetPath(int lfdHandle, ByteBuffer buffer, int bufferLen);
	int LFD_GetTrimString(int lfdHandle);
	int LFD_GetUltimoErro(int lfdHandle, ByteBuffer buffer, int bufferLen);
	int LFD_SaveFileTXT(int lfdHandle);
	int LFD_SetArquivo(int lfdHandle, String arquivo);
	int LFD_SetCurMascara(int lfdHandle, String mascara);
	int LFD_SetDelimitador(int lfdHandle, String delimitador);
	int LFD_SetDT_FIN(int lfdHandle, double data);
	int LFD_SetDT_INI(int lfdHandle, double data);
	int LFD_SetLinhasBuffer(int lfdHandle, int linhas);
	int LFD_SetOnError(int lfdHandle, ACBrLFDInterop.StringCallback method);
	int LFD_SetPath(int lfdHandle, String path);
	int LFD_SetTrimString(int lfdHandle, boolean trim);
}
