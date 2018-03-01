using System;
using System.Net;
using System.Text;
using System.Windows.Forms;
using WebSocketSharp.Server;

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
            var webRequest = WebRequest.Create("http://localhost:9090");

            webRequest.ContentType = "application/json";
            webRequest.Method = "POST";
            var bytes = Encoding.ASCII.GetBytes(textBox1.Text);
            webRequest.ContentLength = bytes.Length;

            using (var stream = webRequest.GetRequestStream())
                stream.Write(bytes, 0, bytes.Length);

            webRequest.GetResponse();
        }

        private void Button2_Click(object sender, EventArgs e) => IniciarSocket();

        private static void IniciarSocket()
        {
            try
            {
                var webSocket = new WebSocketServer($"ws://localhost:8190");
                webSocket.AddWebSocketService("/", () => new RequisicaoSocket());
                webSocket.Start();
                MessageBox.Show("Socket iniciado com sucesso.");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Falha ao iniciar socket: {ex.Message}");
            }
        }
    }
}
