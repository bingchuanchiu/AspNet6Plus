USE [Complex]
GO
/****** Object:  Table [dbo].[SysUserOUs]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysUserOUs](
	[Sys_user_ou_id] [int] IDENTITY(1,1) NOT NULL,
	[ou_name] [nvarchar](max) NULL,
	[Sys_user_id] [int] NOT NULL,
	[created_at] [datetime2](7) NULL,
 CONSTRAINT [PK_UserOUs] PRIMARY KEY CLUSTERED 
(
	[Sys_user_ou_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SysUserOUs]  WITH CHECK ADD  CONSTRAINT [FK_SysUserOUs_SysUsers] FOREIGN KEY([Sys_user_id])
REFERENCES [dbo].[SysUsers] ([Sys_user_id])
GO
ALTER TABLE [dbo].[SysUserOUs] CHECK CONSTRAINT [FK_SysUserOUs_SysUsers]
GO

