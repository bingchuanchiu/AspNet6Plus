USE [Complex]
GO
/****** Object:  Table [dbo].[InvioceStatusTypes]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvioceStatusTypes](
	[invoice_status_type_id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_status_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_InvioceStatusTypes] PRIMARY KEY CLUSTERED 
(
	[invoice_status_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
