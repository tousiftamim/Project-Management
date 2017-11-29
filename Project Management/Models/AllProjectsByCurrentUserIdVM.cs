using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_Management.Models
{
    public class AllProjectsByCurrentUserIdVM
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }
        public string Status { get; set; }
        public int NumberOfMembers { get; set; }
        public int NumberOfTasks { get; set; }
    }
}