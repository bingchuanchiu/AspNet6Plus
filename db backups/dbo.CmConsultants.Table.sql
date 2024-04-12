USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[CmConsultants]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CmConsultants](
	[cm_consultant_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[contractor_id] [int] NOT NULL,
	[cm_consultant_name] [nvarchar](100) NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_CmConsultants] PRIMARY KEY CLUSTERED 
(
	[cm_consultant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CmConsultants] ADD  CONSTRAINT [DF_CmConsultants_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[CmConsultants]  WITH CHECK ADD  CONSTRAINT [FK_CmConsultants_Contractors] FOREIGN KEY([contractor_id])
REFERENCES [dbo].[Contractors] ([contractor_id])
GO
ALTER TABLE [dbo].[CmConsultants] CHECK CONSTRAINT [FK_CmConsultants_Contractors]
GO
ALTER TABLE [dbo].[CmConsultants]  WITH CHECK ADD  CONSTRAINT [FK_CmConsultants_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[CmConsultants] CHECK CONSTRAINT [FK_CmConsultants_ReturnedToSections]
GO
