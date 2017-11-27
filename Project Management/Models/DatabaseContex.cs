using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.WebPages.Deployment;

namespace Project_Management.Models
{
    public class DatabaseContex : DbContext
    {
        public DatabaseContex()
            : base("DefaultConnection")
        {
        }
        public DbSet<ITAdmin> ItAdmins { get; set; }
        public DbSet<UserProfile> UserProfiles { get; set; }

        public DbSet<ProjectManagement> ProjectManagements { get; set; }
        

        
         
    }
}