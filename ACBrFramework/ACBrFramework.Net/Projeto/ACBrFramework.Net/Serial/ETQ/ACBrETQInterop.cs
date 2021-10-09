using System;
using System.Runtime.InteropServices;
using System.Text;

namespace ACBrFramework.ETQ
{
	public static class ACBrETQInterop
	{
		#region DLL

#if x86
		private const string ACBr = "ACBrFramework32.dll";
#elif x64
				private const string ACBr = "ACBrFramework64.dll";
#endif

		#endregion DLL

		#region ACBrETQ

		#region Interop Types

		[UnmanagedFunctionPointer(CallingConvention.Cdecl)]
		public delegate bool GravaLogCallback(string linha);

		#endregion Interop Types

		#region Constructors/Erro Handler

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Create(ref IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Destroy(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetUltimoErro(IntPtr etqHandle, StringBuilder buffer, int bufferLen);

		#endregion Constructors/Erro Handler

		#region ETQ

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetAtivo(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetAtivo(IntPtr etqHandle, bool value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetEtqInicializada(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetEtqFinalizada(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetModeloStr(IntPtr ecfHandle, StringBuilder buffer, int bufferLen);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetModelo(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetModelo(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetPorta(IntPtr ecfHandle, StringBuilder buffer, int bufferLen);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetPorta(IntPtr ecfHandle, string value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetArqLOG(IntPtr ecfHandle, StringBuilder buffer, int bufferLen);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetArqLOG(IntPtr ecfHandle, string value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetTemperatura(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetTemperatura(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetVelocidade(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetVelocidade(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetAvanco(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetAvanco(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetUnidade(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetUnidade(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetDPI(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetDPI(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetLimparMemoria(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetLimparMemoria(IntPtr etqHandle, bool value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetBackFeed(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetBackFeed(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetOrigem(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetOrigem(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetListaCmdCount(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_GetListaCmd(IntPtr ecfHandle, StringBuilder buffer, int bufferLen, int index);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetListaCmd(IntPtr ecfHandle, string[] cmd, int count);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Ativar(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Desativar(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_ImprimirTexto(IntPtr etqHandle, int orientacao, int fonte,
			int multiplicadorH, int multiplicadorV, int vertical, int horizontal, string texto, int subFonte, bool imprimirReverso);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_ImprimirBarras(IntPtr etqHandle, int orientacao, string tipoBarras,
			string larguraBarraLarga, string larguraBarraFina, int vertical, int horizontal, string texto,
			int alturaCodBarras, int exibeCodigo);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_ImprimirLinha(IntPtr etqHandle, int vertical, int horizontal, int largura, int altura);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_ImprimirCaixa(IntPtr etqHandle, int vertical, int horizontal, int largura, int altura,
															int espessuraVertical, int espessuraHorizontal);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_ImprimirImagem(IntPtr etqHandle, int multiplicadorImagem,
															int vertical, int horizontal, string nomeImagem);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_CarregarImagem(IntPtr etqHandle, string imagem, string nomeImagem,
															 bool flipped);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_CarregarImagemStream(IntPtr etqHandle, byte[] imagem, int size, string nomeImagem,
															 bool flipped, string tipo);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_IniciarEtiqueta(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_FinalizarEtiqueta(IntPtr etqHandle, int copias, int avancoEtq);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Imprimir(IntPtr etqHandle, int copias, int avancoEtq);

		#endregion ETQ

		#region ACBrETQClass

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_GetModeloStr(IntPtr ecfHandle, StringBuilder buffer, int bufferLen);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_GetTemperatura(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_SetTemperatura(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_GetVelocidade(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_SetVelocidade(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_GetAvanco(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_SetAvanco(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_GetUnidade(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_SetUnidade(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_GetDPI(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_SetDPI(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_GetBackFeed(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_SetBackFeed(IntPtr etqHandle, int value);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_GetOrigem(IntPtr etqHandle);

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_Class_SetOrigem(IntPtr etqHandle, int value);

		#endregion ACBrETQClass

		#region Eventos

		[DllImport(ACBr, CallingConvention = CallingConvention.Cdecl)]
		public static extern int ETQ_SetOnGravarLog(IntPtr etqHandle, GravaLogCallback method);

		#endregion Eventos

		#endregion ACBrETQ
	}
}