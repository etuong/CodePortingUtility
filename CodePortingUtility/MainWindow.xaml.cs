using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Input;


namespace CodePortingUtility
{
	/// <summary>
	/// Interaction logic for MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{
		Dictionary<string, string> myDictionary;

		public MainWindow()
		{
			InitializeComponent();			
		}

		private void browseBtn_Click(object sender, RoutedEventArgs e)
		{
			// Using disposes the dialog after it's done
			using (var fbd = new System.Windows.Forms.OpenFileDialog())
			{
				System.Windows.Forms.DialogResult result = fbd.ShowDialog();

				if (!string.IsNullOrWhiteSpace(fbd.FileName) && result == System.Windows.Forms.DialogResult.OK)
					pathTextBox.Text = fbd.FileName;
			}
		}

        private void bCompBtn_Click(object sender, RoutedEventArgs e)
        {
            // Using disposes the dialog after it's done
            using (var fbd = new System.Windows.Forms.OpenFileDialog())
            {
                System.Windows.Forms.DialogResult result = fbd.ShowDialog();

                if (!string.IsNullOrWhiteSpace(fbd.FileName) && result == System.Windows.Forms.DialogResult.OK)
                    bCompTextBox.Text = fbd.FileName;
            }
        }

        private void jsonBtn_Click(object sender, RoutedEventArgs e)
        {
            // Using disposes the dialog after it's done
            using (var fbd = new System.Windows.Forms.OpenFileDialog())
            {
                System.Windows.Forms.DialogResult result = fbd.ShowDialog();

                if (!string.IsNullOrWhiteSpace(fbd.FileName) && result == System.Windows.Forms.DialogResult.OK)
                    jsonTextBox.Text = fbd.FileName;
            }
        }

        private void runBtn_Click(object sender, RoutedEventArgs e)
		{
            // Create dictionary
            if (!CreateDictionary())
                return;

            // Temporary files for comparison
            string tempFileBeforePath = string.Empty;
            string tempFileAfterPath = string.Empty;

            if ((bool)fileRadioBtn.IsChecked)
            {
                string fi = pathTextBox.Text;

                // Check that the directory exists
                if (!File.Exists(fi))
                {
                    MessageBox.Show("File does not exist!", "Error!");
                    return;
                }

                // Confirm with the user before continuing
                MessageBoxResult result = MessageBox.Show("Running the utility will overwrite your files, do you want to continue?", "Warning", MessageBoxButton.YesNo);
                if (result == MessageBoxResult.No)
                    return;

                // Read in file
                string oldText = string.Empty;
                using (StreamReader sreader = new StreamReader(fi))
                {
                    oldText = sreader.ReadToEnd();
                    sreader.Close();
                }

                // Make a copy for comparison later
                tempFileBeforePath = GetRandomFilePath();
                File.Copy(fi, tempFileBeforePath);

                // Delete file
                File.SetAttributes(fi, FileAttributes.Normal);
                File.Delete(fi);

                // Insert header to file and write back file
                WriteFile(fi, ReplaceString(oldText));

                // Make a copy of the next text
                tempFileAfterPath = GetRandomFilePath();
                File.Copy(fi, tempFileAfterPath);

            }
            else if ((bool)boxRadioBtn.IsChecked)
            {
                string oldText = txtBox.Text;

                // Create a new temporary file for old text
                tempFileBeforePath = GetRandomFilePath();
                WriteFile(tempFileBeforePath, oldText);

                string newText = ReplaceString(oldText);

                // Create a new temporary file for new text
                tempFileAfterPath = GetRandomFilePath();
                WriteFile(tempFileAfterPath, newText);

                txtBox.Text = newText;
            }
            else
            {
                MessageBox.Show("Please select a radio button!", "ERROR");
                return;
            }

            MessageBox.Show("DONE!", "SUCCESS", MessageBoxButton.OK);

            // Open Beyond Compare
            if (File.Exists(bCompTextBox.Text))
                System.Diagnostics.Process.Start(bCompTextBox.Text, string.Format("{0} {1}", tempFileBeforePath , tempFileAfterPath));
        }

        private string GetRandomFilePath()
        {
            return Path.Combine(Path.GetTempPath(), Path.GetRandomFileName());
        }

        private void WriteFile(string filePath, string text)
        {
            using (StreamWriter sw = new StreamWriter(filePath, true, Encoding.UTF8))
            {
                sw.Write(text);
                sw.Close();
            }
        }

        private string ReplaceString(string oldText)
        {
            return myDictionary.Aggregate(oldText, (str, mapping) => str.Replace(mapping.Key, mapping.Value));
        }

        private bool CreateDictionary()
		{
            if (!File.Exists(@jsonTextBox.Text))
            {
                MessageBox.Show("JSON file does not exist!", "ERROR");
                return false;
            }

            myDictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(File.ReadAllText(@jsonTextBox.Text));

            return true;
        }
    }
}
