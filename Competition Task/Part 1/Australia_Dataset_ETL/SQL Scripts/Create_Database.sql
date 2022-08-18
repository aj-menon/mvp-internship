USE [master]
GO

/****** Object:  Database [AustraliaDW]    Script Date: 18/08/2022 13:25:09 ******/
CREATE DATABASE [AustraliaDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AustraliaDW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AustraliaDW.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AustraliaDW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AustraliaDW_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AustraliaDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [AustraliaDW] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [AustraliaDW] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [AustraliaDW] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [AustraliaDW] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [AustraliaDW] SET ARITHABORT OFF 
GO

ALTER DATABASE [AustraliaDW] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [AustraliaDW] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [AustraliaDW] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [AustraliaDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [AustraliaDW] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [AustraliaDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [AustraliaDW] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [AustraliaDW] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [AustraliaDW] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [AustraliaDW] SET  DISABLE_BROKER 
GO

ALTER DATABASE [AustraliaDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [AustraliaDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [AustraliaDW] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [AustraliaDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [AustraliaDW] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [AustraliaDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [AustraliaDW] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [AustraliaDW] SET RECOVERY FULL 
GO

ALTER DATABASE [AustraliaDW] SET  MULTI_USER 
GO

ALTER DATABASE [AustraliaDW] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [AustraliaDW] SET DB_CHAINING OFF 
GO

ALTER DATABASE [AustraliaDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [AustraliaDW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [AustraliaDW] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [AustraliaDW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [AustraliaDW] SET QUERY_STORE = OFF
GO

ALTER DATABASE [AustraliaDW] SET  READ_WRITE 
GO

