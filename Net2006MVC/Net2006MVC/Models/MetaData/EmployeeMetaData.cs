using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Net2006MVC.Models.EF
{
    [MetadataType(typeof(Employee.Metadata))]
    public partial class Employee
    {
        private sealed class Metadata
        {
            [Display(Name = "FullName")]
            public string FirstName { get; set; }
            [Required(ErrorMessage = "Email không được để trống")]
            public string Email { get; set; }
            [Required(ErrorMessage = "Mật khẩu không được để trống")]
            public string Password { get; set; }
        }
    }
}