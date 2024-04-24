namespace Assignment4
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
            Statistics = new GroupBox();
            tiesScoreLb = new Label();
            oScoreLb = new Label();
            xScoreLb = new Label();
            TiesLb = new Label();
            OWinsLb = new Label();
            XWinsLb = new Label();
            RestartGame = new Button();
            GameBoard = new TableLayoutPanel();
            Tile22 = new Button();
            Tile21 = new Button();
            Tile20 = new Button();
            Tile12 = new Button();
            Tile11 = new Button();
            Tile10 = new Button();
            Tile02 = new Button();
            Tile01 = new Button();
            Tile00 = new Button();
            GameStatus = new RichTextBox();
            GameStatusBox = new GroupBox();
            Statistics.SuspendLayout();
            GameBoard.SuspendLayout();
            GameStatusBox.SuspendLayout();
            SuspendLayout();
            // 
            // Statistics
            // 
            Statistics.BackColor = Color.Lime;
            Statistics.Controls.Add(tiesScoreLb);
            Statistics.Controls.Add(oScoreLb);
            Statistics.Controls.Add(xScoreLb);
            Statistics.Controls.Add(TiesLb);
            Statistics.Controls.Add(OWinsLb);
            Statistics.Controls.Add(XWinsLb);
            Statistics.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            Statistics.Location = new Point(734, 137);
            Statistics.Name = "Statistics";
            Statistics.Size = new Size(497, 281);
            Statistics.TabIndex = 0;
            Statistics.TabStop = false;
            Statistics.Text = "Statistics";
            // 
            // tiesScoreLb
            // 
            tiesScoreLb.AutoSize = true;
            tiesScoreLb.Location = new Point(274, 206);
            tiesScoreLb.Name = "tiesScoreLb";
            tiesScoreLb.Size = new Size(28, 32);
            tiesScoreLb.TabIndex = 5;
            tiesScoreLb.Text = "0";
            // 
            // oScoreLb
            // 
            oScoreLb.AutoSize = true;
            oScoreLb.Location = new Point(274, 129);
            oScoreLb.Name = "oScoreLb";
            oScoreLb.Size = new Size(28, 32);
            oScoreLb.TabIndex = 4;
            oScoreLb.Text = "0";
            // 
            // xScoreLb
            // 
            xScoreLb.AutoSize = true;
            xScoreLb.Location = new Point(274, 51);
            xScoreLb.Name = "xScoreLb";
            xScoreLb.Size = new Size(28, 32);
            xScoreLb.TabIndex = 3;
            xScoreLb.Text = "0";
            // 
            // TiesLb
            // 
            TiesLb.AutoSize = true;
            TiesLb.Location = new Point(145, 206);
            TiesLb.Name = "TiesLb";
            TiesLb.Size = new Size(66, 32);
            TiesLb.TabIndex = 2;
            TiesLb.Text = "Ties:";
            // 
            // OWinsLb
            // 
            OWinsLb.AutoSize = true;
            OWinsLb.Location = new Point(34, 129);
            OWinsLb.Name = "OWinsLb";
            OWinsLb.Size = new Size(181, 32);
            OWinsLb.TabIndex = 1;
            OWinsLb.Text = "Player O Wins:";
            // 
            // XWinsLb
            // 
            XWinsLb.AutoSize = true;
            XWinsLb.Location = new Point(34, 51);
            XWinsLb.Name = "XWinsLb";
            XWinsLb.Size = new Size(179, 32);
            XWinsLb.TabIndex = 0;
            XWinsLb.Text = "Player X Wins:";
            // 
            // RestartGame
            // 
            RestartGame.BackColor = Color.Blue;
            RestartGame.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            RestartGame.ForeColor = SystemColors.ButtonFace;
            RestartGame.Location = new Point(875, 34);
            RestartGame.Name = "RestartGame";
            RestartGame.Size = new Size(216, 68);
            RestartGame.TabIndex = 1;
            RestartGame.Text = "Start Game";
            RestartGame.UseVisualStyleBackColor = false;
            RestartGame.Click += RestartGame_Click;
            // 
            // GameBoard
            // 
            GameBoard.BackColor = Color.Black;
            GameBoard.ColumnCount = 3;
            GameBoard.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 33.33333F));
            GameBoard.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 33.33334F));
            GameBoard.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 33.33334F));
            GameBoard.Controls.Add(Tile22, 2, 2);
            GameBoard.Controls.Add(Tile21, 1, 2);
            GameBoard.Controls.Add(Tile20, 0, 2);
            GameBoard.Controls.Add(Tile12, 2, 1);
            GameBoard.Controls.Add(Tile11, 1, 1);
            GameBoard.Controls.Add(Tile10, 0, 1);
            GameBoard.Controls.Add(Tile02, 2, 0);
            GameBoard.Controls.Add(Tile01, 1, 0);
            GameBoard.Controls.Add(Tile00, 0, 0);
            GameBoard.Location = new Point(21, 25);
            GameBoard.Name = "GameBoard";
            GameBoard.RowCount = 3;
            GameBoard.RowStyles.Add(new RowStyle(SizeType.Percent, 33.33333F));
            GameBoard.RowStyles.Add(new RowStyle(SizeType.Percent, 33.33333F));
            GameBoard.RowStyles.Add(new RowStyle(SizeType.Percent, 33.33333F));
            GameBoard.Size = new Size(629, 596);
            GameBoard.TabIndex = 3;
            // 
            // Tile22
            // 
            Tile22.BackColor = Color.DarkGray;
            Tile22.Font = new Font("Segoe UI", 55F, FontStyle.Bold, GraphicsUnit.Point);
            Tile22.Location = new Point(421, 399);
            Tile22.Name = "Tile22";
            Tile22.Size = new Size(203, 192);
            Tile22.TabIndex = 8;
            Tile22.UseVisualStyleBackColor = false;
            Tile22.Click += Tile_Click;
            // 
            // Tile21
            // 
            Tile21.BackColor = Color.DarkGray;
            Tile21.Font = new Font("Segoe UI", 55F, FontStyle.Bold, GraphicsUnit.Point);
            Tile21.Location = new Point(212, 399);
            Tile21.Name = "Tile21";
            Tile21.Size = new Size(203, 192);
            Tile21.TabIndex = 7;
            Tile21.UseVisualStyleBackColor = false;
            Tile21.Click += Tile_Click;
            // 
            // Tile20
            // 
            Tile20.BackColor = Color.DarkGray;
            Tile20.Font = new Font("Segoe UI", 55F, FontStyle.Bold, GraphicsUnit.Point);
            Tile20.Location = new Point(3, 399);
            Tile20.Name = "Tile20";
            Tile20.Size = new Size(203, 192);
            Tile20.TabIndex = 6;
            Tile20.UseVisualStyleBackColor = false;
            Tile20.Click += Tile_Click;
            // 
            // Tile12
            // 
            Tile12.BackColor = Color.DarkGray;
            Tile12.Font = new Font("Segoe UI", 55F, FontStyle.Bold, GraphicsUnit.Point);
            Tile12.Location = new Point(421, 201);
            Tile12.Name = "Tile12";
            Tile12.Size = new Size(203, 192);
            Tile12.TabIndex = 5;
            Tile12.UseVisualStyleBackColor = false;
            Tile12.Click += Tile_Click;
            // 
            // Tile11
            // 
            Tile11.BackColor = Color.DarkGray;
            Tile11.Font = new Font("Segoe UI", 55F, FontStyle.Bold, GraphicsUnit.Point);
            Tile11.Location = new Point(212, 201);
            Tile11.Name = "Tile11";
            Tile11.Size = new Size(203, 192);
            Tile11.TabIndex = 4;
            Tile11.UseVisualStyleBackColor = false;
            Tile11.Click += Tile_Click;
            // 
            // Tile10
            // 
            Tile10.BackColor = Color.DarkGray;
            Tile10.Font = new Font("Segoe UI", 55F, FontStyle.Bold, GraphicsUnit.Point);
            Tile10.Location = new Point(3, 201);
            Tile10.Name = "Tile10";
            Tile10.Size = new Size(203, 192);
            Tile10.TabIndex = 3;
            Tile10.UseVisualStyleBackColor = false;
            Tile10.Click += Tile_Click;
            // 
            // Tile02
            // 
            Tile02.BackColor = Color.DarkGray;
            Tile02.Font = new Font("Segoe UI", 55F, FontStyle.Bold, GraphicsUnit.Point);
            Tile02.Location = new Point(421, 3);
            Tile02.Name = "Tile02";
            Tile02.Size = new Size(203, 192);
            Tile02.TabIndex = 2;
            Tile02.UseVisualStyleBackColor = false;
            Tile02.Click += Tile_Click;
            // 
            // Tile01
            // 
            Tile01.BackColor = Color.DarkGray;
            Tile01.Font = new Font("Segoe UI", 55F, FontStyle.Bold, GraphicsUnit.Point);
            Tile01.Location = new Point(212, 3);
            Tile01.Name = "Tile01";
            Tile01.Size = new Size(203, 192);
            Tile01.TabIndex = 1;
            Tile01.UseVisualStyleBackColor = false;
            Tile01.Click += Tile_Click;
            // 
            // Tile00
            // 
            Tile00.BackColor = Color.DarkGray;
            Tile00.Font = new Font("Segoe UI", 55F, FontStyle.Bold, GraphicsUnit.Point);
            Tile00.Location = new Point(3, 3);
            Tile00.Name = "Tile00";
            Tile00.Size = new Size(203, 192);
            Tile00.TabIndex = 0;
            Tile00.UseVisualStyleBackColor = false;
            Tile00.Click += Tile_Click;
            // 
            // GameStatus
            // 
            GameStatus.Anchor = AnchorStyles.None;
            GameStatus.BackColor = Color.FromArgb(125, 255, 255);
            GameStatus.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            GameStatus.Location = new Point(22, 47);
            GameStatus.Name = "GameStatus";
            GameStatus.Size = new Size(549, 129);
            GameStatus.TabIndex = 0;
            GameStatus.TabStop = false;
            GameStatus.Text = "";
            // 
            // GameStatusBox
            // 
            GameStatusBox.Controls.Add(GameStatus);
            GameStatusBox.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            GameStatusBox.Location = new Point(21, 661);
            GameStatusBox.Name = "GameStatusBox";
            GameStatusBox.Size = new Size(622, 211);
            GameStatusBox.TabIndex = 4;
            GameStatusBox.TabStop = false;
            GameStatusBox.Text = "Game Status";
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.Red;
            ClientSize = new Size(1273, 927);
            Controls.Add(GameStatusBox);
            Controls.Add(GameBoard);
            Controls.Add(RestartGame);
            Controls.Add(Statistics);
            FormBorderStyle = FormBorderStyle.Fixed3D;
            MaximizeBox = false;
            MaximumSize = new Size(1303, 1002);
            MinimumSize = new Size(1303, 1002);
            Name = "Form1";
            Padding = new Padding(5);
            Text = "Tic Tac Toe";
            Statistics.ResumeLayout(false);
            Statistics.PerformLayout();
            GameBoard.ResumeLayout(false);
            GameStatusBox.ResumeLayout(false);
            ResumeLayout(false);
        }

        #endregion

        private GroupBox Statistics;
        private Button RestartGame;
        private TableLayoutPanel GameBoard;
        private RichTextBox GameStatus;
        private GroupBox GameStatusBox;
        private Label TiesLb;
        private Label OWinsLb;
        private Label XWinsLb;
        private Button Tile00;
        private Button Tile01;
        private Button Tile02;
        private Button Tile10;
        private Button Tile11;
        private Button Tile12;
        private Button Tile20;
        private Button Tile21;
        private Button Tile22;
        private Label tiesScoreLb;
        private Label oScoreLb;
        private Label xScoreLb;
    }
}