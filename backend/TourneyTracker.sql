USE [master]
GO
/****** Object:  Database [TournyTracker]    Script Date: 12/18/21 9:20:54 AM ******/
CREATE DATABASE [TournyTracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TournyTracker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TournyTracker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TournyTracker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TournyTracker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TournyTracker] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TournyTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TournyTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TournyTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TournyTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TournyTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TournyTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [TournyTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TournyTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TournyTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TournyTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TournyTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TournyTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TournyTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TournyTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TournyTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TournyTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TournyTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TournyTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TournyTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TournyTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TournyTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TournyTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TournyTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TournyTracker] SET RECOVERY FULL 
GO
ALTER DATABASE [TournyTracker] SET  MULTI_USER 
GO
ALTER DATABASE [TournyTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TournyTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TournyTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TournyTracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TournyTracker] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TournyTracker] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TournyTracker', N'ON'
GO
ALTER DATABASE [TournyTracker] SET QUERY_STORE = OFF
GO
USE [TournyTracker]
GO
/****** Object:  Table [dbo].[GameParticipants]    Script Date: 12/18/21 9:20:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameParticipants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[ParticipantId] [int] NOT NULL,
	[Team] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 12/18/21 9:20:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeagueId] [int] NOT NULL,
	[Date] [datetime] NULL,
	[IsFinal] [bit] NOT NULL,
	[Winner] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leagues]    Script Date: 12/18/21 9:20:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leagues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OwnerId] [varchar](28) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[IsPrivate] [bit] NOT NULL,
	[MinimumRating] [int] NOT NULL,
	[StartingRating] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participants]    Script Date: 12/18/21 9:20:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeagueId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Elo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/18/21 9:20:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [varchar](28) NOT NULL,
	[DisplayName] [varchar](100) NOT NULL,
	[Email] [varchar](100) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Games] ADD  CONSTRAINT [DF_Games_IsFinal]  DEFAULT ((0)) FOR [IsFinal]
GO
ALTER TABLE [dbo].[Leagues] ADD  CONSTRAINT [DF_Leagues_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Leagues] ADD  CONSTRAINT [DF_Leagues_Private]  DEFAULT ((1)) FOR [IsPrivate]
GO
ALTER TABLE [dbo].[Leagues] ADD  CONSTRAINT [DF_Leagues_MinimumRating]  DEFAULT ((0)) FOR [MinimumRating]
GO
ALTER TABLE [dbo].[Leagues] ADD  CONSTRAINT [DF_Leagues_StartingRating]  DEFAULT ((1500)) FOR [StartingRating]
GO
USE [master]
GO
ALTER DATABASE [TournyTracker] SET  READ_WRITE 
GO
