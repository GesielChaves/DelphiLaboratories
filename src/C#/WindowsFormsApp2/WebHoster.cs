using System;
using Nancy.Hosting.Self;

namespace WindowsFormsApp2
{
    public sealed class WebHoster
    {
        public static void Start()
        {
            var host = new NancyHost(new Uri("http://localhost:1234"));
            host.Start();
        }
    }
}