USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[JocTocSections1]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JocTocSections1](
	[joc_toc_section1_id] [int] NOT NULL,
	[cm_section_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[joc_toc_section_receives_payment_request_date] [date] NULL,
	[joc_toc_section_approves_payment_request_date] [date] NULL,
	[expected_duration_joc_toc_section_payment_approval_days] [int] NULL,
	[actual_duration_joc_toc_section_payment_approval_days] [int] NULL,
	[variance_between_expected_actual_duration_of_cm_section_payment_approval_days] [int] NULL,
	[joc_toc_section_notifies_contractor_include_monthly_requisition_date] [date] NULL,
	[joc_toc_section_notifies_budget_section_submit_funds_approval_date] [date] NULL,
	[requesting_payment_period_begin_date] [date] NULL,
	[requesting_payment_period_end_date] [date] NULL,
	[monthly_payment_requisition_number] [nvarchar](50) NULL,
	[anticipated_submission_date_expense_date] [date] NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_JocTocSections1] PRIMARY KEY CLUSTERED 
(
	[joc_toc_section1_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[JocTocSections1] ADD  CONSTRAINT [DF_JocTocSections1_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[JocTocSections1]  WITH CHECK ADD  CONSTRAINT [FK_JocTocSections1_CmSections] FOREIGN KEY([cm_section_id])
REFERENCES [dbo].[CmSections] ([cm_section_id])
GO
ALTER TABLE [dbo].[JocTocSections1] CHECK CONSTRAINT [FK_JocTocSections1_CmSections]
GO
ALTER TABLE [dbo].[JocTocSections1]  WITH CHECK ADD  CONSTRAINT [FK_JocTocSections1_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[JocTocSections1] CHECK CONSTRAINT [FK_JocTocSections1_ReturnedToSections]
GO
