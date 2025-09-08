USE [Complex]
GO
/****** Object:  Table [dbo].[efOUs]    Script Date: 2/11/2025 10:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efOUs](
	[ef_ou_id] [int] IDENTITY(1,1) NOT NULL,
	[ou_name] [nvarchar](max) NULL,
	[type] [nchar](5) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_efOUs] PRIMARY KEY CLUSTERED 
(
	[ef_ou_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC ef.sp_addextendedproperty @name=N'MS_Description', @value=N'group | role' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'efOUs', @level2type=N'COLUMN',@level2name=N'type'
GO


