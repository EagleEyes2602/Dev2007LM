using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Net2006MVC.Models.EF;

namespace Net2006MVC.Controllers
{
    public class ReleasersController : Controller
    {
        private QuanLyThuVienDevmasterEntities db = new QuanLyThuVienDevmasterEntities();

        // GET: Releasers
        public ActionResult Index()
        {
            return View(db.Releaser.ToList());
        }

        // GET: Releasers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Releaser releaser = db.Releaser.Find(id);
            if (releaser == null)
            {
                return HttpNotFound();
            }
            return View(releaser);
        }

        // GET: Releasers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Releasers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Code,Name,Notes,Status")] Releaser releaser)
        {
            if (ModelState.IsValid)
            {
                db.Releaser.Add(releaser);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(releaser);
        }

        // GET: Releasers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Releaser releaser = db.Releaser.Find(id);
            if (releaser == null)
            {
                return HttpNotFound();
            }
            return View(releaser);
        }

        // POST: Releasers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Code,Name,Notes,Status")] Releaser releaser)
        {
            if (ModelState.IsValid)
            {
                db.Entry(releaser).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(releaser);
        }

        // GET: Releasers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Releaser releaser = db.Releaser.Find(id);
            if (releaser == null)
            {
                return HttpNotFound();
            }
            return View(releaser);
        }

        // POST: Releasers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Releaser releaser = db.Releaser.Find(id);
            db.Releaser.Remove(releaser);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
