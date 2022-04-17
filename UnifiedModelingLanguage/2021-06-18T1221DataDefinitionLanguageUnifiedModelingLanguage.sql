CREATE DATABASE [UnifiedModelingLanguage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UnifiedModelingLanguage_Data', FILENAME = N'E:\SQLServerDataFiles\UnifiedModelingLanguage\UnifiedModelingLanguageData.MDF' , SIZE = 138112KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [UnifiedModelingLanguage_Image_FileGroup] 
( NAME = N'UnifiedModelingLanguage_Image', FILENAME = N'E:\SQLServerDataFiles\UnifiedModelingLanguage\UnifiedModelingLanguageImage.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [UnifiedModelingLanguage_Index_FileGroup] 
( NAME = N'UnifiedModelingLanguage_Index', FILENAME = N'E:\SQLServerDataFiles\UnifiedModelingLanguage\UnifiedModelingLanguageIndex.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [UnifiedModelingLanguage_Text_FileGroup] 
( NAME = N'UnifiedModelingLanguage_Text', FILENAME = N'E:\SQLServerDataFiles\UnifiedModelingLanguage\UnifiedModelingLanguageText.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [UnifiedModelingLanguage_Xml_FileGroup] 
( NAME = N'UnifiedModelingLanguage_Xml', FILENAME = N'E:\SQLServerDataFiles\UnifiedModelingLanguage\UnifiedModelingLanguageXml.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'UnifiedModelingLanguage_Log', FILENAME = N'E:\SQLServerDataFiles\UnifiedModelingLanguage\UnifiedModelingLanguageLog.LDF' , SIZE = 263808KB , MAXSIZE = 2048GB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UnifiedModelingLanguage] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UnifiedModelingLanguage].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ARITHABORT OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET RECOVERY FULL 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET  MULTI_USER 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UnifiedModelingLanguage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UnifiedModelingLanguage] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UnifiedModelingLanguage] SET QUERY_STORE = OFF
GO
