USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[UserOUs]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOUs](
	[user_ou_id] [int] IDENTITY(1,1) NOT NULL,
	[ou_name] [nvarchar](max) NULL,
	[user_id] [int] NOT NULL,
	[created_at] [datetime2](7) NULL,
 CONSTRAINT [PK_UserOUs] PRIMARY KEY CLUSTERED 
(
	[user_ou_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserOUs]  WITH CHECK ADD  CONSTRAINT [FK_UserOUs_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[UserOUs] CHECK CONSTRAINT [FK_UserOUs_Users]
GO
