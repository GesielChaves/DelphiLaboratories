using System;
using System.Drawing;
using System.Net.Sockets;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class Form1 : Form
    {
        private TcpClient _tcpClient;

        public Form1() => InitializeComponent();

        private void button1_Click(object sender, EventArgs e)
        {
            if (!_tcpClient.Connected) return;

            var bytes = Encoding.ASCII.GetBytes(textBox1.Text);
            using (var networkStream = _tcpClient.GetStream())
                networkStream.Write(bytes, 0, bytes.Length);
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                _tcpClient = new TcpClient("localhost", 9090);
                checkBox1.ForeColor = Color.Green;
                checkBox1.Text = "Conectado";
            }
            else
            {
                _tcpClient.Close();
                checkBox1.ForeColor = Color.Red;
                checkBox1.Text = "Desconectado";
            }
        }
    }
}
