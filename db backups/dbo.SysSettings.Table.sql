USE [Complex]
GO
/****** Object:  Table [dbo].[SysSettings]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysSettings](
	[Sys_setting_id] [int] IDENTITY(1,1) NOT NULL,
	[setting_name] [nvarchar](50) NULL,
	[display_name] [nvarchar](50) NULL,
	[value] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [PK_SysSettings] PRIMARY KEY CLUSTERED 
(
	[Sys_setting_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SysSettings] ADD  CONSTRAINT [DF_SysSettings_created_at]  DEFAULT (getdate()) FOR [created_at]
GO

