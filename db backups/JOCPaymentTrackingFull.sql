USE [master]
GO
/****** Object:  Database [JOCPaymentTracking]    Script Date: 8/30/2023 3:20:27 PM ******/
CREATE DATABASE [JOCPaymentTracking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SeedSolution', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\JOCPaymentTracking.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SeedSolution_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\JOCPaymentTracking_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [JOCPaymentTracking] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JOCPaymentTracking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JOCPaymentTracking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET ARITHABORT OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JOCPaymentTracking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JOCPaymentTracking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JOCPaymentTracking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JOCPaymentTracking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET RECOVERY FULL 
GO
ALTER DATABASE [JOCPaymentTracking] SET  MULTI_USER 
GO
ALTER DATABASE [JOCPaymentTracking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JOCPaymentTracking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JOCPaymentTracking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JOCPaymentTracking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JOCPaymentTracking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JOCPaymentTracking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'JOCPaymentTracking', N'ON'
GO
ALTER DATABASE [JOCPaymentTracking] SET QUERY_STORE = ON
GO
ALTER DATABASE [JOCPaymentTracking] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [JOCPaymentTracking]
GO
/****** Object:  Table [dbo].[BudgetSections]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BudgetSections](
	[budget_section_id] [int] IDENTITY(1,1) NOT NULL,
	[contracts_section_id] [int] NULL,
	[user_id] [int] NULL,
	[budget_section_submits_funds_approval_date] [datetime2](7) NULL,
	[budget_section_receives_funds_approval_date] [datetime2](7) NULL,
	[expected_duration_receipt_funds_approval_days] [int] NULL,
	[actual_duration_receipt_funds_approval_days] [int] NULL,
	[variance_between_expected_actual_duration_budget_section_payment_approval_days] [int] NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_BudgetSections] PRIMARY KEY CLUSTERED 
(
	[budget_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CellCarriers]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CellCarriers](
	[cell_carrier_id] [int] IDENTITY(1,1) NOT NULL,
	[cell_carrier_name] [nvarchar](150) NOT NULL,
	[sms_gateway] [nvarchar](150) NOT NULL,
	[sms_notifications] [bit] NULL,
 CONSTRAINT [PK_CellCarriers] PRIMARY KEY CLUSTERED 
(
	[cell_carrier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CmConsultants]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CmConsultants](
	[cm_consultant_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[contractor_id] [int] NOT NULL,
	[cm_consultant_name] [nvarchar](100) NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_CmConsultants] PRIMARY KEY CLUSTERED 
(
	[cm_consultant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CmSections]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CmSections](
	[cm_section_id] [int] IDENTITY(1,1) NOT NULL,
	[cm_consultant_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[cm_consultant_receives_pencil_copy_date] [datetime2](7) NULL,
	[cm_consultant_approves_pencil_copy_date] [datetime2](7) NULL,
	[expected_duration_cm_consultant_pencil_copy_approval_days] [int] NULL,
	[actual_duration_cm_consultant_pencil_copy_approval_days] [int] NULL,
	[variance_between_expected_actual_duration_pencil_copy_approval_days] [int] NULL,
	[cm_consultant_receives_payment_request_date] [datetime2](7) NULL,
	[cm_consultant_approves_payment_request_date] [datetime2](7) NULL,
	[expected_duration_cm_consultant_payment_approval_days] [int] NULL,
	[actual_duration_cm_consultant_payment_approval_days] [int] NULL,
	[variance_between_expected_actual_duration_cm_consultant_payment_approval_days] [int] NULL,
	[bwt_cm_section_receives_payment_request_date] [datetime2](7) NULL,
	[bwt_cm_section_approves_payment_request_date] [datetime2](7) NULL,
	[expected_duration_cm_section_payment_approval_days] [int] NULL,
	[actual_duration_cm_section_payment_approval_days] [int] NULL,
	[variance_between_expected_actual_duration_cm_section_payment_approval_days] [int] NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_CmSections] PRIMARY KEY CLUSTERED 
(
	[cm_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentLogs]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentLogs](
	[comment_log_id] [int] IDENTITY(1,1) NOT NULL,
	[cm_section_id] [int] NOT NULL,
	[comment] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
 CONSTRAINT [PK_CommentLogs] PRIMARY KEY CLUSTERED 
(
	[comment_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfirmatonCodes]    Script Date: 8/30/2023 3:20:27 PM ******/
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
/****** Object:  Table [dbo].[Contractors]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contractors](
	[contractor_id] [int] IDENTITY(1,1) NOT NULL,
	[contractor_name] [nvarchar](100) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_Contractors] PRIMARY KEY CLUSTERED 
(
	[contractor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[contract_id] [int] IDENTITY(1,1) NOT NULL,
	[contractor_id] [int] NOT NULL,
	[contract_number] [nvarchar](100) NULL,
	[contract_registration_number] [nvarchar](100) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractsSections]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractsSections](
	[contracts_section_id] [int] IDENTITY(1,1) NOT NULL,
	[joc_toc_section1_id] [int] NULL,
	[user_id] [int] NULL,
	[dip_received_date] [date] NULL,
	[notification_sent_joctoc_date] [date] NULL,
	[contractor_submitted_updated_documents_dip_date] [date] NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_ContractsSections] PRIMARY KEY CLUSTERED 
(
	[contracts_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractsSectionToContractorPaids]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractsSectionToContractorPaids](
	[contracts_section_to_contractor_paid_id] [int] IDENTITY(1,1) NOT NULL,
	[joc_toc_section2_id] [int] NULL,
	[user_id] [int] NULL,
	[recieves_monthly_requisition_joctoc_section_date] [date] NULL,
	[submits_requisition_acco_office_date] [date] NULL,
	[expected_duration_contracts_section_transmission_monthly_requisition_acco_days] [int] NULL,
	[actual_duration_contracts_section_transmission_monthly_requisition_acco_days] [int] NULL,
	[variance_between_expected_actual_duration_contracts_section_transmission_monthly_payment_acco_days] [int] NULL,
	[contractor_receives_monthly_payment_date] [date] NULL,
	[expected_duration_monthly_requisition_process_days] [int] NULL,
	[actual_duration_joc_section_submission_contract_section_contractor_paid_date] [int] NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_ContractsSectionToContractorPaids] PRIMARY KEY CLUSTERED 
(
	[contracts_section_to_contractor_paid_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBLogs]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBLogs](
	[db_log_id] [int] IDENTITY(1,1) NOT NULL,
	[table_name] [nvarchar](max) NULL,
	[column_name] [nvarchar](max) NULL,
	[column_type] [nvarchar](max) NULL,
	[column_old_value] [nvarchar](max) NULL,
	[column_new_value] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
 CONSTRAINT [PK_DBLogs] PRIMARY KEY CLUSTERED 
(
	[db_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailLogs]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailLogs](
	[email_log_id] [int] IDENTITY(1,1) NOT NULL,
	[email_from] [nvarchar](150) NULL,
	[email_to] [nvarchar](max) NULL,
	[email_cc] [nvarchar](max) NULL,
	[email_bcc] [nvarchar](max) NULL,
	[email_subject] [nvarchar](150) NULL,
	[email_body] [nvarchar](max) NULL,
	[email_attachment] [varbinary](max) NULL,
	[created_at] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
 CONSTRAINT [PK_EmailLogs] PRIMARY KEY CLUSTERED 
(
	[email_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExceptionLogs]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExceptionLogs](
	[exception_log_id] [int] IDENTITY(1,1) NOT NULL,
	[message] [nvarchar](max) NULL,
	[inner_exception] [nvarchar](max) NULL,
	[stack_trace] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
 CONSTRAINT [PK_ExceptionLogs] PRIMARY KEY CLUSTERED 
(
	[exception_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupAssignedOUs]    Script Date: 8/30/2023 3:20:27 PM ******/
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
/****** Object:  Table [dbo].[GroupAssignedRoles]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupAssignedRoles](
	[group_assigned_role_id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_GroupAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[group_assigned_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_type_id] [int] NOT NULL,
	[group_name] [nvarchar](100) NULL,
	[display_name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[email_notifications] [bit] NULL,
	[sms_notifications] [bit] NULL,
	[enabled] [bit] NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[deleted_at] [datetime2](7) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupTypes]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupTypes](
	[group_type_id] [int] IDENTITY(1,1) NOT NULL,
	[group_type_name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_GroupTypes] PRIMARY KEY CLUSTERED 
(
	[group_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[invoice_id] [int] IDENTITY(1,1) NOT NULL,
	[job_order_id] [int] NOT NULL,
	[invoice_status_type_id] [int] NULL,
	[invoice_number] [nchar](10) NULL,
	[invoice_type_id] [int] NULL,
	[invoice_amount] [money] NULL,
	[line_h_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceStatusTypes]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceStatusTypes](
	[invoice_status_type_id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_status_type_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_InvoiceStatusTypes] PRIMARY KEY CLUSTERED 
(
	[invoice_status_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceTypes]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceTypes](
	[invoice_type_id] [int] NOT NULL,
	[invoice_type_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_InvoiceTypes] PRIMARY KEY CLUSTERED 
(
	[invoice_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobOrders]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobOrders](
	[job_order_id] [int] IDENTITY(1,1) NOT NULL,
	[contract_id] [int] NOT NULL,
	[job_order_status_type_id] [int] NULL,
	[job_order_number] [nvarchar](100) NULL,
	[job_order_total_value] [money] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_JobOrders] PRIMARY KEY CLUSTERED 
(
	[job_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobOrderStatusTypes]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobOrderStatusTypes](
	[job_order_status_type_id] [int] IDENTITY(1,1) NOT NULL,
	[job_order_status_type_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_JobOrderStatusTypes] PRIMARY KEY CLUSTERED 
(
	[job_order_status_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JocTocSections1]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JocTocSections1](
	[joc_toc_section1_id] [int] NOT NULL,
	[cm_section_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[joc_toc_section_receives_payment_request_date] [date] NULL,
	[joc_toc_section_approves_payment_request_date] [date] NULL,
	[expected_duration_joc_toc_section_payment_approval_days] [int] NULL,
	[actual_duration_joc_toc_section_payment_approval_days] [int] NULL,
	[variance_between_expected_actual_duration_of_cm_section_payment_approval_days] [int] NULL,
	[joc_toc_section_notifies_contractor_include_monthly_requisition_date] [date] NULL,
	[joc_toc_section_notifies_budget_section_submit_funds_approval_date] [date] NULL,
	[requesting_payment_period_begin_date] [date] NULL,
	[requesting_payment_period_end_date] [date] NULL,
	[monthly_payment_requisition_number] [nvarchar](50) NULL,
	[anticipated_submission_date_expense_date] [date] NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_JocTocSections1] PRIMARY KEY CLUSTERED 
(
	[joc_toc_section1_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JocTocSections2]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JocTocSections2](
	[joc_toc_section2_id] [int] IDENTITY(1,1) NOT NULL,
	[contracts_section_id] [int] NULL,
	[user_id] [int] NULL,
	[payment_returned_date_contractor_date] [date] NULL,
	[transmits_monthly_requisition_contracts_section_date] [date] NULL,
	[actual_duration_joctoc_section_transmission_monthly_requisition_contracts_section_days] [int] NULL,
	[variance_between_expected_actual_duration_joctoc_section_transmission_monthly_payment_days] [int] NULL,
	[deadline_days] [datetime2](7) NULL,
	[returned_to_section_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_JocTocSections2] PRIMARY KEY CLUSTERED 
(
	[joc_toc_section2_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineH]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineH](
	[line_h_id] [int] IDENTITY(1,1) NOT NULL,
	[line_h_name] [nvarchar](50) NULL,
	[line_h_increase_amount] [money] NULL,
	[line_h_decrease_amount] [money] NULL,
	[removed_by] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
 CONSTRAINT [PK_LineH] PRIMARY KEY CLUSTERED 
(
	[line_h_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineHDocuments]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineHDocuments](
	[line_h_document_id] [int] IDENTITY(1,1) NOT NULL,
	[line_h_id] [int] NOT NULL,
	[file_name] [nvarchar](50) NULL,
	[file_type] [nchar](4) NULL,
	[file_size] [nvarchar](10) NULL,
	[file_binary] [varbinary](max) NULL,
	[file_location] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
	[updated_by] [int] NULL,
	[removed_at] [datetime2](7) NULL,
	[removed_by] [int] NULL,
 CONSTRAINT [PK_LineHDocuments] PRIMARY KEY CLUSTERED 
(
	[line_h_document_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OUAssignedRoles]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OUAssignedRoles](
	[ou_assigned_role_id] [int] IDENTITY(1,1) NOT NULL,
	[ou_id] [int] NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_OUAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[ou_assigned_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OUs]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OUs](
	[ou_id] [int] IDENTITY(1,1) NOT NULL,
	[ou_name] [nvarchar](max) NULL,
	[type] [nchar](5) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_OUs] PRIMARY KEY CLUSTERED 
(
	[ou_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passwords]    Script Date: 8/30/2023 3:20:27 PM ******/
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
/****** Object:  Table [dbo].[Permissions]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[permission_id] [int] IDENTITY(1,1) NOT NULL,
	[table_name] [nvarchar](100) NULL,
	[permission_name] [nvarchar](100) NULL,
	[display_name] [nvarchar](100) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlantAreas]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantAreas](
	[plant_area_id] [int] IDENTITY(1,1) NOT NULL,
	[plant_id] [int] NOT NULL,
	[plant_area_name] [nvarchar](max) NULL,
 CONSTRAINT [PK_PlantAreas] PRIMARY KEY CLUSTERED 
(
	[plant_area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plants](
	[plant_id] [int] IDENTITY(1,1) NOT NULL,
	[plant_name] [nvarchar](max) NULL,
	[heading] [float] NOT NULL,
	[height] [float] NOT NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
	[pitch] [float] NOT NULL,
	[roll] [float] NOT NULL,
	[plant_number] [int] NOT NULL,
	[address] [nvarchar](max) NULL,
	[hopper_size] [int] NULL,
	[is_dewatering] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Plants] PRIMARY KEY CLUSTERED 
(
	[plant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReturnedToSections]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnedToSections](
	[returned_to_section_id] [int] IDENTITY(1,1) NOT NULL,
	[returned_date] [datetime2](7) NULL,
	[current_section_id] [int] NULL,
	[returned_desdination_section_id] [int] NULL,
	[returned_from_section_id] [int] NULL,
	[returned_comment] [nvarchar](150) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
 CONSTRAINT [PK_ReturnedToSections] PRIMARY KEY CLUSTERED 
(
	[returned_to_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleAssignedPermissions]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleAssignedPermissions](
	[role_assigned_permission_id] [int] IDENTITY(1,1) NOT NULL,
	[permission_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_RoleAssignedPermissions] PRIMARY KEY CLUSTERED 
(
	[role_assigned_permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](100) NULL,
	[display_name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[deleted_at] [datetime2](7) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectionTypes]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionTypes](
	[section_type_id] [int] IDENTITY(1,1) NOT NULL,
	[section_type_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_SectionTypes] PRIMARY KEY CLUSTERED 
(
	[section_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[setting_id] [int] IDENTITY(1,1) NOT NULL,
	[setting_name] [nvarchar](50) NULL,
	[display_name] [nvarchar](50) NULL,
	[value] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[setting_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAssignedCellCarriers]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAssignedCellCarriers](
	[user_assigned_cell_carrier_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[cell_carrier_id] [int] NOT NULL,
	[cellphone] [nvarchar](15) NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_UserAssignedCellCarriers] PRIMARY KEY CLUSTERED 
(
	[user_assigned_cell_carrier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAssignedGroups]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAssignedGroups](
	[user_assigned_group_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
 CONSTRAINT [PK_UserAssignedGroups] PRIMARY KEY CLUSTERED 
(
	[user_assigned_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAssignedRoles]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAssignedRoles](
	[user_assigned_role_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_UserAssignedRoles] PRIMARY KEY CLUSTERED 
(
	[user_assigned_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogs]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogs](
	[user_log_id] [int] IDENTITY(1,1) NOT NULL,
	[controller] [nvarchar](50) NULL,
	[action] [nvarchar](50) NULL,
	[user_agent] [nvarchar](max) NULL,
	[url_current] [nvarchar](max) NULL,
	[url_referral] [nvarchar](max) NULL,
	[client_ip] [nvarchar](max) NULL,
	[message] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
 CONSTRAINT [PK_UserLogs] PRIMARY KEY CLUSTERED 
(
	[user_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserOUs]    Script Date: 8/30/2023 3:20:27 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 8/30/2023 3:20:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_type_id] [int] NULL,
	[username] [nvarchar](100) NULL,
	[firstname] [nvarchar](100) NULL,
	[lastname] [nvarchar](100) NULL,
	[emplid] [char](8) NULL,
	[email] [varchar](100) NULL,
	[email_notifications] [bit] NULL,
	[thumbnail] [varchar](max) NULL,
	[ldap_whenChanged] [datetime2](7) NULL,
	[ldap_whenCreated] [datetime2](7) NULL,
	[is_disabled] [bit] NULL,
	[lockout_time] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contractors] ON 

INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (1, N'ACME', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (2, N'AWL Industries', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (3, N'Community Electric', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (4, N'Delphi Plumbing', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (5, N'Elmhurst Electric Corp.', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (6, N'ENL Mechanical Incorporated', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (7, N'Geomatrix', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (8, N'Mac Fhionnghaile', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (9, N'Northeast Electrical Contractors', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (10, N'WDF, Inc', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contractors] ([contractor_id], [contractor_name], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (11, N'WELKIN MECHANICAL', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contractors] OFF
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 

INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (1, 1, N'JOC-17-EH', N'20181418691', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (2, 2, N'JOC-22-NG', N'2022880836', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (3, 3, N'JOC-19-NE', N'20201415560', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (4, 3, N'JOC-19-NE-R', N'20238807424', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (5, 4, N'JOC-20-EG', N'20228803600', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (6, 4, N'JOC-20-EG-R', N'20238807100', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (7, 4, N'JOC-22-NP', N'20228808203', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (8, 4, N'JOC-22-SG', N'20228808204', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (9, 5, N'JOC-17-EE', N'20191402480', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (10, 5, N'JOC-17-EE-R ', N'20211419775', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (11, 5, N'JOC-18-E1E', N'20191402281', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (12, 5, N'JOC-22-EE', N'20228808317', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (13, 6, N'JOC-22-PWH', N'20228808200', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (14, 7, N'JOC-17-SG', N'20181419487', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (15, 7, N'JOC-17-SG-R', N'20211419771', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (16, 7, N'JOC-18-SH', N'20181429116', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (17, 7, N'JOC-18-SH-R', N'20221401487', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (18, 8, N'JOC-18-SE', N'20191402283', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (19, 8, N'JOC-18-SE-R', N'20228804252', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (20, 8, N'JOC-23-SE', N'20238806327', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (21, 9, N'JOC-18-N1E', N'20191406212', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (22, 10, N'JOC-17-EG', N'20171429296', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (23, 10, N'JOC-17-EG-R', N'20211419772', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (24, 10, N'JOC-17-EP', N'20171429297', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (25, 10, N'JOC-17-EP-R', N'20211419774', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (26, 10, N'JOC-17-NG', N'20191415167', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (27, 10, N'JOC-17-NG-R', N'20211419773', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (28, 10, N'JOC-18-SP', N'20191419302', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (29, 10, N'JOC-18-SP-R', N'20211421706', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (30, 10, N'JOC-20-EP', N'20228803598', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (31, 10, N'JOC-20-EP-R', N'20238807101', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (32, 10, N'JOC-22-SP', N'20228808201', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (33, 11, N'JOC-17-NH', N'20181423446', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (34, 11, N'JOC-18-NP', N'20191420704', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contracts] ([contract_id], [contractor_id], [contract_number], [contract_registration_number], [created_at], [created_by], [updated_at], [updated_by], [removed_at], [removed_by]) VALUES (35, 11, N'JOC-18-NP-R', N'20211423942', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (1, 1, N'Administrators', N'Administrators', NULL, NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (2, 1, N'ApplicationSupports', N'Application Supports', NULL, NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (3, 1, N'Executives', N'Executives', N'Commissioner, Deputy Commissioner', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (4, 1, N'Managers', N'Managers', N'Director, Facility Manager, Plant Chief, Division Chief, Chief, Project Manager', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (5, 1, N'Supervisors', N'Supervisors', N'Senior Section Stationary Engineer Electrical (SSEE), Senior Sewage Treatment Worker (SSTW)', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (6, 1, N'Professionals', N'Professionals', N'Stationary Engineer Electrical (SEE), Stationary Engineer (SE), Sewage Treatment Worker (STW), Dispatchers', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (7, 1, N'Dispatchers', N'Dispatchers', N'TBD', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (8, 1, N'AdministrativeStaffs', N'Administrative Staffs', N'This is a restricted group with limited access to adding new entries to a specific area. TBD', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (9, 1, N'Drivers', N'Drivers', N'This is a restricted group with limited access. May just be used for the purpose of tracking their location via mobile device.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (10, 1, N'Contractors', N'Contractors', N'This is a restricted user with limited access. TBD', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (11, 2, N'WardsIsland', N'Wards Island', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (12, 2, N'NorthRiver', N'North River', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (13, 2, N'HuntsPoints', N'Hunts Points', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (14, 2, N'NewtownCreek', N'Newtown Creek', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (15, 2, N'26thWard', N'26th Ward', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (16, 2, N'ConeyIsland', N'Coney Island', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (17, 2, N'RedHook', N'Red Hook', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (18, 2, N'OwlsHead', N'Owls Head', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (19, 2, N'TallmanIsland', N'Tallman Island', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (20, 2, N'Jamaica', N'Jamaica', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (21, 2, N'BoweryBay', N'Bowery Bay', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (22, 2, N'Rockaway', N'Rockaway', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (23, 2, N'PortRichmond', N'Port Richmond', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Groups] ([group_id], [group_type_id], [group_name], [display_name], [description], [email_notifications], [sms_notifications], [enabled], [created_at], [updated_at], [deleted_at]) VALUES (24, 2, N'OakwoodBeach', N'Oakwood Beach', N'Will be able to access this plant.', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupTypes] ON 

INSERT [dbo].[GroupTypes] ([group_type_id], [group_type_name], [description]) VALUES (1, N'permissions', NULL)
INSERT [dbo].[GroupTypes] ([group_type_id], [group_type_name], [description]) VALUES (2, N'plants', NULL)
SET IDENTITY_INSERT [dbo].[GroupTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (1, N'CellCarriers', N'CellCarriers_Read', N'CellCarriers Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (2, N'ConfirmatonCodes', N'ConfirmatonCodes_Read', N'ConfirmatonCodes Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (3, N'DBLogs', N'DBLogs_Read', N'DBLogs Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (4, N'EmailLogs', N'EmailLogs_Read', N'EmailLogs Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (5, N'ExceptionLogs', N'ExceptionLogs_Read', N'ExceptionLogs Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (6, N'GroupAssignedOUs', N'GroupAssignedOUs_Read', N'GroupAssignedOUs Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (7, N'GroupAssignedRoles', N'GroupAssignedRoles_Read', N'GroupAssignedRoles Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (8, N'Groups', N'Groups_Read', N'Groups Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (9, N'OUAssignedRoles', N'OUAssignedRoles_Read', N'OUAssignedRoles Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (10, N'OUs', N'OUs_Read', N'OUs Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (11, N'Passwords', N'Passwords_Read', N'Passwords Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (12, N'Permissions', N'Permissions_Read', N'Permissions Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (13, N'PlantAreas', N'PlantAreas_Read', N'PlantAreas Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (14, N'Plants', N'Plants_Read', N'Plants Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (15, N'RoleAssignedPermissions', N'RoleAssignedPermissions_Read', N'RoleAssignedPermissions Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (16, N'Roles', N'Roles_Read', N'Roles Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (17, N'Settings', N'Settings_Read', N'Settings Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (18, N'UserAssignedCellCarriers', N'UserAssignedCellCarriers_Read', N'UserAssignedCellCarriers Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (19, N'UserAssignedGroups', N'UserAssignedGroups_Read', N'UserAssignedGroups Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (20, N'UserAssignedRoles', N'UserAssignedRoles_Read', N'UserAssignedRoles Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (21, N'UserLogs', N'UserLogs_Read', N'UserLogs Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (22, N'UserOUs', N'UserOUs_Read', N'UserOUs Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (23, N'Users', N'Users_Read', N'Users Read', CAST(N'2023-07-07T13:42:40.4700000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (24, N'CellCarriers', N'CellCarriers_Write', N'CellCarriers Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (25, N'ConfirmatonCodes', N'ConfirmatonCodes_Write', N'ConfirmatonCodes Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (26, N'DBLogs', N'DBLogs_Write', N'DBLogs Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (27, N'EmailLogs', N'EmailLogs_Write', N'EmailLogs Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (28, N'ExceptionLogs', N'ExceptionLogs_Write', N'ExceptionLogs Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (29, N'GroupAssignedOUs', N'GroupAssignedOUs_Write', N'GroupAssignedOUs Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (30, N'GroupAssignedRoles', N'GroupAssignedRoles_Write', N'GroupAssignedRoles Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (31, N'Groups', N'Groups_Write', N'Groups Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (32, N'OUAssignedRoles', N'OUAssignedRoles_Write', N'OUAssignedRoles Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (33, N'OUs', N'OUs_Write', N'OUs Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (34, N'Passwords', N'Passwords_Write', N'Passwords Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (35, N'Permissions', N'Permissions_Write', N'Permissions Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (36, N'PlantAreas', N'PlantAreas_Write', N'PlantAreas Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (37, N'Plants', N'Plants_Write', N'Plants Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (38, N'RoleAssignedPermissions', N'RoleAssignedPermissions_Write', N'RoleAssignedPermissions Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (39, N'Roles', N'Roles_Write', N'Roles Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (40, N'Settings', N'Settings_Write', N'Settings Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (41, N'UserAssignedCellCarriers', N'UserAssignedCellCarriers_Write', N'UserAssignedCellCarriers Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (42, N'UserAssignedGroups', N'UserAssignedGroups_Write', N'UserAssignedGroups Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (43, N'UserAssignedRoles', N'UserAssignedRoles_Write', N'UserAssignedRoles Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (44, N'UserLogs', N'UserLogs_Write', N'UserLogs Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (45, N'UserOUs', N'UserOUs_Write', N'UserOUs Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (46, N'Users', N'Users_Write', N'Users Write', CAST(N'2023-07-07T13:42:40.4800000' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (47, N'CellCarriers', N'CellCarriers_Update', N'CellCarriers Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (48, N'ConfirmatonCodes', N'ConfirmatonCodes_Update', N'ConfirmatonCodes Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (49, N'DBLogs', N'DBLogs_Update', N'DBLogs Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (50, N'EmailLogs', N'EmailLogs_Update', N'EmailLogs Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (51, N'ExceptionLogs', N'ExceptionLogs_Update', N'ExceptionLogs Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (52, N'GroupAssignedOUs', N'GroupAssignedOUs_Update', N'GroupAssignedOUs Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (53, N'GroupAssignedRoles', N'GroupAssignedRoles_Update', N'GroupAssignedRoles Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (54, N'Groups', N'Groups_Update', N'Groups Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (55, N'OUAssignedRoles', N'OUAssignedRoles_Update', N'OUAssignedRoles Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (56, N'OUs', N'OUs_Update', N'OUs Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (57, N'Passwords', N'Passwords_Update', N'Passwords Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (58, N'Permissions', N'Permissions_Update', N'Permissions Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (59, N'PlantAreas', N'PlantAreas_Update', N'PlantAreas Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (60, N'Plants', N'Plants_Update', N'Plants Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (61, N'RoleAssignedPermissions', N'RoleAssignedPermissions_Update', N'RoleAssignedPermissions Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (62, N'Roles', N'Roles_Update', N'Roles Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (63, N'Settings', N'Settings_Update', N'Settings Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (64, N'UserAssignedCellCarriers', N'UserAssignedCellCarriers_Update', N'UserAssignedCellCarriers Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (65, N'UserAssignedGroups', N'UserAssignedGroups_Update', N'UserAssignedGroups Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (66, N'UserAssignedRoles', N'UserAssignedRoles_Update', N'UserAssignedRoles Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (67, N'UserLogs', N'UserLogs_Update', N'UserLogs Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (68, N'UserOUs', N'UserOUs_Update', N'UserOUs Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (69, N'Users', N'Users_Update', N'Users Update', CAST(N'2023-07-07T13:42:40.4866667' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (70, N'CellCarriers', N'CellCarriers_Delete', N'CellCarriers Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (71, N'ConfirmatonCodes', N'ConfirmatonCodes_Delete', N'ConfirmatonCodes Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (72, N'DBLogs', N'DBLogs_Delete', N'DBLogs Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (73, N'EmailLogs', N'EmailLogs_Delete', N'EmailLogs Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (74, N'ExceptionLogs', N'ExceptionLogs_Delete', N'ExceptionLogs Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (75, N'GroupAssignedOUs', N'GroupAssignedOUs_Delete', N'GroupAssignedOUs Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (76, N'GroupAssignedRoles', N'GroupAssignedRoles_Delete', N'GroupAssignedRoles Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (77, N'Groups', N'Groups_Delete', N'Groups Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (78, N'OUAssignedRoles', N'OUAssignedRoles_Delete', N'OUAssignedRoles Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (79, N'OUs', N'OUs_Delete', N'OUs Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (80, N'Passwords', N'Passwords_Delete', N'Passwords Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (81, N'Permissions', N'Permissions_Delete', N'Permissions Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (82, N'PlantAreas', N'PlantAreas_Delete', N'PlantAreas Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (83, N'Plants', N'Plants_Delete', N'Plants Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (84, N'RoleAssignedPermissions', N'RoleAssignedPermissions_Delete', N'RoleAssignedPermissions Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (85, N'Roles', N'Roles_Delete', N'Roles Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (86, N'Settings', N'Settings_Delete', N'Settings Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (87, N'UserAssignedCellCarriers', N'UserAssignedCellCarriers_Delete', N'UserAssignedCellCarriers Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (88, N'UserAssignedGroups', N'UserAssignedGroups_Delete', N'UserAssignedGroups Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (89, N'UserAssignedRoles', N'UserAssignedRoles_Delete', N'UserAssignedRoles Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (90, N'UserLogs', N'UserLogs_Delete', N'UserLogs Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (91, N'UserOUs', N'UserOUs_Delete', N'UserOUs Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (92, N'Users', N'Users_Delete', N'Users Delete', CAST(N'2023-07-07T13:42:40.4933333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (93, NULL, N'AdministrativeControlPanel', N'Administrative Control Panel', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (94, NULL, N'PrimaryNavigation', N'Primary Navigation', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (95, NULL, N'SecondaryNavigation', N'Secondary Navigation', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (96, NULL, N'WardsIsland', N'Wards Island', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (97, NULL, N'NorthRiver', N'North River', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (98, NULL, N'HuntsPoints', N'Hunts Points', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (99, NULL, N'NewtownCreek', N'Newtown Creek', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
GO
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (100, NULL, N'26thWard', N'26th Ward', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (101, NULL, N'ConeyIsland', N'Coney Island', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (102, NULL, N'RedHook', N'Red Hook', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (103, NULL, N'OwlsHead', N'Owls Head', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (104, NULL, N'TallmanIsland', N'Tallman Island', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (105, NULL, N'Jamaica', N'Jamaica', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (106, NULL, N'BoweryBay', N'Bowery Bay', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (107, NULL, N'Rockaway', N'Rockaway', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (108, NULL, N'PortRichmond', N'Port Richmond', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (109, NULL, N'OakwoodBeach', N'Oakwood Beach', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (110, NULL, N'Dashboard_ActiveInspections', N'Active Containers', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (111, NULL, N'Dashboard_ContainersRemovalReady', N'Containers Ready For Removal', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (112, NULL, N'Dashboard_ContainersRecentlyRemoved', N'Containers Recently Removed', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (113, NULL, N'Dashboard_DEPContainerRemovalRequests', N'DEP Internal Removal Requests', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (114, NULL, N'Dashboard_ContractorContainerRemovalRequests', N'Contractor Removal Requests', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (115, NULL, N'Dashboard_UnassignedContractorContainerRemovals', N'Contractor Containers in Transit', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (116, NULL, N'Dashboard_UnassignedDepContainerRemovals', N'DEP Containers in Transit', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (117, NULL, N'Dashboard_ConflictedContainers', N'Conflicted Containers', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (118, NULL, N'Dashboard_ContainersRemovedPerDriver', N'Containers Removed Per Driver', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (119, NULL, N'Dashboard_ContainerRemovalRequestsPerFacility', N'Container Removal Requests Per Facility', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
INSERT [dbo].[Permissions] ([permission_id], [table_name], [permission_name], [display_name], [created_at], [updated_at]) VALUES (120, NULL, N'Dashboard_SystemNotificationsPanel', N'System Notifications Panel', CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (1, N'Administrator', N'Administrator', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Roles] ([role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (2, N'ApplicationSupport', N'Application Support', NULL, NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Roles] ([role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (3, N'Executive', N'Executive', N'Commissioner, Deputy Commissioner', NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Roles] ([role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (4, N'Manager', N'Manager', N'Director, Facility Manager, Plant Chief, Division Chief, Chief, Project Manager', NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Roles] ([role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (5, N'Supervisor', N'Supervisor', N'Senior Section Stationary Engineer Electrical (SSEE), Senior Sewage Treatment Worker (SSTW)', NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Roles] ([role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (6, N'Professional', N'Professional', N'Stationary Engineer Electrical (SEE), Stationary Engineer (SE), Sewage Treatment Worker (STW), Dispatchers', NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Roles] ([role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (7, N'Administrative', N'Administrative', N'Drivers, Administrative Staff, Interns', NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[Roles] ([role_id], [role_name], [display_name], [description], [created_by], [updated_by], [created_at], [updated_at], [deleted_at]) VALUES (8, N'Contractor', N'Contractor', N'Contractor', NULL, NULL, CAST(N'2023-07-07T13:42:40.5033333' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLogs] ON 

INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (1, N'HomeAPIController', N'Home', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-07T13:44:18.3410107' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (2, N'HomeAPIController', N'Home', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-07T13:48:15.0081376' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (3, N'User', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', NULL, N'::1', N'Access Granted', CAST(N'2023-07-07T13:48:16.4299107' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (4, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', NULL, N'::1', N'Access Granted', CAST(N'2023-07-07T13:48:39.2744314' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (5, N'User', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-07T13:49:24.5310590' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (6, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-07T13:49:27.3072843' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (7, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', NULL, N'::1', N'Access Granted', CAST(N'2023-07-07T13:50:11.4902358' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (8, N'Dblog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-07T13:53:04.5002086' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (9, N'Dblog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-07T15:04:56.1595772' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (10, N'Dblog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-07T15:05:16.9671597' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (11, N'Dblog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-07T15:05:29.7018146' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (12, N'Dblog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-07T15:05:33.0806227' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (13, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-07T15:05:39.8561456' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (14, N'EmailLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-07T15:05:43.2553075' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (15, N'ExceptionLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-07T15:05:44.6702606' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (16, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-07T15:05:46.6073735' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (17, N'User', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-07T15:05:55.0993442' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (18, N'HomeAPIController', N'Home', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-14T11:45:45.0438863' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (19, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:47:46.4218097' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (20, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:49:07.5060456' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (21, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:51:43.2713155' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (22, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', NULL, N'::1', N'Access Granted', CAST(N'2023-07-14T11:51:43.2816112' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (23, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:51:43.3221220' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (24, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:51:43.2718582' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (25, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:51:40.9435276' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (26, N'ExceptionLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:51:43.2830627' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (27, N'EmailLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:51:43.3106516' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (28, N'Dblog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:51:43.2840998' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (29, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', NULL, N'::1', N'Access Granted', CAST(N'2023-07-14T11:51:43.3379762' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (30, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', NULL, N'::1', N'Access Granted', CAST(N'2023-07-14T11:51:43.3679731' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (31, N'HomeAPIController', N'Home', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-14T11:52:19.8404497' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (32, N'HomeAPIController', N'Home', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-14T11:53:30.1084625' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (33, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:54:14.9799178' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (34, N'EmailLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:54:17.5597439' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (35, N'Dblog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:54:18.7265908' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (36, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:54:20.2431279' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (37, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:54:23.8229975' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (38, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:54:28.6712181' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (39, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:54:30.9243170' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (40, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:55:01.1762583' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (41, N'ExceptionLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:55:21.0163718' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (42, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:55:22.8782595' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (43, N'Dblog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:55:31.2377636' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (44, N'EmailLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:55:32.5210858' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (45, N'ExceptionLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:55:33.4332625' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (46, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T11:55:36.5067133' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (47, N'Dblog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T13:27:16.5695062' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (48, N'EmailLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T13:27:18.0507952' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (49, N'Dblog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T13:27:19.3625513' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (50, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T13:27:20.5399994' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (51, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T13:27:30.4547722' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (52, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T13:27:35.0999849' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (53, N'User', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T13:27:38.9034492' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (54, N'Dblog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:55:09.5191142' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (55, N'EmailLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:55:11.3201292' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (56, N'ExceptionLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:55:12.4814219' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (57, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:55:13.5648266' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (58, N'User', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:55:15.5973005' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (59, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:55:17.6010813' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (60, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:55:24.2662318' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (61, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:55:25.2610911' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (62, N'EmailLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:55:33.0895266' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (63, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:55:34.6114379' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (64, N'Dblog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:56:31.4891030' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (65, N'EmailLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:56:32.9539243' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (66, N'ExceptionLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:56:34.2466803' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (67, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:56:35.3221094' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (68, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:56:37.7894059' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (69, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:56:45.9534437' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (70, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:56:56.9993951' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (71, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.79', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-14T16:57:03.0530857' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (72, N'HomeAPIController', N'Home', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-17T12:47:07.3511025' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (73, N'UserLog', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-17T12:47:49.4092743' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (74, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-17T12:47:54.3258398' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (75, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82', N'localhost:5000', N'http://localhost:4200/', N'::1', N'Access Granted', CAST(N'2023-07-17T12:49:32.2880817' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (76, N'HomeAPIController', N'Home', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-08-24T16:48:31.5703390' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (77, N'HomeAPIController', N'Home', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-08-28T13:45:41.6166209' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (78, N'HomeAPIController', N'Home', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-08-30T15:14:44.2249130' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (79, N'BudgetSection', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.62', N'localhost:5000', NULL, N'::1', N'Access Granted', CAST(N'2023-08-30T15:15:31.1626943' AS DateTime2), 1)
INSERT [dbo].[UserLogs] ([user_log_id], [controller], [action], [user_agent], [url_current], [url_referral], [client_ip], [message], [created_at], [created_by]) VALUES (80, N'Permission', N'Read', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.62', N'localhost:5000', NULL, N'::1', N'Access Granted', CAST(N'2023-08-30T15:15:58.5277819' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[UserLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [user_type_id], [username], [firstname], [lastname], [emplid], [email], [email_notifications], [thumbnail], [ldap_whenChanged], [ldap_whenCreated], [is_disabled], [lockout_time], [created_at], [updated_at], [created_by], [updated_by]) VALUES (1, NULL, N'bchiu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[BudgetSections] ADD  CONSTRAINT [DF_BudgetSections_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[CmConsultants] ADD  CONSTRAINT [DF_CmConsultants_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[CmSections] ADD  CONSTRAINT [DF_CmSections_created_at_1]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[CommentLogs] ADD  CONSTRAINT [DF_CommentLogs_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Contractors] ADD  CONSTRAINT [DF_Contractors_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Contracts] ADD  CONSTRAINT [DF_Contracts_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[ContractsSections] ADD  CONSTRAINT [DF_ContractsSections_created_at_1]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[ContractsSectionToContractorPaids] ADD  CONSTRAINT [DF_ContractsSectionToContractorPaids_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DBLogs] ADD  CONSTRAINT [DF_DBLogs_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[EmailLogs] ADD  CONSTRAINT [DF_EmailLogs_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[ExceptionLogs] ADD  CONSTRAINT [DF_ExceptionLogs_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Invoices] ADD  CONSTRAINT [DF_Invoices_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[JobOrders] ADD  CONSTRAINT [DF_JobOrders_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[JocTocSections1] ADD  CONSTRAINT [DF_JocTocSections1_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[JocTocSections2] ADD  CONSTRAINT [DF_JocTocSections2_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[LineH] ADD  CONSTRAINT [DF_LineH_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[LineHDocuments] ADD  CONSTRAINT [DF_LineHDocuments_created_at_1]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[ReturnedToSections] ADD  CONSTRAINT [DF_ReturnedToSections_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF_Settings_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[BudgetSections]  WITH CHECK ADD  CONSTRAINT [FK_BudgetSections_ContractsSections] FOREIGN KEY([contracts_section_id])
REFERENCES [dbo].[ContractsSections] ([contracts_section_id])
GO
ALTER TABLE [dbo].[BudgetSections] CHECK CONSTRAINT [FK_BudgetSections_ContractsSections]
GO
ALTER TABLE [dbo].[BudgetSections]  WITH CHECK ADD  CONSTRAINT [FK_BudgetSections_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[BudgetSections] CHECK CONSTRAINT [FK_BudgetSections_ReturnedToSections]
GO
ALTER TABLE [dbo].[CmConsultants]  WITH CHECK ADD  CONSTRAINT [FK_CmConsultants_Contractors] FOREIGN KEY([contractor_id])
REFERENCES [dbo].[Contractors] ([contractor_id])
GO
ALTER TABLE [dbo].[CmConsultants] CHECK CONSTRAINT [FK_CmConsultants_Contractors]
GO
ALTER TABLE [dbo].[CmConsultants]  WITH CHECK ADD  CONSTRAINT [FK_CmConsultants_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[CmConsultants] CHECK CONSTRAINT [FK_CmConsultants_ReturnedToSections]
GO
ALTER TABLE [dbo].[CmSections]  WITH CHECK ADD  CONSTRAINT [FK_CmSections_CmConsultants] FOREIGN KEY([cm_consultant_id])
REFERENCES [dbo].[CmConsultants] ([cm_consultant_id])
GO
ALTER TABLE [dbo].[CmSections] CHECK CONSTRAINT [FK_CmSections_CmConsultants]
GO
ALTER TABLE [dbo].[CmSections]  WITH CHECK ADD  CONSTRAINT [FK_CmSections_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[CmSections] CHECK CONSTRAINT [FK_CmSections_ReturnedToSections]
GO
ALTER TABLE [dbo].[CommentLogs]  WITH CHECK ADD  CONSTRAINT [FK_CommentLogs_CmSections] FOREIGN KEY([cm_section_id])
REFERENCES [dbo].[CmSections] ([cm_section_id])
GO
ALTER TABLE [dbo].[CommentLogs] CHECK CONSTRAINT [FK_CommentLogs_CmSections]
GO
ALTER TABLE [dbo].[ConfirmatonCodes]  WITH CHECK ADD  CONSTRAINT [FK_ConfirmatonCodes_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[ConfirmatonCodes] CHECK CONSTRAINT [FK_ConfirmatonCodes_Users]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Contractors] FOREIGN KEY([contractor_id])
REFERENCES [dbo].[Contractors] ([contractor_id])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Contractors]
GO
ALTER TABLE [dbo].[ContractsSections]  WITH CHECK ADD  CONSTRAINT [FK_ContractsSections_JocTocSections1] FOREIGN KEY([joc_toc_section1_id])
REFERENCES [dbo].[JocTocSections1] ([joc_toc_section1_id])
GO
ALTER TABLE [dbo].[ContractsSections] CHECK CONSTRAINT [FK_ContractsSections_JocTocSections1]
GO
ALTER TABLE [dbo].[ContractsSections]  WITH CHECK ADD  CONSTRAINT [FK_ContractsSections_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[ContractsSections] CHECK CONSTRAINT [FK_ContractsSections_ReturnedToSections]
GO
ALTER TABLE [dbo].[ContractsSectionToContractorPaids]  WITH CHECK ADD  CONSTRAINT [FK_ContractsSectionToContractorPaids_JocTocSections2] FOREIGN KEY([joc_toc_section2_id])
REFERENCES [dbo].[JocTocSections2] ([joc_toc_section2_id])
GO
ALTER TABLE [dbo].[ContractsSectionToContractorPaids] CHECK CONSTRAINT [FK_ContractsSectionToContractorPaids_JocTocSections2]
GO
ALTER TABLE [dbo].[ContractsSectionToContractorPaids]  WITH CHECK ADD  CONSTRAINT [FK_ContractsSectionToContractorPaids_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[ContractsSectionToContractorPaids] CHECK CONSTRAINT [FK_ContractsSectionToContractorPaids_ReturnedToSections]
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
ALTER TABLE [dbo].[GroupAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_GroupAssignedRoles_Groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([group_id])
GO
ALTER TABLE [dbo].[GroupAssignedRoles] CHECK CONSTRAINT [FK_GroupAssignedRoles_Groups]
GO
ALTER TABLE [dbo].[GroupAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_GroupAssignedRoles_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[GroupAssignedRoles] CHECK CONSTRAINT [FK_GroupAssignedRoles_Roles]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_GroupTypes] FOREIGN KEY([group_type_id])
REFERENCES [dbo].[GroupTypes] ([group_type_id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_GroupTypes]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_InvoiceStatusTypes] FOREIGN KEY([invoice_status_type_id])
REFERENCES [dbo].[InvoiceStatusTypes] ([invoice_status_type_id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_InvoiceStatusTypes]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_InvoiceTypes] FOREIGN KEY([invoice_type_id])
REFERENCES [dbo].[InvoiceTypes] ([invoice_type_id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_InvoiceTypes]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_JobOrders] FOREIGN KEY([job_order_id])
REFERENCES [dbo].[JobOrders] ([job_order_id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_JobOrders]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_LineH] FOREIGN KEY([line_h_id])
REFERENCES [dbo].[LineH] ([line_h_id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_LineH]
GO
ALTER TABLE [dbo].[JobOrders]  WITH CHECK ADD  CONSTRAINT [FK_JobOrders_Contracts] FOREIGN KEY([contract_id])
REFERENCES [dbo].[Contracts] ([contract_id])
GO
ALTER TABLE [dbo].[JobOrders] CHECK CONSTRAINT [FK_JobOrders_Contracts]
GO
ALTER TABLE [dbo].[JobOrders]  WITH CHECK ADD  CONSTRAINT [FK_JobOrders_JobOrderStatusTypes] FOREIGN KEY([job_order_status_type_id])
REFERENCES [dbo].[JobOrderStatusTypes] ([job_order_status_type_id])
GO
ALTER TABLE [dbo].[JobOrders] CHECK CONSTRAINT [FK_JobOrders_JobOrderStatusTypes]
GO
ALTER TABLE [dbo].[JocTocSections1]  WITH CHECK ADD  CONSTRAINT [FK_JocTocSections1_CmSections] FOREIGN KEY([cm_section_id])
REFERENCES [dbo].[CmSections] ([cm_section_id])
GO
ALTER TABLE [dbo].[JocTocSections1] CHECK CONSTRAINT [FK_JocTocSections1_CmSections]
GO
ALTER TABLE [dbo].[JocTocSections1]  WITH CHECK ADD  CONSTRAINT [FK_JocTocSections1_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[JocTocSections1] CHECK CONSTRAINT [FK_JocTocSections1_ReturnedToSections]
GO
ALTER TABLE [dbo].[JocTocSections2]  WITH CHECK ADD  CONSTRAINT [FK_JocTocSections2_ContractsSections] FOREIGN KEY([contracts_section_id])
REFERENCES [dbo].[ContractsSections] ([contracts_section_id])
GO
ALTER TABLE [dbo].[JocTocSections2] CHECK CONSTRAINT [FK_JocTocSections2_ContractsSections]
GO
ALTER TABLE [dbo].[JocTocSections2]  WITH CHECK ADD  CONSTRAINT [FK_JocTocSections2_ReturnedToSections] FOREIGN KEY([returned_to_section_id])
REFERENCES [dbo].[ReturnedToSections] ([returned_to_section_id])
GO
ALTER TABLE [dbo].[JocTocSections2] CHECK CONSTRAINT [FK_JocTocSections2_ReturnedToSections]
GO
ALTER TABLE [dbo].[LineHDocuments]  WITH CHECK ADD  CONSTRAINT [FK_LineHDocuments_LineH] FOREIGN KEY([line_h_id])
REFERENCES [dbo].[LineH] ([line_h_id])
GO
ALTER TABLE [dbo].[LineHDocuments] CHECK CONSTRAINT [FK_LineHDocuments_LineH]
GO
ALTER TABLE [dbo].[OUAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_OUAssignedRoles_OUs] FOREIGN KEY([ou_id])
REFERENCES [dbo].[OUs] ([ou_id])
GO
ALTER TABLE [dbo].[OUAssignedRoles] CHECK CONSTRAINT [FK_OUAssignedRoles_OUs]
GO
ALTER TABLE [dbo].[OUAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_OUAssignedRoles_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[OUAssignedRoles] CHECK CONSTRAINT [FK_OUAssignedRoles_Roles]
GO
ALTER TABLE [dbo].[Passwords]  WITH CHECK ADD  CONSTRAINT [FK_Passwords_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Passwords] CHECK CONSTRAINT [FK_Passwords_Users]
GO
ALTER TABLE [dbo].[PlantAreas]  WITH CHECK ADD  CONSTRAINT [FK_PlantAreas_Plants] FOREIGN KEY([plant_id])
REFERENCES [dbo].[Plants] ([plant_id])
GO
ALTER TABLE [dbo].[PlantAreas] CHECK CONSTRAINT [FK_PlantAreas_Plants]
GO
ALTER TABLE [dbo].[ReturnedToSections]  WITH CHECK ADD  CONSTRAINT [FK_ReturnedToSections_SectionTypes] FOREIGN KEY([current_section_id])
REFERENCES [dbo].[SectionTypes] ([section_type_id])
GO
ALTER TABLE [dbo].[ReturnedToSections] CHECK CONSTRAINT [FK_ReturnedToSections_SectionTypes]
GO
ALTER TABLE [dbo].[ReturnedToSections]  WITH CHECK ADD  CONSTRAINT [FK_ReturnedToSections_SectionTypes1] FOREIGN KEY([returned_desdination_section_id])
REFERENCES [dbo].[SectionTypes] ([section_type_id])
GO
ALTER TABLE [dbo].[ReturnedToSections] CHECK CONSTRAINT [FK_ReturnedToSections_SectionTypes1]
GO
ALTER TABLE [dbo].[ReturnedToSections]  WITH CHECK ADD  CONSTRAINT [FK_ReturnedToSections_SectionTypes2] FOREIGN KEY([returned_from_section_id])
REFERENCES [dbo].[SectionTypes] ([section_type_id])
GO
ALTER TABLE [dbo].[ReturnedToSections] CHECK CONSTRAINT [FK_ReturnedToSections_SectionTypes2]
GO
ALTER TABLE [dbo].[RoleAssignedPermissions]  WITH CHECK ADD  CONSTRAINT [FK_RoleAssignedPermissions_Permissions] FOREIGN KEY([permission_id])
REFERENCES [dbo].[Permissions] ([permission_id])
GO
ALTER TABLE [dbo].[RoleAssignedPermissions] CHECK CONSTRAINT [FK_RoleAssignedPermissions_Permissions]
GO
ALTER TABLE [dbo].[RoleAssignedPermissions]  WITH CHECK ADD  CONSTRAINT [FK_RoleAssignedPermissions_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[RoleAssignedPermissions] CHECK CONSTRAINT [FK_RoleAssignedPermissions_Roles]
GO
ALTER TABLE [dbo].[UserAssignedCellCarriers]  WITH CHECK ADD  CONSTRAINT [FK_UserAssignedCellCarriers_CellCarriers1] FOREIGN KEY([cell_carrier_id])
REFERENCES [dbo].[CellCarriers] ([cell_carrier_id])
GO
ALTER TABLE [dbo].[UserAssignedCellCarriers] CHECK CONSTRAINT [FK_UserAssignedCellCarriers_CellCarriers1]
GO
ALTER TABLE [dbo].[UserAssignedCellCarriers]  WITH CHECK ADD  CONSTRAINT [FK_UserAssignedCellCarriers_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[UserAssignedCellCarriers] CHECK CONSTRAINT [FK_UserAssignedCellCarriers_Users]
GO
ALTER TABLE [dbo].[UserAssignedGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserAssignedGroups_Groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([group_id])
GO
ALTER TABLE [dbo].[UserAssignedGroups] CHECK CONSTRAINT [FK_UserAssignedGroups_Groups]
GO
ALTER TABLE [dbo].[UserAssignedGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserAssignedGroups_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[UserAssignedGroups] CHECK CONSTRAINT [FK_UserAssignedGroups_Users]
GO
ALTER TABLE [dbo].[UserAssignedRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserAssignedRoles_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[UserAssignedRoles] CHECK CONSTRAINT [FK_UserAssignedRoles_Roles]
GO
ALTER TABLE [dbo].[UserOUs]  WITH CHECK ADD  CONSTRAINT [FK_UserOUs_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[UserOUs] CHECK CONSTRAINT [FK_UserOUs_Users]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'this is a calculated money value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractsSectionToContractorPaids', @level2type=N'COLUMN',@level2name=N'actual_duration_joc_section_submission_contract_section_contractor_paid_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'group | role' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OUs', @level2type=N'COLUMN',@level2name=N'type'
GO
USE [master]
GO
ALTER DATABASE [JOCPaymentTracking] SET  READ_WRITE 
GO
