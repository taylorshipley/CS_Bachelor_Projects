using System.Diagnostics;

namespace Assignment3
{
    /// <summary>
    /// The class Scores represents a form for the user to enter student count and assignment count and display scores for each student for each assignment.
    /// </summary>
    public partial class Scores : Form
    {
        /// <summary>
        /// The variable stCount stores the number of students.
        /// </summary>
        static int stCount = 0;

        /// <summary>
        /// The variable asCount stores the number of assignments.
        /// </summary>
        static int asCount = 0;

        /// <summary>
        /// The variable indexNum stores the index of the current student.
        /// </summary>
        static int indexNum;

        /// <summary>
        /// The variable asNum stores the assigment number that will have it's score updated.
        /// </summary>
        static int asNum;

        /// <summary>
        /// The variable asScore stores  the updated score for the assigment.
        /// </summary>
        static int asScore;

        /// <summary>
        /// The array stArr stores the names of the students.
        /// </summary>
        static string[] stArr;



        /// <summary>
        /// The array asScoreArr stores the scores for each student for each assignment.
        /// </summary>
        static int[,] asScoreArr;

        /// <summary>
        /// The constructor initializes the form's components.
        /// </summary>
        public Scores()
        {
            InitializeComponent();
        }

        /// <summary>
        /// The event handler resetScores_Click restarts the application when the "Reset Scores" button is clicked.
        /// </summary>
        /// <param name="sender">The object that raised the event.</param>
        /// <param name="e">The event arguments.</param>
        private void resetScores_Click(object sender, EventArgs e)
        {
            Application.Restart();
        }

        /// <summary>
        /// The event handler submitCounts_Click handles the submission of the student count and assignment count and enables other form components when the "Submit Counts" button is clicked.
        /// </summary>
        /// <param name="sender">The object that raised the event.</param>
        /// <param name="e">The event arguments.</param>
        private void submitCounts_Click(object sender, EventArgs e)
        {
            bool stError = false;
            bool asError = false;

            // Try parsing the student count
            if (int.TryParse(stCountInput.Text, out int stCountRaw))
            {
                // Check if the student count is within the expected range
                if (stCountRaw < 1 || stCountRaw > 10)
                {
                    stCntError.Visible = true;
                    stError = true;
                }
                else
                {
                    stCount = stCountRaw;
                    stCntError.Visible = false;
                    stError = false;
                }
            }
            else
            {
                stCntError.Visible = true;
                stError = false;
            }

            // Try parsing the assignment count
            if (int.TryParse(asCountInput.Text, out int asCountRaw))
            {
                // Check if the assignment count is within the expected range
                if (asCountRaw < 1 || asCountRaw > 99)
                {
                    asCntError.Visible = true;
                    asError = true;
                }
                else { asCount = asCountRaw; asCntError.Visible = false; asError = false; }
            }
            else { asCntError.Visible = true; asError = true; }

            // If both the student count and assignment count are valid, update the other controls
            if (!stError && !asError)
            {
                asNumLb.Text = "Enter Assignment Number (1-" + asCount + "):";
                createArrs(stCount, asCount);
                stCountInput.Enabled = false;
                asCountInput.Enabled = false;
                submitCounts.Enabled = false;
                firstStudent.Enabled = true;
                prevStudent.Enabled = true;
                nextStudent.Enabled = true;
                lastStudent.Enabled = true;
                stNameInput.Enabled = true;
                saveName.Enabled = true;
                asNumInput.Enabled = true;
                asScoreInput.Enabled = true;
                saveScore.Enabled = true;
                displayScores.Enabled = true;
            }
        }
        /// <summary>
        /// This method creates arrays for student names and assignment scores
        /// </summary>
        /// <param name="stCount">Number of students</param>
        /// <param name="asCount">Number of assignments</param>
        private void createArrs(int stCount, int asCount)
        {
            // Initialize student name array with a default value for each student
            stArr = new String[stCount];
            for (int i = 0; i < stCount; i++)
            {
                int stNum = i + 1;
                stArr[i] = "Student #" + stNum.ToString();
            }

            // Initialize assignment score array with 0 for each assignment
            asScoreArr = new int[stCount, asCount];
            for (int i = 0; i < stCount; i++)
            {
                for (int j = 0; j < asCount; j++)
                {
                    asScoreArr[i, j] = 0;
                }
            }
        }
        /// <summary>
        /// This method updates the display of the currently selected student to the first student in the `stArr` array.
        /// </summary>
        /// <param name="sender">The object that raised the event</param>
        /// <param name="e">The EventArgs for the event</param>
        private void firstStudent_Click(object sender, EventArgs e)
        {
            indexNum = 0;
            stNumLb.Text = stArr[indexNum].ToString();
        }

        /// <summary>
        /// This method updates the display of the currently selected student to the previous student in the `stArr` array.
        /// </summary>
        /// <param name="sender">The object that raised the event</param>
        /// <param name="e">The EventArgs for the event</param>
        private void prevStudent_Click(object sender, EventArgs e)
        {
            if (indexNum != 0)
            {
                indexNum--;
                stNumLb.Text = stArr[indexNum].ToString();
            }
        }
        /// <summary>
        /// Event handler for the "Next Student" button. Updates the index number and displays the next student's name.
        /// </summary>
        /// <param name="sender">The object that raised the event</param>
        /// <param name="e">Event data</param>
        private void nextStudent_Click(object sender, EventArgs e)
        {
            if (indexNum != stArr.Length - 1)
            {
                indexNum++;
                stNumLb.Text = stArr[indexNum].ToString();
            }
        }

        /// <summary>
        /// Event handler for the "Last Student" button. Sets the index number to the last student and displays their name.
        /// </summary>
        /// <param name="sender">The object that raised the event</param>
        /// <param name="e">Event data</param>
        private void lastStudent_Click(object sender, EventArgs e)
        {
            indexNum = stArr.Length - 1;
            stNumLb.Text = stArr[indexNum].ToString();
        }

        /// <summary>
        /// Handles the event when the "Save Name" button is clicked.
        /// </summary>
        /// <param name="sender">The object that raised the event.</param>
        /// <param name="e">The event arguments.</param>
        private void saveName_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(stNameInput.Text))
            {
                nameError.Visible = true;
            }
            else
            {
                stArr[indexNum] = stNameInput.Text;
                stNumLb.Text = stArr[indexNum].ToString();
                stNameInput.Clear();
                nameError.Visible = false;
            }
        }

        /// <summary>
        /// Save the entered score for a student.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        private void saveScore_Click(object sender, EventArgs e)
        {
            Boolean asNumValid = false;
            // Attempt to parse the entered assignment number
            if (int.TryParse(asNumInput.Text, out int asNumRaw))
            {

                // Check if the assignment number is within the expected range
                if (asNumRaw < 1 || asNumRaw > asCount)
                {
                    // Show error message for assignment number out of range
                    asNumError.Visible = true;
                }
                else
                {
                    // Set the assignment number to the parsed value and hide the error message
                    asNumValid = true;
                    asNum = asNumRaw;
                    asNumError.Visible = false;
                }
            }
            else
            {
                // Show error message for invalid assignment number
                asNumError.Visible = true;
            }
            // Attempt to parse the entered score
            if (int.TryParse(asScoreInput.Text, out int asScoreRaw))
            {
                // Check if the score is within the expected range
                if (asScoreRaw < 0 || asScoreRaw > 100)
                {
                    // Show error message for score out of range
                    asScoreError.Visible = true;
                }
                else
                {
                    // Hides error message for invalid score
                    asScoreError.Visible = false;

                    if (asNumValid)
                    {
                        // Set the score to the parsed value
                        asScore = asScoreRaw;
                        // Save the score for the student and assignment
                        asScoreArr[indexNum, asNum - 1] = asScore;
                        asNumInput.Clear();
                        asScoreInput.Clear();
                    }
                }
            }
            else
            {
                // Show error message for invalid score
                asScoreError.Visible = true;
            }

        }

        /// <summary>
        /// Handles the click event of the `displayScores` button. Populates the `scoreResults` DataGridView with
        /// the student names, scores, and average scores, along with their respective letter grades.
        /// </summary>
        /// <param name="sender">The button that raised the event</param>
        /// <param name="e">Event arguments</param>
        private void displayScores_Click(object sender, EventArgs e)
        {

            // Clears any existing data
            scoreResults.Columns.Clear();
            scoreResults.Rows.Clear();
            
            // Sets the number of columns and rows
            scoreResults.ColumnCount = asCount + 3;
            scoreResults.RowCount = stCount;

            // Adds the text for the header
            scoreResults.Columns[0].HeaderText = "Student";
            for (int i = 1; i < asCount + 1; i++)
            {
                scoreResults.Columns[i].HeaderText = "#" + i.ToString();
            }
            scoreResults.Columns[asCount + 1].HeaderText = "AVG";
            scoreResults.Columns[asCount + 2].HeaderText = "Grade";


            for (int i = 0; i < stCount; i++)
            {
                double totalScore = 0;

                // Adds student name from student name array to datasheet
                scoreResults.Rows[i].Cells[0].Value = stArr[i];
                // Adds scores to from assignment score array to datasheet
                for (int j = 1; j < asCount + 1; j++)
                {
                    scoreResults.Rows[i].Cells[j].Value = asScoreArr[i, j-1];
                    totalScore += asScoreArr[i, j-1];
                }
                // Calculates average score and letter grade then adds them to datasheet
                double avgScore = (totalScore / asCount);
                double avgScore2 = Math.Round(avgScore, 2);
                scoreResults.Rows[i].Cells[asCount + 1].Value = avgScore2;
                scoreResults.Rows[i].Cells[asCount + 2].Value = letterGrade(avgScore2);
            }
        }


        /// <summary>
        /// Calculates the letter grade based on the average score.
        /// </summary>
        /// <param name="avgScore2">The average score as a double.</param>
        /// <returns>The letter grade as a string.</returns>
        private string letterGrade(double avgScore2)
        {
            string grade;

            if (avgScore2 >= 93)
            {
                grade = "A";
            }
            else if (avgScore2 >= 90)
            {
                grade = "A-";
            }
            else if (avgScore2 >= 87)
            {
                grade = "B+";
            }
            else if (avgScore2 >= 83)
            {
                grade = "B";
            }
            else if (avgScore2 >= 80)
            {
                grade = "B-";
            }
            else if (avgScore2 >= 77)
            {
                grade = "C+";
            }
            else if (avgScore2 >= 73)
            {
                grade = "C";
            }
            else if (avgScore2 >= 70)
            {
                grade = "C-";
            }
            else if (avgScore2 >= 67)
            {
                grade = "D+";
            }
            else if (avgScore2 >= 63)
            {
                grade = "D";
            }
            else if (avgScore2 >= 60)
            {
                grade = "D-";
            }
            else
            {
                grade = "E";
            }

            return grade;
        }

    }
}