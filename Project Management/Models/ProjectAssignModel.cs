﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Project_Management.Models
{
    [Table("ProjectAssing")]
    public class ProjectAssignModel
    {
        public int Id { get; set; }
        public int ProjectId { get; set; }
        public int PersonsUserId { get; set; }
       

    }
}