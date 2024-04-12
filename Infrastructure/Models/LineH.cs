using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class LineH
    {
        public LineH()
        {
            Invoices = new HashSet<Invoice>();
            LineHdocuments = new HashSet<LineHdocument>();
        }

        public int LineHId { get; set; }
        public string LineHName { get; set; }
        public decimal? LineHIncreaseAmount { get; set; }
        public decimal? LineHDecreaseAmount { get; set; }
        public int? RemovedBy { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? RemovedAt { get; set; }

        public virtual ICollection<Invoice> Invoices { get; set; }
        public virtual ICollection<LineHdocument> LineHdocuments { get; set; }
    }
}
