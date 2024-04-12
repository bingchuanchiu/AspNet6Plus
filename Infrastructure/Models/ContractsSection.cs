using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class ContractsSection
    {
        public ContractsSection()
        {
            BudgetSections = new HashSet<BudgetSection>();
            JocTocSections2s = new HashSet<JocTocSections2>();
        }

        public int ContractsSectionId { get; set; }
        public int? JocTocSection1Id { get; set; }
        public int? UserId { get; set; }
        public DateTime? DipReceivedDate { get; set; }
        public DateTime? NotificationSentJoctocDate { get; set; }
        public DateTime? ContractorSubmittedUpdatedDocumentsDipDate { get; set; }
        public DateTime? DeadlineDays { get; set; }
        public int? ReturnedToSectionId { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? RemovedAt { get; set; }
        public int? RemovedBy { get; set; }

        public virtual JocTocSections1 JocTocSection1 { get; set; }
        public virtual ReturnedToSection ReturnedToSection { get; set; }
        public virtual ICollection<BudgetSection> BudgetSections { get; set; }
        public virtual ICollection<JocTocSections2> JocTocSections2s { get; set; }
    }
}
