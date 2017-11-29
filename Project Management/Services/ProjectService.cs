using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Project_Management.Models;

namespace Project_Management.Services
{
    public class ProjectService
    {
        private DatabaseContex _database;

        public ProjectService()
        {
            _database = new DatabaseContex();
        }

        public List<ITAdmin> GetUsersByProjectId(int projectId)
        {
            var users = (from assignModel in _database.ProjectAssignModels
                join itAdmin in _database.ItAdmins on assignModel.PersonsUserId equals itAdmin.UserId
                where assignModel.ProjectId == projectId
                select itAdmin).ToList();

            return users;
        }
    }
}