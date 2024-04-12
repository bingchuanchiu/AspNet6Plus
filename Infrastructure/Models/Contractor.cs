using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class Contractor
    {
        public Contractor()
        {
            CmConsultants = new HashSet<CmConsultant>();
            Contracts = new HashSet<Contract>();
        }

        public int ContractorId { get; set; }
        public string ContractorName { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? RemovedAt { get; set; }
        public int? RemovedBy { get; set; }

        public virtual ICollection<CmConsultant> CmConsultants { get; set; }
        public virtual ICollection<Contract> Contracts { get; set; }
    }
}
