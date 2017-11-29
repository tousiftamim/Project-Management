using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_Management.Models.ViewModels
{
    public class ProjectUserVm
    {
        public int ProjectId { get; set; }
        public string ProjectName { get; set; }
        public int UserId { get; set; }
    }
}