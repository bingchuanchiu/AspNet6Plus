USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[ContractsSectionToContractorPaids]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractsSectionToContractorPaids](
	[contracts_section_to_contractor_paid_id] [int] IDENTITY(1,1) NOT NULL,
	[joc_toc_section2_id] [int] NULL,
	[user_id] [int] NULL,
	[recieves_monthly_requisition_joctoc_section_date] [date] NULL,
	[submits_requisition_acco_office_date] [date] NULL,
	[expected_duration_contracts_section_transmission_monthly_requisition_acco_days] [int] NULL,
	[actual_duration_contracts_section_transmission_monthly_requisition_acco_days] [int] NULL,
	[variance_between_expected_actual_duration_contracts_section_transmission_monthly_payment_acco_days] [int] NULL,
	[contractor_receives_monthly_payment_date] [date] NULL,
	[expected_duration_monthly_requisition_process_days] [int] NULL,
	[actual_duration_joc_section_submission_contract_section_contractor_paid_date] [int] NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_ContractsSectionToContractorPaids] PRIMARY KEY CLUSTERED 
(
	[contracts_section_to_contractor_paid_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContractsSectionToContractorPaids] ADD  CONSTRAINT [DF_ContractsSectionToContractorPaids_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[ContractsSectionToContractorPaids]  WITH CHECK ADD  CONSTRAINT [FK_ContractsSectionToContractorPaids_JocTocSections2] FOREIGN KEY([joc_toc_section2_id])
REFERENCES [dbo].[JocTocSections2] ([joc_toc_section2_id])
GO
ALTER TABLE [dbo].[ContractsSectionToContractorPaids] CHECK CONSTRAINT [FK_ContractsSectionToContractorPaids_JocTocSections2]
GO
ALTER TABLE [dbo].[ContractsSectionToContractorPaids]  WITH CHECK ADD  CONSTRAINT [FK_ContractsSectionToContractorPaids_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[ContractsSectionToContractorPaids] CHECK CONSTRAINT [FK_ContractsSectionToContractorPaids_ReturnedToSections]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'this is a calculated money value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractsSectionToContractorPaids', @level2type=N'COLUMN',@level2name=N'actual_duration_joc_section_submission_contract_section_contractor_paid_date'
GO
