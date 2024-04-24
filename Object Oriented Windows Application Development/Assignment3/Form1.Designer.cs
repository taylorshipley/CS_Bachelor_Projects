namespace Assignment3
{
    partial class Scores
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.countsBox = new System.Windows.Forms.GroupBox();
            this.asCountInput = new System.Windows.Forms.TextBox();
            this.stCountInput = new System.Windows.Forms.TextBox();
            this.numAssignments = new System.Windows.Forms.Label();
            this.numStudents = new System.Windows.Forms.Label();
            this.submitCounts = new System.Windows.Forms.Button();
            this.navigateBox = new System.Windows.Forms.GroupBox();
            this.navigateTbl = new System.Windows.Forms.TableLayoutPanel();
            this.firstStudent = new System.Windows.Forms.Button();
            this.lastStudent = new System.Windows.Forms.Button();
            this.nextStudent = new System.Windows.Forms.Button();
            this.prevStudent = new System.Windows.Forms.Button();
            this.studentBox = new System.Windows.Forms.GroupBox();
            this.nameError = new System.Windows.Forms.Label();
            this.stNameInput = new System.Windows.Forms.TextBox();
            this.stNumLb = new System.Windows.Forms.Label();
            this.saveName = new System.Windows.Forms.Button();
            this.studentBox2 = new System.Windows.Forms.GroupBox();
            this.asScoreInput = new System.Windows.Forms.TextBox();
            this.asScoreError = new System.Windows.Forms.Label();
            this.asNumInput = new System.Windows.Forms.TextBox();
            this.asScoreLb = new System.Windows.Forms.Label();
            this.asNumLb = new System.Windows.Forms.Label();
            this.saveScore = new System.Windows.Forms.Button();
            this.resetScores = new System.Windows.Forms.Button();
            this.displayScores = new System.Windows.Forms.Button();
            this.scoreResults = new System.Windows.Forms.DataGridView();
            this.Student = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.assignment1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.assignment2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.assignment3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Assignment4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.assignment5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.averageScore = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.grade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.stCntError = new System.Windows.Forms.Label();
            this.asCntError = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.asNumError = new System.Windows.Forms.Label();
            this.countsBox.SuspendLayout();
            this.navigateBox.SuspendLayout();
            this.navigateTbl.SuspendLayout();
            this.studentBox.SuspendLayout();
            this.studentBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.scoreResults)).BeginInit();
            this.SuspendLayout();
            // 
            // countsBox
            // 
            this.countsBox.Controls.Add(this.asCountInput);
            this.countsBox.Controls.Add(this.stCountInput);
            this.countsBox.Controls.Add(this.numAssignments);
            this.countsBox.Controls.Add(this.numStudents);
            this.countsBox.Controls.Add(this.submitCounts);
            this.countsBox.Location = new System.Drawing.Point(57, 41);
            this.countsBox.Name = "countsBox";
            this.countsBox.Size = new System.Drawing.Size(849, 174);
            this.countsBox.TabIndex = 0;
            this.countsBox.TabStop = false;
            this.countsBox.Text = "Counts";
            // 
            // asCountInput
            // 
            this.asCountInput.Location = new System.Drawing.Point(369, 105);
            this.asCountInput.MaxLength = 2;
            this.asCountInput.Name = "asCountInput";
            this.asCountInput.Size = new System.Drawing.Size(139, 39);
            this.asCountInput.TabIndex = 4;
            // 
            // stCountInput
            // 
            this.stCountInput.Location = new System.Drawing.Point(369, 46);
            this.stCountInput.MaxLength = 2;
            this.stCountInput.Name = "stCountInput";
            this.stCountInput.Size = new System.Drawing.Size(139, 39);
            this.stCountInput.TabIndex = 3;
            // 
            // numAssignments
            // 
            this.numAssignments.AutoSize = true;
            this.numAssignments.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.numAssignments.Location = new System.Drawing.Point(27, 107);
            this.numAssignments.Name = "numAssignments";
            this.numAssignments.Size = new System.Drawing.Size(336, 37);
            this.numAssignments.TabIndex = 2;
            this.numAssignments.Text = "Number of assignments: ";
            // 
            // numStudents
            // 
            this.numStudents.AutoSize = true;
            this.numStudents.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.numStudents.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.numStudents.Location = new System.Drawing.Point(76, 48);
            this.numStudents.Name = "numStudents";
            this.numStudents.Size = new System.Drawing.Size(287, 37);
            this.numStudents.TabIndex = 1;
            this.numStudents.Text = "Number of students: ";
            // 
            // submitCounts
            // 
            this.submitCounts.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.submitCounts.Location = new System.Drawing.Point(591, 64);
            this.submitCounts.Name = "submitCounts";
            this.submitCounts.Size = new System.Drawing.Size(230, 58);
            this.submitCounts.TabIndex = 0;
            this.submitCounts.Text = "Submit Counts";
            this.submitCounts.UseVisualStyleBackColor = true;
            this.submitCounts.Click += new System.EventHandler(this.submitCounts_Click);
            // 
            // navigateBox
            // 
            this.navigateBox.Controls.Add(this.navigateTbl);
            this.navigateBox.Location = new System.Drawing.Point(57, 350);
            this.navigateBox.Name = "navigateBox";
            this.navigateBox.Size = new System.Drawing.Size(1129, 150);
            this.navigateBox.TabIndex = 1;
            this.navigateBox.TabStop = false;
            this.navigateBox.Text = "Navigate";
            // 
            // navigateTbl
            // 
            this.navigateTbl.ColumnCount = 4;
            this.navigateTbl.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.navigateTbl.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.navigateTbl.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.navigateTbl.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.navigateTbl.Controls.Add(this.firstStudent, 0, 0);
            this.navigateTbl.Controls.Add(this.lastStudent, 3, 0);
            this.navigateTbl.Controls.Add(this.nextStudent, 2, 0);
            this.navigateTbl.Controls.Add(this.prevStudent, 1, 0);
            this.navigateTbl.Location = new System.Drawing.Point(6, 38);
            this.navigateTbl.Name = "navigateTbl";
            this.navigateTbl.Padding = new System.Windows.Forms.Padding(3);
            this.navigateTbl.RowCount = 1;
            this.navigateTbl.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.navigateTbl.Size = new System.Drawing.Size(1099, 92);
            this.navigateTbl.TabIndex = 0;
            // 
            // firstStudent
            // 
            this.firstStudent.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.firstStudent.Enabled = false;
            this.firstStudent.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.firstStudent.Location = new System.Drawing.Point(39, 16);
            this.firstStudent.Name = "firstStudent";
            this.firstStudent.Size = new System.Drawing.Size(200, 60);
            this.firstStudent.TabIndex = 1;
            this.firstStudent.Text = "<<First Student";
            this.firstStudent.UseVisualStyleBackColor = true;
            this.firstStudent.Click += new System.EventHandler(this.firstStudent_Click);
            // 
            // lastStudent
            // 
            this.lastStudent.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lastStudent.Enabled = false;
            this.lastStudent.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.lastStudent.Location = new System.Drawing.Point(859, 16);
            this.lastStudent.Name = "lastStudent";
            this.lastStudent.Size = new System.Drawing.Size(200, 60);
            this.lastStudent.TabIndex = 4;
            this.lastStudent.Text = ">>Last Student";
            this.lastStudent.UseVisualStyleBackColor = true;
            this.lastStudent.Click += new System.EventHandler(this.lastStudent_Click);
            // 
            // nextStudent
            // 
            this.nextStudent.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.nextStudent.Enabled = false;
            this.nextStudent.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.nextStudent.Location = new System.Drawing.Point(585, 16);
            this.nextStudent.Name = "nextStudent";
            this.nextStudent.Size = new System.Drawing.Size(200, 60);
            this.nextStudent.TabIndex = 3;
            this.nextStudent.Text = ">Next Student";
            this.nextStudent.UseVisualStyleBackColor = true;
            this.nextStudent.Click += new System.EventHandler(this.nextStudent_Click);
            // 
            // prevStudent
            // 
            this.prevStudent.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.prevStudent.Enabled = false;
            this.prevStudent.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.prevStudent.Location = new System.Drawing.Point(312, 16);
            this.prevStudent.Name = "prevStudent";
            this.prevStudent.Size = new System.Drawing.Size(200, 60);
            this.prevStudent.TabIndex = 2;
            this.prevStudent.Text = "<Prev Student";
            this.prevStudent.UseVisualStyleBackColor = true;
            this.prevStudent.Click += new System.EventHandler(this.prevStudent_Click);
            // 
            // studentBox
            // 
            this.studentBox.Controls.Add(this.nameError);
            this.studentBox.Controls.Add(this.stNameInput);
            this.studentBox.Controls.Add(this.stNumLb);
            this.studentBox.Controls.Add(this.saveName);
            this.studentBox.Location = new System.Drawing.Point(57, 551);
            this.studentBox.Name = "studentBox";
            this.studentBox.Size = new System.Drawing.Size(1129, 149);
            this.studentBox.TabIndex = 2;
            this.studentBox.TabStop = false;
            this.studentBox.Text = "Student Info";
            // 
            // nameError
            // 
            this.nameError.AutoSize = true;
            this.nameError.BackColor = System.Drawing.SystemColors.Info;
            this.nameError.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.nameError.ForeColor = System.Drawing.SystemColors.ControlText;
            this.nameError.Location = new System.Drawing.Point(369, 35);
            this.nameError.Name = "nameError";
            this.nameError.Size = new System.Drawing.Size(263, 32);
            this.nameError.TabIndex = 13;
            this.nameError.Text = "Error: Name is invalid";
            this.nameError.Visible = false;
            // 
            // stNameInput
            // 
            this.stNameInput.Enabled = false;
            this.stNameInput.Location = new System.Drawing.Point(205, 79);
            this.stNameInput.MaxLength = 255;
            this.stNameInput.Name = "stNameInput";
            this.stNameInput.Size = new System.Drawing.Size(586, 39);
            this.stNameInput.TabIndex = 5;
            // 
            // stNumLb
            // 
            this.stNumLb.AutoSize = true;
            this.stNumLb.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.stNumLb.Location = new System.Drawing.Point(27, 78);
            this.stNumLb.Name = "stNumLb";
            this.stNumLb.Size = new System.Drawing.Size(156, 37);
            this.stNumLb.TabIndex = 2;
            this.stNumLb.Text = "Student #1";
            // 
            // saveName
            // 
            this.saveName.Enabled = false;
            this.saveName.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.saveName.Location = new System.Drawing.Point(865, 68);
            this.saveName.Name = "saveName";
            this.saveName.Size = new System.Drawing.Size(200, 60);
            this.saveName.TabIndex = 1;
            this.saveName.Text = "Save Name";
            this.saveName.UseVisualStyleBackColor = true;
            this.saveName.Click += new System.EventHandler(this.saveName_Click);
            // 
            // studentBox2
            // 
            this.studentBox2.Controls.Add(this.asNumError);
            this.studentBox2.Controls.Add(this.asScoreInput);
            this.studentBox2.Controls.Add(this.asScoreError);
            this.studentBox2.Controls.Add(this.asNumInput);
            this.studentBox2.Controls.Add(this.asScoreLb);
            this.studentBox2.Controls.Add(this.asNumLb);
            this.studentBox2.Controls.Add(this.saveScore);
            this.studentBox2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.studentBox2.Location = new System.Drawing.Point(57, 744);
            this.studentBox2.Name = "studentBox2";
            this.studentBox2.Size = new System.Drawing.Size(1129, 234);
            this.studentBox2.TabIndex = 3;
            this.studentBox2.TabStop = false;
            this.studentBox2.Text = "Student Info";
            // 
            // asScoreInput
            // 
            this.asScoreInput.Enabled = false;
            this.asScoreInput.Location = new System.Drawing.Point(473, 162);
            this.asScoreInput.Name = "asScoreInput";
            this.asScoreInput.Size = new System.Drawing.Size(182, 39);
            this.asScoreInput.TabIndex = 5;
            // 
            // asScoreError
            // 
            this.asScoreError.AutoSize = true;
            this.asScoreError.BackColor = System.Drawing.SystemColors.Info;
            this.asScoreError.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.asScoreError.ForeColor = System.Drawing.SystemColors.ControlText;
            this.asScoreError.Location = new System.Drawing.Point(679, 170);
            this.asScoreError.Name = "asScoreError";
            this.asScoreError.Size = new System.Drawing.Size(426, 32);
            this.asScoreError.TabIndex = 11;
            this.asScoreError.Text = "Error: Score must be between 0-100";
            this.asScoreError.Visible = false;
            // 
            // asNumInput
            // 
            this.asNumInput.Enabled = false;
            this.asNumInput.Location = new System.Drawing.Point(473, 65);
            this.asNumInput.Name = "asNumInput";
            this.asNumInput.Size = new System.Drawing.Size(182, 39);
            this.asNumInput.TabIndex = 4;
            // 
            // asScoreLb
            // 
            this.asScoreLb.AutoSize = true;
            this.asScoreLb.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.asScoreLb.Location = new System.Drawing.Point(205, 161);
            this.asScoreLb.Name = "asScoreLb";
            this.asScoreLb.Size = new System.Drawing.Size(253, 37);
            this.asScoreLb.TabIndex = 3;
            this.asScoreLb.Text = "Assignment Score:";
            // 
            // asNumLb
            // 
            this.asNumLb.AutoSize = true;
            this.asNumLb.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.asNumLb.Location = new System.Drawing.Point(27, 67);
            this.asNumLb.Name = "asNumLb";
            this.asNumLb.Size = new System.Drawing.Size(431, 37);
            this.asNumLb.TabIndex = 2;
            this.asNumLb.Text = "Enter Assignment Number (1-5):";
            // 
            // saveScore
            // 
            this.saveScore.Enabled = false;
            this.saveScore.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.saveScore.Location = new System.Drawing.Point(803, 108);
            this.saveScore.Name = "saveScore";
            this.saveScore.Size = new System.Drawing.Size(150, 46);
            this.saveScore.TabIndex = 1;
            this.saveScore.Text = "Save Score";
            this.saveScore.UseVisualStyleBackColor = true;
            this.saveScore.Click += new System.EventHandler(this.saveScore_Click);
            // 
            // resetScores
            // 
            this.resetScores.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.resetScores.Location = new System.Drawing.Point(923, 87);
            this.resetScores.Name = "resetScores";
            this.resetScores.Size = new System.Drawing.Size(204, 84);
            this.resetScores.TabIndex = 5;
            this.resetScores.Text = "Reset\r\nScores";
            this.resetScores.UseVisualStyleBackColor = true;
            this.resetScores.Click += new System.EventHandler(this.resetScores_Click);
            // 
            // displayScores
            // 
            this.displayScores.Enabled = false;
            this.displayScores.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.displayScores.Location = new System.Drawing.Point(520, 996);
            this.displayScores.Name = "displayScores";
            this.displayScores.Size = new System.Drawing.Size(192, 64);
            this.displayScores.TabIndex = 6;
            this.displayScores.Text = "Display Scores";
            this.displayScores.UseVisualStyleBackColor = true;
            this.displayScores.Click += new System.EventHandler(this.displayScores_Click);
            // 
            // scoreResults
            // 
            this.scoreResults.AllowUserToAddRows = false;
            this.scoreResults.AllowUserToDeleteRows = false;
            this.scoreResults.BackgroundColor = System.Drawing.SystemColors.Window;
            this.scoreResults.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.scoreResults.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Student,
            this.assignment1,
            this.assignment2,
            this.assignment3,
            this.Assignment4,
            this.assignment5,
            this.averageScore,
            this.grade});
            this.scoreResults.GridColor = System.Drawing.SystemColors.Window;
            this.scoreResults.Location = new System.Drawing.Point(57, 1083);
            this.scoreResults.Margin = new System.Windows.Forms.Padding(5);
            this.scoreResults.Name = "scoreResults";
            this.scoreResults.ReadOnly = true;
            this.scoreResults.RowHeadersVisible = false;
            this.scoreResults.RowHeadersWidth = 82;
            this.scoreResults.RowTemplate.Height = 41;
            this.scoreResults.Size = new System.Drawing.Size(1439, 393);
            this.scoreResults.TabIndex = 7;
            // 
            // Student
            // 
            this.Student.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.TopLeft;
            this.Student.DefaultCellStyle = dataGridViewCellStyle2;
            this.Student.HeaderText = "STUDENT";
            this.Student.MinimumWidth = 10;
            this.Student.Name = "Student";
            this.Student.ReadOnly = true;
            this.Student.Width = 300;
            // 
            // assignment1
            // 
            this.assignment1.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.assignment1.HeaderText = "#1";
            this.assignment1.MinimumWidth = 100;
            this.assignment1.Name = "assignment1";
            this.assignment1.ReadOnly = true;
            // 
            // assignment2
            // 
            this.assignment2.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.assignment2.HeaderText = "#2";
            this.assignment2.MinimumWidth = 100;
            this.assignment2.Name = "assignment2";
            this.assignment2.ReadOnly = true;
            // 
            // assignment3
            // 
            this.assignment3.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.assignment3.HeaderText = "#3";
            this.assignment3.MinimumWidth = 100;
            this.assignment3.Name = "assignment3";
            this.assignment3.ReadOnly = true;
            // 
            // Assignment4
            // 
            this.Assignment4.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Assignment4.HeaderText = "#4";
            this.Assignment4.MinimumWidth = 100;
            this.Assignment4.Name = "Assignment4";
            this.Assignment4.ReadOnly = true;
            // 
            // assignment5
            // 
            this.assignment5.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.assignment5.HeaderText = "#5";
            this.assignment5.MinimumWidth = 100;
            this.assignment5.Name = "assignment5";
            this.assignment5.ReadOnly = true;
            // 
            // averageScore
            // 
            this.averageScore.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.averageScore.HeaderText = "AVG";
            this.averageScore.MinimumWidth = 100;
            this.averageScore.Name = "averageScore";
            this.averageScore.ReadOnly = true;
            // 
            // grade
            // 
            this.grade.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.grade.HeaderText = "GRADE";
            this.grade.MinimumWidth = 100;
            this.grade.Name = "grade";
            this.grade.ReadOnly = true;
            // 
            // stCntError
            // 
            this.stCntError.AutoSize = true;
            this.stCntError.BackColor = System.Drawing.SystemColors.Info;
            this.stCntError.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.stCntError.ForeColor = System.Drawing.SystemColors.ControlText;
            this.stCntError.Location = new System.Drawing.Point(73, 216);
            this.stCntError.Name = "stCntError";
            this.stCntError.Size = new System.Drawing.Size(579, 32);
            this.stCntError.TabIndex = 8;
            this.stCntError.Text = "Error: Number of students must be between 1-10";
            this.stCntError.Visible = false;
            // 
            // asCntError
            // 
            this.asCntError.AutoSize = true;
            this.asCntError.BackColor = System.Drawing.SystemColors.Info;
            this.asCntError.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.asCntError.ForeColor = System.Drawing.SystemColors.ControlText;
            this.asCntError.Location = new System.Drawing.Point(73, 277);
            this.asCntError.Name = "asCntError";
            this.asCntError.Size = new System.Drawing.Size(627, 32);
            this.asCntError.TabIndex = 9;
            this.asCntError.Text = "Error: Number of Assignments must be between 1-99";
            this.asCntError.Visible = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(0, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(78, 32);
            this.label1.TabIndex = 10;
            this.label1.Text = "label1";
            // 
            // asNumError
            // 
            this.asNumError.AutoSize = true;
            this.asNumError.BackColor = System.Drawing.SystemColors.Info;
            this.asNumError.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.asNumError.ForeColor = System.Drawing.SystemColors.ControlText;
            this.asNumError.Location = new System.Drawing.Point(679, 54);
            this.asNumError.Name = "asNumError";
            this.asNumError.Size = new System.Drawing.Size(408, 32);
            this.asNumError.TabIndex = 12;
            this.asNumError.Text = "Error: Invalid Assignment Number";
            this.asNumError.Visible = false;
            // 
            // Scores
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(13F, 32F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1510, 1513);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.asCntError);
            this.Controls.Add(this.stCntError);
            this.Controls.Add(this.scoreResults);
            this.Controls.Add(this.displayScores);
            this.Controls.Add(this.resetScores);
            this.Controls.Add(this.studentBox2);
            this.Controls.Add(this.studentBox);
            this.Controls.Add(this.navigateBox);
            this.Controls.Add(this.countsBox);
            this.MinimumSize = new System.Drawing.Size(1536, 1584);
            this.Name = "Scores";
            this.Text = "Scores";
            this.countsBox.ResumeLayout(false);
            this.countsBox.PerformLayout();
            this.navigateBox.ResumeLayout(false);
            this.navigateTbl.ResumeLayout(false);
            this.studentBox.ResumeLayout(false);
            this.studentBox.PerformLayout();
            this.studentBox2.ResumeLayout(false);
            this.studentBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.scoreResults)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private GroupBox countsBox;
        private GroupBox navigateBox;
        private GroupBox studentBox;
        private GroupBox studentBox2;
        private Button submitCounts;
        private TableLayoutPanel navigateTbl;
        private Button firstStudent;
        private Button prevStudent;
        private Button nextStudent;
        private Button lastStudent;
        private Button saveName;
        private Button saveScore;
        private Button resetScores;
        private Button displayScores;
        private Label numStudents;
        private Label numAssignments;
        private Label stNumLb;
        private Label asScoreLb;
        private Label asNumLb;
        private TextBox stCountInput;
        private TextBox asCountInput;
        private TextBox stNameInput;
        private TextBox asScoreInput;
        private TextBox asNumInput;
        private DataGridView scoreResults;
        private DataGridViewTextBoxColumn Student;
        private DataGridViewTextBoxColumn assignment1;
        private DataGridViewTextBoxColumn assignment2;
        private DataGridViewTextBoxColumn assignment3;
        private DataGridViewTextBoxColumn Assignment4;
        private DataGridViewTextBoxColumn assignment5;
        private DataGridViewTextBoxColumn averageScore;
        private DataGridViewTextBoxColumn grade;
        private Label stCntError;
        private Label asScoreError;
        private Label asCntError;
        private Label nameError;
        private Label label1;
        private Label asNumError;
    }
}