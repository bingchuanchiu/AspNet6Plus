USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[JocTocSections2]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JocTocSections2](
	[joc_toc_section2_id] [int] IDENTITY(1,1) NOT NULL,
	[contracts_section_id] [int] NULL,
	[user_id] [int] NULL,
	[payment_returned_date_contractor_date] [date] NULL,
	[transmits_monthly_requisition_contracts_section_date] [date] NULL,
	[actual_duration_joctoc_section_transmission_monthly_requisition_contracts_section_days] [int] NULL,
	[variance_between_expected_actual_duration_joctoc_section_transmission_monthly_payment_days] [int] NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_JocTocSections2] PRIMARY KEY CLUSTERED 
(
	[joc_toc_section2_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[JocTocSections2] ADD  CONSTRAINT [DF_JocTocSections2_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[JocTocSections2]  WITH CHECK ADD  CONSTRAINT [FK_JocTocSections2_ContractsSections] FOREIGN KEY([contracts_section_id])
REFERENCES [dbo].[ContractsSections] ([contracts_section_id])
GO
ALTER TABLE [dbo].[JocTocSections2] CHECK CONSTRAINT [FK_JocTocSections2_ContractsSections]
GO
ALTER TABLE [dbo].[JocTocSections2]  WITH CHECK ADD  CONSTRAINT [FK_JocTocSections2_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[JocTocSections2] CHECK CONSTRAINT [FK_JocTocSections2_ReturnedToSections]
GO
