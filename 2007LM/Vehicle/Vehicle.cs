using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vehicle
{
    class Car
    {
        protected string Code { get; set; }
        protected string Brand { get; set; }
        protected string Name { get; set; }
        protected decimal Price { get; set; }

        public Car() { }
        public Car(string code, string brand, string name, decimal price)
        {
            this.Code = code;
            this.Brand = brand;
            this.Name = name;
            this.Price = price;
        }
        public void Run()
        {
            Console.WriteLine(this.Code + " đang chạy");
        }

        public void Stop()
        {
            Console.WriteLine(this.Code + " đang dừng");
        }
    }

    namespace TwoWheel
    {
        class MotoBike : Car
        {
            public string Supplier { get; set; }
            public MotoBike() : base() { }
            public MotoBike(string code, string brand, string name, decimal price, string supplier)
                : base(code, brand, name, price)
            {
                this.Supplier = supplier;
            }
        }
    }
}
