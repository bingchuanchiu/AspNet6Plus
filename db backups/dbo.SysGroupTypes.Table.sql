USE [Complex]
GO
/****** Object:  Table [dbo].[SysGroupTypes]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysGroupTypes](
	[Sys_group_type_id] [int] IDENTITY(1,1) NOT NULL,
	[group_type_name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_SysGroupTypes] PRIMARY KEY CLUSTERED 
(
	[Sys_group_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SysGroupTypes] ON 

INSERT [dbo].[SysGroupTypes] ([Sys_group_type_id], [group_type_name], [description]) VALUES (1, N'permissions', NULL)
INSERT [dbo].[SysGroupTypes] ([Sys_group_type_id], [group_type_name], [description]) VALUES (2, N'plants', NULL)
SET IDENTITY_INSERT [dbo].[SysGroupTypes] OFF
GO

