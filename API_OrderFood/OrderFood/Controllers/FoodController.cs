using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace OrderFood.Controllers
{
	public class FoodController : ApiController
	{
		[HttpGet]
		[Route("api/Foods/GetList")]
		public IHttpActionResult GetList(int categoryId)
		{
			try
			{
				using (var db = new OrderEntities())
				{
					var food = new List<Food>();

					food = db.Foods.Where(x => x.CategoryId == categoryId).ToList();

					var f = food.Select(s => new Food()
					{
						Id = s.Id,
						Name = s.Name,
						RestaurantId = s.RestaurantId,
						CategoryId = s.CategoryId,
						Price = s.Price,
						Image = s.Image
					});

					return Json(new
					{
						Message = "Success",
						Result = f,
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
						Result = new List<Food>(),
						Code = 400
					}
				);
			}

		}
		//Add 
		[HttpPost]
		[Route("api/Foods/Add")]
		public IHttpActionResult Add(int foodId)
		{
			try
			{
				using (var db = new OrderEntities())
				{
					var f = new Food();
					//Lay mon an co Id == id truyen vao trong bang Foods
					f = db.Foods.Where(x => x.Id == foodId).FirstOrDefault();

					//Lay mon an co FoodId = id truyen vao trong bang Orders
					var o = db.Orders.Where(x => x.FoodId == foodId).FirstOrDefault();

					//Kiem tra trong Orders da ton tai mon an co FoodId = id truyen vao chua
					if (o == null)//neu chua => them vao
					{
						var order = new Order();
						order.FoodId = f.Id;
						order.Name = f.Name;
						order.Qty = 1;
						order.Price = f.Price;
						order.Total = order.Price*order.Qty;
						
						db.Orders.Add(order);

					}
					else//neu ton tai thi tang so luong len 1
					{
						o.Qty++;
					}
					//var detail = new Detail();
					//detail.AccountId = f.Restaurant.Id;

					db.SaveChanges();

					var res = db.Restaurants.Where(x => x.Id == f.RestaurantId).FirstOrDefault();
					var r = new Restaurant()
					{
						Name = res.Name
					};

					return Json(new
					{
						Message = "Success",
						Result = r,
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
						Result = new List<Food>(),
						Code = 400
					}
				);
			}

		}//end Add
		

	}
}
