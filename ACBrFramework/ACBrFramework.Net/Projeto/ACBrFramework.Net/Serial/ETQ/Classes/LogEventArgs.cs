using System;

namespace ACBrFramework.ETQ
{
	public class LogEventArgs : EventArgs
	{
		public LogEventArgs(string linha)
		{
			Linha = linha;
			Tratado = false;
		}

		public string Linha { get; }

		public bool Tratado { get; set; }
	}
}