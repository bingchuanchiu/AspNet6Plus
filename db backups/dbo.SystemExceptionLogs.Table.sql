USE [Complex]
GO
/****** Object:  Table [dbo].[SystemExceptionLogs]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemExceptionLogs](
	[system_exception_log_id] [int] IDENTITY(1,1) NOT NULL,
	[message] [nvarchar](max) NULL,
	[inner_exception] [nvarchar](max) NULL,
	[stack_trace] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
 CONSTRAINT [PK_SystemExceptionLogs] PRIMARY KEY CLUSTERED 
(
	[system_exception_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SystemExceptionLogs] ADD  CONSTRAINT [DF_SystemExceptionLogs_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
