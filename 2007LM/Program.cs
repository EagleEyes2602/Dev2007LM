using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using Vehicle.TwoWheel;
using _2007LM.Model;

namespace _2007LM
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            #region Session 07
            #region LINQ
            // Có thể thao tác dữ liệu 1 cách dễ dàng bằng C#
            // LINQ Query -- gần giống như code T-SQL
            List<Khoa> khoas = new List<Khoa>()
            {
                new Khoa(){Id = 1, Code = "K01", Name = "CNTT", Type = 1},
                new Khoa(){Id = 2, Code = "K02", Name = "DTVT", Type = 1},
                new Khoa(){Id = 3, Code = "K03", Name = "KinhTe", Type = 1},
                new Khoa(){Id = 4, Code = "K04", Name = "KHCoBan", Type = 1}
            };

            IEnumerable<Lop> lops = new List<Lop>()
            {
                new Lop(){Id = 1, IdKhoa = 1, Code = "L01", Name = "CNTT1", Type = 1},
                new Lop(){Id = 2, IdKhoa = 1, Code = "L02", Name = "CNTT2", Type = 1},
                new Lop(){Id = 3, IdKhoa = 2, Code = "L03", Name = "DTVT1", Type = 1},
                new Lop(){Id = 4, IdKhoa = 3, Code = "L04", Name = "KTVienThong", Type = 1},
                new Lop(){Id = 5, IdKhoa = 3, Code = "L05", Name = "KTVanTai", Type = 1},
                new Lop(){Id = 6, IdKhoa = 3, Code = "L06", Name = "HoaHoc", Type = 0}
            };

            IEnumerable<Khoa> lst2 = (from k in khoas select k);

            var response = from k in khoas
                           where k.Id > 1
                           orderby k.Name
                           select k;

            foreach (var res in response)
            {
                Console.WriteLine("Id: {0}, Code: {1}, Name: {2}", res.Id, res.Code, res.Name);
            }

            Console.WriteLine("-----------------------------------------------------");
            var response1 = from k in khoas
                            where k.Id > 1
                            orderby k.Name
                            select new { k.Code, k.Name };
            foreach (var res in response1)
            {
                Console.WriteLine("Code: {0}, Name: {1}", res.Code, res.Name);
            }

            Console.WriteLine("-----------------------------------------------------");
            var linqJoin = from k in khoas
                           join l in lops on k.Id equals l.IdKhoa
                           select new { khoa = k, lop = l };
            foreach (var res in linqJoin)
            {
                Console.WriteLine("TenKhoa: {0}, TenLop: {1}", res.khoa.Name, res.lop.Name);
            }

            var linqJoin1 = from k in khoas
                            join l in lops on new { Id = k.Id, Type = k.Type } equals
                                              new { Id = l.IdKhoa, Type = l.Type }
                            select new { khoa = k, lop = l };

            var linqLeftJoin = from k in khoas
                               join l in lops on k.Id equals l.IdKhoa into lgrp
                               from l in lgrp.DefaultIfEmpty()
                               select new { k, l };

            Console.WriteLine("-----------------------------------------------------");
            // Lấy ra những khoa có từ 2 lớp trở lên
            var linqQuery1 = from T1 in (
                                 from l in lops
                                 group l by l.IdKhoa into lgrp
                                 where lgrp.Count() > 1
                                 orderby lgrp.Key descending
                                 select new { IdKhoa = lgrp.Key, count = lgrp.Count() }
                             )
                             join k in khoas on T1.IdKhoa equals k.Id
                             select new { TenKhoa = k.Name, SoLuongLop = T1.count }
                             ;
            foreach (var res in linqQuery1)
            {
                Console.WriteLine("TenKhoa: {0}, SoLuongLop: {1}", res.TenKhoa, res.SoLuongLop);
            }
            // LINQ Method -- sử dụng các function được dựng sẵn để query (lambda expression)
            var linqMethod1 = khoas.Where((x) => { return x.Id == 1; }).ToList();
            var linqMethod2 = khoas.Where(x => x.Id == 1).ToList();
            var linqMethod3 = khoas.OrderBy(x => x.Id).ThenBy(x => x.Name).FirstOrDefault();
            var linqMethod4 = khoas.Join(lops, x => x.Id, y => y.IdKhoa, (x,y) => new { x, y }).Where(z=>z.x.Id == 1);

            //(Khoa) => (bool)
            #endregion
            #endregion
            Console.ReadKey();
        }

        #region Session 06
        public void Session06()
        {
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
                int d = a / b;
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

            int c = IiTi(true)(1, 2);
            #endregion
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
        #endregion
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
