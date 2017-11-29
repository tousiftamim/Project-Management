using System;
using System.Collections.Generic;
using System.Data.Common.CommandTrees;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Project_Management.Filters;
using Project_Management.Models;
using Project_Management.Models.ViewModels;
using Project_Management.Services;
using WebMatrix.WebData;

namespace Project_Management.Controllers
{
    [InitializeSimpleMembership]
    public class HomeController : Controller
    {
        private DatabaseContex db;
        private ProjectService _projectService;
        public HomeController()
        {
            db = new DatabaseContex();
            _projectService = new ProjectService();

        }
        public ActionResult Index()
        {
            if (Roles.IsUserInRole("ITAdmin"))
            {
                return RedirectToAction("Index", "ITAdmin");
            }
            if (Roles.IsUserInRole("ProjectManager"))
            {
                return RedirectToAction("Index", "ProjectManagement");
            }

            else
            {
                ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

                return View();
            }

        }

        public ActionResult AssingTask()
        {
            var userId = WebSecurity.CurrentUserId;


            var items = (from management in db.ProjectManagements
                         join userProject in db.ProjectAssignModels on management.Id equals userProject.ProjectId
                         join assignModel in db.ProjectAssignModels on management.Id equals assignModel.PersonsUserId into assingmodels
                         where userProject.PersonsUserId == userId

                         select new ProjectUserVm()
                         {
                             ProjectId = management.Id,
                             ProjectName = management.ProjectName,
                             UserId = userProject.PersonsUserId

                         }).ToList();
           
            ViewBag.ProjecItems = items;
            List<UserProfile> userlist = db.UserProfiles.ToList();
            ViewBag.UserList = userlist;
            return View();
        }

        [HttpPost]
        public ActionResult AssingTask(TaskAssign taskAssign)
        {
            var userId = WebSecurity.CurrentUserId;
            taskAssign.TaskAssignBy = userId;
            db.TaskAssigns.Add(taskAssign);
            db.SaveChanges();

            return RedirectToAction("Index", "Home");
        }

        public ActionResult ShowAssignTaskByUserId()
        {
            var userId = WebSecurity.CurrentUserId;
            return null;
        }
        public ActionResult ShowAllProjectbyUserid()
        {
            var userId = WebSecurity.CurrentUserId;

            var items = (from management in db.ProjectManagements
                         join userProject in db.ProjectAssignModels on management.Id equals userProject.ProjectId
                         join assignModel in db.ProjectAssignModels on management.Id equals assignModel.ProjectId into assignModels
                         join taskAssign in db.TaskAssigns on userProject.ProjectId equals taskAssign.ProjectId into taskassigns
            
                         where userProject.PersonsUserId == userId
                         select new AllProjectsByCurrentUserIdVM()

                         {
                             Id = management.Id,
                             Name = management.ProjectName,
                             ShortName = management.ShortName,
                             Status = management.Status,
                             NumberOfMembers = assignModels.Count(),
                             NumberOfTasks = taskassigns.Count()
                         }).ToList();


            return View(items);
        }

        public JsonResult GetProjectUsers(int projectId)
        {
            var projectUsers = _projectService.GetUsersByProjectId(projectId);
            return Json(projectUsers, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Details(int id = 0)
        {
            ProjectManagement projectmanagement = db.ProjectManagements.Find(id);
            if (projectmanagement == null)
            {
                return HttpNotFound();
            }
            var tasks = (from taskAssign in db.TaskAssigns
                join assignBy in db.UserProfiles on taskAssign.TaskAssignBy equals assignBy.UserId
                join assignTo in db.UserProfiles on taskAssign.PersonUserId equals assignTo.UserId
                where taskAssign.ProjectId == id
                select new ShowTaskVM()
                {
                    Description = taskAssign.Description,
                    AssignTo = assignTo.UserName,
                    Priority = taskAssign.Priority,
                    AssignedBy = assignBy.UserName,
                    DueDate = taskAssign.DueDate
                    
                }).ToList();

            //var tasks = db.TaskAssigns.Where(_ => _.ProjectId == id).ToList();
            ViewBag.Tasks = tasks;
            return View(projectmanagement);
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
