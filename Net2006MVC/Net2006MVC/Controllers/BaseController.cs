﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net2006MVC.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            bool unCheckAuthenMode = false;
            bool.TryParse(ConfigurationManager.AppSettings["UnCheckAuthentication"].ToString(), out unCheckAuthenMode);
            if (Session["Employee"] == null && !unCheckAuthenMode)
            {
                filterContext.Result = RedirectToAction("Index", "Authentication");
            }
        }
    }
}