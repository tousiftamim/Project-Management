using System;
using System.IO;
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
    [Authorize(Roles = "ProjectManager")]
    [InitializeSimpleMembership]
    public class ProjectManagementController : Controller
    {
        private DatabaseContex db = new DatabaseContex();

        //
        // GET: /ProjectManagement/

        public ActionResult Index()
        {
            var projectlist = db.ProjectManagements.Where(_ => _.UserId == WebSecurity.CurrentUserId).ToList();
            return View(projectlist);
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
            var p = db.ProjectManagements.FirstOrDefault();
            return View(p);
        }

        //
        // POST: /ProjectManagement/Create

        [HttpPost]

        public ActionResult Create(ProjectManagement projectmanagement)
        {
            if (ModelState.IsValid)

                if (Request.Files.Count > 0)
                {
                    try
                    {
                        var file = Request.Files[0];
                        if (file != null && file.ContentLength > 0)
                        {
                            string path = Path.Combine(Server.MapPath("~/Images/"),
                                                  Path.GetFileName(file.FileName));
                            file.SaveAs(path);
                            ViewBag.Message = "File uploaded successfully";
                        }
                       
                    }
                    catch (Exception ex)
                    {
                        ViewBag.Message = "ERROR:" + ex.Message.ToString();
                    }
                }
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
            List<UserProfile> userlist = db.UserProfiles.ToList();
            ViewBag.ProjectList = projectList;
            ViewBag.UserList = userlist;
            return View();
        }

        [HttpPost]
        public ActionResult AssignTask(ProjectAssignModel projectAssignModel)
        {
            db.ProjectAssignModels.Add(projectAssignModel);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult ShowProjectResourcePerson()
        {
            var datalist = from projectass in db.ProjectAssignModels
                           join projecinfo in db.ProjectManagements on projectass.ProjectId equals projecinfo.Id
                           join u in db.ItAdmins on projectass.PersonsUserId equals u.Id
                           where projecinfo.UserId == WebSecurity.CurrentUserId
                           select new ProjectResourcePersonVM()
                           {
                               ProjectName = projecinfo.ProjectName,
                               ResourcePerson = u.UserName,
                               Designation = u.Designation

                           };

            return View(datalist);
        }


        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}