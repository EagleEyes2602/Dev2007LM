using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using Vehicle.TwoWheel;

namespace _2007LM
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;

            #region NameSpace
            Car.Car car = new Car.Car() { Code = "MS650", Brand = "Merc", Name = "Merc S650 Maybach", Price = 900000 };
            car.Run();
            car.Stop();

            Vehicle.Car car1 = new Vehicle.Car();
            MotoBike motoBike = new MotoBike("", "", "", 1, "");
            motoBike.Run();
            motoBike.Stop();
            #endregion

            #region Exception

            try
            {
                // Chứa đoạn code muốn bắt lỗi / có khả năng xảy ra lỗi
                int a = 10, b = 1;
                int c = a / b;
                //car = null;
                car.Run();
                throw new Exception("Lỗi rồi hihi");
            }
            catch (IndexOutOfRangeException ex)
            {
                // Khi lỗi chương trình sẽ chạy vào đây
                Console.WriteLine(ex.Message);
            }
            catch (Exception ex)
            {
                // Khi lỗi chương trình sẽ chạy vào đây
                Console.WriteLine(ex.Message);
            }
            finally
            {
                // Lúc nào cũng chạy vào đây
            }

            try
            {
                int[] arr = new int[] { 1, 3, 2 };
                Console.WriteLine(arr[3]);
            }
            catch (LoiRoi ex)
            {
                Console.WriteLine(ex.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            #endregion

            #region Delegate
            IntIntToInt iiToInt = new IntIntToInt(Sum);
            Console.WriteLine(iiToInt(1, 2));

            iiToInt = new IntIntToInt(Minus);
            Console.WriteLine(iiToInt(1, 2));

            int c = IiTi(true)(1,2);
            #endregion
            Console.ReadKey();
        }

        public delegate int IntIntToInt(int a, int b);

        public static IntIntToInt IiTi(bool flag)
        {
            if (flag)
            {
                return Sum;
            }
            else
            {
                return Minus;
            }
        }

        public class LoiRoi : SystemException
        {
            public LoiRoi(string msg)
                : base(msg)
            {
                Console.WriteLine("Tự giác mà sửa đi");
            }
        }

        #region Session 05

        public void Session05()
        {

            #region MyRegion
            //int resA = Sum(1, 1, 1);
            //int resB = Sum(1, 1);
            //Console.WriteLine(resA);
            //Console.WriteLine(resB);
            #endregion

            #region Hashtable
            Hashtable hashtable = new Hashtable();
            hashtable.Add(1, "Lập trình C#");
            hashtable.Add("2008", "Lập trình MVC");
            Console.WriteLine(hashtable["2008"]);
            print(hashtable);
            hashtable.Remove(1);
            print(hashtable);
            //hashtable.sort
            #endregion

            #region SortedList
            Product product1 = new Product();
            Product product2 = new Product("A01", "Laptop");
            SortedList sortedList = new SortedList();
            sortedList.Add("2", "DevmasterKey2");
            sortedList.Add("1", product1.Name);
            sortedList.Add("3", "DevmasterKey3");
            sortedList.Clear();
            sortedList.Add(2, "Devmaster");
            sortedList.Add(1, product2);
            #endregion

            #region List
            Console.WriteLine("----------------List-------------------");
            List<string> lstStr = new List<string>();
            lstStr.Add("Lập Trình Cùng");
            lstStr.Add("Devmaster");
            lstStr.Add("Devmaster");
            lstStr.Add("Devmaster");
            lstStr.Add("Devmaster");
            lstStr.Add("Devmaster");
            lstStr.Add("Devmaster");
            lstStr.Add("Devmaster");
            lstStr.Add("Devmaster");
            lstStr.Add("Devmaster");
            lstStr.Sort();
            lstStr.RemoveRange(0, 2);
            lstStr.RemoveAt(0);
            lstStr.Remove("Devmaster");
            lstStr.RemoveAll(x => x == "Devmaster");
            lstStr.AddRange(new[] { "Bằng", "C#" });
            print(lstStr);

            List<Product> lstProduct = new List<Product>();
            lstProduct.Add(product1);
            lstProduct.Add(product2);
            var a = lstProduct[0];
            print(lstProduct);
            #endregion

            #region Dictionary
            Dictionary<int, Product> dicProduct = new Dictionary<int, Product>() {
                { 1, product1 }, { 2, product2 }
            };
            dicProduct.Remove(1);

            Dictionary<int, Dictionary<string, Product>> dicProductAdv = new Dictionary<int, Dictionary<string, Product>>()
            {
                { 1, new Dictionary<string, Product>() { { "1", product1 } } },
                { 2, new Dictionary<string, Product>() { { "2", product2 } } }
            };
            dicProduct.Remove(1);

            #endregion
        }

        public static void print(List<Product> lst)
        {
            Console.WriteLine("-----------------------------------");
            foreach (Product item in lst)
            {
                Console.WriteLine("Code: {1} --- Name: {0}", item.Name, item.Code);
            }
        }

        public static void print(List<string> lst)
        {
            Console.WriteLine("-----------------------------------");
            foreach (string item in lst)
            {
                Console.WriteLine(item);
            }
        }

        public static void print(Hashtable hashtable)
        {
            Console.WriteLine("-----------------------------------");
            foreach (DictionaryEntry item in hashtable)
            {
                Console.WriteLine(item.Key + "---" + item.Value);
            }
        }

        public static int Sum(int a, int b, int c)
        {
            int res = a + b + c;
            return res;
        }

        public static int Sum(int a, int b)
        {
            int res = a + b;
            return res;
        }

        public static int Minus(int a, int b)
        {
            return a - b;
        }

        #endregion
    }
}
