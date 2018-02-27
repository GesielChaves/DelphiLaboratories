using System;
using System.Drawing;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            textBox1.Text = @"{ ""action"": ""somar"", ""parameters"": [1,2]  }";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var webRequest = HttpWebRequest.Create("http://localhost:9090");

            webRequest.ContentType = "application/json";
            webRequest.Method = "POST";
            var bytes = Encoding.ASCII.GetBytes(textBox1.Text);
            webRequest.ContentLength = bytes.Length;

            using (var stream = webRequest.GetRequestStream())
                stream.Write(bytes, 0, bytes.Length);

            webRequest.GetResponse();
        }
    }
}
