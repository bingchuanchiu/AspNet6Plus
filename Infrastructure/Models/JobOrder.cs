using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class JobOrder
    {
        public JobOrder()
        {
            Invoices = new HashSet<Invoice>();
        }

        public int JobOrderId { get; set; }
        public int ContractId { get; set; }
        public int? JobOrderStatusTypeId { get; set; }
        public string JobOrderNumber { get; set; }
        public decimal? JobOrderTotalValue { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? RemovedAt { get; set; }
        public int? RemovedBy { get; set; }

        public virtual Contract Contract { get; set; }
        public virtual JobOrderStatusType JobOrderStatusType { get; set; }
        public virtual ICollection<Invoice> Invoices { get; set; }
    }
}
