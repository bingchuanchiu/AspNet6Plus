USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[CommentLogs]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentLogs](
	[comment_log_id] [int] IDENTITY(1,1) NOT NULL,
	[cm_section_id] [int] NOT NULL,
	[comment] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
 CONSTRAINT [PK_CommentLogs] PRIMARY KEY CLUSTERED 
(
	[comment_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CommentLogs] ADD  CONSTRAINT [DF_CommentLogs_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[CommentLogs]  WITH CHECK ADD  CONSTRAINT [FK_CommentLogs_CmSections] FOREIGN KEY([cm_section_id])
REFERENCES [dbo].[CmSections] ([cm_section_id])
GO
ALTER TABLE [dbo].[CommentLogs] CHECK CONSTRAINT [FK_CommentLogs_CmSections]
GO
