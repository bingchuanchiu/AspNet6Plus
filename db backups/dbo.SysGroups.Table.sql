USE [Complex]
GO
/****** Object:  Table [dbo].[SysGroups]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysGroups](
	[Sys_group_id] [int] IDENTITY(1,1) NOT NULL,
	[Sys_group_type_id] [int] NOT NULL,
	[group_name] [nvarchar](100) NULL,
	[display_name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[email_notifications] [bit] NULL,
	[sms_notifications] [bit] NULL,
	[enabled] [bit] NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[deleted_at] [datetime2](7) NULL,
 CONSTRAINT [PK_SysGroups] PRIMARY KEY CLUSTERED 
(
	[Sys_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SysGroups] ON 

INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (1, 1, N'Administrators', N'Administrators', NULL, NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (2, 1, N'ApplicationSupports', N'Application Supports', NULL, NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (3, 1, N'Executives', N'Executives', N'Commissioner, Deputy Commissioner', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (4, 1, N'Managers', N'Managers', N'Director, Facility Manager, Plant Chief, Division Chief, Chief, Project Manager', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (5, 1, N'Supervisors', N'Supervisors', N'Senior Section Stationary Engineer Electrical (SSEE), Senior Sewage Treatment Worker (SSTW)', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (6, 1, N'Professionals', N'Professionals', N'Stationary Engineer Electrical (SEE), Stationary Engineer (SE), Sewage Treatment Worker (STW), Dispatchers', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (7, 1, N'Dispatchers', N'Dispatchers', N'TBD', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (8, 1, N'AdministrativeStaffs', N'Administrative Staffs', N'This is a restricted group with limited access to adding new entries to a specific area. TBD', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (9, 1, N'Drivers', N'Drivers', N'This is a restricted group with limited access. May just be used for the purpose of tracking their location via mobile device.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (10, 1, N'Contractors', N'Contractors', N'This is a restricted user with limited access. TBD', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (11, 2, N'WardsIsland', N'Wards Island', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (12, 2, N'NorthRiver', N'North River', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (13, 2, N'HuntsPoints', N'Hunts Points', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (14, 2, N'NewtownCreek', N'Newtown Creek', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (15, 2, N'26thWard', N'26th Ward', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (16, 2, N'ConeyIsland', N'Coney Island', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (17, 2, N'RedHook', N'Red Hook', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (18, 2, N'OwlsHead', N'Owls Head', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (19, 2, N'TallmanIsland', N'Tallman Island', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (20, 2, N'Jamaica', N'Jamaica', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (21, 2, N'BoweryBay', N'Bowery Bay', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (22, 2, N'Rockaway', N'Rockaway', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (23, 2, N'PortRichmond', N'Port Richmond', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[SysGroups] ([Sys_group_id], [Sys_group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (24, 2, N'OakwoodBeach', N'Oakwood Beach', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[SysGroups] OFF
GO
ALTER TABLE [dbo].[SysGroups]  WITH CHECK ADD  CONSTRAINT [FK_SysGroups_GroupTypes] FOREIGN KEY([Sys_group_type_id])
REFERENCES [dbo].[SysGroupTypes] ([Sys_group_type_id])
GO
ALTER TABLE [dbo].[SysGroups] CHECK CONSTRAINT [FK_SysGroups_GroupTypes]
GO

