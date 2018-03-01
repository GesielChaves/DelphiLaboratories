using System.Windows.Forms;
using WebSocketSharp;
using WebSocketSharp.Server;

namespace WindowsFormsApp2
{
    public class RequisicaoSocket : WebSocketBehavior
    {
        protected override void OnMessage(MessageEventArgs e) => Send(ReceberMensagem(e.Data));

        public string ReceberMensagem(string messagem)
        {
            MessageBox.Show(messagem);
            return "Ok";
        }
    }
}
