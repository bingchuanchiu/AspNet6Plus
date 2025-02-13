USE [Complex]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[contract_id] [int] IDENTITY(1,1) NOT NULL,
	[contractor_id] [int] NOT NULL,
	[contract_number] [nvarchar](100) NULL,
	[contract_registration_number] [nvarchar](100) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 

INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (1, 1, N'JOC-17-EH', N'20181418691', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (2, 2, N'JOC-22-NG', N'2022880836', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (3, 3, N'JOC-19-NE', N'20201415560', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (4, 3, N'JOC-19-NE-R', N'20238807424', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (5, 4, N'JOC-20-EG', N'20228803600', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (6, 4, N'JOC-20-EG-R', N'20238807100', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (7, 4, N'JOC-22-NP', N'20228808203', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (8, 4, N'JOC-22-SG', N'20228808204', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (9, 5, N'JOC-17-EE', N'20191402480', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (10, 5, N'JOC-17-EE-R ', N'20211419775', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (11, 5, N'JOC-18-E1E', N'20191402281', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (12, 5, N'JOC-22-EE', N'20228808317', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (13, 6, N'JOC-22-PWH', N'20228808200', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (14, 7, N'JOC-17-SG', N'20181419487', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (15, 7, N'JOC-17-SG-R', N'20211419771', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (16, 7, N'JOC-18-SH', N'20181429116', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (17, 7, N'JOC-18-SH-R', N'20221401487', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (18, 8, N'JOC-18-SE', N'20191402283', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (19, 8, N'JOC-18-SE-R', N'20228804252', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (20, 8, N'JOC-23-SE', N'20238806327', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (21, 9, N'JOC-18-N1E', N'20191406212', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (22, 10, N'JOC-17-EG', N'20171429296', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (23, 10, N'JOC-17-EG-R', N'20211419772', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (24, 10, N'JOC-17-EP', N'20171429297', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (25, 10, N'JOC-17-EP-R', N'20211419774', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (26, 10, N'JOC-17-NG', N'20191415167', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (27, 10, N'JOC-17-NG-R', N'20211419773', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (28, 10, N'JOC-18-SP', N'20191419302', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (29, 10, N'JOC-18-SP-R', N'20211421706', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (30, 10, N'JOC-20-EP', N'20228803598', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (31, 10, N'JOC-20-EP-R', N'20238807101', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (32, 10, N'JOC-22-SP', N'20228808201', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (33, 11, N'JOC-17-NH', N'20181423446', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (34, 11, N'JOC-18-NP', N'20191420704', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (35, 11, N'JOC-18-NP-R', N'20211423942', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
ALTER TABLE [dbo].[Contracts] ADD  CONSTRAINT [DF_Contracts_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
