using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Common.CommandTrees;
using System.IO;
using System.Linq;
using System.Web;

namespace Project_Management.Models
{
    [Table("ProjectInfo")]
    public class ProjectManagement
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string ProjectName { get; set; }
        public string CodeName { get; set; }
        public string Description { get; set; }
        public DateTime PossibleStartDate { get; set; }
        public DateTime PossibleEndDate { get; set; }
        public string Duration { get; set; }
        public string UploadFile { get; set; }
        public string Status { get; set; }
        public string ShortName { get; set; }

    }
}