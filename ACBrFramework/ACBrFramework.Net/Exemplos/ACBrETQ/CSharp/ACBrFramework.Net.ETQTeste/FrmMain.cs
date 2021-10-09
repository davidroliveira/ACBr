using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Windows.Forms;
using ACBrFramework.ECF;
using ACBrFramework.ETQ;

namespace ACBrFramework.Net.ETQTeste
{
	public partial class FrmMain : Form
	{
		#region Constructors

		public FrmMain()
		{
			InitializeComponent();
		}

		private void FrmMain_Shown(object sender, System.EventArgs e)
		{
			CarregarInfos();
		}

		#endregion Constructors

		#region Methods

		private void CarregarInfos()
		{
			comboBoxModelo.Items.Clear();
			foreach (var item in Enum.GetValues(typeof(ETQModelo))) comboBoxModelo.Items.Add(item);
			comboBoxModelo.SelectedIndex = 0;

			comboBoxBackFeed.Items.Clear();
			foreach (var item in Enum.GetValues(typeof(EtqBackFeed))) comboBoxBackFeed.Items.Add(item);
			comboBoxBackFeed.SelectedIndex = 0;

			comboBoxDPI.Items.Clear();
			foreach (var item in Enum.GetValues(typeof(ETQDPI))) comboBoxDPI.Items.Add(item);
			comboBoxDPI.SelectedIndex = 0;
		}

		private void ConfigurarSerial()
		{
			using (var cfgForm = new SerialCFGForm())
			{
				cfgForm.ShowDialog(this, acbrETQ.Device);
			}
		}

		private void AtivarACBrETQ()
		{
			acbrETQ.DPI = (ETQDPI)comboBoxDPI.SelectedItem;
			acbrETQ.Modelo = (ETQModelo)comboBoxModelo.SelectedItem;
			acbrETQ.LimparMemoria = checkBoxLimparMemoria.Checked;
			acbrETQ.Temperatura = (int)numericUpDownTemperatura.Value;
			acbrETQ.Velocidade = (int)numericUpDownVelocidade.Value;
			acbrETQ.BackFeed = (EtqBackFeed)comboBoxBackFeed.SelectedItem;

			acbrETQ.Ativar();
		}

		#endregion Methods

		#region EventHandlers

		private void buttonCfgSerial_Click(object sender, EventArgs e)
		{
			ConfigurarSerial();
		}

		private void buttonEtqSimples_Click(object sender, EventArgs e)
		{
			AtivarACBrETQ();

			if (acbrETQ.Modelo == ETQModelo.Ppla)
			{
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 2, 2, 190, 5, "BISCOITO MARILAN RECH 335G", 0, true);
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 2, 1, 158, 5, "CHOC BRANCO");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "F", "2", "2", 32, 0, "7896003701685", 90, ETQBarraExibeCodigo.SIM);
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 3, 2, 15, 300, "R$");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 4, 4, 15, 450, "20.59");
			}
			else
			{
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 2, 2, 15, 55, "BISCOITO MARILAN RECH 335G", 0, true);
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 2, 1, 60, 55, "CHOC BRANCO");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "E30", "2", "2", 95, 55, "7896003701685", 90, ETQBarraExibeCodigo.SIM);
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 3, 2, 110, 355, "R$");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 4, 5, 85, 515, "20.59");
			}

			acbrETQ.Imprimir((int)numericUpDownCopias.Value, (int)numericUpDownAvancoEtq.Value);
			acbrETQ.Desativar();
		}

		private void buttonEtq3Colunas_Click(object sender, EventArgs e)
		{
			AtivarACBrETQ();

			if (acbrETQ.Modelo == ETQModelo.Ppla)
			{
				acbrETQ.IniciarEtiqueta();
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 2, 2, 190, 5, "BISCOITO MARILAN RECH 335G");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 2, 1, 158, 5, "CHOC BRANCO");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "F", "2", "2", 32, 0, "7896003701685", 90, ETQBarraExibeCodigo.SIM);
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 3, 2, 15, 300, "R$");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 4, 4, 15, 450, "20.59");
				acbrETQ.FinalizarEtiqueta((int)numericUpDownCopias.Value, (int)numericUpDownAvancoEtq.Value);

				acbrETQ.IniciarEtiqueta();
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 2, 2, 190, 5, "SABAO EM PO FLASH 1KG");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 2, 1, 158, 5, "ADVANCED - UNIDADE");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "F", "2", "2", 32, 0, "7898903097042", 90, ETQBarraExibeCodigo.SIM);
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 3, 2, 15, 300, "R$");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 4, 4, 15, 450, "3.18");
				acbrETQ.FinalizarEtiqueta((int)numericUpDownCopias.Value, (int)numericUpDownAvancoEtq.Value);

				acbrETQ.IniciarEtiqueta();
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 2, 2, 190, 5, "AMACIANTE AMACIEX 5 LTS");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 2, 1, 158, 5, "MACIO MATRIX FIX");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "F", "2", "2", 32, 0, "7898237690230", 90, ETQBarraExibeCodigo.SIM);
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 3, 2, 15, 300, "R$");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 4, 4, 15, 450, "8.60");
				acbrETQ.FinalizarEtiqueta((int)numericUpDownCopias.Value, (int)numericUpDownAvancoEtq.Value);
			}
			else
			{
				acbrETQ.IniciarEtiqueta();
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 2, 2, 15, 55, "BISCOITO MARILAN RECH 335G");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 2, 1, 60, 55, "CHOC BRANCO");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "E30", "2", "2", 95, 55, "7896003701685", 90, ETQBarraExibeCodigo.SIM);
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 3, 2, 110, 355, "R$");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 4, 5, 85, 515, "20.59");
				acbrETQ.FinalizarEtiqueta((int)numericUpDownCopias.Value, (int)numericUpDownAvancoEtq.Value);

				acbrETQ.IniciarEtiqueta();
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 2, 2, 15, 55, "SABAO EM PO FLASH 1KG");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 2, 1, 60, 55, "ADVANCED - UNIDADE");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "E30", "2", "2", 95, 55, "7898903097042", 90, ETQBarraExibeCodigo.SIM);
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 3, 2, 110, 355, "R$");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 4, 5, 85, 515, "3.18");
				acbrETQ.FinalizarEtiqueta((int)numericUpDownCopias.Value, (int)numericUpDownAvancoEtq.Value);

				acbrETQ.IniciarEtiqueta();
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 2, 2, 15, 55, "AMACIANTE AMACIEX 5 LTS");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 2, 1, 60, 55, "MACIO MATRIX FIX");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "E30", "2", "2", 95, 55, "7898237690230", 90, ETQBarraExibeCodigo.SIM);
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 3, 2, 110, 355, "R$");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 3, 4, 5, 85, 515, "8.60");
				acbrETQ.FinalizarEtiqueta((int)numericUpDownCopias.Value, (int)numericUpDownAvancoEtq.Value);
			}

			acbrETQ.Imprimir(1, (int)numericUpDownAvancoEtq.Value);
			acbrETQ.Desativar();
		}

		private void buttonEtqBloco_Click(object sender, EventArgs e)
		{
			AtivarACBrETQ();

			if (acbrETQ.Modelo == ETQModelo.Ppla)
			{
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 1, 2, 180, 15, "BISCOITO REC 335G");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 1, 1, 140, 15, "CHOC BRANCO");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "F", "2", "2", 20, 10, "7896003701685", 70);

				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 1, 2, 180, 315, "BISCOITO RECH 335G");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 1, 1, 140, 315, "CHOC BRANCO");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "F", "2", "2", 20, 315, "7896003701685", 70);

				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 1, 2, 180, 620, "BISCOITO RECH 335G");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 1, 1, 140, 620, "CHOC BRANCO");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "F", "2", "2", 20, 620, "7896003701685", 70);
			}
			else
			{
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 1, 3, 15, 55, "BISCOITO REC 335G");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 1, 1, 80, 55, "CHOC BRANCO");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "E30", "2", "2", 120, 55, "7896003701685", 080, ETQBarraExibeCodigo.SIM);

				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 1, 3, 15, 365, "BISCOITO RECH 335G");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 1, 1, 80, 365, "CHOC BRANCO");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "E30", "2", "2", 120, 365, "7896003701685", 080, ETQBarraExibeCodigo.SIM);

				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 1, 3, 15, 670, "BISCOITO RECH 335G");
				acbrETQ.ImprimirTexto(EtqOrientacao.Normal, 2, 1, 1, 80, 670, "CHOC BRANCO");
				acbrETQ.ImprimirBarras(EtqOrientacao.Normal, "E30", "2", "2", 120, 670, "7896003701685", 080, ETQBarraExibeCodigo.SIM);
			}

			acbrETQ.Imprimir((int)numericUpDownCopias.Value, (int)numericUpDownAvancoEtq.Value);
			acbrETQ.Desativar();
		}

		private void buttonEtqImagem_Click(object sender, EventArgs e)
		{
			AtivarACBrETQ();

			acbrETQ.ImprimirImagem(1, 10, 10, textBoxImagem.Text);
			acbrETQ.Imprimir((int)numericUpDownCopias.Value, (int)numericUpDownAvancoEtq.Value);
			acbrETQ.Desativar();
		}

		private void buttonCarregarImagem_Click(object sender, EventArgs e)
		{
			AtivarACBrETQ();

			try
			{
				using (var ofd = new OpenFileDialog())
				{
					ofd.InitialDirectory = Application.ExecutablePath;
					ofd.CheckFileExists = true;

					if (radioButtonStream.Checked)
					{
						ofd.Filter = @"BMP MonoCromático|*.bmp";

						if (ofd.ShowDialog() != DialogResult.OK) return;
						var image = Image.FromFile(ofd.FileName);
						pictureBox.Image = image;
						using (var ms = new MemoryStream())
						{
							image.Save(ms, image.RawFormat);

							acbrETQ.CarregarImagem(ms, textBoxImagem.Text);
						}
					}
					else
					{
						ofd.Filter = @"PCX|*.pcx|BMP MonoCromático|*.bmp|IMG|*.img";

						if (ofd.ShowDialog() != DialogResult.OK) return;

						var image = Image.FromFile(ofd.FileName);
						pictureBox.Image = image;

						acbrETQ.CarregarImagem(ofd.FileName, textBoxImagem.Text);
					}
				}
			}
			finally
			{
				acbrETQ.Desativar();
			}
		}

		#endregion EventHandlers
	}
}