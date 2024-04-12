USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[EmailLogs]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailLogs](
	[email_log_id] [int] IDENTITY(1,1) NOT NULL,
	[email_from] [nvarchar](150) NULL,
	[email_to] [nvarchar](max) NULL,
	[email_cc] [nvarchar](max) NULL,
	[email_bcc] [nvarchar](max) NULL,
	[email_subject] [nvarchar](150) NULL,
	[email_body] [nvarchar](max) NULL,
	[email_attachment] [varbinary](max) NULL,
	[created_at] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
 CONSTRAINT [PK_EmailLogs] PRIMARY KEY CLUSTERED 
(
	[email_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmailLogs] ADD  CONSTRAINT [DF_EmailLogs_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
