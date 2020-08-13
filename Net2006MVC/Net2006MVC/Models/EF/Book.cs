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
    
    public partial class Book
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Book()
        {
            this.BookBorrowReturnDetail = new HashSet<BookBorrowReturnDetail>();
        }
    
        public int Id { get; set; }
        public string Code { get; set; }
        public int BookTitleId { get; set; }
        public Nullable<int> BookLocation { get; set; }
        public Nullable<byte> OriginalState { get; set; }
        public Nullable<System.DateTime> CreatedTime { get; set; }
        public Nullable<System.DateTime> UpdatedTime { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public string Notes { get; set; }
        public Nullable<byte> Status { get; set; }
    
        public virtual BookTitle BookTitle { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual Employee Employee1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookBorrowReturnDetail> BookBorrowReturnDetail { get; set; }
        public virtual BookLocation BookLocation1 { get; set; }
    }
}
