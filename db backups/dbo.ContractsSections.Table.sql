USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[ContractsSections]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractsSections](
	[contracts_section_id] [int] IDENTITY(1,1) NOT NULL,
	[joc_toc_section1_id] [int] NULL,
	[user_id] [int] NULL,
	[dip_received_date] [date] NULL,
	[notification_sent_joctoc_date] [date] NULL,
	[contractor_submitted_updated_documents_dip_date] [date] NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_ContractsSections] PRIMARY KEY CLUSTERED 
(
	[contracts_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContractsSections] ADD  CONSTRAINT [DF_ContractsSections_created_at_1]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[ContractsSections]  WITH CHECK ADD  CONSTRAINT [FK_ContractsSections_JocTocSections1] FOREIGN KEY([joc_toc_section1_id])
REFERENCES [dbo].[JocTocSections1] ([joc_toc_section1_id])
GO
ALTER TABLE [dbo].[ContractsSections] CHECK CONSTRAINT [FK_ContractsSections_JocTocSections1]
GO
ALTER TABLE [dbo].[ContractsSections]  WITH CHECK ADD  CONSTRAINT [FK_ContractsSections_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[ContractsSections] CHECK CONSTRAINT [FK_ContractsSections_ReturnedToSections]
GO
