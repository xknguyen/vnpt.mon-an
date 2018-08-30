﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace OrderFood
{
	public static class WebApiConfig
	{
		public static void Register(HttpConfiguration config)
		{
			// Web API configuration and services

			// Web API routes
			config.MapHttpAttributeRoutes();
			//config.EnableCors();

			config.Routes.MapHttpRoute(
				name: "DefaultApi",
				routeTemplate: "api/{controller}/{id}&{id2}",
				defaults: new { id = RouteParameter.Optional, id2 = RouteParameter.Optional}
			);
		}
	}
}
