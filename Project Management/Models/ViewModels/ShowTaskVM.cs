using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_Management.Models.ViewModels
{
    public class ShowTaskVM
    {
        public string Description { get; set; }
        public string AssignTo { get; set; }
        public string Priority { get; set; }
        public string AssignedBy { get; set; }
        public DateTime DueDate { get; set; }
    }
}