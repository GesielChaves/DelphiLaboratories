using Nancy;
[assembly: IncludeInNancyAssemblyScanning]

namespace WindowsFormsApp2
{
    public class HelloModule : NancyModule
    {
        public HelloModule()
        {
            Get["/"] = parameters => "Hello World";
        }
    }
}
