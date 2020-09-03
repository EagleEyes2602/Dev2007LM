using Net2006MVC.Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Net2006MVC.Utilities
{
    public static class Security
    {
        private static QuanLyThuVienDevmasterEntities db = new QuanLyThuVienDevmasterEntities();

        public static bool CheckPermission(string menuName, string permissionName, int employeeId)
        {
            var per = (from p in db.Permission
                       join mp in db.MenuPermission on p.Id equals mp.PermissionId
                       join m in db.Menu on mp.MenuId equals m.Id
                       join rp in db.RolePermission on mp.Id equals rp.MenuPermissionId
                       join r in db.Role on rp.RoleId equals r.Id
                       join er in db.EmployeeRole on r.Id equals er.RoleId
                       where p.Name == permissionName && m.Name == menuName && er.EmployeeId == employeeId
                       select er).ToList();
            return per.Count > 0;
        }
    }
}