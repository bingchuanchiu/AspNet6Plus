using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class Invoice
    {
        public int InvoiceId { get; set; }
        public int JobOrderId { get; set; }
        public int? InvoiceStatusTypeId { get; set; }
        public string InvoiceNumber { get; set; }
        public int? InvoiceTypeId { get; set; }
        public decimal? InvoiceAmount { get; set; }
        public int? LineHId { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? RemovedAt { get; set; }
        public int? RemovedBy { get; set; }

        public virtual InvoiceStatusType InvoiceStatusType { get; set; }
        public virtual InvoiceType InvoiceType { get; set; }
        public virtual JobOrder JobOrder { get; set; }
        public virtual LineH LineH { get; set; }
    }
}
