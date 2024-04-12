USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[Passwords]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passwords](
	[password_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[password_secret] [nvarchar](max) NULL,
	[never_expires] [bit] NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [PK_Passwords] PRIMARY KEY CLUSTERED 
(
	[password_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Passwords]  WITH CHECK ADD  CONSTRAINT [FK_Passwords_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Passwords] CHECK CONSTRAINT [FK_Passwords_Users]
GO
