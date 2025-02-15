USE [Complex]
GO
/****** Object:  Table [dbo].[Contractors]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contractors](
	[contractor_id] [int] IDENTITY(1,1) NOT NULL,
	[contractor_name] [nvarchar](100) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_Contractors] PRIMARY KEY CLUSTERED 
(
	[contractor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contractors] ON 

INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (1, N'ACME', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (2, N'AWL Industries', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (3, N'Community Electric', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (4, N'Delphi Plumbing', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (5, N'Elmhurst Electric Corp.', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (6, N'ENL Mechanical Incorporated', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (7, N'Geomatrix', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (8, N'Mac Fhionnghaile', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (9, N'Northeast Electrical Contractors', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (10, N'WDF, Inc', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (11, N'WELKIN MECHANICAL', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contractors] OFF
GO
ALTER TABLE [dbo].[Contractors] ADD  CONSTRAINT [DF_Contractors_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
