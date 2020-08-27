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
    public class BookTitlesController : Controller
    {
        private QuanLyThuVienDevmasterEntities db = new QuanLyThuVienDevmasterEntities();

        // GET: BookTitles
        public ActionResult Index()
        {
            var bookTitle = db.BookTitle.Include(b => b.Author).Include(b => b.BookType).Include(b => b.Employee).Include(b => b.Publisher).Include(b => b.Employee1).Include(b => b.Releaser);
            return View(bookTitle.ToList());
        }

        // GET: BookTitles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BookTitle bookTitle = db.BookTitle.Find(id);
            if (bookTitle == null)
            {
                return HttpNotFound();
            }
            return View(bookTitle);
        }

        // GET: BookTitles/Create
        public ActionResult Create()
        {
            ViewBag.AuthorId = new SelectList(db.Author, "Id", "Code");
            ViewBag.BookTypeId = new SelectList(db.BookType, "Id", "Code");
            ViewBag.CreatedBy = new SelectList(db.Employee, "Id", "Code");
            ViewBag.PublisherId = new SelectList(db.Publisher, "Id", "Code");
            ViewBag.UpdatedBy = new SelectList(db.Employee, "Id", "Code");
            ViewBag.ReleaserId = new SelectList(db.Releaser, "Id", "Code");
            return View();
        }

        // POST: BookTitles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "Code,Name,PublisherId,AuthorId,BookTypeId,ReleaserId,PublishYear,PageNo,Price,Description,Notes,Status")] BookTitle bookTitle, HttpPostedFileBase ImageUpload)
        {
            if (ImageUpload.ContentLength > 0)
            {
            }
            if (ModelState.IsValid)
            {
                db.BookTitle.Add(bookTitle);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AuthorId = new SelectList(db.Author, "Id", "Code", bookTitle.AuthorId);
            ViewBag.BookTypeId = new SelectList(db.BookType, "Id", "Code", bookTitle.BookTypeId);
            ViewBag.CreatedBy = new SelectList(db.Employee, "Id", "Code", bookTitle.CreatedBy);
            ViewBag.PublisherId = new SelectList(db.Publisher, "Id", "Code", bookTitle.PublisherId);
            ViewBag.UpdatedBy = new SelectList(db.Employee, "Id", "Code", bookTitle.UpdatedBy);
            ViewBag.ReleaserId = new SelectList(db.Releaser, "Id", "Code", bookTitle.ReleaserId);
            return View(bookTitle);
        }

        // GET: BookTitles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BookTitle bookTitle = db.BookTitle.Find(id);
            if (bookTitle == null)
            {
                return HttpNotFound();
            }
            ViewBag.AuthorId = new SelectList(db.Author, "Id", "Code", bookTitle.AuthorId);
            ViewBag.BookTypeId = new SelectList(db.BookType, "Id", "Code", bookTitle.BookTypeId);
            ViewBag.CreatedBy = new SelectList(db.Employee, "Id", "Code", bookTitle.CreatedBy);
            ViewBag.PublisherId = new SelectList(db.Publisher, "Id", "Code", bookTitle.PublisherId);
            ViewBag.UpdatedBy = new SelectList(db.Employee, "Id", "Code", bookTitle.UpdatedBy);
            ViewBag.ReleaserId = new SelectList(db.Releaser, "Id", "Code", bookTitle.ReleaserId);
            return View(bookTitle);
        }

        // POST: BookTitles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Code,Name,PublisherId,AuthorId,BookTypeId,ReleaserId,Image,PublishYear,PageNo,Price,Description,CreatedTime,UpdatedTime,CreatedBy,UpdatedBy,Notes,Status")] BookTitle bookTitle)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bookTitle).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AuthorId = new SelectList(db.Author, "Id", "Code", bookTitle.AuthorId);
            ViewBag.BookTypeId = new SelectList(db.BookType, "Id", "Code", bookTitle.BookTypeId);
            ViewBag.CreatedBy = new SelectList(db.Employee, "Id", "Code", bookTitle.CreatedBy);
            ViewBag.PublisherId = new SelectList(db.Publisher, "Id", "Code", bookTitle.PublisherId);
            ViewBag.UpdatedBy = new SelectList(db.Employee, "Id", "Code", bookTitle.UpdatedBy);
            ViewBag.ReleaserId = new SelectList(db.Releaser, "Id", "Code", bookTitle.ReleaserId);
            return View(bookTitle);
        }

        // GET: BookTitles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BookTitle bookTitle = db.BookTitle.Find(id);
            if (bookTitle == null)
            {
                return HttpNotFound();
            }
            return View(bookTitle);
        }

        // POST: BookTitles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BookTitle bookTitle = db.BookTitle.Find(id);
            db.BookTitle.Remove(bookTitle);
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
