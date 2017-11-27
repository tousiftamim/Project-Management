using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_Management.Filters;
using Project_Management.Models;
using WebMatrix.WebData;

namespace Project_Management.Controllers
{
    [InitializeSimpleMembership]
    public class ProjectManagementController : Controller
    {
        private DatabaseContex db = new DatabaseContex();

        //
        // GET: /ProjectManagement/

        public ActionResult Index()
        {
            return View(db.ProjectManagements.ToList());
        }

        //
        // GET: /ProjectManagement/Details/5

        public ActionResult Details(int id = 0)
        {
            ProjectManagement projectmanagement = db.ProjectManagements.Find(id);
            if (projectmanagement == null)
            {
                return HttpNotFound();
            }
            return View(projectmanagement);
        }

        //
        // GET: /ProjectManagement/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /ProjectManagement/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ProjectManagement projectmanagement)
        {
            if (ModelState.IsValid)
            {
                projectmanagement.UserId = WebSecurity.CurrentUserId;
                db.ProjectManagements.Add(projectmanagement);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(projectmanagement);
        }

        //
        // GET: /ProjectManagement/Edit/5

        public ActionResult Edit(int id = 0)
        {
            ProjectManagement projectmanagement = db.ProjectManagements.Find(id);
            if (projectmanagement == null)
            {
                return HttpNotFound();
            }
            return View(projectmanagement);
        }

        //
        // POST: /ProjectManagement/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ProjectManagement projectmanagement)
        {
            if (ModelState.IsValid)
            {
                db.Entry(projectmanagement).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(projectmanagement);
        }

        //
        // GET: /ProjectManagement/Delete/5

        public ActionResult Delete(int id = 0)
        {
            ProjectManagement projectmanagement = db.ProjectManagements.Find(id);
            if (projectmanagement == null)
            {
                return HttpNotFound();
            }
            return View(projectmanagement);
        }

        //
        // POST: /ProjectManagement/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProjectManagement projectmanagement = db.ProjectManagements.Find(id);
            db.ProjectManagements.Remove(projectmanagement);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult AssignTask()
        {
            List<ProjectManagement> projectList = db.ProjectManagements.Where(_ => _.UserId == WebSecurity.CurrentUserId).ToList();
            
            ViewBag.ProjectList = projectList;
            
            return View();
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}