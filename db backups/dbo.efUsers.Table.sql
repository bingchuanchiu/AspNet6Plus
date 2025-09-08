USE [Complex]
GO
/****** Object:  Table [dbo].[efUsers]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efUsers](
	[ef_user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_type_id] [int] NULL,
	[username] [nvarchar](100) NULL,
	[firstname] [nvarchar](100) NULL,
	[lastname] [nvarchar](100) NULL,
	[emplid] [char](8) NULL,
	[email] [varchar](100) NULL,
	[email_notifications] [bit] NULL,
	[thumbnail] [varchar](max) NULL,
	[is_disabled] [bit] NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [PK_efUsers] PRIMARY KEY CLUSTERED 
(
	[ef_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[efUsers] ON 

INSERT [dbo].[efUsers] ([ef_user_id], [user_type_id], [username], [firstname], [lastname], [emplid], [email], [email_notifications], [thumbnail], [is_disabled], [created_at], [updated_at], [created_by], [updated_by]) VALUES (1, NULL, N'bchiu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[efUsers] OFF
GO


