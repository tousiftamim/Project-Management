using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Project_Management.Filters;
using Project_Management.Models;
using WebMatrix.WebData;

namespace Project_Management.Controllers
{
    [Authorize(Roles = "ITAdmin")]
    [InitializeSimpleMembership]
    public class ITAdminController : Controller
    {
        private DatabaseContex db = new DatabaseContex();

        //
        // GET: /ITAdmin/

        public ActionResult Index()
        {
            var userId = WebSecurity.CurrentUserId;
            var userInfos = db.ItAdmins.Where(_ => _.UserId == userId).ToList();
            return View(userInfos);
        }

        //
        // GET: /ITAdmin/Details/5

        public ActionResult Details(int id = 0)
        {
            ITAdmin itadmin = db.ItAdmins.Find(id);
            if (itadmin == null)
            {
                return HttpNotFound();
            }
            return View(itadmin);
        }

        //
        // GET: /ITAdmin/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /ITAdmin/Create

        [HttpPost]
        
        public ActionResult Create(ITAdmin itadmin)
        {
            if (ModelState.IsValid)
            {
                WebSecurity.CreateUserAndAccount(itadmin.UserName, itadmin.DefaultPassword);
                itadmin.UserId = WebSecurity.CurrentUserId;
                db.ItAdmins.Add(itadmin);
                db.SaveChanges();
                var userId = db.UserProfiles.Where(_ => _.UserName == itadmin.UserName).Select(_ => _.UserId).FirstOrDefault();
                Roles.AddUserToRole(itadmin.UserName, itadmin.Designation);
                


                return RedirectToAction("Index");
            }

            return View(itadmin);
        }

        //
        // GET: /ITAdmin/Edit/5

        public ActionResult Edit(int id = 0)
        {
            ITAdmin itadmin = db.ItAdmins.Find(id);
            if (itadmin == null)
            {
                return HttpNotFound();
            }
            return View(itadmin);
        }

        //
        // POST: /ITAdmin/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ITAdmin itadmin)
        {
            if (ModelState.IsValid)
            {
                db.Entry(itadmin).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(itadmin);
        }

        //
        // GET: /ITAdmin/Delete/5

        public ActionResult Delete(int id = 0)
        {
            ITAdmin itadmin = db.ItAdmins.Find(id);
            if (itadmin == null)
            {
                return HttpNotFound();
            }
            return View(itadmin);
        }

        //
        // POST: /ITAdmin/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ITAdmin itadmin = db.ItAdmins.Find(id);
            db.ItAdmins.Remove(itadmin);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}