USE [Complex]
GO
/****** Object:  Table [dbo].[SystemPasswords]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemPasswords](
	[system_password_id] [int] IDENTITY(1,1) NOT NULL,
	[system_user_id] [int] NULL,
	[password_secret] [nvarchar](max) NULL,
	[never_expires] [bit] NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [PK_SystemPasswords] PRIMARY KEY CLUSTERED 
(
	[system_password_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SystemPasswords]  WITH CHECK ADD  CONSTRAINT [FK_SystemPasswords_Users] FOREIGN KEY([system_user_id])
REFERENCES [dbo].[SystemUsers] ([system_user_id])
GO
ALTER TABLE [dbo].[SystemPasswords] CHECK CONSTRAINT [FK_SystemPasswords_Users]
GO
