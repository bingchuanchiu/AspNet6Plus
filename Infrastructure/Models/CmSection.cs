using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class CmSection
    {
        public CmSection()
        {
            CommentLogs = new HashSet<CommentLog>();
            JocTocSections1s = new HashSet<JocTocSections1>();
        }

        public int CmSectionId { get; set; }
        public int CmConsultantId { get; set; }
        public int? UserId { get; set; }
        public DateTime? CmConsultantReceivesPencilCopyDate { get; set; }
        public DateTime? CmConsultantApprovesPencilCopyDate { get; set; }
        public int? ExpectedDurationCmConsultantPencilCopyApprovalDays { get; set; }
        public int? ActualDurationCmConsultantPencilCopyApprovalDays { get; set; }
        public int? VarianceBetweenExpectedActualDurationPencilCopyApprovalDays { get; set; }
        public DateTime? CmConsultantReceivesPaymentRequestDate { get; set; }
        public DateTime? CmConsultantApprovesPaymentRequestDate { get; set; }
        public int? ExpectedDurationCmConsultantPaymentApprovalDays { get; set; }
        public int? ActualDurationCmConsultantPaymentApprovalDays { get; set; }
        public int? VarianceBetweenExpectedActualDurationCmConsultantPaymentApprovalDays { get; set; }
        public DateTime? BwtCmSectionReceivesPaymentRequestDate { get; set; }
        public DateTime? BwtCmSectionApprovesPaymentRequestDate { get; set; }
        public int? ExpectedDurationCmSectionPaymentApprovalDays { get; set; }
        public int? ActualDurationCmSectionPaymentApprovalDays { get; set; }
        public int? VarianceBetweenExpectedActualDurationCmSectionPaymentApprovalDays { get; set; }
        public DateTime? DeadlineDays { get; set; }
        public int? ReturnedToSectionId { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? RemovedAt { get; set; }
        public int? RemovedBy { get; set; }

        public virtual CmConsultant CmConsultant { get; set; }
        public virtual ReturnedToSection ReturnedToSection { get; set; }
        public virtual ICollection<CommentLog> CommentLogs { get; set; }
        public virtual ICollection<JocTocSections1> JocTocSections1s { get; set; }
    }
}
