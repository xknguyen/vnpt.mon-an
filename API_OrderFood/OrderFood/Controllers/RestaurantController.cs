
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace OrderFood.Controllers
{
	public class RestaurantController : ApiController
	{
		[HttpGet]
		[Route("api/Restaurant/GetList")]
		public IHttpActionResult GetList()
		{
			try
			{
				using (var db = new OrderEntities())
				{

					var restaurant = new List<Restaurant>();
					//Nếu ss khác 0
					if (db.Sessions.Count() == 0)
					{
						restaurant = db.Restaurants.ToList();

						var re = restaurant.Select(s => new Restaurant()
						{
							Id = s.Id,
							Name = s.Name,
							Address = s.Address,
							Phone = s.Phone,
							Image = s.Image
						});

						return Json(new
						{
							Message = "Success",
							Result = re,
							Code = 200
						});
					}
					else//Nếu khác 0
					{
						var ss = db.Sessions.FirstOrDefault();
						restaurant = db.Restaurants.Where( r => r.Id == ss.RestaurantId).ToList();

						var re = restaurant.Select(s => new Restaurant()
						{
							Id = s.Id,
							Name = s.Name,
							Address = s.Address,
							Phone = s.Phone,
							Image = s.Image
						});

						return Json(new
						{
							Message = "Success",
							Result = re,
							Code = 200
						});
					}

				}
			}
			catch (Exception ex)
			{
				return Json(
					new
					{
						Message = ex.Message,
						Result = new List<Restaurant>(),
						Code = 400
					}
				);
			}

		}
	}
}
