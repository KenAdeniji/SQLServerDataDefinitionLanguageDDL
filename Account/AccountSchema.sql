USE [master]
GO
/****** Object:  Database [Account]    Script Date: 2/1/2023 3:59:17 PM ******/
CREATE DATABASE [Account]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AccountData', FILENAME = N'E:\SQLServerDataFiles\Account\AccountData.MDF' , SIZE = 4608KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [AccountImage] 
( NAME = N'AccountImage', FILENAME = N'E:\SQLServerDataFiles\Account\AccountImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [AccountIndex] 
( NAME = N'AccountIndex', FILENAME = N'E:\SQLServerDataFiles\Account\AccountIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [AccountText] 
( NAME = N'AccountText', FILENAME = N'E:\SQLServerDataFiles\Account\AccountText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [AccountXML] 
( NAME = N'AccountXml', FILENAME = N'E:\SQLServerDataFiles\Account\AccountXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'AccountLog', FILENAME = N'E:\SQLServerDataFiles\Account\AccountLog.LDF' , SIZE = 2304KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Account] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Account].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Account] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Account] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Account] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Account] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Account] SET ARITHABORT OFF 
GO
ALTER DATABASE [Account] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Account] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Account] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Account] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Account] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Account] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Account] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Account] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Account] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Account] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Account] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Account] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Account] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Account] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Account] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Account] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Account] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Account] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Account] SET  MULTI_USER 
GO
ALTER DATABASE [Account] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [Account] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Account] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Account] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Account] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Account] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Account] SET QUERY_STORE = OFF
GO
USE [Account]
GO
/****** Object:  User [ephraimtech\ephwebuser]    Script Date: 2/1/2023 3:59:17 PM ******/
CREATE USER [ephraimtech\ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ephraimtech\ephwebuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ephraimtech\ephwebuser]
GO
/****** Object:  Table [dbo].[ChartOfAccounts]    Script Date: 2/1/2023 3:59:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChartOfAccounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Dated] [datetime] NOT NULL,
	[AccountNumber] [int] NOT NULL,
	[AccountTitle] [varchar](500) NOT NULL,
	[NormalBalance] [varchar](255) NULL,
	[Commentary] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChartOfAccounts] ON 

INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (1, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 100000, N'Assets', N'N/A', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (2, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 200000, N'Liabilities', N'N/A', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (3, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 300000, N'Net Position', N'N/A', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (4, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 400000, N'Budgetary', N'N/A', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (5, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 500000, N'Revenue and Other Financing Sources', N'N/A', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (6, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 600000, N'Expenses', N'N/A', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (7, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 700000, N'Gains/Losses/Miscellaneous Items', N'N/A', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (8, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 800000, N'Memorandum', N'N/A', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (9, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 162000, N'Investments in Securities Other Than the Bureau of the Public Debt Securities', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (10, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 162100, N'Discount on Securities Other Than the Bureau of the Public Debt Securities', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (11, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 162200, N'Premium on Securities Other Than the Bureau of the Public Debt Securities', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (12, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 162300, N'Amortization of Discount and Premium on Securities Other Than the Bureau of the Public Debt Securities', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (13, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 163000, N'Investments in U.S. Treasury Zero Coupon Bonds Issued by the Bureau of the Public Debt', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (14, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 163100, N'Discount on U.S. Treasury Zero Coupon Bonds Issued by the Bureau of the Public Debt', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (15, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 163300, N'Amortization of Discount on U.S. Treasury Zero Coupon Bonds Issued by the Bureau of the Public Debt', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (16, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 164200, N'Preferred Stock Accounted for Under the Provisions of the Federal Credit Reform Act', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (17, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 164300, N'Allowance for Subsidy - Preferred Stock Accounted for Under the Provisions of the Federal Credit Reform Act', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (18, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 164400, N'Common Stock Accounted for Under the Provisions of the Federal Credit Reform Act', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (19, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 164500, N'Allowance for Subsidy - Common Stock Accounted for Under the Provisions of the Federal Credit Reform Act', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (20, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 164600, N'Discount on Securities Account for Under the Provisions of the Federal Credit Reform Act', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (21, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 164700, N'Premium on Securities Accounted for Under the Provisions of the Federal Credit Reform Act', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (22, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 165000, N'Preferred Stock in Federal Government Sponsored Enterprise', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (23, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 165100, N'Market Adjustment - Senior Preferred Stock in Federal Government Sponsored Enterprise', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (24, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 165200, N'Common Stock Warrants in Federal Government Sponsored Enterprise', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (25, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 165300, N'Market Adjustment - Common Stock Warrants in Federal Government Sponsored Enterprise', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (26, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 167000, N'Foreign Investments', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (27, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 167100, N'Discount on Foreign Investments', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (28, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 167200, N'Premium on Foreign Investments', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (29, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 167900, N'Foreign Exchange Rate Revalue Adjustments - Investments', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (30, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 169000, N'Other Investments', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (31, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 171100, N'Land and Land Rights', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (32, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 171200, N'Improvements to Land', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (33, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 171900, N'Accumulated Depreciation on Improvements to Land', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (34, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 172000, N'Construction-in-Progress', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (35, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 173000, N'Buildings, Improvements, and Renovations', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (36, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 173900, N'Accumulated Depreciation on Buildings, Improvements, and Renovations', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (37, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 174000, N'Other Structures and Facilities', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (38, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 174900, N'Accumulated Depreciation on Other Structures and Facilities', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (39, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 175000, N'Equipment', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (40, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 175900, N'Accumulated Depreciation on Equipment', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (41, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 181000, N'Assets Under Capital Lease', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (42, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 181900, N'Accumulated Depreciation on Assets Under Capital Lease', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (43, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 182000, N'Leasehold Improvements', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (44, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 182900, N'Accumulated Amortization on Leasehold Improvements', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (45, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 183000, N'Internal-Use Software', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (46, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 183200, N'Internal-Use Software in Development', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (47, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 183900, N'Accumulated Amortization on Internal-Use Software', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (48, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 184000, N'Other Natural Resources', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (49, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 184900, N'Allowance for Depletion', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (50, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 189000, N'Other General Property, Plant, and Equipment', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (51, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 189900, N'Accumulated Depreciation on Other General Property, Plant, and Equipment', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (52, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 192100, N'Receivable From Appropriations', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (53, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 192300, N'Contingent Receivable for Capital Transfers', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (54, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 192500, N'Capital Transfers Receivable', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (55, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 198000, N'Asset for Agency''s Custodial and Non-Entity Liabilities', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (56, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 199000, N'Other Assets', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (57, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 199500, N'General Property, Plant, and Equipment Permanently Removed but Not Yet Disposed', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (58, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 199900, N'Central Accounting Control Account', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (59, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 201000, N'Liability for Fund Balance With Treasury', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (60, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 211000, N'Accounts Payable', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (61, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 211200, N'Accounts Payable for Federal Government Sponsored Enterprise', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (62, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 212000, N'Disbursements in Transit', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (63, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 213000, N'Contract Holdbacks', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (64, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 214000, N'Accrued Interest Payable - Not Otherwise Classified', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (65, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 214100, N'Accrued Interest Payable - Debt', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (66, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 215000, N'Payable for Transfers of Currently Invested Balances', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (67, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 215500, N'Expenditure Transfers Payable', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (68, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 216000, N'Entitlement Benefits Due and Payable', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (69, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 217000, N'Subsidy Payable to the Financing Account', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (70, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 218000, N'Loan Guarantee Liability', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (71, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 219000, N'Other Liabilities With Related Budgetary Obligations', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (72, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 219100, N'Employee Health Care Liability Incurred but Not Reported', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (73, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 219200, N'Special Drawing Right (SDR) Certificates Issued to Federal Reserve Banks', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (74, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 219300, N'Allocation of Special Drawing Rights (SDRs)', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (75, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 221000, N'Accrued Funded Payroll and Leave', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (76, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 221100, N'Withholdings Payable', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (77, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 221300, N'Employer Contributions and Payroll Taxes Payable', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (78, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 221500, N'Other Post Employment Benefits Due and Payable', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (79, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 221600, N'Pension Benefits Due and Payable to Beneficiaries', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (80, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 221700, N'Benefit Premiums Payable to Carriers', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (81, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 221800, N'Life Insurance Benefits Due and Payable to Beneficiaries', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (82, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 222000, N'Unfunded Leave', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (83, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 222500, N'Unfunded FECA Liability', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (84, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 229000, N'Other Unfunded Employment Related Liability', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (85, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 231000, N'Liability for Advances and Prepayments', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (86, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 232000, N'Other Deferred Revenue', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (87, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 240000, N'Liability for Nonfiduciary Deposit Funds and Undeposited Collections', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (88, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 241000, N'Liability for Clearing Accounts', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (89, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 251000, N'Principal Payable to the Bureau of the Public Debt', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (90, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 251100, N'Capitalized Loan Interest Payable -Non-Credit Reform', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (91, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 252000, N'Principal Payable to the Federal Financing Bank', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (92, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 253000, N'Securities Issued by Federal Agencies Under General and Special Financing Authority', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (93, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 253100, N'Discount on Securities Issued by Federal Agencies Under General and Special Financing Authority', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (94, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 253200, N'Premium on Securities Issued by Federal Agencies Under General and Special Financing Authority', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (95, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 253300, N'Amortization of Discount on Securities Issued by Federal Agencies Under General and Special Financing Authority', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (96, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 253400, N'Amortization of Premium on Securities Issued by Federal Agencies Under General and Special Financing Authority', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (97, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 254000, N'Participation Certificates', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (98, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 259000, N'Other Debt', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (99, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 261000, N'Actuarial Pension Liability', N'Credit', NULL)
GO
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (100, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 262000, N'Actuarial Health Insurance Liability', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (101, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 263000, N'Actuarial Life Insurance Liability', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (102, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 265000, N'Actuarial FECA Liability', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (103, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 266000, N'Actuarial Liabilities for Federal Insurance and Guarantee Programs', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (104, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 267000, N'Actuarial Liabilities for Treasury - Managed Benefit Programs', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (105, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 269000, N'Other Actuarial Liabilities', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (106, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 291000, N'Prior Liens Outstanding on Acquired Collateral', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (107, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 292000, N'Contingent Liabilities', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (108, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 292200, N'Contingent Liabilities - Federal Government Sponsored Enterprise', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (109, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 292300, N'Contingent Liability for Capital Transfers', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (110, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 294000, N'Capital Lease Liability', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (111, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 296000, N'Accounts Payable From Canceled Appropriations', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (112, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 297000, N'Liability for Capital Transfers', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (113, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 298000, N'Custodial Liability', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (114, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 298500, N'Liability for Non-Entity Assets Not Reported on the Statement of Custodial Activity', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (115, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 299000, N'Other Liabilities Without Related Budgetary Obligations', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (116, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 299500, N'Estimated Cleanup Cost Liability', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (117, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 310000, N'Unexpended Appropriations - Cumulative', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (118, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 310100, N'Unexpended Appropriations - Appropriations Received', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (119, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 310200, N'Unexpended Appropriations - Transfers-In', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (120, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 310300, N'Unexpended Appropriations - Transfers-Out', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (121, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 310500, N'Unexpended Appropriations - Prior Period Adjustments Due to Corrections of Errors - Years Preceding the Prior Year', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (122, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 310600, N'Unexpended Appropriations - Adjustments', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (123, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 310700, N'Unexpended Appropriations - Used', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (124, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 310800, N'Unexpended Appropriations - Prior - Period Adjustments Due to Corrections of Errors', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (125, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 310900, N'Unexpended Appropriations - Prior - Period Adjustments Due to Changes in Accounting Principles', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (126, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 320000, N'Appropriations Outstanding - Cumulative', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (127, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 320100, N'Appropriations Outstanding - Warrants Issued', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (128, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 320600, N'Appropriations Outstanding - Adjustments', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (129, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 331000, N'Cumulative Results of Operations', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (130, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 340000, N'Fiduciary Net Assets', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (131, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 341000, N'Contributions to Fiduciary Net Assets', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (132, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 342000, N'Withdrawals or Distributions of Fiduciary Net Assets', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (133, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 403200, N'Estimated Indefinite Contract Authority', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (134, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 403400, N'Anticipated Adjustments to Contract Authority', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (135, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 404200, N'Estimated Indefinite Borrowing Authority', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (136, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 404400, N'Anticipated Reductions to Borrowing Authority', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (137, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 404700, N'Anticipated Transfers to the General Fund of the Treasury-Current-Year Authority', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (138, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 404800, N'Anticipated Transfers to the General Fund of the Treasury-Prior-Year Balances', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (139, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 406000, N'Anticipated Collections From Non-Federal Sources', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (140, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 407000, N'Anticipated Collections From Federal Sources', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (141, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 408100, N'Amounts Appropriated From a Specific Treasury-Managed Trust Fund TAFS-Receivable-Transferred', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (142, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 408200, N'Allocations of Realized Authority -To Be Transferred From Invested Balances - Transferred', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (143, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 408300, N'Transfers -Current-Year Authority -Receivable -Transferred', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (144, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 411100, N'Debt Liquidation Appropriations', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (145, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 411200, N'Liquidation of Deficiency - Appropriations', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (146, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 411300, N'Appropriated Receipts Derived from Unavailable Trust or Special Fund Receipts', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (147, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 411400, N'Appropriated Receipts Derived from Available Trust or Special Fund Receipts', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (148, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 411500, N'Loan Subsidy Appropriation', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (149, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 411600, N'Debt Forgiveness Appropriation', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (150, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 411700, N'Loan Administrative Expense Appropriation', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (151, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 411800, N'Reestimated Loan Subsidy Appropriation', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (152, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 411900, N'Other Appropriations Realized', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (153, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 412000, N'Anticipated Indefinite Appropriations', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (154, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 412100, N'Amounts Appropriated From Specific Invested TAFS Reclassified -Receivable-Cancellation', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (155, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 412200, N'Authority Adjusted for Interest on the Bureau of the Public Debt Securities', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (156, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 412300, N'Amounts Appropriated From Specific Invested TAFS Reclassified -Receivable-Temporary Reduction', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (157, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 412400, N'Amounts Appropriated From Specific Invested TAFS Reclassified -Payable-Temporary Reduction/Cancellation', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (158, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 412500, N'Loan Modification Adjustment Transfer Appropriation', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (159, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 412600, N'Amounts Appropriated From Specific Invested TAFS - Receivable', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (160, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 412700, N'Amounts Appropriated From Specific Invested TAFS - Payable', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (161, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 412800, N'Amounts Appropriated From Specific Invested TAFS - Transfers-In', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (162, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 412900, N'Amounts Appropriated From Specific Invested TAFS - Transfers-Out', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (163, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 413000, N'Appropriation To Liquidate Contract Authority Withdrawn', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (164, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 413100, N'Current - Year Contract Authority Realized', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (165, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 413200, N'Substitution of Contract Authority', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (166, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 413300, N'Decreases to Indefinite Contract Authority', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (167, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 413400, N'Contract Authority Withdrawn', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (168, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 413500, N'Contract Authority Liquidated', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (169, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 413600, N'Contract Authority To Be Liquidated by Trust Funds', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (170, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 413700, N'Transfers of Contract Authority - Allocation', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (171, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 413800, N'Appropriation To Liquidate Contract Authority', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (172, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 413900, N'Contract Authority Carried Forward', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (173, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 414000, N'Substitution of Borrowing Authority', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (174, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 414100, N'Current - Year Borrowing Authority Realized', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (175, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 414200, N'Actual Repayment of Borrowing Authority Converted to Cash', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (176, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 414300, N'Current-Year Decreases to Indefinite Borrowing Authority Realized', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (177, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 414400, N'Borrowing Authority Withdrawn', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (178, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 414500, N'Borrowing Authority Converted to Cash', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (179, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 414600, N'Actual Repayments of Debt, Current-Year Authority', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (180, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 414700, N'Actual Repayments of Debt, Prior-Year Balances', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (181, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 414800, N'Resources Realized From Borrowing Authority', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (182, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 414900, N'Borrowing Authority Carried Forward', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (183, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 415000, N'Reappropriations - Transfers-In', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (184, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 415100, N'Actual Capital Transfers to the General Fund of the Treasury, Current-Year Authority', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (185, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 415200, N'Actual Capital Transfers to the General Fund of the Treasury, Prior-Year Balances', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (186, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 415300, N'Transfers of Contract Authority - Nonallocation', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (187, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 415400, N'Appropriation To Liquidate Contract Authority-Nonallocation-Transferred', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (188, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 415700, N'Authority Made Available From Receipt or Appropriation Balances Previously Precluded From Obligation', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (189, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 415800, N'Authority Made Available From Offsetting Collection Balances Previously Precluded From Obligation', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (190, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 416000, N'Anticipated Transfers-Current-Year Authority', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (191, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 416500, N'Allocations of Authority-Anticipated From Invested Balances', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (192, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 416600, N'Allocations of Realized Authority -To Be Transferred From Invested Balances', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (193, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 416700, N'Allocations of Realized Authority - Transferred From Invested Balances', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (194, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 416800, N'Allocations of Realized Authority Reclassified -Authority To Be Transferred From Invested Balances - Temporary Reduction', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (195, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 417000, N'Transfers - Current-Year Authority', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (196, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 417100, N'Nonallocation Transfers of Invested Balances - Receivable', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (197, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 417200, N'Nonallocation Transfers of Invested Balances - Payable', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (198, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 417300, N'Nonallocation Transfers of Invested Balances - Transferred', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (199, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 417500, N'Allocation Transfers of Current - Year Authority for Noninvested Accounts', N'Debit', NULL)
GO
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (200, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 417600, N'Allocation Transfers of Prior - Year Balances', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (201, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 418000, N'Anticipated Transfers - Prior - Year Balances', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (202, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 418300, N'Anticipated Balance Transfers - Unobligated Balances - Legislative Change of Purpose', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (203, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 419000, N'Transfers - Prior-Year Balances', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (204, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 419100, N'Balance Transfers - Extension of Availability Other Than Reappropriations', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (205, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 419200, N'Balance Transfers - Unexpired to Expired', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (206, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 419300, N'Balance Transfers - Unobligated Balances - Legislative Change of Purpose', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (207, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 419500, N'Transfer of Obligated Balances', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (208, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 419600, N'Balance Transfer-In-Expired to Expired', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (209, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 419700, N'Balance Transfer-Out-Expired to Expired', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (210, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 419900, N'Transfer of Expired Expenditure Transfers-Receivable', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (211, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 420100, N'Total Actual Resources-Collected', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (212, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 420800, N'Adjustment to Total Resources - Disposition of Canceled Payables', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (213, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 421000, N'Anticipated Reimbursements and Other Income', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (214, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 421200, N'Liquidation of Deficiency - Offsetting Collections', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (215, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 421500, N'Anticipated Expenditure Transfers from Trust Funds', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (216, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 422100, N'Unfilled Customer Orders Without Advance', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (217, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 422200, N'Unfilled Customer Orders With Advance', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (218, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 422500, N'Expenditure Transfers from Trust Funds - Receivable', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (219, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 423000, N'Unfilled Customer Orders Without Advance - Transferred', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (220, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 423100, N'Unfilled Customer Orders With Advance - Transferred', N'Credit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (221, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 423200, N'Appropriation Trust Fund Expenditure Transfers - Receivable - Transferred', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (222, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 423300, N'Reimbursements and Other Income Earned -Receivable-Transferred', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (223, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 423400, N'Other Federal Receivables - Transferred', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (224, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 425100, N'Reimbursements and Other Income Earned - Receivable', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (225, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 425200, N'Reimbursements and Other Income Earned - Collected', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (226, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 425300, N'Prior - Year Unfilled Customer Orders With Advance - Refunds Paid', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (227, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 425500, N'Expenditure Transfers from Trust Funds - Collected', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (228, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 426000, N'Actual Collections of "governmental-type" Fees', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (229, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 426100, N'Actual Collections of Business - Type Fees', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (230, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 426200, N'Actual Collections of Loan Principal', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (231, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 426300, N'Actual Collections of Loan Interest', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (232, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 426400, N'Actual Collections of Rent', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (233, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 426500, N'Actual Collections From Sale of Foreclosed Property', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (234, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 426600, N'Other Actual Business - Type Collections From Non-Federal Sources', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (235, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 426700, N'Other Actual "governmental-type" Collections From Non-Federal Sources', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (236, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 427100, N'Actual Program Fund Subsidy Collected', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (237, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 427300, N'Interest Collected From Treasury', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (238, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 427500, N'Actual Collections From Liquidating Fund', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (239, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 427600, N'Actual Collections From Financing Fund', N'Debit', NULL)
INSERT [dbo].[ChartOfAccounts] ([AccountID], [Dated], [AccountNumber], [AccountTitle], [NormalBalance], [Commentary]) VALUES (240, CAST(N'2018-04-30T00:00:00.000' AS DateTime), 427700, N'Other Actual Collections - Federal', N'Debit', NULL)
SET IDENTITY_INSERT [dbo].[ChartOfAccounts] OFF
GO
/****** Object:  Index [PK_AccountChart]    Script Date: 2/1/2023 3:59:17 PM ******/
ALTER TABLE [dbo].[ChartOfAccounts] ADD  CONSTRAINT [PK_AccountChart] PRIMARY KEY NONCLUSTERED 
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChartOfAccounts] ADD  CONSTRAINT [DF_ChartOfAccounts_Dated]  DEFAULT (getdate()) FOR [Dated]
GO
USE [master]
GO
ALTER DATABASE [Account] SET  READ_WRITE 
GO
