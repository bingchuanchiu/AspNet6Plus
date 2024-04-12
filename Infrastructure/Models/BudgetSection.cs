using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class BudgetSection
    {
        public int BudgetSectionId { get; set; }
        public int? ContractsSectionId { get; set; }
        public int? UserId { get; set; }
        public DateTime? BudgetSectionSubmitsFundsApprovalDate { get; set; }
        public DateTime? BudgetSectionReceivesFundsApprovalDate { get; set; }
        public int? ExpectedDurationReceiptFundsApprovalDays { get; set; }
        public int? ActualDurationReceiptFundsApprovalDays { get; set; }
        public int? VarianceBetweenExpectedActualDurationBudgetSectionPaymentApprovalDays { get; set; }
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
    }
}
