USE [Complex]
GO
/****** Object:  Table [dbo].[efPasswords]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efPasswords](
	[ef_password_id] [int] IDENTITY(1,1) NOT NULL,
	[ef_user_id] [int] NULL,
	[password_secret] [nvarchar](max) NULL,
	[disabled] [bit] NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [PK_efPasswords] PRIMARY KEY CLUSTERED 
(
	[ef_password_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[efPasswords]  WITH CHECK ADD  CONSTRAINT [FK_efPasswords_Users] FOREIGN KEY([ef_user_id])
REFERENCES [dbo].[efUsers] ([ef_user_id])
GO
ALTER TABLE [dbo].[efPasswords] CHECK CONSTRAINT [FK_efPasswords_Users]
GO



