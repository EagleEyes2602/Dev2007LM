using Net2006MVC.Models.EF;
using Net2006MVC.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net2006MVC.Controllers
{
    public class HomeController : BaseController
    {
        private QuanLyThuVienDevmasterEntities db = new QuanLyThuVienDevmasterEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        public ActionResult TestAjax(int recordNumber)
        {
            List<Employee> emps = db.Employee.Take(recordNumber).ToList();
            List<EmployeeEntity> empLst = emps.Select(x =>
            {
                return new EmployeeEntity() { Id = x.Id, Code = x.Code, FirstName = x.FirstName, LastName = x.LastName };
            }).ToList();
            return Json(new { empLst }, JsonRequestBehavior.AllowGet);
        }
    }
}