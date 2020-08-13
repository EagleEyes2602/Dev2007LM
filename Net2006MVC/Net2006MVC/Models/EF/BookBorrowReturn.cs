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
    
    public partial class BookBorrowReturn
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BookBorrowReturn()
        {
            this.BookBorrowReturnDetail = new HashSet<BookBorrowReturnDetail>();
        }
    
        public int Id { get; set; }
        public string Code { get; set; }
        public int ReaderId { get; set; }
        public decimal Deposits { get; set; }
        public decimal BorrowFee { get; set; }
        public Nullable<decimal> PenaltyFee { get; set; }
        public Nullable<bool> IsOnline { get; set; }
        public Nullable<bool> IsBorrow { get; set; }
        public Nullable<bool> IsReturn { get; set; }
        public Nullable<System.DateTime> CreatedTime { get; set; }
        public Nullable<System.DateTime> ReturnTime { get; set; }
        public Nullable<System.DateTime> BorrowTime { get; set; }
        public string Notes { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookBorrowReturnDetail> BookBorrowReturnDetail { get; set; }
        public virtual Reader Reader { get; set; }
    }
}
