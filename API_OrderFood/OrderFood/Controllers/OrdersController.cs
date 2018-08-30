using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace OrderFood.Controllers
{
	public class OrdersController : ApiController
	{
		//list selected
		[HttpGet]
		[Route("api/Orders/GetListSelected")]
		public IHttpActionResult GetListSelected()
		{
			try
			{
				using (var db = new OrderEntities())
				{
					var order = new List<Order>();

					order = db.Orders.ToList();

					var o = order.Select(s => new Order()
					{
						Id = s.Id,
						FoodId = s.FoodId,
						Name = s.Name,
						Qty = s.Qty,
						Price = s.Price,
						Total = s.Total,

					});

					return Json(new
					{
						Message = "Success",
						Result = o,
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

		}//end selected



		//Delete
		[HttpGet]
		[Route("api/Orders/Delete")]
		public IHttpActionResult Delete(int foodId)
		{
			try
			{
				using (var db = new OrderEntities())
				{
					//var order = new List<Order>();

					var order = db.Orders.Where(x => x.FoodId == foodId).SingleOrDefault();
					if (order != null)
					{
						db.Orders.Remove(order);
						db.SaveChanges();
					}
					
					return Json(new
					{
						Message = "Success",
						Result = "Delete success",
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

		}//end delete

		//Delete all
		[HttpGet]
		[Route("api/Orders/DeleteAll")]
		public IHttpActionResult DeleteAll()
		{
			try
			{
				using (var db = new OrderEntities())
				{
					var order = new List<Order>();
					order = db.Orders.ToList();

					if (order != null)
					{
						for (int i = 0; i < order.Count; i++)
						{
							db.Orders.Remove(order[i]);
						}
						db.SaveChanges();
					}
					return Json(new
					{
						Message = "Success",
						Result = "Delete success",
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

		}//end delete all

		[HttpGet]
		[Route("api/Orders/Info")]
		public IHttpActionResult Info()
		{
			try
			{
				using (var db = new OrderEntities())
				{
					//var order = new List<Order>();

					var session = db.Sessions.FirstOrDefault();
					var res = db.Restaurants.Where(x => x.Id == session.RestaurantId).FirstOrDefault();
					

					var r = new Restaurant()
					{
						Id = res.Id,
						Name = res.Name,
						Address = res.Address,
						Phone = res.Phone
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
						Result = "Error ^^",
						Code = 400
					}
				);
			}

		}//end 

		//Delete
		[HttpGet]
		[Route("api/Orders/Close")]
		public IHttpActionResult Close()
		{
			try
			{
				using (var db = new OrderEntities())
				{
					//var order = new List<Order>();

					var order = db.Orders.ToList();
					for (int i = 0; i < order.Count; i++)
					{
						db.Orders.Remove(order[i]);
					}
					var session = db.Sessions.FirstOrDefault();
					db.Sessions.Remove(session);
					for (int i = 0; i < order.Count; i++)
					{
						db.Orders.Remove(order[i]);
					}

					db.SaveChanges();

					return Json(new
					{
						Message = "Success",
						Result = "Close success",
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

		}//end delete

		//[HttpGet]
		//[Route("api/Orders/Test")]
		//public IHttpActionResult Test()
		//{
		//	try
		//	{
		//		using (var db = new OrderEntities())
		//		{
		//			//var order = new List<Order>();

		//			var order = db.Orders.ToList();
		//			var or = new Order();
		//			


		//			return Json(new
		//			{
		//				Message = "Success",
		//				Result = or,
		//				Code = 200
		//			});


		//		}
		//	}
		//	catch (Exception ex)
		//	{
		//		return Json(
		//			new
		//			{
		//				Message = ex.Message,
		//				Result = "Error ^^",
		//				Code = 400
		//			}
		//		);
		//	}

		//}//end 
	}

}
