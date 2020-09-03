using Net2006MVC.Models.EF;
using Net2006MVC.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net2006MVC.Controllers
{
    public class BaseController : Controller
    {
        private QuanLyThuVienDevmasterEntities db = new QuanLyThuVienDevmasterEntities();

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var temp = filterContext.RequestContext.HttpContext.Request;
            if(filterContext.RequestContext.HttpContext.Request.Cookies["test"] == null)
            {
                filterContext.RequestContext.HttpContext.Response.AppendCookie(new HttpCookie("test", "ahihi"));
            }
            bool unCheckAuthenMode = false;
            bool.TryParse(ConfigurationManager.AppSettings["UnCheckAuthentication"].ToString(), out unCheckAuthenMode);
            if (Session["Employee"] == null && !unCheckAuthenMode)
            {
                filterContext.Result = RedirectToAction("Index", "Authentication");
            }
            else
            {
                Employee emp = Session["Employee"] as Employee;
                string controllerName = filterContext.RequestContext.RouteData.Values["controller"].ToString();
                string actionName = filterContext.RequestContext.RouteData.Values["action"].ToString();
                string[] actionConverter = new string[] { "Index", "Details" };
                actionName = actionConverter.Contains(actionName) ? "View" : actionName;
                if (!Security.CheckPermission(controllerName, actionName, emp.Id))
                {
                    filterContext.Result = RedirectToAction("AccessDenied", "Authentication");
                }
            }
        }
    }
}