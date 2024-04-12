using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class CmConsultant
    {
        public CmConsultant()
        {
            CmSections = new HashSet<CmSection>();
        }

        public int CmConsultantId { get; set; }
        public int? UserId { get; set; }
        public int ContractorId { get; set; }
        public string CmConsultantName { get; set; }
        public DateTime? DeadlineDays { get; set; }
        public int? ReturnedToSectionId { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? RemovedAt { get; set; }
        public int? RemovedBy { get; set; }

        public virtual Contractor Contractor { get; set; }
        public virtual ReturnedToSection ReturnedToSection { get; set; }
        public virtual ICollection<CmSection> CmSections { get; set; }
    }
}
