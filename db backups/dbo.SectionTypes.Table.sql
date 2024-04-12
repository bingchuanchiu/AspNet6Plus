--﻿USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[SystemSectionTypes]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemSectionTypes](
	[system_section_type_id] [int] IDENTITY(1,1) NOT NULL,
	[section_type_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_SystemSectionTypes] PRIMARY KEY CLUSTERED 
(
	[system_section_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
