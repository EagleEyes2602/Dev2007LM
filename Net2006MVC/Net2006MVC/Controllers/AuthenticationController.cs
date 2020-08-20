using Net2006MVC.Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net2006MVC.Controllers
{
    public class AuthenticationController : Controller
    {
        private QuanLyThuVienDevmasterEntities db = new QuanLyThuVienDevmasterEntities();
        // GET: Authentication
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index([Bind(Include = "Email, Password")] Employee employee)
        {
            if (ModelState.IsValid)
            {
                Employee emp = db.Employee.Where(x => x.Email == employee.Email && x.Password == employee.Password).FirstOrDefault();
                if (emp != null)
                {
                    Session["Employee"] = emp;
                    RedirectToAction("Index", "Home");
                }
            }
            ViewBag.Message = "Email hoặc password không khớp !!!";
            return View();
        }
    }
}