using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace OrderFood.Controllers
{
	public class CategoriesController : ApiController
	{
		[HttpGet]
		[Route("api/Categories/GetList")]
		public IHttpActionResult GetList(int restaurantId)
		{
			try
			{
				using (var db = new OrderEntities())
				{
					//add res to ss
					var res = db.Restaurants.Where(x => x.Id == restaurantId).FirstOrDefault();
					if (db.Sessions.Count() == 0)
					{
						var ss = new Session();
						ss.RestaurantId = res.Id;
						ss.Date = DateTime.Now;
						ss.Status = false;
						db.Sessions.Add(ss);
						db.SaveChanges();
					}
					//Get cate
					var se = db.Sessions.FirstOrDefault();
					var categories = new List<Category>();

					categories = db.Categories.Where(x => x.RestaurantId == se.RestaurantId).ToList();

					var cate = categories.Select(s => new Category()
					{
						Id = s.Id,
						Name = s.Name,
						RestaurantId = s.RestaurantId,
						Icon = s.Icon
					});
					
					


					return Json(new
					{
						Message = "Success",
						Result = cate,
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
						Result = new List<Category>(),
						Code = 400
					}
				);
			}

		}


	}
}
