USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[ConfirmatonCodes]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfirmatonCodes](
	[confirmation_code_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[type] [nchar](10) NOT NULL,
	[code] [nchar](10) NULL,
	[url] [nvarchar](150) NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ConfirmatonCodes] PRIMARY KEY CLUSTERED 
(
	[confirmation_code_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConfirmatonCodes]  WITH CHECK ADD  CONSTRAINT [FK_ConfirmatonCodes_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[ConfirmatonCodes] CHECK CONSTRAINT [FK_ConfirmatonCodes_Users]
GO
