using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using Microsoft.Owin.Cors;

[assembly: OwinStartup(typeof(OrderFood.Startup1))]

namespace OrderFood
{
	public class Startup1
	{
		public void Configuration(IAppBuilder app)
		{
			app.UseCors(CorsOptions.AllowAll);
			//ConfigureAuth(app);
		}
	}
}
