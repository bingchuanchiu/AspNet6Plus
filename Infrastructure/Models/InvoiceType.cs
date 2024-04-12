using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class InvoiceType
    {
        public InvoiceType()
        {
            Invoices = new HashSet<Invoice>();
        }

        public int InvoiceTypeId { get; set; }
        public string InvoiceTypeName { get; set; }

        public virtual ICollection<Invoice> Invoices { get; set; }
    }
}
