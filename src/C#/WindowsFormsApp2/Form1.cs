using System;
using System.IO;
using System.Net;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class Form1 : Form
    {
        public Form1(string[] args)
        {
            InitializeComponent();
            textBox1.Text = string.Join(",",args);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var webRequest = WebRequest.Create("http://localhost:9090");

            webRequest.ContentType = "application/json";
            webRequest.Method = "POST";
            var bytes = Encoding.ASCII.GetBytes(textBox1.Text);
            webRequest.ContentLength = bytes.Length;

            using (var stream = webRequest.GetRequestStream())
                stream.Write(bytes, 0, bytes.Length);

            var response = webRequest.GetResponse();

            using (var sr = new StreamReader(response.GetResponseStream()))
                textBox1.Text = sr.ReadToEnd();
        }

        private void Button2_Click(object sender, EventArgs e) => IniciarSocket();

        private static void IniciarSocket()
        {
            try
            {
                WebHoster.Start();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Falha ao iniciar socket: {ex.Message}");
            }
        }
    }
}
