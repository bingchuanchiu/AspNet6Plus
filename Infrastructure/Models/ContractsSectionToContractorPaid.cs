using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class ContractsSectionToContractorPaid
    {
        public int ContractsSectionToContractorPaidId { get; set; }
        public int? JocTocSection2Id { get; set; }
        public int? UserId { get; set; }
        public DateTime? RecievesMonthlyRequisitionJoctocSectionDate { get; set; }
        public DateTime? SubmitsRequisitionAccoOfficeDate { get; set; }
        public int? ExpectedDurationContractsSectionTransmissionMonthlyRequisitionAccoDays { get; set; }
        public int? ActualDurationContractsSectionTransmissionMonthlyRequisitionAccoDays { get; set; }
        public int? VarianceBetweenExpectedActualDurationContractsSectionTransmissionMonthlyPaymentAccoDays { get; set; }
        public DateTime? ContractorReceivesMonthlyPaymentDate { get; set; }
        public int? ExpectedDurationMonthlyRequisitionProcessDays { get; set; }
        public int? ActualDurationJocSectionSubmissionContractSectionContractorPaidDate { get; set; }
        public DateTime? DeadlineDays { get; set; }
        public int? ReturnedToSectionId { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? RemovedAt { get; set; }
        public int? RemovedBy { get; set; }

        public virtual JocTocSections2 JocTocSection2 { get; set; }
        public virtual ReturnedToSection ReturnedToSection { get; set; }
    }
}
