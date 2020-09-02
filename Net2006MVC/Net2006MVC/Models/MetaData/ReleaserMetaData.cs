using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Net2006MVC.Models.EF
{
    [MetadataType(typeof(Releaser.Metadata))]
    public partial class Releaser
    {
        private sealed class Metadata
        {
            [Required(ErrorMessage = "Mã không được để trống")]
            [MaxLength(10, ErrorMessage = "Mã không được nhiều hơn 10 ký tự")]
            [MinLength(3, ErrorMessage = "Mã không được ít hơn 3 ký tự")]
            public string Code { get; set; }
            [Required(ErrorMessage = "Tên không được để trống")]
            public string Name { get; set; }
        }
    }
}