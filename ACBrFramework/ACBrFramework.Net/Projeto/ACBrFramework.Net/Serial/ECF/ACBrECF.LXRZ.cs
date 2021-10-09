using System;
using System.Runtime.InteropServices;

namespace ACBrFramework.ECF
{
	public partial class ACBrECF
	{
		#region Leitura X / Redução Z

		public void LeituraX()
		{
			int ret = ACBrECFInterop.ECF_LeituraX(this.Handle);
			CheckResult(ret);
		}

		public void ReducaoZ([Optional]DateTime data)
		{
			int ret;

			if (data == default(DateTime))
			{
				ret = ACBrECFInterop.ECF_ReducaoZ(this.Handle, 0d);
			}
			else
			{
				ret = ACBrECFInterop.ECF_ReducaoZ(this.Handle, data.ToOADate());
			}

			CheckResult(ret);
		}

		#region COM_INTEROP

#if COM_INTEROP

        [ComVisible(false)]
#endif

		#endregion COM_INTEROP

		public void ReducaoZ()
		{
			int ret = ACBrECFInterop.ECF_ReducaoZ(this.Handle, 0d);
			CheckResult(ret);
		}

		public string DadosUltimaReducaoZ()
		{
			const int BUFFER_LEN = 16384;
			string retorno = GetString(ACBrECFInterop.ECF_GetDadosUltimaReducaoZ, BUFFER_LEN);

			DadosReducaoZClass = new DadosReducaoZClass(this);

			return retorno;
		}

		public string DadosReducaoZ()
		{
			const int BUFFER_LEN = 16384;
			string retorno = GetString(ACBrECFInterop.ECF_GetDadosReducaoZ, BUFFER_LEN);

			DadosReducaoZClass = new DadosReducaoZClass(this);

			return retorno;
		}

		#endregion Leitura X / Redução Z
	}
}