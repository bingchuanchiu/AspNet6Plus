USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[GroupAssignedOUs]    Script Date: 8/30/2023 3:21:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupAssignedOUs](
	[group_assigned_ou_id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[ou_id] [int] NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_UserAssignedFIMGroups] PRIMARY KEY CLUSTERED 
(
	[group_assigned_ou_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupAssignedOUs]  WITH CHECK ADD  CONSTRAINT [FK_GroupAssignedOUs_Groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([group_id])
GO
ALTER TABLE [dbo].[GroupAssignedOUs] CHECK CONSTRAINT [FK_GroupAssignedOUs_Groups]
GO
ALTER TABLE [dbo].[GroupAssignedOUs]  WITH CHECK ADD  CONSTRAINT [FK_GroupAssignedOUs_OUs] FOREIGN KEY([ou_id])
REFERENCES [dbo].[OUs] ([ou_id])
GO
ALTER TABLE [dbo].[GroupAssignedOUs] CHECK CONSTRAINT [FK_GroupAssignedOUs_OUs]
GO
