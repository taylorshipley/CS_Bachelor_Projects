using System.Drawing;

namespace CS3650_FinalProject
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.saveToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.openToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.saveAsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.saveToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.saveToolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.saveAsToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.feebackToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.sendFeedbackToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.interfaceSettingsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.highContrastToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.fontLable = new System.Windows.Forms.ToolStripLabel();
            this.fontStyleComboBox = new System.Windows.Forms.ToolStripComboBox();
            this.fontColorLable = new System.Windows.Forms.ToolStripButton();
            this.fontColorComboBox = new System.Windows.Forms.ToolStripComboBox();
            this.fontSizeLable = new System.Windows.Forms.ToolStripLabel();
            this.toolStripButton3 = new System.Windows.Forms.ToolStripTextBox();
            this.backgroundColorLable = new System.Windows.Forms.ToolStripLabel();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.getPromptButton = new System.Windows.Forms.ToolStripButton();
            this.bColorComboBox = new System.Windows.Forms.ToolStripComboBox();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.menuStrip1.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(32, 32);
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // menuStrip1
            // 
            this.menuStrip1.GripMargin = new System.Windows.Forms.Padding(2, 2, 0, 2);
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(32, 32);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1,
            this.saveToolStripMenuItem,
            this.feebackToolStripMenuItem,
            this.interfaceSettingsToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1543, 40);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.saveToolStripMenuItem1,
            this.openToolStripMenuItem,
            this.saveAsToolStripMenuItem});
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(71, 36);
            this.toolStripMenuItem1.Text = "File";
            // 
            // saveToolStripMenuItem1
            // 
            this.saveToolStripMenuItem1.Name = "saveToolStripMenuItem1";
            this.saveToolStripMenuItem1.Size = new System.Drawing.Size(206, 44);
            this.saveToolStripMenuItem1.Text = "New";
            this.saveToolStripMenuItem1.Click += new System.EventHandler(this.saveToolStripMenuItem1_Click);
            // 
            // openToolStripMenuItem
            // 
            this.openToolStripMenuItem.Name = "openToolStripMenuItem";
            this.openToolStripMenuItem.Size = new System.Drawing.Size(206, 44);
            this.openToolStripMenuItem.Text = "Open";
            this.openToolStripMenuItem.Click += new System.EventHandler(this.openToolStripMenuItem_Click);
            // 
            // saveAsToolStripMenuItem
            // 
            this.saveAsToolStripMenuItem.Name = "saveAsToolStripMenuItem";
            this.saveAsToolStripMenuItem.Size = new System.Drawing.Size(206, 44);
            this.saveAsToolStripMenuItem.Text = "Close";
            this.saveAsToolStripMenuItem.Click += new System.EventHandler(this.saveAsToolStripMenuItem_Click);
            // 
            // saveToolStripMenuItem
            // 
            this.saveToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.saveToolStripMenuItem2,
            this.saveAsToolStripMenuItem1});
            this.saveToolStripMenuItem.Name = "saveToolStripMenuItem";
            this.saveToolStripMenuItem.Size = new System.Drawing.Size(84, 36);
            this.saveToolStripMenuItem.Text = "Save";
            // 
            // saveToolStripMenuItem2
            // 
            this.saveToolStripMenuItem2.Name = "saveToolStripMenuItem2";
            this.saveToolStripMenuItem2.Size = new System.Drawing.Size(229, 44);
            this.saveToolStripMenuItem2.Text = "Save";
            this.saveToolStripMenuItem2.Click += new System.EventHandler(this.saveToolStripMenuItem2_Click);
            // 
            // saveAsToolStripMenuItem1
            // 
            this.saveAsToolStripMenuItem1.Name = "saveAsToolStripMenuItem1";
            this.saveAsToolStripMenuItem1.Size = new System.Drawing.Size(229, 44);
            this.saveAsToolStripMenuItem1.Text = "Save As";
            this.saveAsToolStripMenuItem1.Click += new System.EventHandler(this.saveAsToolStripMenuItem1_Click);
            // 
            // feebackToolStripMenuItem
            // 
            this.feebackToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.sendFeedbackToolStripMenuItem});
            this.feebackToolStripMenuItem.Name = "feebackToolStripMenuItem";
            this.feebackToolStripMenuItem.Size = new System.Drawing.Size(121, 36);
            this.feebackToolStripMenuItem.Text = "Feeback";
            // 
            // sendFeedbackToolStripMenuItem
            // 
            this.sendFeedbackToolStripMenuItem.Name = "sendFeedbackToolStripMenuItem";
            this.sendFeedbackToolStripMenuItem.Size = new System.Drawing.Size(309, 44);
            this.sendFeedbackToolStripMenuItem.Text = "Send Feedback";
            this.sendFeedbackToolStripMenuItem.Click += new System.EventHandler(this.sendFeedbackToolStripMenuItem_Click);
            // 
            // interfaceSettingsToolStripMenuItem
            // 
            this.interfaceSettingsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.highContrastToolStripMenuItem});
            this.interfaceSettingsToolStripMenuItem.Name = "interfaceSettingsToolStripMenuItem";
            this.interfaceSettingsToolStripMenuItem.Size = new System.Drawing.Size(220, 36);
            this.interfaceSettingsToolStripMenuItem.Text = "Interface Settings";
            // 
            // highContrastToolStripMenuItem
            // 
            this.highContrastToolStripMenuItem.Name = "highContrastToolStripMenuItem";
            this.highContrastToolStripMenuItem.Size = new System.Drawing.Size(364, 44);
            this.highContrastToolStripMenuItem.Text = "High Contrast Mode";
            this.highContrastToolStripMenuItem.Click += new System.EventHandler(this.highContrastMode);
            // 
            // toolStrip1
            // 
            this.toolStrip1.ImageScalingSize = new System.Drawing.Size(32, 32);
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fontLable,
            this.fontStyleComboBox,
            this.fontColorLable,
            this.fontColorComboBox,
            this.fontSizeLable,
            this.toolStripButton3,
            this.backgroundColorLable,
            this.toolStripSeparator1,
            this.getPromptButton,
            this.bColorComboBox});
            this.toolStrip1.Location = new System.Drawing.Point(0, 40);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(1543, 42);
            this.toolStrip1.TabIndex = 2;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // fontLable
            // 
            this.fontLable.BackColor = System.Drawing.SystemColors.Control;
            this.fontLable.Name = "fontLable";
            this.fontLable.Size = new System.Drawing.Size(120, 36);
            this.fontLable.Text = "Font Style";
            // 
            // fontStyleComboBox
            // 
            this.fontStyleComboBox.BackColor = System.Drawing.SystemColors.Window;
            this.fontStyleComboBox.Items.AddRange(new object[] {
            "Arial",
            "Calibri",
            "Comic Sans MS",
            "Tahoma",
            "Times New Roman"});
            this.fontStyleComboBox.Name = "fontStyleComboBox";
            this.fontStyleComboBox.Size = new System.Drawing.Size(211, 42);
            this.fontStyleComboBox.Text = "Tahoma";
            this.fontStyleComboBox.SelectedIndexChanged += new System.EventHandler(this.fontStyleChanged);
            // 
            // fontColorLable
            // 
            this.fontColorLable.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.fontColorLable.Image = ((System.Drawing.Image)(resources.GetObject("fontColorLable.Image")));
            this.fontColorLable.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.fontColorLable.Name = "fontColorLable";
            this.fontColorLable.Size = new System.Drawing.Size(130, 36);
            this.fontColorLable.Text = "Font Color";
            // 
            // fontColorComboBox
            // 
            this.fontColorComboBox.Items.AddRange(new object[] {
            "Black",
            "White",
            "Red",
            "Yellow",
            "Green",
            ""});
            this.fontColorComboBox.Name = "fontColorComboBox";
            this.fontColorComboBox.Size = new System.Drawing.Size(121, 42);
            this.fontColorComboBox.Text = "Black";
            this.fontColorComboBox.SelectedIndexChanged += new System.EventHandler(this.fontColorChange);
            // 
            // fontSizeLable
            // 
            this.fontSizeLable.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.fontSizeLable.Image = ((System.Drawing.Image)(resources.GetObject("fontSizeLable.Image")));
            this.fontSizeLable.ImageTransparentColor = System.Drawing.Color.LimeGreen;
            this.fontSizeLable.Name = "fontSizeLable";
            this.fontSizeLable.Size = new System.Drawing.Size(112, 36);
            this.fontSizeLable.Text = "Font Size";
            // 
            // toolStripButton3
            // 
            this.toolStripButton3.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.toolStripButton3.Name = "toolStripButton3";
            this.toolStripButton3.Size = new System.Drawing.Size(116, 42);
            this.toolStripButton3.Text = "12";
            this.toolStripButton3.Leave += new System.EventHandler(this.FontSizeChange);
            // 
            // backgroundColorLable
            // 
            this.backgroundColorLable.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.backgroundColorLable.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.backgroundColorLable.Name = "backgroundColorLable";
            this.backgroundColorLable.Size = new System.Drawing.Size(205, 36);
            this.backgroundColorLable.Text = "Background Color";
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 42);
            // 
            // getPromptButton
            // 
            this.getPromptButton.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right;
            this.getPromptButton.BackColor = System.Drawing.SystemColors.Info;
            this.getPromptButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.getPromptButton.Image = ((System.Drawing.Image)(resources.GetObject("getPromptButton.Image")));
            this.getPromptButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.getPromptButton.Name = "getPromptButton";
            this.getPromptButton.Size = new System.Drawing.Size(140, 36);
            this.getPromptButton.Text = "Get Prompt";
            this.getPromptButton.Click += new System.EventHandler(this.GetPrompt_Click);
            // 
            // bColorComboBox
            // 
            this.bColorComboBox.Items.AddRange(new object[] {
            "White",
            "Red",
            "Yellow",
            "Green",
            "Black",
            ""});
            this.bColorComboBox.Name = "bColorComboBox";
            this.bColorComboBox.Size = new System.Drawing.Size(121, 42);
            this.bColorComboBox.Text = "White";
            this.bColorComboBox.SelectedIndexChanged += new System.EventHandler(this.BackgroundColorChange);
            // 
            // richTextBox1
            // 
            this.richTextBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.richTextBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.richTextBox1.Location = new System.Drawing.Point(0, 82);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(1543, 976);
            this.richTextBox1.TabIndex = 3;
            this.richTextBox1.Text = "";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(12F, 25F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1543, 1058);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.menuStrip1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.SizableToolWindow;
            this.MainMenuStrip = this.menuStrip1;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Form1";
            this.Text = "Form1";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem openToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem saveToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem feebackToolStripMenuItem;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripComboBox fontStyleComboBox;
        private System.Windows.Forms.ToolStripButton fontColorLable;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripButton getPromptButton;
        private System.Windows.Forms.ToolStripMenuItem interfaceSettingsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem highContrastToolStripMenuItem;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.ToolStripLabel fontSizeLable;
        private System.Windows.Forms.ToolStripTextBox toolStripButton3;
        private System.Windows.Forms.ToolStripMenuItem saveToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem saveAsToolStripMenuItem;
        private System.Windows.Forms.ToolStripLabel backgroundColorLable;
        private System.Windows.Forms.ToolStripComboBox bColorComboBox;
        private System.Windows.Forms.ToolStripLabel fontLable;
        private System.Windows.Forms.ToolStripMenuItem saveToolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem saveAsToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem sendFeedbackToolStripMenuItem;
        private System.Windows.Forms.ToolStripComboBox fontColorComboBox;
    }
}

