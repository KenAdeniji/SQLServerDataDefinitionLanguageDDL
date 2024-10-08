USE [master]
GO
/****** Object:  Database [ComparingYourWordAsYourDeed]    Script Date: 9/18/2021 3:09:42 AM ******/
CREATE DATABASE [ComparingYourWordAsYourDeed]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ComparingYourWordAsYourDeed_Data', FILENAME = N'E:\SQLServerDataFiles\ComparingYourWordAsYourDeed\ComparingYourWordAsYourDeedData.MDF' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [ComparingYourWordAsYourDeed_Index_FileGroup] 
( NAME = N'ComparingYourWordAsYourDeed_Index', FILENAME = N'E:\SQLServerDataFiles\ComparingYourWordAsYourDeed\ComparingYourWordAsYourDeedIndex.NDF' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%) 
 LOG ON 
( NAME = N'ComparingYourWordAsYourDeed_Log', FILENAME = N'E:\SQLServerDataFiles\ComparingYourWordAsYourDeed\ComparingYourWordAsYourDeedLog.LDF' , SIZE = 10240KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ComparingYourWordAsYourDeed].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ARITHABORT OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET RECOVERY FULL 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET  MULTI_USER 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET QUERY_STORE = OFF
GO
USE [ComparingYourWordAsYourDeed]
GO
/****** Object:  User [LoginNameSecurity]    Script Date: 9/18/2021 3:09:42 AM ******/
CREATE USER [LoginNameSecurity] FOR LOGIN [LoginNameSecurity] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ephwebuser]    Script Date: 9/18/2021 3:09:42 AM ******/
CREATE USER [ephwebuser] FOR LOGIN [ephraimtech\ephwebuser] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [master]
GO
ALTER DATABASE [ComparingYourWordAsYourDeed] SET  READ_WRITE 
GO
