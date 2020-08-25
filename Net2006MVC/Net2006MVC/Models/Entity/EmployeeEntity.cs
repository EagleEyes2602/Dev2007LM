using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Net2006MVC.Models.Entity
{
    public class EmployeeEntity
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public byte Gender { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public Nullable<System.DateTime> CreatedTime { get; set; }
        public Nullable<System.DateTime> UpdatedTime { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public string Notes { get; set; }
        public Nullable<byte> Status { get; set; }
    }
}