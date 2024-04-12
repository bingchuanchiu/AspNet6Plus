USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[GroupTypes]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupTypes](
	[group_type_id] [int] IDENTITY(1,1) NOT NULL,
	[group_type_name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_GroupTypes] PRIMARY KEY CLUSTERED 
(
	[group_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GroupTypes] ON 

INSERT [dbo].[GroupTypes] ([group_type_id], [group_type_name], [description]) VALUES (1, N'permissions', NULL)
INSERT [dbo].[GroupTypes] ([group_type_id], [group_type_name], [description]) VALUES (2, N'plants', NULL)
SET IDENTITY_INSERT [dbo].[GroupTypes] OFF
GO
