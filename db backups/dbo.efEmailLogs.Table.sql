USE [Complex]
GO
/****** Object:  Table [dbo].[efEmailLogs]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efEmailLogs](
	[ef_email_log_id] [int] IDENTITY(1,1) NOT NULL,
	[email_from] [nvarchar](150) NULL,
	[email_to] [nvarchar](max) NULL,
	[email_cc] [nvarchar](max) NULL,
	[email_bcc] [nvarchar](max) NULL,
	[email_subject] [nvarchar](150) NULL,
	[email_body] [nvarchar](max) NULL,
	[email_attachment] [varbinary](max) NULL,
	[created_at] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
 CONSTRAINT [PK_efEmailLogs] PRIMARY KEY CLUSTERED 
(
	[ef_email_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[efEmailLogs] ADD  CONSTRAINT [DF_efEmailLogs_created_at]  DEFAULT (getdate()) FOR [created_at]
GO


