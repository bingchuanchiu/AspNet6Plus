using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class JocTocSections2
    {
        public JocTocSections2()
        {
            ContractsSectionToContractorPaids = new HashSet<ContractsSectionToContractorPaid>();
        }

        public int JocTocSection2Id { get; set; }
        public int? ContractsSectionId { get; set; }
        public int? UserId { get; set; }
        public DateTime? PaymentReturnedDateContractorDate { get; set; }
        public DateTime? TransmitsMonthlyRequisitionContractsSectionDate { get; set; }
        public int? ActualDurationJoctocSectionTransmissionMonthlyRequisitionContractsSectionDays { get; set; }
        public int? VarianceBetweenExpectedActualDurationJoctocSectionTransmissionMonthlyPaymentDays { get; set; }
        public DateTime? DeadlineDays { get; set; }
        public int? ReturnedToSectionId { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? RemovedAt { get; set; }
        public int? RemovedBy { get; set; }

        public virtual ContractsSection ContractsSection { get; set; }
        public virtual ReturnedToSection ReturnedToSection { get; set; }
        public virtual ICollection<ContractsSectionToContractorPaid> ContractsSectionToContractorPaids { get; set; }
    }
}
