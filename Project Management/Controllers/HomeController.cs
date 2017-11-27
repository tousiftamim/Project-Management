using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Project_Management.Filters;

namespace Project_Management.Controllers
{
    [InitializeSimpleMembership]
    public class HomeController : Controller
    {
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
