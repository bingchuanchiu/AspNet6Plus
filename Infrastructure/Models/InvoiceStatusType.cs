using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class InvoiceStatusType
    {
        public InvoiceStatusType()
        {
            Invoices = new HashSet<Invoice>();
        }

        public int InvoiceStatusTypeId { get; set; }
        public string InvoiceStatusTypeName { get; set; }

        public virtual ICollection<Invoice> Invoices { get; set; }
    }
}
