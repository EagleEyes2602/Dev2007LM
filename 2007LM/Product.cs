using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2007LM
{
    public class Product
    {
        private string code;
        public string Code
        {
            get { return code; }
            set { code = value; }
        }

        public string Name { get; set; }

        public Product() { }

        public Product(string code,string name)
        {
            this.Code = code;
            this.Name = name;
        }
    }
}
