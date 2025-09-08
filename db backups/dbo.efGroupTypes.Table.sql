USE [Complex]
GO
/****** Object:  Table [dbo].[efGroupTypes]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efGroupTypes](
	[ef_group_type_id] [int] IDENTITY(1,1) NOT NULL,
	[group_type_name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_efGroupTypes] PRIMARY KEY CLUSTERED 
(
	[ef_group_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[efGroupTypes] ON 

INSERT [dbo].[efGroupTypes] ([ef_group_type_id], [group_type_name], [description]) VALUES (1, N'permissions', NULL)
INSERT [dbo].[efGroupTypes] ([ef_group_type_id], [group_type_name], [description]) VALUES (2, N'plants', NULL)
SET IDENTITY_INSERT [dbo].[efGroupTypes] OFF
GO


