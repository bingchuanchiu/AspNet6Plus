USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[ReturnedToSections]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnedToSections](
	[returned_to_section_id] [int] IDENTITY(1,1) NOT NULL,
	[returned_date] [datetime2](7) NULL,
	[current_section_id] [int] NULL,
	[returned_desdination_section_id] [int] NULL,
	[returned_from_section_id] [int] NULL,
	[returned_comment] [nvarchar](150) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
 CONSTRAINT [PK_ReturnedToSections] PRIMARY KEY CLUSTERED 
(
	[returned_to_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReturnedToSections] ADD  CONSTRAINT [DF_ReturnedToSections_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[ReturnedToSections]  WITH CHECK ADD  CONSTRAINT [FK_ReturnedToSections_SectionTypes] FOREIGN KEY([current_section_id])
REFERENCES [dbo].[SectionTypes] ([section_type_id])
GO
ALTER TABLE [dbo].[ReturnedToSections] CHECK CONSTRAINT [FK_ReturnedToSections_SectionTypes]
GO
ALTER TABLE [dbo].[ReturnedToSections]  WITH CHECK ADD  CONSTRAINT [FK_ReturnedToSections_SectionTypes1] FOREIGN KEY([returned_desdination_section_id])
REFERENCES [dbo].[SectionTypes] ([section_type_id])
GO
ALTER TABLE [dbo].[ReturnedToSections] CHECK CONSTRAINT [FK_ReturnedToSections_SectionTypes1]
GO
ALTER TABLE [dbo].[ReturnedToSections]  WITH CHECK ADD  CONSTRAINT [FK_ReturnedToSections_SectionTypes2] FOREIGN KEY([returned_from_section_id])
REFERENCES [dbo].[SectionTypes] ([section_type_id])
GO
ALTER TABLE [dbo].[ReturnedToSections] CHECK CONSTRAINT [FK_ReturnedToSections_SectionTypes2]
GO
