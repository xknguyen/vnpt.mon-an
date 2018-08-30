using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace OrderFood.Controllers
{
    public class AccountsController : ApiController
    {
		[HttpPost]
		[Route("api/Accounts/Login")]
		public IHttpActionResult Login(string username, string password)
		{
			try
			{
				using (var db = new OrderEntities())
				{
					//var order = new List<Order>();

					var account = db.Accounts.Where(x => x.Username == username && x.Password == password).FirstOrDefault();

					//var a=HttpContext.Current.Session["Id"] ="123456" ;

					var acc = new Account();
					{
						acc.Username = account.Username;
						acc.Password = account.Password;
					};

					return Json(new
					{
						Message = "Login Success",
						Result = acc,
						Code = 200
					});
				}
			}
			catch (Exception ex)
			{
				return Json(
					new
					{
						Message = ex.Message,
						Result = "Error ^^",
						Code = 400
					}
				);
			}

		}//end login
	}
}
