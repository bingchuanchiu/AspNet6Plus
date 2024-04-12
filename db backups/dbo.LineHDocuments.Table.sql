USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[LineHDocuments]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineHDocuments](
	[line_h_document_id] [int] IDENTITY(1,1) NOT NULL,
	[line_h_id] [int] NOT NULL,
	[file_name] [nvarchar](50) NULL,
	[file_type] [nchar](4) NULL,
	[file_size] [nvarchar](10) NULL,
	[file_binary] [varbinary](max) NULL,
	[file_location] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_LineHDocuments] PRIMARY KEY CLUSTERED 
(
	[line_h_document_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[LineHDocuments] ADD  CONSTRAINT [DF_LineHDocuments_created_at_1]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[LineHDocuments]  WITH CHECK ADD  CONSTRAINT [FK_LineHDocuments_LineH] FOREIGN KEY([line_h_id])
REFERENCES [dbo].[LineH] ([line_h_id])
GO
ALTER TABLE [dbo].[LineHDocuments] CHECK CONSTRAINT [FK_LineHDocuments_LineH]
GO
