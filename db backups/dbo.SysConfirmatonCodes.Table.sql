USE [Complex]
GO
/****** Object:  Table [dbo].[SysConfirmatonCodes]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysConfirmatonCodes](
	[Sys_confirmation_code_id] [int] IDENTITY(1,1) NOT NULL,
	[Sys_user_id] [int] NOT NULL,
	[type] [nchar](10) NOT NULL,
	[code] [nchar](10) NULL,
	[url] [nvarchar](150) NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_SystemConfirmatonCodes] PRIMARY KEY CLUSTERED 
(
	[Sys_confirmation_code_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SysConfirmatonCodes]  WITH CHECK ADD  CONSTRAINT [FK_SystemConfirmatonCodes_SystemUsers] FOREIGN KEY([Sys_user_id])
REFERENCES [dbo].[SysUsers] ([Sys_user_id])
GO
ALTER TABLE [dbo].[SysConfirmatonCodes] CHECK CONSTRAINT [FK_SystemConfirmatonCodes_SystemUsers]
GO

