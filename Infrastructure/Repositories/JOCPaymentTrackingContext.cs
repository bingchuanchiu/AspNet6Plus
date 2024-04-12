using System;
using System.IO;
using Infrastructure.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Newtonsoft.Json.Linq;

#nullable disable

namespace Infrastructure.Repositories
{
    public partial class JOCPaymentTrackingContext : DbContext
    {
        public JOCPaymentTrackingContext()
        {
        }

        public JOCPaymentTrackingContext(DbContextOptions<JOCPaymentTrackingContext> options)
            : base(options)
        {
        }

        public virtual DbSet<BudgetSection> BudgetSections { get; set; }
        public virtual DbSet<CellCarrier> CellCarriers { get; set; }
        public virtual DbSet<CmConsultant> CmConsultants { get; set; }
        public virtual DbSet<CmSection> CmSections { get; set; }
        public virtual DbSet<CommentLog> CommentLogs { get; set; }
        public virtual DbSet<ConfirmatonCode> ConfirmatonCodes { get; set; }
        public virtual DbSet<Contract> Contracts { get; set; }
        public virtual DbSet<Contractor> Contractors { get; set; }
        public virtual DbSet<ContractsSection> ContractsSections { get; set; }
        public virtual DbSet<ContractsSectionToContractorPaid> ContractsSectionToContractorPaids { get; set; }
        public virtual DbSet<Dblog> Dblogs { get; set; }
        public virtual DbSet<EmailLog> EmailLogs { get; set; }
        public virtual DbSet<ExceptionLog> ExceptionLogs { get; set; }
        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<GroupAssignedOu> GroupAssignedOus { get; set; }
        public virtual DbSet<GroupAssignedRole> GroupAssignedRoles { get; set; }
        public virtual DbSet<GroupType> GroupTypes { get; set; }
        public virtual DbSet<Invoice> Invoices { get; set; }
        public virtual DbSet<InvoiceStatusType> InvoiceStatusTypes { get; set; }
        public virtual DbSet<InvoiceType> InvoiceTypes { get; set; }
        public virtual DbSet<JobOrder> JobOrders { get; set; }
        public virtual DbSet<JobOrderStatusType> JobOrderStatusTypes { get; set; }
        public virtual DbSet<JocTocSections1> JocTocSections1s { get; set; }
        public virtual DbSet<JocTocSections2> JocTocSections2s { get; set; }
        public virtual DbSet<LineH> LineHs { get; set; }
        public virtual DbSet<LineHdocument> LineHdocuments { get; set; }
        public virtual DbSet<Ou> Ous { get; set; }
        public virtual DbSet<OuassignedRole> OuassignedRoles { get; set; }
        public virtual DbSet<Password> Passwords { get; set; }
        public virtual DbSet<Permission> Permissions { get; set; }
        public virtual DbSet<Plant> Plants { get; set; }
        public virtual DbSet<PlantArea> PlantAreas { get; set; }
        public virtual DbSet<ReturnedToSection> ReturnedToSections { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<RoleAssignedPermission> RoleAssignedPermissions { get; set; }
        public virtual DbSet<SectionType> SectionTypes { get; set; }
        public virtual DbSet<Setting> Settings { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserAssignedCellCarrier> UserAssignedCellCarriers { get; set; }
        public virtual DbSet<UserAssignedGroup> UserAssignedGroups { get; set; }
        public virtual DbSet<UserAssignedRole> UserAssignedRoles { get; set; }
        public virtual DbSet<UserLog> UserLogs { get; set; }
        public virtual DbSet<UserOu> UserOus { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                // optionsBuilder.UseSqlServer("Server=lfkbwtstgsql01;Database=JOCPaymentTrackingDbDev;user id=JptUser; password=HJMqcVEZZmWL;Trusted_Connection=True;");

                //var myJsonString = File.ReadAllText("../Infrastructure/appsettings.json");


                string myJsonString = "";
                
                if (File.Exists("appsettings.json")) {
                    myJsonString = File.ReadAllText("appsettings.json");
                } 
                else if (File.Exists("../Infrastructure/appsettings.json")) {
                    myJsonString = File.ReadAllText("../Infrastructure/appsettings.json");
                }
                else if (File.Exists("../appsettings.json"))
                {
                    myJsonString = File.ReadAllText("../appsettings.json");
                }
                else
                {
                    myJsonString = "Server=lfkbwtstgsql01;Database=JOCPaymentTrackingDbDev;user id=JptUser; password=HJMqcVEZZmWL;Trusted_Connection=True;";
                }

                var myJObject = JObject.Parse(myJsonString);

                optionsBuilder.UseSqlServer(myJObject.SelectToken("ConnectionStrings").SelectToken("DevConnection").ToString());
                }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<BudgetSection>(entity =>
            {
                entity.Property(e => e.BudgetSectionId).HasColumnName("budget_section_id");

                entity.Property(e => e.ActualDurationReceiptFundsApprovalDays).HasColumnName("actual_duration_receipt_funds_approval_days");

                entity.Property(e => e.BudgetSectionReceivesFundsApprovalDate).HasColumnName("budget_section_receives_funds_approval_date");

                entity.Property(e => e.BudgetSectionSubmitsFundsApprovalDate).HasColumnName("budget_section_submits_funds_approval_date");

                entity.Property(e => e.ContractsSectionId).HasColumnName("contracts_section_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.DeadlineDays).HasColumnName("deadline_days");

                entity.Property(e => e.ExpectedDurationReceiptFundsApprovalDays).HasColumnName("expected_duration_receipt_funds_approval_days");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.ReturnedToSectionId).HasColumnName("returned_to_section_id");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.VarianceBetweenExpectedActualDurationBudgetSectionPaymentApprovalDays).HasColumnName("variance_between_expected_actual_duration_budget_section_payment_approval_days");

                entity.HasOne(d => d.ContractsSection)
                    .WithMany(p => p.BudgetSections)
                    .HasForeignKey(d => d.ContractsSectionId)
                    .HasConstraintName("FK_BudgetSections_ContractsSections");

                entity.HasOne(d => d.ReturnedToSection)
                    .WithMany(p => p.BudgetSections)
                    .HasForeignKey(d => d.ReturnedToSectionId)
                    .HasConstraintName("FK_BudgetSections_ReturnedToSections");
            });

            modelBuilder.Entity<CellCarrier>(entity =>
            {
                entity.Property(e => e.CellCarrierId).HasColumnName("cell_carrier_id");

                entity.Property(e => e.CellCarrierName)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("cell_carrier_name");

                entity.Property(e => e.SmsGateway)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("sms_gateway");

                entity.Property(e => e.SmsNotifications).HasColumnName("sms_notifications");
            });

            modelBuilder.Entity<CmConsultant>(entity =>
            {
                entity.Property(e => e.CmConsultantId).HasColumnName("cm_consultant_id");

                entity.Property(e => e.CmConsultantName)
                    .HasMaxLength(100)
                    .HasColumnName("cm_consultant_name");

                entity.Property(e => e.ContractorId).HasColumnName("contractor_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.DeadlineDays).HasColumnName("deadline_days");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.ReturnedToSectionId).HasColumnName("returned_to_section_id");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Contractor)
                    .WithMany(p => p.CmConsultants)
                    .HasForeignKey(d => d.ContractorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CmConsultants_Contractors");

                entity.HasOne(d => d.ReturnedToSection)
                    .WithMany(p => p.CmConsultants)
                    .HasForeignKey(d => d.ReturnedToSectionId)
                    .HasConstraintName("FK_CmConsultants_ReturnedToSections");
            });

            modelBuilder.Entity<CmSection>(entity =>
            {
                entity.Property(e => e.CmSectionId).HasColumnName("cm_section_id");

                entity.Property(e => e.ActualDurationCmConsultantPaymentApprovalDays).HasColumnName("actual_duration_cm_consultant_payment_approval_days");

                entity.Property(e => e.ActualDurationCmConsultantPencilCopyApprovalDays).HasColumnName("actual_duration_cm_consultant_pencil_copy_approval_days");

                entity.Property(e => e.ActualDurationCmSectionPaymentApprovalDays).HasColumnName("actual_duration_cm_section_payment_approval_days");

                entity.Property(e => e.BwtCmSectionApprovesPaymentRequestDate).HasColumnName("bwt_cm_section_approves_payment_request_date");

                entity.Property(e => e.BwtCmSectionReceivesPaymentRequestDate).HasColumnName("bwt_cm_section_receives_payment_request_date");

                entity.Property(e => e.CmConsultantApprovesPaymentRequestDate).HasColumnName("cm_consultant_approves_payment_request_date");

                entity.Property(e => e.CmConsultantApprovesPencilCopyDate).HasColumnName("cm_consultant_approves_pencil_copy_date");

                entity.Property(e => e.CmConsultantId).HasColumnName("cm_consultant_id");

                entity.Property(e => e.CmConsultantReceivesPaymentRequestDate).HasColumnName("cm_consultant_receives_payment_request_date");

                entity.Property(e => e.CmConsultantReceivesPencilCopyDate).HasColumnName("cm_consultant_receives_pencil_copy_date");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.DeadlineDays).HasColumnName("deadline_days");

                entity.Property(e => e.ExpectedDurationCmConsultantPaymentApprovalDays).HasColumnName("expected_duration_cm_consultant_payment_approval_days");

                entity.Property(e => e.ExpectedDurationCmConsultantPencilCopyApprovalDays).HasColumnName("expected_duration_cm_consultant_pencil_copy_approval_days");

                entity.Property(e => e.ExpectedDurationCmSectionPaymentApprovalDays).HasColumnName("expected_duration_cm_section_payment_approval_days");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.ReturnedToSectionId).HasColumnName("returned_to_section_id");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.VarianceBetweenExpectedActualDurationCmConsultantPaymentApprovalDays).HasColumnName("variance_between_expected_actual_duration_cm_consultant_payment_approval_days");

                entity.Property(e => e.VarianceBetweenExpectedActualDurationCmSectionPaymentApprovalDays).HasColumnName("variance_between_expected_actual_duration_cm_section_payment_approval_days");

                entity.Property(e => e.VarianceBetweenExpectedActualDurationPencilCopyApprovalDays).HasColumnName("variance_between_expected_actual_duration_pencil_copy_approval_days");

                entity.HasOne(d => d.CmConsultant)
                    .WithMany(p => p.CmSections)
                    .HasForeignKey(d => d.CmConsultantId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CmSections_CmConsultants");

                entity.HasOne(d => d.ReturnedToSection)
                    .WithMany(p => p.CmSections)
                    .HasForeignKey(d => d.ReturnedToSectionId)
                    .HasConstraintName("FK_CmSections_ReturnedToSections");
            });

            modelBuilder.Entity<CommentLog>(entity =>
            {
                entity.Property(e => e.CommentLogId).HasColumnName("comment_log_id");

                entity.Property(e => e.CmSectionId).HasColumnName("cm_section_id");

                entity.Property(e => e.Comment).HasColumnName("comment");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.HasOne(d => d.CmSection)
                    .WithMany(p => p.CommentLogs)
                    .HasForeignKey(d => d.CmSectionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CommentLogs_CmSections");
            });

            modelBuilder.Entity<ConfirmatonCode>(entity =>
            {
                entity.HasKey(e => e.ConfirmationCodeId);

                entity.Property(e => e.ConfirmationCodeId).HasColumnName("confirmation_code_id");

                entity.Property(e => e.Code)
                    .HasMaxLength(10)
                    .HasColumnName("code")
                    .IsFixedLength(true);

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(10)
                    .HasColumnName("type")
                    .IsFixedLength(true);

                entity.Property(e => e.Url)
                    .HasMaxLength(150)
                    .HasColumnName("url");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.ConfirmatonCodes)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ConfirmatonCodes_Users");
            });

            modelBuilder.Entity<Contract>(entity =>
            {
                entity.Property(e => e.ContractId).HasColumnName("contract_id");

                entity.Property(e => e.ContractNumber)
                    .HasMaxLength(100)
                    .HasColumnName("contract_number");

                entity.Property(e => e.ContractRegistrationNumber)
                    .HasMaxLength(100)
                    .HasColumnName("contract_registration_number");

                entity.Property(e => e.ContractorId).HasColumnName("contractor_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.HasOne(d => d.Contractor)
                    .WithMany(p => p.Contracts)
                    .HasForeignKey(d => d.ContractorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Contracts_Contractors");
            });

            modelBuilder.Entity<Contractor>(entity =>
            {
                entity.Property(e => e.ContractorId).HasColumnName("contractor_id");

                entity.Property(e => e.ContractorName)
                    .HasMaxLength(100)
                    .HasColumnName("contractor_name");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");
            });

            modelBuilder.Entity<ContractsSection>(entity =>
            {
                entity.Property(e => e.ContractsSectionId).HasColumnName("contracts_section_id");

                entity.Property(e => e.ContractorSubmittedUpdatedDocumentsDipDate)
                    .HasColumnType("date")
                    .HasColumnName("contractor_submitted_updated_documents_dip_date");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.DeadlineDays).HasColumnName("deadline_days");

                entity.Property(e => e.DipReceivedDate)
                    .HasColumnType("date")
                    .HasColumnName("dip_received_date");

                entity.Property(e => e.JocTocSection1Id).HasColumnName("joc_toc_section1_id");

                entity.Property(e => e.NotificationSentJoctocDate)
                    .HasColumnType("date")
                    .HasColumnName("notification_sent_joctoc_date");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.ReturnedToSectionId).HasColumnName("returned_to_section_id");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.JocTocSection1)
                    .WithMany(p => p.ContractsSections)
                    .HasForeignKey(d => d.JocTocSection1Id)
                    .HasConstraintName("FK_ContractsSections_JocTocSections1");

                entity.HasOne(d => d.ReturnedToSection)
                    .WithMany(p => p.ContractsSections)
                    .HasForeignKey(d => d.ReturnedToSectionId)
                    .HasConstraintName("FK_ContractsSections_ReturnedToSections");
            });

            modelBuilder.Entity<ContractsSectionToContractorPaid>(entity =>
            {
                entity.Property(e => e.ContractsSectionToContractorPaidId).HasColumnName("contracts_section_to_contractor_paid_id");

                entity.Property(e => e.ActualDurationContractsSectionTransmissionMonthlyRequisitionAccoDays).HasColumnName("actual_duration_contracts_section_transmission_monthly_requisition_acco_days");

                entity.Property(e => e.ActualDurationJocSectionSubmissionContractSectionContractorPaidDate)
                    .HasColumnName("actual_duration_joc_section_submission_contract_section_contractor_paid_date")
                    .HasComment("this is a calculated money value");

                entity.Property(e => e.ContractorReceivesMonthlyPaymentDate)
                    .HasColumnType("date")
                    .HasColumnName("contractor_receives_monthly_payment_date");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.DeadlineDays).HasColumnName("deadline_days");

                entity.Property(e => e.ExpectedDurationContractsSectionTransmissionMonthlyRequisitionAccoDays).HasColumnName("expected_duration_contracts_section_transmission_monthly_requisition_acco_days");

                entity.Property(e => e.ExpectedDurationMonthlyRequisitionProcessDays).HasColumnName("expected_duration_monthly_requisition_process_days");

                entity.Property(e => e.JocTocSection2Id).HasColumnName("joc_toc_section2_id");

                entity.Property(e => e.RecievesMonthlyRequisitionJoctocSectionDate)
                    .HasColumnType("date")
                    .HasColumnName("recieves_monthly_requisition_joctoc_section_date");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.ReturnedToSectionId).HasColumnName("returned_to_section_id");

                entity.Property(e => e.SubmitsRequisitionAccoOfficeDate)
                    .HasColumnType("date")
                    .HasColumnName("submits_requisition_acco_office_date");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.VarianceBetweenExpectedActualDurationContractsSectionTransmissionMonthlyPaymentAccoDays).HasColumnName("variance_between_expected_actual_duration_contracts_section_transmission_monthly_payment_acco_days");

                entity.HasOne(d => d.JocTocSection2)
                    .WithMany(p => p.ContractsSectionToContractorPaids)
                    .HasForeignKey(d => d.JocTocSection2Id)
                    .HasConstraintName("FK_ContractsSectionToContractorPaids_JocTocSections2");

                entity.HasOne(d => d.ReturnedToSection)
                    .WithMany(p => p.ContractsSectionToContractorPaids)
                    .HasForeignKey(d => d.ReturnedToSectionId)
                    .HasConstraintName("FK_ContractsSectionToContractorPaids_ReturnedToSections");
            });

            modelBuilder.Entity<Dblog>(entity =>
            {
                entity.ToTable("DBLogs");

                entity.Property(e => e.DbLogId).HasColumnName("db_log_id");

                entity.Property(e => e.ColumnName).HasColumnName("column_name");

                entity.Property(e => e.ColumnNewValue).HasColumnName("column_new_value");

                entity.Property(e => e.ColumnOldValue).HasColumnName("column_old_value");

                entity.Property(e => e.ColumnType).HasColumnName("column_type");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.TableName).HasColumnName("table_name");
            });

            modelBuilder.Entity<EmailLog>(entity =>
            {
                entity.Property(e => e.EmailLogId).HasColumnName("email_log_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.EmailAttachment).HasColumnName("email_attachment");

                entity.Property(e => e.EmailBcc).HasColumnName("email_bcc");

                entity.Property(e => e.EmailBody).HasColumnName("email_body");

                entity.Property(e => e.EmailCc).HasColumnName("email_cc");

                entity.Property(e => e.EmailFrom)
                    .HasMaxLength(150)
                    .HasColumnName("email_from");

                entity.Property(e => e.EmailSubject)
                    .HasMaxLength(150)
                    .HasColumnName("email_subject");

                entity.Property(e => e.EmailTo).HasColumnName("email_to");
            });

            modelBuilder.Entity<ExceptionLog>(entity =>
            {
                entity.Property(e => e.ExceptionLogId).HasColumnName("exception_log_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.InnerException).HasColumnName("inner_exception");

                entity.Property(e => e.Message).HasColumnName("message");

                entity.Property(e => e.StackTrace).HasColumnName("stack_trace");
            });

            modelBuilder.Entity<Group>(entity =>
            {
                entity.Property(e => e.GroupId).HasColumnName("group_id");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.DeletedAt).HasColumnName("deleted_at");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.DisplayName)
                    .HasMaxLength(100)
                    .HasColumnName("display_name");

                entity.Property(e => e.EmailNotifications).HasColumnName("email_notifications");

                entity.Property(e => e.Enabled).HasColumnName("enabled");

                entity.Property(e => e.GroupName)
                    .HasMaxLength(100)
                    .HasColumnName("group_name");

                entity.Property(e => e.GroupTypeId).HasColumnName("group_type_id");

                entity.Property(e => e.SmsNotifications).HasColumnName("sms_notifications");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.HasOne(d => d.GroupType)
                    .WithMany(p => p.Groups)
                    .HasForeignKey(d => d.GroupTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Groups_GroupTypes");
            });

            modelBuilder.Entity<GroupAssignedOu>(entity =>
            {
                entity.ToTable("GroupAssignedOUs");

                entity.Property(e => e.GroupAssignedOuId).HasColumnName("group_assigned_ou_id");

                entity.Property(e => e.Active).HasColumnName("active");

                entity.Property(e => e.GroupId).HasColumnName("group_id");

                entity.Property(e => e.OuId).HasColumnName("ou_id");

                entity.HasOne(d => d.Group)
                    .WithMany(p => p.GroupAssignedOus)
                    .HasForeignKey(d => d.GroupId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupAssignedOUs_Groups");

                entity.HasOne(d => d.Ou)
                    .WithMany(p => p.GroupAssignedOus)
                    .HasForeignKey(d => d.OuId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupAssignedOUs_OUs");
            });

            modelBuilder.Entity<GroupAssignedRole>(entity =>
            {
                entity.Property(e => e.GroupAssignedRoleId).HasColumnName("group_assigned_role_id");

                entity.Property(e => e.GroupId).HasColumnName("group_id");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.HasOne(d => d.Group)
                    .WithMany(p => p.GroupAssignedRoles)
                    .HasForeignKey(d => d.GroupId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupAssignedRoles_Groups");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.GroupAssignedRoles)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupAssignedRoles_Roles");
            });

            modelBuilder.Entity<GroupType>(entity =>
            {
                entity.Property(e => e.GroupTypeId).HasColumnName("group_type_id");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.GroupTypeName)
                    .HasMaxLength(100)
                    .HasColumnName("group_type_name");
            });

            modelBuilder.Entity<Invoice>(entity =>
            {
                entity.Property(e => e.InvoiceId).HasColumnName("invoice_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.InvoiceAmount)
                    .HasColumnType("money")
                    .HasColumnName("invoice_amount");

                entity.Property(e => e.InvoiceNumber)
                    .HasMaxLength(10)
                    .HasColumnName("invoice_number")
                    .IsFixedLength(true);

                entity.Property(e => e.InvoiceStatusTypeId).HasColumnName("invoice_status_type_id");

                entity.Property(e => e.InvoiceTypeId).HasColumnName("invoice_type_id");

                entity.Property(e => e.JobOrderId).HasColumnName("job_order_id");

                entity.Property(e => e.LineHId).HasColumnName("line_h_id");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.HasOne(d => d.InvoiceStatusType)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.InvoiceStatusTypeId)
                    .HasConstraintName("FK_Invoices_InvoiceStatusTypes");

                entity.HasOne(d => d.InvoiceType)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.InvoiceTypeId)
                    .HasConstraintName("FK_Invoices_InvoiceTypes");

                entity.HasOne(d => d.JobOrder)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.JobOrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Invoices_JobOrders");

                entity.HasOne(d => d.LineH)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.LineHId)
                    .HasConstraintName("FK_Invoices_LineH");
            });

            modelBuilder.Entity<InvoiceStatusType>(entity =>
            {
                entity.Property(e => e.InvoiceStatusTypeId).HasColumnName("invoice_status_type_id");

                entity.Property(e => e.InvoiceStatusTypeName)
                    .HasMaxLength(100)
                    .HasColumnName("invoice_status_type_name");
            });

            modelBuilder.Entity<InvoiceType>(entity =>
            {
                entity.Property(e => e.InvoiceTypeId)
                    .ValueGeneratedNever()
                    .HasColumnName("invoice_type_id");

                entity.Property(e => e.InvoiceTypeName)
                    .HasMaxLength(50)
                    .HasColumnName("invoice_type_name");
            });

            modelBuilder.Entity<JobOrder>(entity =>
            {
                entity.Property(e => e.JobOrderId).HasColumnName("job_order_id");

                entity.Property(e => e.ContractId).HasColumnName("contract_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.JobOrderNumber)
                    .HasMaxLength(100)
                    .HasColumnName("job_order_number");

                entity.Property(e => e.JobOrderStatusTypeId).HasColumnName("job_order_status_type_id");

                entity.Property(e => e.JobOrderTotalValue)
                    .HasColumnType("money")
                    .HasColumnName("job_order_total_value");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.HasOne(d => d.Contract)
                    .WithMany(p => p.JobOrders)
                    .HasForeignKey(d => d.ContractId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_JobOrders_Contracts");

                entity.HasOne(d => d.JobOrderStatusType)
                    .WithMany(p => p.JobOrders)
                    .HasForeignKey(d => d.JobOrderStatusTypeId)
                    .HasConstraintName("FK_JobOrders_JobOrderStatusTypes");
            });

            modelBuilder.Entity<JobOrderStatusType>(entity =>
            {
                entity.Property(e => e.JobOrderStatusTypeId).HasColumnName("job_order_status_type_id");

                entity.Property(e => e.JobOrderStatusTypeName)
                    .HasMaxLength(100)
                    .HasColumnName("job_order_status_type_name");
            });

            modelBuilder.Entity<JocTocSections1>(entity =>
            {
                entity.HasKey(e => e.JocTocSection1Id);

                entity.ToTable("JocTocSections1");

                entity.Property(e => e.JocTocSection1Id)
                    .ValueGeneratedNever()
                    .HasColumnName("joc_toc_section1_id");

                entity.Property(e => e.ActualDurationJocTocSectionPaymentApprovalDays).HasColumnName("actual_duration_joc_toc_section_payment_approval_days");

                entity.Property(e => e.AnticipatedSubmissionDateExpenseDate)
                    .HasColumnType("date")
                    .HasColumnName("anticipated_submission_date_expense_date");

                entity.Property(e => e.CmSectionId).HasColumnName("cm_section_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.DeadlineDays).HasColumnName("deadline_days");

                entity.Property(e => e.ExpectedDurationJocTocSectionPaymentApprovalDays).HasColumnName("expected_duration_joc_toc_section_payment_approval_days");

                entity.Property(e => e.JocTocSectionApprovesPaymentRequestDate)
                    .HasColumnType("date")
                    .HasColumnName("joc_toc_section_approves_payment_request_date");

                entity.Property(e => e.JocTocSectionNotifiesBudgetSectionSubmitFundsApprovalDate)
                    .HasColumnType("date")
                    .HasColumnName("joc_toc_section_notifies_budget_section_submit_funds_approval_date");

                entity.Property(e => e.JocTocSectionNotifiesContractorIncludeMonthlyRequisitionDate)
                    .HasColumnType("date")
                    .HasColumnName("joc_toc_section_notifies_contractor_include_monthly_requisition_date");

                entity.Property(e => e.JocTocSectionReceivesPaymentRequestDate)
                    .HasColumnType("date")
                    .HasColumnName("joc_toc_section_receives_payment_request_date");

                entity.Property(e => e.MonthlyPaymentRequisitionNumber)
                    .HasMaxLength(50)
                    .HasColumnName("monthly_payment_requisition_number");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.RequestingPaymentPeriodBeginDate)
                    .HasColumnType("date")
                    .HasColumnName("requesting_payment_period_begin_date");

                entity.Property(e => e.RequestingPaymentPeriodEndDate)
                    .HasColumnType("date")
                    .HasColumnName("requesting_payment_period_end_date");

                entity.Property(e => e.ReturnedToSectionId).HasColumnName("returned_to_section_id");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.VarianceBetweenExpectedActualDurationOfCmSectionPaymentApprovalDays).HasColumnName("variance_between_expected_actual_duration_of_cm_section_payment_approval_days");

                entity.HasOne(d => d.CmSection)
                    .WithMany(p => p.JocTocSections1s)
                    .HasForeignKey(d => d.CmSectionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_JocTocSections1_CmSections");

                entity.HasOne(d => d.ReturnedToSection)
                    .WithMany(p => p.JocTocSections1s)
                    .HasForeignKey(d => d.ReturnedToSectionId)
                    .HasConstraintName("FK_JocTocSections1_ReturnedToSections");
            });

            modelBuilder.Entity<JocTocSections2>(entity =>
            {
                entity.HasKey(e => e.JocTocSection2Id);

                entity.ToTable("JocTocSections2");

                entity.Property(e => e.JocTocSection2Id).HasColumnName("joc_toc_section2_id");

                entity.Property(e => e.ActualDurationJoctocSectionTransmissionMonthlyRequisitionContractsSectionDays).HasColumnName("actual_duration_joctoc_section_transmission_monthly_requisition_contracts_section_days");

                entity.Property(e => e.ContractsSectionId).HasColumnName("contracts_section_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.DeadlineDays).HasColumnName("deadline_days");

                entity.Property(e => e.PaymentReturnedDateContractorDate)
                    .HasColumnType("date")
                    .HasColumnName("payment_returned_date_contractor_date");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.ReturnedToSectionId).HasColumnName("returned_to_section_id");

                entity.Property(e => e.TransmitsMonthlyRequisitionContractsSectionDate)
                    .HasColumnType("date")
                    .HasColumnName("transmits_monthly_requisition_contracts_section_date");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.VarianceBetweenExpectedActualDurationJoctocSectionTransmissionMonthlyPaymentDays).HasColumnName("variance_between_expected_actual_duration_joctoc_section_transmission_monthly_payment_days");

                entity.HasOne(d => d.ContractsSection)
                    .WithMany(p => p.JocTocSections2s)
                    .HasForeignKey(d => d.ContractsSectionId)
                    .HasConstraintName("FK_JocTocSections2_ContractsSections");

                entity.HasOne(d => d.ReturnedToSection)
                    .WithMany(p => p.JocTocSections2s)
                    .HasForeignKey(d => d.ReturnedToSectionId)
                    .HasConstraintName("FK_JocTocSections2_ReturnedToSections");
            });

            modelBuilder.Entity<LineH>(entity =>
            {
                entity.ToTable("LineH");

                entity.Property(e => e.LineHId).HasColumnName("line_h_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.LineHDecreaseAmount)
                    .HasColumnType("money")
                    .HasColumnName("line_h_decrease_amount");

                entity.Property(e => e.LineHIncreaseAmount)
                    .HasColumnType("money")
                    .HasColumnName("line_h_increase_amount");

                entity.Property(e => e.LineHName)
                    .HasMaxLength(50)
                    .HasColumnName("line_h_name");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");
            });

            modelBuilder.Entity<LineHdocument>(entity =>
            {
                entity.ToTable("LineHDocuments");

                entity.Property(e => e.LineHDocumentId).HasColumnName("line_h_document_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.FileBinary).HasColumnName("file_binary");

                entity.Property(e => e.FileLocation).HasColumnName("file_location");

                entity.Property(e => e.FileName)
                    .HasMaxLength(50)
                    .HasColumnName("file_name");

                entity.Property(e => e.FileSize)
                    .HasMaxLength(10)
                    .HasColumnName("file_size");

                entity.Property(e => e.FileType)
                    .HasMaxLength(4)
                    .HasColumnName("file_type")
                    .IsFixedLength(true);

                entity.Property(e => e.LineHId).HasColumnName("line_h_id");

                entity.Property(e => e.RemovedAt).HasColumnName("removed_at");

                entity.Property(e => e.RemovedBy).HasColumnName("removed_by");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.HasOne(d => d.LineH)
                    .WithMany(p => p.LineHdocuments)
                    .HasForeignKey(d => d.LineHId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_LineHDocuments_LineH");
            });

            modelBuilder.Entity<Ou>(entity =>
            {
                entity.ToTable("OUs");

                entity.Property(e => e.OuId).HasColumnName("ou_id");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.OuName).HasColumnName("ou_name");

                entity.Property(e => e.Type)
                    .HasMaxLength(5)
                    .HasColumnName("type")
                    .IsFixedLength(true)
                    .HasComment("group | role");
            });

            modelBuilder.Entity<OuassignedRole>(entity =>
            {
                entity.ToTable("OUAssignedRoles");

                entity.Property(e => e.OuAssignedRoleId).HasColumnName("ou_assigned_role_id");

                entity.Property(e => e.OuId).HasColumnName("ou_id");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.HasOne(d => d.Ou)
                    .WithMany(p => p.OuassignedRoles)
                    .HasForeignKey(d => d.OuId)
                    .HasConstraintName("FK_OUAssignedRoles_OUs");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.OuassignedRoles)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_OUAssignedRoles_Roles");
            });

            modelBuilder.Entity<Password>(entity =>
            {
                entity.Property(e => e.PasswordId).HasColumnName("password_id");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.NeverExpires).HasColumnName("never_expires");

                entity.Property(e => e.PasswordSecret).HasColumnName("password_secret");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Passwords)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Passwords_Users");
            });

            modelBuilder.Entity<Permission>(entity =>
            {
                entity.Property(e => e.PermissionId).HasColumnName("permission_id");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.DisplayName)
                    .HasMaxLength(100)
                    .HasColumnName("display_name");

                entity.Property(e => e.PermissionName)
                    .HasMaxLength(100)
                    .HasColumnName("permission_name");

                entity.Property(e => e.TableName)
                    .HasMaxLength(100)
                    .HasColumnName("table_name");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");
            });

            modelBuilder.Entity<Plant>(entity =>
            {
                entity.Property(e => e.PlantId).HasColumnName("plant_id");

                entity.Property(e => e.Address).HasColumnName("address");

                entity.Property(e => e.Heading).HasColumnName("heading");

                entity.Property(e => e.Height).HasColumnName("height");

                entity.Property(e => e.HopperSize).HasColumnName("hopper_size");

                entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");

                entity.Property(e => e.IsDewatering).HasColumnName("is_dewatering");

                entity.Property(e => e.Latitude).HasColumnName("latitude");

                entity.Property(e => e.Longitude).HasColumnName("longitude");

                entity.Property(e => e.Pitch).HasColumnName("pitch");

                entity.Property(e => e.PlantName).HasColumnName("plant_name");

                entity.Property(e => e.PlantNumber).HasColumnName("plant_number");

                entity.Property(e => e.Roll).HasColumnName("roll");
            });

            modelBuilder.Entity<PlantArea>(entity =>
            {
                entity.Property(e => e.PlantAreaId).HasColumnName("plant_area_id");

                entity.Property(e => e.PlantAreaName).HasColumnName("plant_area_name");

                entity.Property(e => e.PlantId).HasColumnName("plant_id");

                entity.HasOne(d => d.Plant)
                    .WithMany(p => p.PlantAreas)
                    .HasForeignKey(d => d.PlantId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlantAreas_Plants");
            });

            modelBuilder.Entity<ReturnedToSection>(entity =>
            {
                entity.Property(e => e.ReturnedToSectionId).HasColumnName("returned_to_section_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.CurrentSectionId).HasColumnName("current_section_id");

                entity.Property(e => e.ReturnedComment)
                    .HasMaxLength(150)
                    .HasColumnName("returned_comment");

                entity.Property(e => e.ReturnedDate).HasColumnName("returned_date");

                entity.Property(e => e.ReturnedDesdinationSectionId).HasColumnName("returned_desdination_section_id");

                entity.Property(e => e.ReturnedFromSectionId).HasColumnName("returned_from_section_id");

                entity.HasOne(d => d.CurrentSection)
                    .WithMany(p => p.ReturnedToSectionCurrentSections)
                    .HasForeignKey(d => d.CurrentSectionId)
                    .HasConstraintName("FK_ReturnedToSections_SectionTypes");

                entity.HasOne(d => d.ReturnedDesdinationSection)
                    .WithMany(p => p.ReturnedToSectionReturnedDesdinationSections)
                    .HasForeignKey(d => d.ReturnedDesdinationSectionId)
                    .HasConstraintName("FK_ReturnedToSections_SectionTypes1");

                entity.HasOne(d => d.ReturnedFromSection)
                    .WithMany(p => p.ReturnedToSectionReturnedFromSections)
                    .HasForeignKey(d => d.ReturnedFromSectionId)
                    .HasConstraintName("FK_ReturnedToSections_SectionTypes2");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.DeletedAt).HasColumnName("deleted_at");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.DisplayName)
                    .HasMaxLength(100)
                    .HasColumnName("display_name");

                entity.Property(e => e.RoleName)
                    .HasMaxLength(100)
                    .HasColumnName("role_name");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");
            });

            modelBuilder.Entity<RoleAssignedPermission>(entity =>
            {
                entity.Property(e => e.RoleAssignedPermissionId).HasColumnName("role_assigned_permission_id");

                entity.Property(e => e.PermissionId).HasColumnName("permission_id");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.RoleAssignedPermissions)
                    .HasForeignKey(d => d.PermissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RoleAssignedPermissions_Permissions");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.RoleAssignedPermissions)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RoleAssignedPermissions_Roles");
            });

            modelBuilder.Entity<SectionType>(entity =>
            {
                entity.Property(e => e.SectionTypeId).HasColumnName("section_type_id");

                entity.Property(e => e.SectionTypeName)
                    .HasMaxLength(100)
                    .HasColumnName("section_type_name");
            });

            modelBuilder.Entity<Setting>(entity =>
            {
                entity.Property(e => e.SettingId).HasColumnName("setting_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.DisplayName)
                    .HasMaxLength(50)
                    .HasColumnName("display_name");

                entity.Property(e => e.SettingName)
                    .HasMaxLength(50)
                    .HasColumnName("setting_name");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.Property(e => e.Value).HasColumnName("value");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.Email)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("email");

                entity.Property(e => e.EmailNotifications).HasColumnName("email_notifications");

                entity.Property(e => e.Emplid)
                    .HasMaxLength(8)
                    .IsUnicode(false)
                    .HasColumnName("emplid")
                    .IsFixedLength(true);

                entity.Property(e => e.Firstname)
                    .HasMaxLength(100)
                    .HasColumnName("firstname");

                entity.Property(e => e.IsDisabled).HasColumnName("is_disabled");

                entity.Property(e => e.Lastname)
                    .HasMaxLength(100)
                    .HasColumnName("lastname");

                entity.Property(e => e.LdapWhenChanged).HasColumnName("ldap_whenChanged");

                entity.Property(e => e.LdapWhenCreated).HasColumnName("ldap_whenCreated");

                entity.Property(e => e.LockoutTime).HasColumnName("lockout_time");

                entity.Property(e => e.Thumbnail)
                    .IsUnicode(false)
                    .HasColumnName("thumbnail");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.Property(e => e.UserTypeId).HasColumnName("user_type_id");

                entity.Property(e => e.Username)
                    .HasMaxLength(100)
                    .HasColumnName("username");
            });

            modelBuilder.Entity<UserAssignedCellCarrier>(entity =>
            {
                entity.Property(e => e.UserAssignedCellCarrierId).HasColumnName("user_assigned_cell_carrier_id");

                entity.Property(e => e.Active).HasColumnName("active");

                entity.Property(e => e.CellCarrierId).HasColumnName("cell_carrier_id");

                entity.Property(e => e.Cellphone)
                    .IsRequired()
                    .HasMaxLength(15)
                    .HasColumnName("cellphone");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.CellCarrier)
                    .WithMany(p => p.UserAssignedCellCarriers)
                    .HasForeignKey(d => d.CellCarrierId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserAssignedCellCarriers_CellCarriers1");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserAssignedCellCarriers)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserAssignedCellCarriers_Users");
            });

            modelBuilder.Entity<UserAssignedGroup>(entity =>
            {
                entity.Property(e => e.UserAssignedGroupId).HasColumnName("user_assigned_group_id");

                entity.Property(e => e.GroupId).HasColumnName("group_id");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Group)
                    .WithMany(p => p.UserAssignedGroups)
                    .HasForeignKey(d => d.GroupId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserAssignedGroups_Groups");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserAssignedGroups)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserAssignedGroups_Users");
            });

            modelBuilder.Entity<UserAssignedRole>(entity =>
            {
                entity.Property(e => e.UserAssignedRoleId).HasColumnName("user_assigned_role_id");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.UserAssignedRoles)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserAssignedRoles_Roles");
            });

            modelBuilder.Entity<UserLog>(entity =>
            {
                entity.Property(e => e.UserLogId).HasColumnName("user_log_id");

                entity.Property(e => e.Action)
                    .HasMaxLength(50)
                    .HasColumnName("action");

                entity.Property(e => e.ClientIp).HasColumnName("client_ip");

                entity.Property(e => e.Controller)
                    .HasMaxLength(50)
                    .HasColumnName("controller");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.Message).HasColumnName("message");

                entity.Property(e => e.UrlCurrent).HasColumnName("url_current");

                entity.Property(e => e.UrlReferral).HasColumnName("url_referral");

                entity.Property(e => e.UserAgent).HasColumnName("user_agent");
            });

            modelBuilder.Entity<UserOu>(entity =>
            {
                entity.ToTable("UserOUs");

                entity.Property(e => e.UserOuId).HasColumnName("user_ou_id");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.OuName).HasColumnName("ou_name");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserOus)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserOUs_Users");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
