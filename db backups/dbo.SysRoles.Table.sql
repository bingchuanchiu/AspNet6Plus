USE [Complex]
GO
/****** Object:  Table [dbo].[SysRoles]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysRoles](
	[Sys_role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](100) NULL,
	[display_name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[deleted_at] [datetime2](7) NULL,
 CONSTRAINT [PK_SysRoles] PRIMARY KEY CLUSTERED 
(
	[Sys_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SysRoles] ON 

INSERT [dbo].[SysRoles] ([Sys_role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (1, N'Administrator', N'Administrator', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysRoles] ([Sys_role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (2, N'ApplicationSupport', N'Application Support', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysRoles] ([Sys_role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (3, N'Executive', N'Executive', N'Commissioner, Deputy Commissioner', NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysRoles] ([Sys_role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (4, N'Manager', N'Manager', N'Director, Facility Manager, Plant Chief, Division Chief, Chief, Project Manager', NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysRoles] ([Sys_role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (5, N'Supervisor', N'Supervisor', N'Senior Section Stationary Engineer Electrical (SSEE), Senior Sewage Treatment Worker (SSTW)', NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysRoles] ([Sys_role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (6, N'Professional', N'Professional', N'Stationary Engineer Electrical (SEE), Stationary Engineer (SE), Sewage Treatment Worker (STW), Dispatchers', NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysRoles] ([Sys_role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (7, N'Administrative', N'Administrative', N'Drivers, Administrative Staff, Interns', NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysRoles] ([Sys_role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (8, N'Contractor', N'Contractor', N'Contractor', NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[SysRoles] OFF
GO

