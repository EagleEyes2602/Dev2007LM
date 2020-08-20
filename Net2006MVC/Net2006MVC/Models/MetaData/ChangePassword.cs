using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Net2006MVC.Models
{
    public class ChangePassword
    {
        [Required(ErrorMessage = "Mật khẩu cũ không được để trống")]
        [DataType(DataType.Password)]
        public string OldPassword { get; set; }
        [Required(ErrorMessage = "Mật khẩu mới không được để trống")]
        [DataType(DataType.Password)]
        public string NewPassword { get; set; }
        [Required(ErrorMessage = "Xác nhận mật khẩu không được để trống")]
        [DataType(DataType.Password)]
        [Compare("NewPassword", ErrorMessage = "Mật khẩu mới không khớp")]
        public string ConfirmNewPassword { get; set; }
    }
}