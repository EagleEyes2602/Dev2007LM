using Net2006MVC.Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Net2006MVC.Models.ViewModels
{
    public class IndexViewModel
    {
        public List<BookTitle> LatestProduct { get; set; }
        public List<BookTitle> TopSaleProduct { get; set; }
    }
}