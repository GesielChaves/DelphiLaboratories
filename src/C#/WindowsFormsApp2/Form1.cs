using System;
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
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var tcpClient = new TcpClient();

            tcpClient.Connect("localhost", 9090);

            if (tcpClient.Connected)
            {
                var networkStream = tcpClient.GetStream();
                var bytes = Encoding.ASCII.GetBytes("{ \"nome\": \"Gesiel\", \"status\": \"O host fulero\"}");
                networkStream.Write(bytes, 0, bytes.Length);

                tcpClient.Close();
            }
        }
    }
}
