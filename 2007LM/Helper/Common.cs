using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using _2007LM.Model;

namespace _2007LM.Helper
{
    public class Common
    {
        private static string conStr = @"Server=DESKTOP-A30ET4Q\EAGLEMSSQL17;Database=QLSV_V2;Integrated Security=True";
        /// <summary>
        /// Get entities from DataTable
        /// </summary>
        /// <typeparam name="T">Type of entity</typeparam>
        /// <param name="dt">DataTable</param>
        /// <returns></returns>
        public static IEnumerable<T> GetEntities<T>(DataTable dt)
        {
            if (dt == null)
            {
                return null;
            }

            List<T> returnValue = new List<T>();
            List<string> typeProperties = new List<string>();

            T typeInstance = Activator.CreateInstance<T>();

            foreach (DataColumn column in dt.Columns)
            {
                var prop = typeInstance.GetType().GetProperty(column.ColumnName, BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Public);
                if (prop != null)
                {
                    typeProperties.Add(column.ColumnName);
                }
            }

            foreach (DataRow row in dt.Rows)
            {
                T entity = Activator.CreateInstance<T>();

                foreach (var propertyName in typeProperties)
                {

                    if (row[propertyName] != DBNull.Value)
                    {
                        string str = row[propertyName].GetType().FullName;

                        if (entity.GetType().GetProperty(propertyName).PropertyType == typeof(System.String))
                        {
                            object Val = row[propertyName].ToString();
                            entity.GetType().GetProperty(propertyName, BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Public).SetValue(entity, Val, BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Public, null, null, null);
                        }
                        else if (entity.GetType().GetProperty(propertyName).PropertyType == typeof(System.Guid))
                        {
                            object Val = Guid.Parse(row[propertyName].ToString());
                            entity.GetType().GetProperty(propertyName, BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Public).SetValue(entity, Val, BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Public, null, null, null);
                        }
                        else
                        {
                            entity.GetType().GetProperty(propertyName, BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Public).SetValue(entity, row[propertyName], BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Public, null, null, null);
                        }
                    }
                    else
                    {
                        entity.GetType().GetProperty(propertyName, BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Public).SetValue(entity, null, BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Public, null, null, null);
                    }
                }

                returnValue.Add(entity);
            }

            return returnValue.AsEnumerable();
        }

        public static void ConnectDB()
        {
            SqlConnection conn = new SqlConnection(conStr);

            SqlCommand cmd = new SqlCommand("select * from KHOA", conn);
            
            conn.Open();
            // ExecuteScalar - trả về 1 giá trị (1 cell)
            // ExecuteNonQuery - trả về (số) record bị tác động
            // Sử dụng cho việc Insert, Update, Delete
            // ExecuteReader - trả về bảng dữ liệu

            var res = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable dt = new DataTable();
            dt.Load(res);
            var lst = GetEntities<KhoaModel>(dt);
            foreach (var item in lst)
            {
                Console.WriteLine("Id: {0}, Ma: {1},Ten: {2}", item.ID, item.MA, item.TEN);
            }

            // INSERT, UPDATE, DELETE
            string cmdText = "INSERT INTO KHOA VALUES (N'K07', N'Kiểm toán')";
            cmd = new SqlCommand(cmdText, conn);

            conn.Open();
            int record = cmd.ExecuteNonQuery();
            conn.Close();
            Console.WriteLine("Record: " + record);
        }
    }
}
