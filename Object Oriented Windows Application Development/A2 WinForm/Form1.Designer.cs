namespace A2_WinForm
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.gameInfo = new System.Windows.Forms.GroupBox();
            this.NumXLost = new System.Windows.Forms.Label();
            this.numXWon = new System.Windows.Forms.Label();
            this.numXPlayed = new System.Windows.Forms.Label();
            this.lbXLost = new System.Windows.Forms.Label();
            this.lbXWon = new System.Windows.Forms.Label();
            this.lbXPlayed = new System.Windows.Forms.Label();
            this.lbUserGuess = new System.Windows.Forms.Label();
            this.tbUserGuess = new System.Windows.Forms.TextBox();
            this.dieFace = new System.Windows.Forms.PictureBox();
            this.btnRoll = new System.Windows.Forms.Button();
            this.btnClear = new System.Windows.Forms.Button();
            this.pnlResults = new System.Windows.Forms.TableLayoutPanel();
            this.lbFace = new System.Windows.Forms.Label();
            this.face2 = new System.Windows.Forms.Label();
            this.face4 = new System.Windows.Forms.Label();
            this.face5 = new System.Windows.Forms.Label();
            this.lbFrequency = new System.Windows.Forms.Label();
            this.freq1 = new System.Windows.Forms.Label();
            this.freq2 = new System.Windows.Forms.Label();
            this.freq3 = new System.Windows.Forms.Label();
            this.freq4 = new System.Windows.Forms.Label();
            this.freq5 = new System.Windows.Forms.Label();
            this.freq6 = new System.Windows.Forms.Label();
            this.lbPercent = new System.Windows.Forms.Label();
            this.perc1 = new System.Windows.Forms.Label();
            this.perc2 = new System.Windows.Forms.Label();
            this.perc4 = new System.Windows.Forms.Label();
            this.perc5 = new System.Windows.Forms.Label();
            this.perc6 = new System.Windows.Forms.Label();
            this.lbXGuessed = new System.Windows.Forms.Label();
            this.guess2 = new System.Windows.Forms.Label();
            this.guess3 = new System.Windows.Forms.Label();
            this.guess4 = new System.Windows.Forms.Label();
            this.guess5 = new System.Windows.Forms.Label();
            this.guess6 = new System.Windows.Forms.Label();
            this.face1 = new System.Windows.Forms.Label();
            this.face3 = new System.Windows.Forms.Label();
            this.perc3 = new System.Windows.Forms.Label();
            this.guess1 = new System.Windows.Forms.Label();
            this.face6 = new System.Windows.Forms.Label();
            this.invalidEntry = new System.Windows.Forms.Label();
            this.gameInfo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dieFace)).BeginInit();
            this.pnlResults.SuspendLayout();
            this.SuspendLayout();
            // 
            // gameInfo
            // 
            this.gameInfo.Controls.Add(this.NumXLost);
            this.gameInfo.Controls.Add(this.numXWon);
            this.gameInfo.Controls.Add(this.numXPlayed);
            this.gameInfo.Controls.Add(this.lbXLost);
            this.gameInfo.Controls.Add(this.lbXWon);
            this.gameInfo.Controls.Add(this.lbXPlayed);
            this.gameInfo.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.gameInfo.Location = new System.Drawing.Point(12, 14);
            this.gameInfo.Name = "gameInfo";
            this.gameInfo.Size = new System.Drawing.Size(440, 179);
            this.gameInfo.TabIndex = 0;
            this.gameInfo.TabStop = false;
            this.gameInfo.Text = "Game Info";
            // 
            // NumXLost
            // 
            this.NumXLost.AutoSize = true;
            this.NumXLost.Location = new System.Drawing.Point(326, 126);
            this.NumXLost.Name = "NumXLost";
            this.NumXLost.Size = new System.Drawing.Size(32, 37);
            this.NumXLost.TabIndex = 5;
            this.NumXLost.Text = "0";
            // 
            // numXWon
            // 
            this.numXWon.AutoSize = true;
            this.numXWon.Location = new System.Drawing.Point(326, 80);
            this.numXWon.Name = "numXWon";
            this.numXWon.Size = new System.Drawing.Size(32, 37);
            this.numXWon.TabIndex = 4;
            this.numXWon.Text = "0";
            // 
            // numXPlayed
            // 
            this.numXPlayed.AutoSize = true;
            this.numXPlayed.Location = new System.Drawing.Point(326, 39);
            this.numXPlayed.Name = "numXPlayed";
            this.numXPlayed.Size = new System.Drawing.Size(32, 37);
            this.numXPlayed.TabIndex = 3;
            this.numXPlayed.Text = "0";
            // 
            // lbXLost
            // 
            this.lbXLost.AutoSize = true;
            this.lbXLost.Location = new System.Drawing.Point(6, 126);
            this.lbXLost.Name = "lbXLost";
            this.lbXLost.Size = new System.Drawing.Size(283, 37);
            this.lbXLost.TabIndex = 2;
            this.lbXLost.Text = "Number of Times Lost:";
            // 
            // lbXWon
            // 
            this.lbXWon.AutoSize = true;
            this.lbXWon.Location = new System.Drawing.Point(7, 80);
            this.lbXWon.Name = "lbXWon";
            this.lbXWon.Size = new System.Drawing.Size(289, 37);
            this.lbXWon.TabIndex = 1;
            this.lbXWon.Text = "Number of Times Won:";
            // 
            // lbXPlayed
            // 
            this.lbXPlayed.AutoSize = true;
            this.lbXPlayed.Location = new System.Drawing.Point(6, 39);
            this.lbXPlayed.Name = "lbXPlayed";
            this.lbXPlayed.Size = new System.Drawing.Size(313, 37);
            this.lbXPlayed.TabIndex = 0;
            this.lbXPlayed.Text = "Number of Times Played:";
            // 
            // lbUserGuess
            // 
            this.lbUserGuess.AutoSize = true;
            this.lbUserGuess.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lbUserGuess.Location = new System.Drawing.Point(12, 224);
            this.lbUserGuess.Name = "lbUserGuess";
            this.lbUserGuess.Size = new System.Drawing.Size(274, 36);
            this.lbUserGuess.TabIndex = 1;
            this.lbUserGuess.Text = "Enter your guess (1-6):";
            // 
            // tbUserGuess
            // 
            this.tbUserGuess.Location = new System.Drawing.Point(295, 217);
            this.tbUserGuess.MaxLength = 1;
            this.tbUserGuess.Name = "tbUserGuess";
            this.tbUserGuess.Size = new System.Drawing.Size(90, 43);
            this.tbUserGuess.TabIndex = 2;
            // 
            // dieFace
            // 
            this.dieFace.Image = global::A2_WinForm.Properties.Resources.die1;
            this.dieFace.InitialImage = global::A2_WinForm.Properties.Resources.die1;
            this.dieFace.Location = new System.Drawing.Point(19, 294);
            this.dieFace.Name = "dieFace";
            this.dieFace.Size = new System.Drawing.Size(169, 162);
            this.dieFace.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.dieFace.TabIndex = 3;
            this.dieFace.TabStop = false;
            // 
            // btnRoll
            // 
            this.btnRoll.Location = new System.Drawing.Point(261, 294);
            this.btnRoll.Name = "btnRoll";
            this.btnRoll.Size = new System.Drawing.Size(191, 57);
            this.btnRoll.TabIndex = 4;
            this.btnRoll.Text = "Roll";
            this.btnRoll.UseVisualStyleBackColor = true;
            this.btnRoll.Click += new System.EventHandler(this.btnRoll_Clicked);
            // 
            // btnClear
            // 
            this.btnClear.Location = new System.Drawing.Point(261, 400);
            this.btnClear.Name = "btnClear";
            this.btnClear.Padding = new System.Windows.Forms.Padding(2);
            this.btnClear.Size = new System.Drawing.Size(191, 56);
            this.btnClear.TabIndex = 5;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // pnlResults
            // 
            this.pnlResults.AutoSize = true;
            this.pnlResults.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.pnlResults.BackColor = System.Drawing.SystemColors.Window;
            this.pnlResults.ColumnCount = 4;
            this.pnlResults.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.pnlResults.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.pnlResults.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.pnlResults.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.pnlResults.Controls.Add(this.lbFace, 0, 0);
            this.pnlResults.Controls.Add(this.face2, 0, 2);
            this.pnlResults.Controls.Add(this.face4, 0, 4);
            this.pnlResults.Controls.Add(this.face5, 0, 5);
            this.pnlResults.Controls.Add(this.lbFrequency, 1, 0);
            this.pnlResults.Controls.Add(this.freq1, 1, 1);
            this.pnlResults.Controls.Add(this.freq2, 1, 2);
            this.pnlResults.Controls.Add(this.freq3, 1, 3);
            this.pnlResults.Controls.Add(this.freq4, 1, 4);
            this.pnlResults.Controls.Add(this.freq5, 1, 5);
            this.pnlResults.Controls.Add(this.freq6, 1, 6);
            this.pnlResults.Controls.Add(this.lbPercent, 2, 0);
            this.pnlResults.Controls.Add(this.perc1, 2, 1);
            this.pnlResults.Controls.Add(this.perc2, 2, 2);
            this.pnlResults.Controls.Add(this.perc4, 2, 4);
            this.pnlResults.Controls.Add(this.perc5, 2, 5);
            this.pnlResults.Controls.Add(this.perc6, 2, 6);
            this.pnlResults.Controls.Add(this.lbXGuessed, 3, 0);
            this.pnlResults.Controls.Add(this.guess2, 3, 2);
            this.pnlResults.Controls.Add(this.guess3, 3, 3);
            this.pnlResults.Controls.Add(this.guess4, 3, 4);
            this.pnlResults.Controls.Add(this.guess5, 3, 5);
            this.pnlResults.Controls.Add(this.guess6, 3, 6);
            this.pnlResults.Controls.Add(this.face1, 0, 1);
            this.pnlResults.Controls.Add(this.face3, 0, 3);
            this.pnlResults.Controls.Add(this.perc3, 2, 3);
            this.pnlResults.Controls.Add(this.guess1, 3, 1);
            this.pnlResults.Controls.Add(this.face6, 0, 6);
            this.pnlResults.GrowStyle = System.Windows.Forms.TableLayoutPanelGrowStyle.FixedSize;
            this.pnlResults.Location = new System.Drawing.Point(19, 498);
            this.pnlResults.Margin = new System.Windows.Forms.Padding(10);
            this.pnlResults.Name = "pnlResults";
            this.pnlResults.Padding = new System.Windows.Forms.Padding(3);
            this.pnlResults.RowCount = 7;
            this.pnlResults.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.pnlResults.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.pnlResults.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.pnlResults.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.pnlResults.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.pnlResults.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.pnlResults.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.pnlResults.Size = new System.Drawing.Size(670, 297);
            this.pnlResults.TabIndex = 6;
            // 
            // lbFace
            // 
            this.lbFace.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.lbFace.AutoSize = true;
            this.lbFace.Location = new System.Drawing.Point(6, 3);
            this.lbFace.Name = "lbFace";
            this.lbFace.Size = new System.Drawing.Size(75, 37);
            this.lbFace.TabIndex = 0;
            this.lbFace.Text = "FACE";
            // 
            // face2
            // 
            this.face2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.face2.AutoSize = true;
            this.face2.Location = new System.Drawing.Point(25, 81);
            this.face2.Name = "face2";
            this.face2.Padding = new System.Windows.Forms.Padding(2);
            this.face2.Size = new System.Drawing.Size(36, 41);
            this.face2.TabIndex = 2;
            this.face2.Text = "2";
            // 
            // face4
            // 
            this.face4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.face4.AutoSize = true;
            this.face4.Location = new System.Drawing.Point(25, 165);
            this.face4.Name = "face4";
            this.face4.Padding = new System.Windows.Forms.Padding(2);
            this.face4.Size = new System.Drawing.Size(36, 43);
            this.face4.TabIndex = 4;
            this.face4.Text = "4";
            // 
            // face5
            // 
            this.face5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.face5.AutoSize = true;
            this.face5.Location = new System.Drawing.Point(25, 208);
            this.face5.Name = "face5";
            this.face5.Padding = new System.Windows.Forms.Padding(2);
            this.face5.Size = new System.Drawing.Size(36, 43);
            this.face5.TabIndex = 5;
            this.face5.Text = "5";
            // 
            // lbFrequency
            // 
            this.lbFrequency.AutoSize = true;
            this.lbFrequency.Location = new System.Drawing.Point(87, 3);
            this.lbFrequency.Name = "lbFrequency";
            this.lbFrequency.Size = new System.Drawing.Size(165, 37);
            this.lbFrequency.TabIndex = 7;
            this.lbFrequency.Text = "FREQUENCY";
            // 
            // freq1
            // 
            this.freq1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.freq1.AutoSize = true;
            this.freq1.Location = new System.Drawing.Point(153, 40);
            this.freq1.Name = "freq1";
            this.freq1.Size = new System.Drawing.Size(32, 41);
            this.freq1.TabIndex = 8;
            this.freq1.Text = "0";
            // 
            // freq2
            // 
            this.freq2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.freq2.AutoSize = true;
            this.freq2.Location = new System.Drawing.Point(153, 81);
            this.freq2.Name = "freq2";
            this.freq2.Size = new System.Drawing.Size(32, 41);
            this.freq2.TabIndex = 9;
            this.freq2.Text = "0";
            // 
            // freq3
            // 
            this.freq3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.freq3.AutoSize = true;
            this.freq3.Location = new System.Drawing.Point(153, 122);
            this.freq3.Name = "freq3";
            this.freq3.Size = new System.Drawing.Size(32, 43);
            this.freq3.TabIndex = 10;
            this.freq3.Text = "0";
            // 
            // freq4
            // 
            this.freq4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.freq4.AutoSize = true;
            this.freq4.Location = new System.Drawing.Point(153, 165);
            this.freq4.Name = "freq4";
            this.freq4.Size = new System.Drawing.Size(32, 43);
            this.freq4.TabIndex = 11;
            this.freq4.Text = "0";
            // 
            // freq5
            // 
            this.freq5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.freq5.AutoSize = true;
            this.freq5.Location = new System.Drawing.Point(153, 208);
            this.freq5.Name = "freq5";
            this.freq5.Size = new System.Drawing.Size(32, 43);
            this.freq5.TabIndex = 12;
            this.freq5.Text = "0";
            // 
            // freq6
            // 
            this.freq6.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.freq6.AutoSize = true;
            this.freq6.Location = new System.Drawing.Point(153, 251);
            this.freq6.Name = "freq6";
            this.freq6.Size = new System.Drawing.Size(32, 43);
            this.freq6.TabIndex = 13;
            this.freq6.Text = "0";
            // 
            // lbPercent
            // 
            this.lbPercent.AutoSize = true;
            this.lbPercent.Location = new System.Drawing.Point(258, 3);
            this.lbPercent.Name = "lbPercent";
            this.lbPercent.Size = new System.Drawing.Size(127, 37);
            this.lbPercent.TabIndex = 14;
            this.lbPercent.Text = "PERCENT";
            // 
            // perc1
            // 
            this.perc1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.perc1.AutoSize = true;
            this.perc1.Location = new System.Drawing.Point(276, 40);
            this.perc1.Name = "perc1";
            this.perc1.Size = new System.Drawing.Size(90, 41);
            this.perc1.TabIndex = 15;
            this.perc1.Text = "0.00%";
            // 
            // perc2
            // 
            this.perc2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.perc2.AutoSize = true;
            this.perc2.Location = new System.Drawing.Point(276, 81);
            this.perc2.Name = "perc2";
            this.perc2.Size = new System.Drawing.Size(90, 41);
            this.perc2.TabIndex = 16;
            this.perc2.Text = "0.00%";
            // 
            // perc4
            // 
            this.perc4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.perc4.AutoSize = true;
            this.perc4.Location = new System.Drawing.Point(276, 165);
            this.perc4.Name = "perc4";
            this.perc4.Size = new System.Drawing.Size(90, 43);
            this.perc4.TabIndex = 18;
            this.perc4.Text = "0.00%";
            // 
            // perc5
            // 
            this.perc5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.perc5.AutoSize = true;
            this.perc5.Location = new System.Drawing.Point(276, 208);
            this.perc5.Name = "perc5";
            this.perc5.Size = new System.Drawing.Size(90, 43);
            this.perc5.TabIndex = 19;
            this.perc5.Text = "0.00%";
            // 
            // perc6
            // 
            this.perc6.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.perc6.AutoSize = true;
            this.perc6.Location = new System.Drawing.Point(276, 251);
            this.perc6.Name = "perc6";
            this.perc6.Size = new System.Drawing.Size(90, 43);
            this.perc6.TabIndex = 20;
            this.perc6.Text = "0.00%";
            // 
            // lbXGuessed
            // 
            this.lbXGuessed.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.lbXGuessed.AutoSize = true;
            this.lbXGuessed.Location = new System.Drawing.Point(391, 3);
            this.lbXGuessed.Name = "lbXGuessed";
            this.lbXGuessed.Size = new System.Drawing.Size(273, 37);
            this.lbXGuessed.TabIndex = 21;
            this.lbXGuessed.Text = "# OF TIMES GUESSED";
            // 
            // guess2
            // 
            this.guess2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.guess2.AutoSize = true;
            this.guess2.Location = new System.Drawing.Point(510, 81);
            this.guess2.Name = "guess2";
            this.guess2.Padding = new System.Windows.Forms.Padding(1);
            this.guess2.Size = new System.Drawing.Size(34, 41);
            this.guess2.TabIndex = 23;
            this.guess2.Text = "0";
            // 
            // guess3
            // 
            this.guess3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.guess3.AutoSize = true;
            this.guess3.Location = new System.Drawing.Point(511, 125);
            this.guess3.Margin = new System.Windows.Forms.Padding(3);
            this.guess3.Name = "guess3";
            this.guess3.Size = new System.Drawing.Size(32, 37);
            this.guess3.TabIndex = 24;
            this.guess3.Text = "0";
            // 
            // guess4
            // 
            this.guess4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.guess4.AutoSize = true;
            this.guess4.Location = new System.Drawing.Point(511, 168);
            this.guess4.Margin = new System.Windows.Forms.Padding(3);
            this.guess4.Name = "guess4";
            this.guess4.Size = new System.Drawing.Size(32, 37);
            this.guess4.TabIndex = 25;
            this.guess4.Text = "0";
            // 
            // guess5
            // 
            this.guess5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.guess5.AutoSize = true;
            this.guess5.Location = new System.Drawing.Point(511, 211);
            this.guess5.Margin = new System.Windows.Forms.Padding(3);
            this.guess5.Name = "guess5";
            this.guess5.Size = new System.Drawing.Size(32, 37);
            this.guess5.TabIndex = 26;
            this.guess5.Text = "0";
            // 
            // guess6
            // 
            this.guess6.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.guess6.AutoSize = true;
            this.guess6.Location = new System.Drawing.Point(511, 254);
            this.guess6.Margin = new System.Windows.Forms.Padding(3);
            this.guess6.Name = "guess6";
            this.guess6.Size = new System.Drawing.Size(32, 37);
            this.guess6.TabIndex = 27;
            this.guess6.Text = "0";
            // 
            // face1
            // 
            this.face1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.face1.AutoSize = true;
            this.face1.Location = new System.Drawing.Point(25, 40);
            this.face1.Name = "face1";
            this.face1.Padding = new System.Windows.Forms.Padding(2);
            this.face1.Size = new System.Drawing.Size(36, 41);
            this.face1.TabIndex = 1;
            this.face1.Text = "1";
            // 
            // face3
            // 
            this.face3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.face3.AutoSize = true;
            this.face3.Location = new System.Drawing.Point(25, 122);
            this.face3.Name = "face3";
            this.face3.Padding = new System.Windows.Forms.Padding(2);
            this.face3.Size = new System.Drawing.Size(36, 43);
            this.face3.TabIndex = 3;
            this.face3.Text = "3";
            // 
            // perc3
            // 
            this.perc3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.perc3.AutoSize = true;
            this.perc3.Location = new System.Drawing.Point(276, 122);
            this.perc3.Name = "perc3";
            this.perc3.Size = new System.Drawing.Size(90, 43);
            this.perc3.TabIndex = 17;
            this.perc3.Text = "0.00%";
            // 
            // guess1
            // 
            this.guess1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.guess1.AutoSize = true;
            this.guess1.Location = new System.Drawing.Point(511, 40);
            this.guess1.Name = "guess1";
            this.guess1.Size = new System.Drawing.Size(32, 41);
            this.guess1.TabIndex = 22;
            this.guess1.Text = "0";
            this.guess1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // face6
            // 
            this.face6.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.face6.AutoSize = true;
            this.face6.Location = new System.Drawing.Point(25, 251);
            this.face6.Name = "face6";
            this.face6.Padding = new System.Windows.Forms.Padding(2);
            this.face6.Size = new System.Drawing.Size(36, 43);
            this.face6.TabIndex = 6;
            this.face6.Text = "6";
            // 
            // invalidEntry
            // 
            this.invalidEntry.AutoSize = true;
            this.invalidEntry.BackColor = System.Drawing.SystemColors.Info;
            this.invalidEntry.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.invalidEntry.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.invalidEntry.Location = new System.Drawing.Point(420, 220);
            this.invalidEntry.Name = "invalidEntry";
            this.invalidEntry.Size = new System.Drawing.Size(259, 37);
            this.invalidEntry.TabIndex = 7;
            this.invalidEntry.Text = "Error: Invalid Entry";
            this.invalidEntry.Visible = false;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(15F, 37F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.ClientSize = new System.Drawing.Size(714, 814);
            this.Controls.Add(this.invalidEntry);
            this.Controls.Add(this.pnlResults);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.btnRoll);
            this.Controls.Add(this.dieFace);
            this.Controls.Add(this.tbUserGuess);
            this.Controls.Add(this.lbUserGuess);
            this.Controls.Add(this.gameInfo);
            this.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Margin = new System.Windows.Forms.Padding(2, 1, 2, 1);
            this.Name = "Form1";
            this.Text = "Die Guess Game";
            this.gameInfo.ResumeLayout(false);
            this.gameInfo.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dieFace)).EndInit();
            this.pnlResults.ResumeLayout(false);
            this.pnlResults.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private GroupBox gameInfo;
        private Label lbXLost;
        private Label lbXWon;
        private Label lbXPlayed;
        private Label lbUserGuess;
        private TextBox tbUserGuess;
        private PictureBox dieFace;
        private Button btnRoll;
        private Button btnClear;
        private TableLayoutPanel pnlResults;
        private Label lbFace;
        private Label face1;
        private Label face2;
        private Label face3;
        private Label face4;
        private Label face5;
        private Label face6;
        private Label lbFrequency;
        private Label freq1;
        private Label freq2;
        private Label freq3;
        private Label freq4;
        private Label freq5;
        private Label freq6;
        private Label lbPercent;
        private Label perc1;
        private Label perc2;
        private Label perc3;
        private Label perc4;
        private Label perc5;
        private Label perc6;
        private Label lbXGuessed;
        private Label guess1;
        private Label guess2;
        private Label guess3;
        private Label guess4;
        private Label guess5;
        private Label guess6;
        private Label NumXLost;
        private Label numXWon;
        private Label numXPlayed;
        private Label invalidEntry;
    }
}