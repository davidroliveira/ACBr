using System;
using System.IO;
using System.Windows.Forms;
using ACBrFramework.AAC;
using ACBrFramework.BAL;
using ACBrFramework.EAD;
using ACBrFramework.ECF;
using ACBrFramework.LCB;
using ACBrFramework.PAF;
using ACBrFramework.Sintegra;
using ACBrFramework.TEFD;
using ACBrFramework;
using ACBrFramework.CEP;
using ACBrFramework.CNIEE;
using ACBrFramework.DIS;
using ACBrFramework.ETQ;
using ACBrFramework.IBGE;
using ACBrFramework.LFD;
using ACBrFramework.RFD;
using ACBrFramework.SMS;
using ACBrFramework.Sped;
using ACBrFramework.Validador;

namespace ACBrDefExporter
{
	public partial class MainForm : Form
	{
		#region Constructor

		public MainForm()
		{
			InitializeComponent();
			Populate();
		}

		#endregion Constructor

		#region Methods

		#region EventHandlers

		private void pathButton_Click(object sender, EventArgs e)
		{
			DialogResult result = folderBrowserDialog.ShowDialog(this);

			if (result == DialogResult.OK)
			{
				pathTextBox.Text = folderBrowserDialog.SelectedPath;
			}
		}

		private void okButton_Click(object sender, EventArgs e)
		{
			Process();
		}

		private void cancelButton_Click(object sender, EventArgs e)
		{
			Close();
		}

		#endregion EventHandlers

		private void Populate()
		{
			foreach (Language language in Enum.GetValues(typeof(Language)))
			{
				languageComboBox.Items.Add(language);
			}

			languageComboBox.SelectedIndex = -1;
		}

		private void Process()
		{
			if (languageComboBox.SelectedItem == null)
			{
				MessageBox.Show(this, @"Selecione a linguagem", Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
				return;
			}

			if (!Directory.Exists(pathTextBox.Text))
			{
				MessageBox.Show(this, @"Selecione uma pasta válida", Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
				return;
			}

			Language language = (Language)languageComboBox.SelectedItem;

			DefExporter defExporter;
			switch (language)
			{
				case Language.C:
					defExporter = new CDefExporter(pathTextBox.Text);
					break;

				case Language.VB6:
					defExporter = new VBDefExporter(pathTextBox.Text);
					break;

				case Language.Java:
					defExporter = new JavaDefExporter(pathTextBox.Text);
					break;

				default:
					defExporter = null;
					break;
			}

			if (defExporter == null)
			{
				MessageBox.Show(this, @"DefExporter para essa linguagem não implementado." + Environment.NewLine + @"Selecione outra", Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
				return;
			}

			try
			{
				defExporter.Export(typeof(ACBrAACInterop));
				defExporter.Export(typeof(ACBrEADInterop));
				defExporter.Export(typeof(ACBrPAFInterop));
				defExporter.Export(typeof(ACBrBALInterop));
				defExporter.Export(typeof(ACBrECFInterop));
				defExporter.Export(typeof(ACBrDeviceInterop));
				defExporter.Export(typeof(ACBrLCBInterop));
				defExporter.Export(typeof(ACBrSintegraInterop));
				defExporter.Export(typeof(ACBrSpedFiscalInterop));
				defExporter.Export(typeof(ACBrTEFInterop));
				defExporter.Export(typeof(ACBrETQInterop));
				defExporter.Export(typeof(ACBrCEPInterop));
				defExporter.Export(typeof(ACBrCNIEEInterop));
				defExporter.Export(typeof(ACBrIBGEInterop));
				defExporter.Export(typeof(ACBrLFDInterop));
				defExporter.Export(typeof(ACBrValidadorInterop));
				defExporter.Export(typeof(ACBrDISInterop));
				defExporter.Export(typeof(ACBrRFDInterop));
				defExporter.Export(typeof(ACBrSMSInterop));

				MessageBox.Show(this, @"Definições exportadas com sucesso!", Text, MessageBoxButtons.OK, MessageBoxIcon.Information);
			}
			catch (Exception exception)
			{
				MessageBox.Show(this, @"Erro exportando definições:" + Environment.NewLine + exception.Message, Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
			}
		}

		#endregion Methods
	}
}