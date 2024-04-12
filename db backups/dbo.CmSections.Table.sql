USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[CmSections]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CmSections](
	[cm_section_id] [int] IDENTITY(1,1) NOT NULL,
	[cm_consultant_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[cm_consultant_receives_pencil_copy_date] [datetime2](7) NULL,
	[cm_consultant_approves_pencil_copy_date] [datetime2](7) NULL,
	[expected_duration_cm_consultant_pencil_copy_approval_days] [int] NULL,
	[actual_duration_cm_consultant_pencil_copy_approval_days] [int] NULL,
	[variance_between_expected_actual_duration_pencil_copy_approval_days] [int] NULL,
	[cm_consultant_receives_payment_request_date] [datetime2](7) NULL,
	[cm_consultant_approves_payment_request_date] [datetime2](7) NULL,
	[expected_duration_cm_consultant_payment_approval_days] [int] NULL,
	[actual_duration_cm_consultant_payment_approval_days] [int] NULL,
	[variance_between_expected_actual_duration_cm_consultant_payment_approval_days] [int] NULL,
	[bwt_cm_section_receives_payment_request_date] [datetime2](7) NULL,
	[bwt_cm_section_approves_payment_request_date] [datetime2](7) NULL,
	[expected_duration_cm_section_payment_approval_days] [int] NULL,
	[actual_duration_cm_section_payment_approval_days] [int] NULL,
	[variance_between_expected_actual_duration_cm_section_payment_approval_days] [int] NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_CmSections] PRIMARY KEY CLUSTERED 
(
	[cm_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CmSections] ADD  CONSTRAINT [DF_CmSections_created_at_1]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[CmSections]  WITH CHECK ADD  CONSTRAINT [FK_CmSections_CmConsultants] FOREIGN KEY([cm_consultant_id])
REFERENCES [dbo].[CmConsultants] ([cm_consultant_id])
GO
ALTER TABLE [dbo].[CmSections] CHECK CONSTRAINT [FK_CmSections_CmConsultants]
GO
ALTER TABLE [dbo].[CmSections]  WITH CHECK ADD  CONSTRAINT [FK_CmSections_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[CmSections] CHECK CONSTRAINT [FK_CmSections_ReturnedToSections]
GO
