USE [Complex]
GO
/****** Object:  Table [dbo].[SysDBLogs]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysDBLogs](
	[Sys_db_log_id] [int] IDENTITY(1,1) NOT NULL,
	[table_name] [nvarchar](max) NULL,
	[column_name] [nvarchar](max) NULL,
	[column_type] [nvarchar](max) NULL,
	[column_old_value] [nvarchar](max) NULL,
	[column_new_value] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
 CONSTRAINT [PK_SystemDBLogs] PRIMARY KEY CLUSTERED 
(
	[Sys_db_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SysDBLogs] ADD  CONSTRAINT [DF_SystemDBLogs_created_at]  DEFAULT (getdate()) FOR [created_at]
GO

