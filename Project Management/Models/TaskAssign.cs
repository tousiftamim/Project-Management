using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Project_Management.Models
{
    [Table("TaskAssign")]
    public class TaskAssign
    {
        public int Id { get; set; }
        public int ProjectId { get; set; }
        public int PersonUserId { get; set; }
        public string Description { get; set; }
        public DateTime DueDate { get; set; }
        public string Priority { get; set; }
        public int TaskAssignBy { get; set; }

    }
}