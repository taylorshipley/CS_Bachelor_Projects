using System.Text.RegularExpressions;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;

namespace FirstApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBoxButtons buttons = MessageBoxButtons.OKCancel;
            string message1 = textBox1.Text;
            string title= "Your Message";
            DialogResult result1 = MessageBox.Show(message1,title,buttons, MessageBoxIcon.Warning);
            if (result1 == DialogResult.OK)
            {
                lbResult1.Text = "Ok button was pressed";
                result1 = DialogResult.None;
                }
            else if (result1 == DialogResult.Cancel)
            {
                lbResult1.Text = "Cancel button was pressed";
                result1 = DialogResult.None;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MessageBoxButtons buttons = MessageBoxButtons.OK;
            string userInput = textBox2.Text.ToLower();
            MessageBoxIcon icon = MessageBoxIcon.None;
            string message2;
            switch (userInput)
            {
                case "none":
                    icon = MessageBoxIcon.None;
                    message2 = "This a message box with the icon set to none";
                    break;
                case "hand":
                    icon= MessageBoxIcon.Hand;
                    message2 = "This is a Hand icon";
                    break;
                case "question":
                    icon= MessageBoxIcon.Question;
                    message2 = "This is a Question icon";
                    break;
                case "exclamation":
                    icon = MessageBoxIcon.Exclamation;
                    message2 = "This is an Exclamation icon";
                    break;
                case "asterisk":
                    icon = MessageBoxIcon.Asterisk;
                    message2 = "This is an Asterisk icon";
                    break;
                case "stop":
                    icon = MessageBoxIcon.Stop;
                    message2 = "This is a Stop icon";
                    break;
                case "error":
                    icon = MessageBoxIcon.Error;
                    message2 = "This is an Error icon";
                    break;
                case "warning":
                    icon = MessageBoxIcon.Warning;
                    message2 = "This is a Warning icon";
                    break;
                case "information":
                    icon = MessageBoxIcon.Information;
                    message2 = "This is an Information icon";
                    break;
                default: icon= MessageBoxIcon.None;
                    message2 = "Error: Entered icon type is not a valid answer. Try again.\n" +
                        "Icon types: None, Hand, Question, Exclamation, Asterisk, Stop, Error, Warning, Information";
                    break;
            }
            string title = "Types of MessageBox Icons";
            DialogResult result2 = MessageBox.Show(message2, title, buttons, icon);
            if (result2 == DialogResult.OK)
            {
               lbResult2.Text = "Ok button was pressed";
                result2 = DialogResult.None;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string message3;
            MessageBoxButtons buttons = MessageBoxButtons.OK;
            string userInput = textBox3.Text.ToLower();
            userInput= Regex.Replace(userInput, @" ", "");
            string title = "Types of MessageBox Buttons";

            switch (userInput)
            {
                case "ok":
                    message3 = "This is a MesssageBox with an OK button";
                    buttons = MessageBoxButtons.OK;
                    break;

                case "okandcancel":
                    message3 = "This is a MesssageBox with an OK Cancel buttons";
                    buttons = MessageBoxButtons.OKCancel;
                    break;

                case "abortretryandigonore":
                    message3 = "This is a MesssageBox with Abort, Retry, and Ignore buttons";
                    buttons = MessageBoxButtons.AbortRetryIgnore;
                    break;

                case "yesnoandcancel":
                    message3 = "This is a MesssageBox with Yes, No, and Cancel buttons";
                    buttons = MessageBoxButtons.YesNoCancel;
                    break;

                case "yesandno":
                    message3 = "This is a MesssageBox with a Yes and No buttons";
                    buttons = MessageBoxButtons.YesNo;
                    break;

                case "retryandcancel":
                    message3 = "This is a MesssageBox with Retry and Cancel Buttons";
                    buttons = MessageBoxButtons.RetryCancel;
                    break;
                default:
                    message3 = "Error: Entered icon type is not a valid answer. Try again.\n" +
                        "Button Types: OK, Ok and Cancel, Abort Retry and Ignore, Yes No and Cancel," +
                        " Yes and No, Retry and Cancel";
                    break;
            }

            DialogResult result3 = MessageBox.Show(message3, title, buttons, MessageBoxIcon.Information);

            if (result3 == DialogResult.OK)
            {
                lbResult3.Text = "Ok button was pressed";
                result3 = DialogResult.None;
            } else if (result3 == DialogResult.Cancel) 
            {
                lbResult3.Text = "Cancel button was pressed";
                result3 = DialogResult.None;
            } else if(result3 == DialogResult.Abort) 
            {
                lbResult3.Text = "Abort button was pressed";
                result3 = DialogResult.None;
            } else if (result3 == DialogResult.Retry)
            {
                lbResult3.Text = "Retry button was pressed";
                result3 = DialogResult.None;
            } else if (result3 == DialogResult.Ignore)
            {
                lbResult3.Text = "Ignore button was pressed";
                result3 = DialogResult.None;
            } else if (result3 == DialogResult.Yes)
            {
                lbResult3.Text = "Yes button was pressed";
                result3 = DialogResult.None;
            } else if (result3 == DialogResult.No)
            {
                lbResult3.Text = "No button was pressed";
                result3 = DialogResult.None;
            }

        }
    }
}