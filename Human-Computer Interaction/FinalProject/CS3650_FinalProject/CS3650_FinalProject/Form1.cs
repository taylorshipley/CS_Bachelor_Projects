using Microsoft.Win32;
using System;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;

namespace CS3650_FinalProject
{

    public partial class Form1 : Form
    {
        Boolean highContrastOff = true;
        private string filePath;
        public Form1()
        {
            InitializeComponent();
        }

        private void BackgroundColorChange(object sender, EventArgs e)
        {
            Color c = Color.White;
            if (bColorComboBox.Text.Equals("White"))
            {
                c = Color.White;
            }
            if (bColorComboBox.Text.Equals("Red"))
            {
                c = Color.Red;
            }
            if (bColorComboBox.Text.Equals("Yellow"))
            {
                c = Color.Yellow;
            }
            if (bColorComboBox.Text.Equals("Green"))
            {
                c = Color.Green;
            }
            if (bColorComboBox.Text.Equals("Black"))
            {
                c = Color.Black;
            }
            richTextBox1.BackColor = c;
        }

        private void FontSizeChange(object sender, EventArgs e)
        {
            Font currentFont = richTextBox1.SelectionFont; 
            FontStyle newFontStyle = currentFont.Style;
            richTextBox1.SelectionFont = new Font(currentFont.FontFamily, float.Parse(toolStripButton3.Text), newFontStyle);
        }

        private void fontColorChange(object sender, EventArgs e)
        {
            Color c = Color.Black;
            if (fontColorComboBox.Text.Equals("White"))
            {
                c = Color.White;
            }
            if (fontColorComboBox.Text.Equals("Red"))
            {
                c = Color.Red;
            }
            if (fontColorComboBox.Text.Equals("Yellow"))
            {
                c = Color.Yellow;
            }
            if (fontColorComboBox.Text.Equals("Green"))
            {
                c = Color.Green;
            }
            if (fontColorComboBox.Text.Equals("Black"))
            {
                c = Color.Black;
            }
            richTextBox1.SelectionColor = c;
        }

        private void fontStyleChanged(object sender, EventArgs e)
        {
            try
            {
                Font currentFont = richTextBox1.SelectionFont;
                FontStyle fontStyle = currentFont.Style;
                float currentfontSize = float.Parse(toolStripButton3.Text);
                richTextBox1.SelectionFont = new Font(fontStyleComboBox.Text, currentfontSize, fontStyle);
            }
            catch (Exception ex)
            {
                Console.WriteLine("{0} Exception caught.", ex);
            }
           
        }

        private void highContrastMode(object sender, EventArgs e)
        {
            
            if (highContrastOff)
            {
                richTextBox1.SelectAll();
                richTextBox1.BackColor = Color.Black;
                richTextBox1.SelectionColor = Color.White;
                Font currentFont = richTextBox1.SelectionFont;
                FontStyle fontStyle = currentFont.Style;
                float fontSize = 15;
                richTextBox1.SelectionFont = new Font("Arial", fontSize, fontStyle);
                highContrastOff = false;
            }
            else
            {
                richTextBox1.SelectAll();
                richTextBox1.BackColor = Color.White;
                richTextBox1.SelectionColor = Color.Black;
                Font currentFont = richTextBox1.SelectionFont;
                FontStyle fontStyle = currentFont.Style;
                float fontSize = 12;
                richTextBox1.SelectionFont = new Font("Tahoma", fontSize, fontStyle);
                highContrastOff = true;
            }
        }
        //Creates new file and loads it in
        private void saveToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            //Have user create new txt file and load it
        }
        //Opens file
        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            filePath = SelectFile();
            //Path of selected file
            if (File.Exists(filePath))
            {
                
                richTextBox1.Text = File.ReadAllText(filePath);
            }
            else 
            {
                //File doesn't exist
            }
        }
        //Call this function to use file explorer
        private string SelectFile()
        {
            var dlg = new System.Windows.Forms.OpenFileDialog()
            {
                InitialDirectory = "C://",
                Filter = "Text Files (All Files (*.*) | *.*)",
                RestoreDirectory = true
            };
            //User didn't select a file so return a default value
            if (dlg.ShowDialog() != DialogResult.OK)
                return "";
            //Return the file the user selected
            return dlg.FileName;
        }
        //Closes file
        private void saveAsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string message = "Unsaved changes will be lost. Are you sure you want to close?";
            string title = "Close Window";
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result = MessageBox.Show(message, title, buttons, MessageBoxIcon.Warning);
            if (result == DialogResult.Yes)
            {
                this.Close();
            }
            
        }
        //Saves file
        private void saveToolStripMenuItem2_Click(object sender, EventArgs e)
        {
            saveText(richTextBox1.Text);
        }
        private void saveText(string text) 
        {
            if (File.Exists(filePath))
            {
                File.WriteAllText(filePath, text);
            }
            else 
            {
                //File doesn't exist
            }
        }
        //Saves File as
        private void saveAsToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            // Displays a SaveFileDialog so the user can save the Image
            // assigned to Button2.
            System.Windows.Forms.SaveFileDialog saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            saveFileDialog1.Filter = "Text Files (*.txt) | *.txt";
            saveFileDialog1.Title = "Save a Text File";
            saveFileDialog1.ShowDialog();

            // If the file name is not an empty string open it for saving.
            
                // Saves the Image via a FileStream created by the OpenFile method.
            System.IO.FileStream fs =
            (System.IO.FileStream)saveFileDialog1.OpenFile();
            fs.Close();
            filePath= Path.GetFullPath(saveFileDialog1.FileName);
            saveText(richTextBox1.Text);
        }

        //Send Feedback
        private void sendFeedbackToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form2 secondForm = new Form2();
            secondForm.ShowDialog();
        }

        private void GetPrompt_Click(object sender, EventArgs e)
        {
            Random rnd = new Random();
            int rndNumber = rnd.Next(1, 5);
            String promptMessage="";
            switch(rndNumber)
            {
                case 1:
                    promptMessage = "What do I know to be true that I didn’t know a year ago?";
                    break;
                case 2:
                    promptMessage = "What distractions get in the way of being my most productive?";
                    break;
                case 3:
                    promptMessage = "When do I feel most in tune with myself?";
                    break;
                case 4:
                    promptMessage = "If someone described me, what would they say?";
                    break;
                case 5:
                    promptMessage = "What can wait until next week?";
                    break;
            }
            string message = promptMessage;
            string title = "Jounal Prompt";
            MessageBoxButtons buttons = MessageBoxButtons.OK;
            DialogResult result = MessageBox.Show(message, title, buttons, MessageBoxIcon.Question);
        }
    }
}
