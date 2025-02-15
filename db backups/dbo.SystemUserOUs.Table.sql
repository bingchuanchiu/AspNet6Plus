USE [Complex]
GO
/****** Object:  Table [dbo].[SystemUserOUs]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUserOUs](
	[system_user_ou_id] [int] IDENTITY(1,1) NOT NULL,
	[ou_name] [nvarchar](max) NULL,
	[system_user_id] [int] NOT NULL,
	[created_at] [datetime2](7) NULL,
 CONSTRAINT [PK_UserOUs] PRIMARY KEY CLUSTERED 
(
	[system_user_ou_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SystemUserOUs]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserOUs_SystemUsers] FOREIGN KEY([system_user_id])
REFERENCES [dbo].[SystemUsers] ([system_user_id])
GO
ALTER TABLE [dbo].[SystemUserOUs] CHECK CONSTRAINT [FK_SystemUserOUs_SystemUsers]
GO
