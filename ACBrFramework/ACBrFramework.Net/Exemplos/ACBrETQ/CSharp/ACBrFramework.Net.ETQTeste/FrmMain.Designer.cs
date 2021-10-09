namespace ACBrFramework.Net.ETQTeste
{
	partial class FrmMain
	{
		/// <summary>
		/// Variável de designer necessária.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Limpar os recursos que estão sendo usados.
		/// </summary>
		/// <param name="disposing">true se for necessário descartar os recursos gerenciados; caso contrário, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Código gerado pelo Windows Form Designer

		/// <summary>
		/// Método necessário para suporte ao Designer - não modifique 
		/// o conteúdo deste método com o editor de código.
		/// </summary>
		private void InitializeComponent()
		{
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.label6 = new System.Windows.Forms.Label();
			this.comboBoxBackFeed = new System.Windows.Forms.ComboBox();
			this.label5 = new System.Windows.Forms.Label();
			this.comboBoxDPI = new System.Windows.Forms.ComboBox();
			this.checkBoxLimparMemoria = new System.Windows.Forms.CheckBox();
			this.label4 = new System.Windows.Forms.Label();
			this.numericUpDownAvancoEtq = new System.Windows.Forms.NumericUpDown();
			this.label3 = new System.Windows.Forms.Label();
			this.numericUpDownVelocidade = new System.Windows.Forms.NumericUpDown();
			this.label2 = new System.Windows.Forms.Label();
			this.numericUpDownTemperatura = new System.Windows.Forms.NumericUpDown();
			this.buttonCfgSerial = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.comboBoxModelo = new System.Windows.Forms.ComboBox();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.radioButtonStream = new System.Windows.Forms.RadioButton();
			this.radioButtonArquivo = new System.Windows.Forms.RadioButton();
			this.buttonCarregarImagem = new System.Windows.Forms.Button();
			this.textBoxImagem = new System.Windows.Forms.TextBox();
			this.label7 = new System.Windows.Forms.Label();
			this.pictureBox = new System.Windows.Forms.PictureBox();
			this.groupBox3 = new System.Windows.Forms.GroupBox();
			this.buttonEtqImagem = new System.Windows.Forms.Button();
			this.buttonEtqBloco = new System.Windows.Forms.Button();
			this.buttonEtq3Colunas = new System.Windows.Forms.Button();
			this.buttonEtqSimples = new System.Windows.Forms.Button();
			this.label8 = new System.Windows.Forms.Label();
			this.numericUpDownCopias = new System.Windows.Forms.NumericUpDown();
			this.acbrETQ = new ACBrFramework.ETQ.ACBrETQ();
			this.button1 = new System.Windows.Forms.Button();
			this.groupBox1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDownAvancoEtq)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDownVelocidade)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDownTemperatura)).BeginInit();
			this.groupBox2.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.pictureBox)).BeginInit();
			this.groupBox3.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDownCopias)).BeginInit();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.Add(this.label6);
			this.groupBox1.Controls.Add(this.comboBoxBackFeed);
			this.groupBox1.Controls.Add(this.label5);
			this.groupBox1.Controls.Add(this.comboBoxDPI);
			this.groupBox1.Controls.Add(this.checkBoxLimparMemoria);
			this.groupBox1.Controls.Add(this.label4);
			this.groupBox1.Controls.Add(this.numericUpDownAvancoEtq);
			this.groupBox1.Controls.Add(this.label3);
			this.groupBox1.Controls.Add(this.numericUpDownVelocidade);
			this.groupBox1.Controls.Add(this.label2);
			this.groupBox1.Controls.Add(this.numericUpDownTemperatura);
			this.groupBox1.Controls.Add(this.buttonCfgSerial);
			this.groupBox1.Controls.Add(this.label1);
			this.groupBox1.Controls.Add(this.comboBoxModelo);
			this.groupBox1.Location = new System.Drawing.Point(12, 12);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(267, 207);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Configurações da Impressora";
			// 
			// label6
			// 
			this.label6.AutoSize = true;
			this.label6.Location = new System.Drawing.Point(132, 97);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(56, 13);
			this.label6.TabIndex = 11;
			this.label6.Text = "BackFeed";
			// 
			// comboBoxBackFeed
			// 
			this.comboBoxBackFeed.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.comboBoxBackFeed.FormattingEnabled = true;
			this.comboBoxBackFeed.Location = new System.Drawing.Point(135, 113);
			this.comboBoxBackFeed.Name = "comboBoxBackFeed";
			this.comboBoxBackFeed.Size = new System.Drawing.Size(121, 21);
			this.comboBoxBackFeed.TabIndex = 12;
			// 
			// label5
			// 
			this.label5.AutoSize = true;
			this.label5.Location = new System.Drawing.Point(132, 59);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(79, 13);
			this.label5.TabIndex = 9;
			this.label5.Text = "DPI Impressora";
			// 
			// comboBoxDPI
			// 
			this.comboBoxDPI.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.comboBoxDPI.FormattingEnabled = true;
			this.comboBoxDPI.Location = new System.Drawing.Point(135, 75);
			this.comboBoxDPI.Name = "comboBoxDPI";
			this.comboBoxDPI.Size = new System.Drawing.Size(121, 21);
			this.comboBoxDPI.TabIndex = 10;
			// 
			// checkBoxLimparMemoria
			// 
			this.checkBoxLimparMemoria.AutoSize = true;
			this.checkBoxLimparMemoria.Location = new System.Drawing.Point(9, 179);
			this.checkBoxLimparMemoria.Name = "checkBoxLimparMemoria";
			this.checkBoxLimparMemoria.Size = new System.Drawing.Size(100, 17);
			this.checkBoxLimparMemoria.TabIndex = 8;
			this.checkBoxLimparMemoria.Text = "Limpar Memoria";
			this.checkBoxLimparMemoria.UseVisualStyleBackColor = true;
			// 
			// label4
			// 
			this.label4.AutoSize = true;
			this.label4.Location = new System.Drawing.Point(6, 137);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(86, 13);
			this.label4.TabIndex = 7;
			this.label4.Text = "Avanço Etiqueta";
			// 
			// numericUpDownAvancoEtq
			// 
			this.numericUpDownAvancoEtq.Location = new System.Drawing.Point(9, 153);
			this.numericUpDownAvancoEtq.Maximum = new decimal(new int[] {
            99999,
            0,
            0,
            0});
			this.numericUpDownAvancoEtq.Name = "numericUpDownAvancoEtq";
			this.numericUpDownAvancoEtq.Size = new System.Drawing.Size(120, 20);
			this.numericUpDownAvancoEtq.TabIndex = 6;
			this.numericUpDownAvancoEtq.Value = new decimal(new int[] {
            600,
            0,
            0,
            0});
			// 
			// label3
			// 
			this.label3.AutoSize = true;
			this.label3.Location = new System.Drawing.Point(6, 98);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(60, 13);
			this.label3.TabIndex = 5;
			this.label3.Text = "Velocidade";
			// 
			// numericUpDownVelocidade
			// 
			this.numericUpDownVelocidade.Location = new System.Drawing.Point(9, 114);
			this.numericUpDownVelocidade.Maximum = new decimal(new int[] {
            999,
            0,
            0,
            0});
			this.numericUpDownVelocidade.Minimum = new decimal(new int[] {
            999,
            0,
            0,
            -2147483648});
			this.numericUpDownVelocidade.Name = "numericUpDownVelocidade";
			this.numericUpDownVelocidade.Size = new System.Drawing.Size(120, 20);
			this.numericUpDownVelocidade.TabIndex = 4;
			this.numericUpDownVelocidade.Value = new decimal(new int[] {
            1,
            0,
            0,
            -2147483648});
			// 
			// label2
			// 
			this.label2.AutoSize = true;
			this.label2.Location = new System.Drawing.Point(6, 59);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(67, 13);
			this.label2.TabIndex = 3;
			this.label2.Text = "Temperatura";
			// 
			// numericUpDownTemperatura
			// 
			this.numericUpDownTemperatura.Location = new System.Drawing.Point(9, 75);
			this.numericUpDownTemperatura.Maximum = new decimal(new int[] {
            9999,
            0,
            0,
            0});
			this.numericUpDownTemperatura.Name = "numericUpDownTemperatura";
			this.numericUpDownTemperatura.Size = new System.Drawing.Size(120, 20);
			this.numericUpDownTemperatura.TabIndex = 2;
			this.numericUpDownTemperatura.Value = new decimal(new int[] {
            10,
            0,
            0,
            0});
			// 
			// buttonCfgSerial
			// 
			this.buttonCfgSerial.Location = new System.Drawing.Point(10, 28);
			this.buttonCfgSerial.Name = "buttonCfgSerial";
			this.buttonCfgSerial.Size = new System.Drawing.Size(100, 23);
			this.buttonCfgSerial.TabIndex = 1;
			this.buttonCfgSerial.Text = "Configurar Serial";
			this.buttonCfgSerial.UseVisualStyleBackColor = true;
			this.buttonCfgSerial.Click += new System.EventHandler(this.buttonCfgSerial_Click);
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Location = new System.Drawing.Point(132, 19);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(42, 13);
			this.label1.TabIndex = 1;
			this.label1.Text = "Modelo";
			// 
			// comboBoxModelo
			// 
			this.comboBoxModelo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.comboBoxModelo.FormattingEnabled = true;
			this.comboBoxModelo.Location = new System.Drawing.Point(135, 35);
			this.comboBoxModelo.Name = "comboBoxModelo";
			this.comboBoxModelo.Size = new System.Drawing.Size(121, 21);
			this.comboBoxModelo.TabIndex = 1;
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.Add(this.radioButtonStream);
			this.groupBox2.Controls.Add(this.radioButtonArquivo);
			this.groupBox2.Controls.Add(this.buttonCarregarImagem);
			this.groupBox2.Controls.Add(this.textBoxImagem);
			this.groupBox2.Controls.Add(this.label7);
			this.groupBox2.Controls.Add(this.pictureBox);
			this.groupBox2.Location = new System.Drawing.Point(285, 12);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(283, 207);
			this.groupBox2.TabIndex = 1;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Carregar Imagem";
			// 
			// radioButtonStream
			// 
			this.radioButtonStream.AutoSize = true;
			this.radioButtonStream.Location = new System.Drawing.Point(182, 176);
			this.radioButtonStream.Name = "radioButtonStream";
			this.radioButtonStream.Size = new System.Drawing.Size(92, 17);
			this.radioButtonStream.TabIndex = 5;
			this.radioButtonStream.Text = "De um Stream";
			this.radioButtonStream.UseVisualStyleBackColor = true;
			// 
			// radioButtonArquivo
			// 
			this.radioButtonArquivo.AutoSize = true;
			this.radioButtonArquivo.Checked = true;
			this.radioButtonArquivo.Location = new System.Drawing.Point(182, 156);
			this.radioButtonArquivo.Name = "radioButtonArquivo";
			this.radioButtonArquivo.Size = new System.Drawing.Size(95, 17);
			this.radioButtonArquivo.TabIndex = 4;
			this.radioButtonArquivo.TabStop = true;
			this.radioButtonArquivo.Text = "De um Arquivo";
			this.radioButtonArquivo.UseVisualStyleBackColor = true;
			// 
			// buttonCarregarImagem
			// 
			this.buttonCarregarImagem.Location = new System.Drawing.Point(6, 156);
			this.buttonCarregarImagem.Name = "buttonCarregarImagem";
			this.buttonCarregarImagem.Size = new System.Drawing.Size(142, 37);
			this.buttonCarregarImagem.TabIndex = 3;
			this.buttonCarregarImagem.Text = "Carregar Imagem";
			this.buttonCarregarImagem.UseVisualStyleBackColor = true;
			this.buttonCarregarImagem.Click += new System.EventHandler(this.buttonCarregarImagem_Click);
			// 
			// textBoxImagem
			// 
			this.textBoxImagem.Location = new System.Drawing.Point(6, 129);
			this.textBoxImagem.Name = "textBoxImagem";
			this.textBoxImagem.Size = new System.Drawing.Size(271, 20);
			this.textBoxImagem.TabIndex = 2;
			this.textBoxImagem.Text = "ACBR";
			// 
			// label7
			// 
			this.label7.AutoSize = true;
			this.label7.Location = new System.Drawing.Point(3, 113);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(118, 13);
			this.label7.TabIndex = 1;
			this.label7.Text = "Nome Imagem Memória";
			// 
			// pictureBox
			// 
			this.pictureBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.pictureBox.Image = global::ACBrFramework.Net.ETQTeste.Properties.Resources.acbr;
			this.pictureBox.Location = new System.Drawing.Point(6, 19);
			this.pictureBox.Name = "pictureBox";
			this.pictureBox.Size = new System.Drawing.Size(271, 91);
			this.pictureBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.pictureBox.TabIndex = 0;
			this.pictureBox.TabStop = false;
			// 
			// groupBox3
			// 
			this.groupBox3.Controls.Add(this.buttonEtqImagem);
			this.groupBox3.Controls.Add(this.buttonEtqBloco);
			this.groupBox3.Controls.Add(this.buttonEtq3Colunas);
			this.groupBox3.Controls.Add(this.buttonEtqSimples);
			this.groupBox3.Controls.Add(this.label8);
			this.groupBox3.Controls.Add(this.numericUpDownCopias);
			this.groupBox3.Location = new System.Drawing.Point(574, 12);
			this.groupBox3.Name = "groupBox3";
			this.groupBox3.Size = new System.Drawing.Size(134, 207);
			this.groupBox3.TabIndex = 2;
			this.groupBox3.TabStop = false;
			this.groupBox3.Text = "Impressão";
			// 
			// buttonEtqImagem
			// 
			this.buttonEtqImagem.Location = new System.Drawing.Point(8, 173);
			this.buttonEtqImagem.Name = "buttonEtqImagem";
			this.buttonEtqImagem.Size = new System.Drawing.Size(120, 23);
			this.buttonEtqImagem.TabIndex = 10;
			this.buttonEtqImagem.Text = "Imprimir Imagem";
			this.buttonEtqImagem.UseVisualStyleBackColor = true;
			this.buttonEtqImagem.Click += new System.EventHandler(this.buttonEtqImagem_Click);
			// 
			// buttonEtqBloco
			// 
			this.buttonEtqBloco.Location = new System.Drawing.Point(8, 115);
			this.buttonEtqBloco.Name = "buttonEtqBloco";
			this.buttonEtqBloco.Size = new System.Drawing.Size(120, 23);
			this.buttonEtqBloco.TabIndex = 8;
			this.buttonEtqBloco.Text = "Bloco de Etiquetas";
			this.buttonEtqBloco.UseVisualStyleBackColor = true;
			this.buttonEtqBloco.Click += new System.EventHandler(this.buttonEtqBloco_Click);
			// 
			// buttonEtq3Colunas
			// 
			this.buttonEtq3Colunas.Location = new System.Drawing.Point(8, 86);
			this.buttonEtq3Colunas.Name = "buttonEtq3Colunas";
			this.buttonEtq3Colunas.Size = new System.Drawing.Size(120, 23);
			this.buttonEtq3Colunas.TabIndex = 7;
			this.buttonEtq3Colunas.Text = "Etiqueta 3 Colunas";
			this.buttonEtq3Colunas.UseVisualStyleBackColor = true;
			this.buttonEtq3Colunas.Click += new System.EventHandler(this.buttonEtq3Colunas_Click);
			// 
			// buttonEtqSimples
			// 
			this.buttonEtqSimples.Location = new System.Drawing.Point(8, 57);
			this.buttonEtqSimples.Name = "buttonEtqSimples";
			this.buttonEtqSimples.Size = new System.Drawing.Size(120, 23);
			this.buttonEtqSimples.TabIndex = 6;
			this.buttonEtqSimples.Text = "Etiqueta Simples";
			this.buttonEtqSimples.UseVisualStyleBackColor = true;
			this.buttonEtqSimples.Click += new System.EventHandler(this.buttonEtqSimples_Click);
			// 
			// label8
			// 
			this.label8.AutoSize = true;
			this.label8.Location = new System.Drawing.Point(3, 15);
			this.label8.Name = "label8";
			this.label8.Size = new System.Drawing.Size(69, 13);
			this.label8.TabIndex = 5;
			this.label8.Text = "Nº de Copias";
			// 
			// numericUpDownCopias
			// 
			this.numericUpDownCopias.Location = new System.Drawing.Point(8, 31);
			this.numericUpDownCopias.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
			this.numericUpDownCopias.Name = "numericUpDownCopias";
			this.numericUpDownCopias.Size = new System.Drawing.Size(120, 20);
			this.numericUpDownCopias.TabIndex = 4;
			this.numericUpDownCopias.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
			// 
			// acbrETQ
			// 
			this.acbrETQ.ArqLOG = "";
			this.acbrETQ.Ativo = false;
			this.acbrETQ.Avanco = 0;
			this.acbrETQ.BackFeed = ACBrFramework.ETQ.EtqBackFeed.None;
			this.acbrETQ.DPI = ACBrFramework.ETQ.ETQDPI.dpi203;
			this.acbrETQ.LimparMemoria = true;
			this.acbrETQ.ListaCmd = new string[0];
			this.acbrETQ.Modelo = ACBrFramework.ETQ.ETQModelo.Nenhum;
			this.acbrETQ.Origem = ACBrFramework.ETQ.EtqOrigem.ogNone;
			this.acbrETQ.Porta = "LPT1";
			this.acbrETQ.Temperatura = 10;
			this.acbrETQ.Unidade = ACBrFramework.ETQ.ETQUnidade.Milimetros;
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(6, 156);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(142, 37);
			this.button1.TabIndex = 3;
			this.button1.Text = "Carregar Imagem";
			this.button1.UseVisualStyleBackColor = true;
			// 
			// FrmMain
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(720, 231);
			this.Controls.Add(this.groupBox3);
			this.Controls.Add(this.groupBox2);
			this.Controls.Add(this.groupBox1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.Name = "FrmMain";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Impressão de Etiquetas";
			this.Shown += new System.EventHandler(this.FrmMain_Shown);
			this.groupBox1.ResumeLayout(false);
			this.groupBox1.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDownAvancoEtq)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDownVelocidade)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDownTemperatura)).EndInit();
			this.groupBox2.ResumeLayout(false);
			this.groupBox2.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this.pictureBox)).EndInit();
			this.groupBox3.ResumeLayout(false);
			this.groupBox3.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDownCopias)).EndInit();
			this.ResumeLayout(false);

		}

		#endregion

		private ETQ.ACBrETQ acbrETQ;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.ComboBox comboBoxBackFeed;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.ComboBox comboBoxDPI;
		private System.Windows.Forms.CheckBox checkBoxLimparMemoria;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.NumericUpDown numericUpDownAvancoEtq;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.NumericUpDown numericUpDownVelocidade;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.NumericUpDown numericUpDownTemperatura;
		private System.Windows.Forms.Button buttonCfgSerial;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.ComboBox comboBoxModelo;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.GroupBox groupBox3;
		private System.Windows.Forms.PictureBox pictureBox;
		private System.Windows.Forms.Button buttonCarregarImagem;
		private System.Windows.Forms.TextBox textBoxImagem;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.Button buttonEtqImagem;
		private System.Windows.Forms.Button buttonEtqBloco;
		private System.Windows.Forms.Button buttonEtq3Colunas;
		private System.Windows.Forms.Button buttonEtqSimples;
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.NumericUpDown numericUpDownCopias;
		private System.Windows.Forms.RadioButton radioButtonStream;
		private System.Windows.Forms.RadioButton radioButtonArquivo;
		private System.Windows.Forms.Button button1;
	}
}

