using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class InvioceStatusType
    {
        public InvioceStatusType()
        {
            Invoices = new HashSet<Invoice>();
        }

        public int InvoiceStatusTypeId { get; set; }
        public string InvoiceStatusName { get; set; }

        public virtual ICollection<Invoice> Invoices { get; set; }
    }
}
