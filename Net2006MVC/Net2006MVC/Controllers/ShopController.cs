using Net2006MVC.Models.EF;
using Net2006MVC.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net2006MVC.Controllers
{
    public class ShopController : Controller
    {
        private QuanLyThuVienDevmasterEntities db = new QuanLyThuVienDevmasterEntities();

        // GET: Shop
        public ActionResult Index()
        {
            var vm = new IndexViewModel();
            vm.LatestProduct = db.BookTitle.Take(5).ToList();
            return View(vm);
        }
    }
}