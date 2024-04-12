using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class JocTocSections1
    {
        public JocTocSections1()
        {
            ContractsSections = new HashSet<ContractsSection>();
        }

        public int JocTocSection1Id { get; set; }
        public int CmSectionId { get; set; }
        public int? UserId { get; set; }
        public DateTime? JocTocSectionReceivesPaymentRequestDate { get; set; }
        public DateTime? JocTocSectionApprovesPaymentRequestDate { get; set; }
        public int? ExpectedDurationJocTocSectionPaymentApprovalDays { get; set; }
        public int? ActualDurationJocTocSectionPaymentApprovalDays { get; set; }
        public int? VarianceBetweenExpectedActualDurationOfCmSectionPaymentApprovalDays { get; set; }
        public DateTime? JocTocSectionNotifiesContractorIncludeMonthlyRequisitionDate { get; set; }
        public DateTime? JocTocSectionNotifiesBudgetSectionSubmitFundsApprovalDate { get; set; }
        public DateTime? RequestingPaymentPeriodBeginDate { get; set; }
        public DateTime? RequestingPaymentPeriodEndDate { get; set; }
        public string MonthlyPaymentRequisitionNumber { get; set; }
        public DateTime? AnticipatedSubmissionDateExpenseDate { get; set; }
        public DateTime? DeadlineDays { get; set; }
        public int? ReturnedToSectionId { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? RemovedAt { get; set; }
        public int? RemovedBy { get; set; }

        public virtual CmSection CmSection { get; set; }
        public virtual ReturnedToSection ReturnedToSection { get; set; }
        public virtual ICollection<ContractsSection> ContractsSections { get; set; }
    }
}
