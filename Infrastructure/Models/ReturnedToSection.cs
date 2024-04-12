using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class ReturnedToSection
    {
        public ReturnedToSection()
        {
            BudgetSections = new HashSet<BudgetSection>();
            CmConsultants = new HashSet<CmConsultant>();
            CmSections = new HashSet<CmSection>();
            ContractsSectionToContractorPaids = new HashSet<ContractsSectionToContractorPaid>();
            ContractsSections = new HashSet<ContractsSection>();
            JocTocSections1s = new HashSet<JocTocSections1>();
            JocTocSections2s = new HashSet<JocTocSections2>();
        }

        public int ReturnedToSectionId { get; set; }
        public DateTime? ReturnedDate { get; set; }
        public int? CurrentSectionId { get; set; }
        public int? ReturnedDesdinationSectionId { get; set; }
        public int? ReturnedFromSectionId { get; set; }
        public string ReturnedComment { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }

        public virtual SectionType CurrentSection { get; set; }
        public virtual SectionType ReturnedDesdinationSection { get; set; }
        public virtual SectionType ReturnedFromSection { get; set; }
        public virtual ICollection<BudgetSection> BudgetSections { get; set; }
        public virtual ICollection<CmConsultant> CmConsultants { get; set; }
        public virtual ICollection<CmSection> CmSections { get; set; }
        public virtual ICollection<ContractsSectionToContractorPaid> ContractsSectionToContractorPaids { get; set; }
        public virtual ICollection<ContractsSection> ContractsSections { get; set; }
        public virtual ICollection<JocTocSections1> JocTocSections1s { get; set; }
        public virtual ICollection<JocTocSections2> JocTocSections2s { get; set; }
    }
}
