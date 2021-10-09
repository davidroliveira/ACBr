using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Text;

namespace ACBrFramework
{
	public static class ACBrFrameworkExtensions
	{
		public static Encoding DefaultEncoding = Encoding.UTF8;

		public static byte[] ToByteArray(this Image imageIn, ImageFormat format = null)
		{
			if (imageIn == null) return null;

			if (format == null)
			{
				format = imageIn.RawFormat;
			}

			using (var ms = new MemoryStream())
			{
				imageIn.Save(ms, format);
				return ms.ToArray();
			}
		}

		public static byte[] ReadToEnd(this Stream stream)
		{
			long originalPosition = 0;

			if (stream.CanSeek)
			{
				originalPosition = stream.Position;
				stream.Position = 0;
			}

			try
			{
				byte[] readBuffer = new byte[4096];

				int totalBytesRead = 0;
				int bytesRead;

				while ((bytesRead = stream.Read(readBuffer, totalBytesRead, readBuffer.Length - totalBytesRead)) > 0)
				{
					totalBytesRead += bytesRead;

					if (totalBytesRead == readBuffer.Length)
					{
						int nextByte = stream.ReadByte();
						if (nextByte != -1)
						{
							byte[] temp = new byte[readBuffer.Length * 2];
							Buffer.BlockCopy(readBuffer, 0, temp, 0, readBuffer.Length);
							Buffer.SetByte(temp, totalBytesRead, (byte)nextByte);
							readBuffer = temp;
							totalBytesRead++;
						}
					}
				}

				byte[] buffer = readBuffer;
				if (readBuffer.Length != totalBytesRead)
				{
					buffer = new byte[totalBytesRead];
					Buffer.BlockCopy(readBuffer, 0, buffer, 0, totalBytesRead);
				}
				return buffer;
			}
			finally
			{
				if (stream.CanSeek)
				{
					stream.Position = originalPosition;
				}
			}
		}

		public static string ToUTF8(this string value)
		{
			if (string.IsNullOrEmpty(value)) return value;
			return Encoding.Default.GetString(DefaultEncoding.GetBytes(value));
		}

		public static string[] ToUTF8(this string[] value)
		{
			if (value == null || value.Length == 0) return value;

			string[] array = new string[value.Length];

			for (int i = 0; i < value.Length; i++)
			{
				array[i] = ToUTF8(value[i]);
			}

			return array;
		}

		public static string FromUTF8(this string value)
		{
			if (value == null) return null;
			if (value.Length == 0) return string.Empty;

			return DefaultEncoding.GetString(Encoding.Default.GetBytes(value));
		}

		public static string FromUTF8(this StringBuilder value)
		{
			if (value == null) return null;
			if (value.Length == 0) return string.Empty;

			return DefaultEncoding.GetString(Encoding.Default.GetBytes(value.ToString()));
		}
	}
}