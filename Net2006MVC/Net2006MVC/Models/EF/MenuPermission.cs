//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Net2006MVC.Models.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class MenuPermission
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MenuPermission()
        {
            this.RolePermission = new HashSet<RolePermission>();
        }
    
        public int Id { get; set; }
        public Nullable<int> MenuId { get; set; }
        public Nullable<int> PermissionId { get; set; }
    
        public virtual Menu Menu { get; set; }
        public virtual Permission Permission { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RolePermission> RolePermission { get; set; }
    }
}
