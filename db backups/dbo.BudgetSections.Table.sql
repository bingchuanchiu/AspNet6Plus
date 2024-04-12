USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[BudgetSections]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BudgetSections](
	[budget_section_id] [int] IDENTITY(1,1) NOT NULL,
	[contracts_section_id] [int] NULL,
	[user_id] [int] NULL,
	[budget_section_submits_funds_approval_date] [datetime2](7) NULL,
	[budget_section_receives_funds_approval_date] [datetime2](7) NULL,
	[expected_duration_receipt_funds_approval_days] [int] NULL,
	[actual_duration_receipt_funds_approval_days] [int] NULL,
	[variance_between_expected_actual_duration_budget_section_payment_approval_days] [int] NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_BudgetSections] PRIMARY KEY CLUSTERED 
(
	[budget_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BudgetSections] ADD  CONSTRAINT [DF_BudgetSections_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[BudgetSections]  WITH CHECK ADD  CONSTRAINT [FK_BudgetSections_ContractsSections] FOREIGN KEY([contracts_section_id])
REFERENCES [dbo].[ContractsSections] ([contracts_section_id])
GO
ALTER TABLE [dbo].[BudgetSections] CHECK CONSTRAINT [FK_BudgetSections_ContractsSections]
GO
ALTER TABLE [dbo].[BudgetSections]  WITH CHECK ADD  CONSTRAINT [FK_BudgetSections_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[BudgetSections] CHECK CONSTRAINT [FK_BudgetSections_ReturnedToSections]
GO
