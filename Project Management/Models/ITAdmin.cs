using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Project_Management.Models
{
    [Table("UserInformation")]
    public class ITAdmin
    {
        [Key]
        public int Id { get; set; }
        public string UserName { get; set; }
        public string UserEmail { get; set; }
        public string DefaultPassword { get; set; }
        public string Status { get; set; }
        public string Designation { get; set; }
        public int UserId { get; set; }


    }
}