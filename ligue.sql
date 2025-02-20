USE [master]
GO
/****** Object:  Database [TravailLigue]    Script Date: 21/03/2016 15:18:53 ******/
CREATE DATABASE [TravailLigue]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TravailLigue', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TravailLigue.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TravailLigue_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TravailLigue_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TravailLigue] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TravailLigue].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TravailLigue] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TravailLigue] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TravailLigue] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TravailLigue] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TravailLigue] SET ARITHABORT OFF 
GO
ALTER DATABASE [TravailLigue] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TravailLigue] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TravailLigue] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TravailLigue] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TravailLigue] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TravailLigue] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TravailLigue] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TravailLigue] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TravailLigue] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TravailLigue] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TravailLigue] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TravailLigue] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TravailLigue] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TravailLigue] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TravailLigue] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TravailLigue] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TravailLigue] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TravailLigue] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TravailLigue] SET  MULTI_USER 
GO
ALTER DATABASE [TravailLigue] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TravailLigue] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TravailLigue] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TravailLigue] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TravailLigue]
GO
/****** Object:  Table [dbo].[tcategories]    Script Date: 21/03/2016 15:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcategories](
	[idCat] [smallint] NOT NULL,
	[libcat] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[idCat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tcomptes]    Script Date: 21/03/2016 15:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcomptes](
	[idCompte] [int] NULL,
	[identifiant] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tligues]    Script Date: 21/03/2016 15:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tligues](
	[idligue] [int] NOT NULL,
	[nomligue] [nvarchar](50) NOT NULL,
	[adrligue] [nvarchar](50) NOT NULL,
	[villeligue] [nvarchar](50) NOT NULL,
	[cpligue] [nvarchar](5) NOT NULL,
	[telligue] [nvarchar](10) NOT NULL,
	[mailligue] [nvarchar](50) NOT NULL,
	[intitligue] [nvarchar](50) NULL,
 CONSTRAINT [PK_ligues] PRIMARY KEY CLUSTERED 
(
	[idligue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[treserv]    Script Date: 21/03/2016 15:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treserv](
	[idreserv] [int] NOT NULL,
	[idLigue] [int] NOT NULL,
	[idsalle] [smallint] NOT NULL,
	[datereserv] [datetime] NOT NULL,
 CONSTRAINT [PK_treserv] PRIMARY KEY CLUSTERED 
(
	[idreserv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tsalles]    Script Date: 21/03/2016 15:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tsalles](
	[idsalle] [smallint] NOT NULL,
	[libsalle] [nvarchar](50) NULL,
	[prixsalle] [numeric](6, 0) NOT NULL,
	[perssalle] [smallint] NOT NULL,
	[idCat] [smallint] NOT NULL,
 CONSTRAINT [PK_salles] PRIMARY KEY CLUSTERED 
(
	[idsalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[treserv]  WITH CHECK ADD  CONSTRAINT [FK_treserv_tligues] FOREIGN KEY([idLigue])
REFERENCES [dbo].[tligues] ([idligue])
GO
ALTER TABLE [dbo].[treserv] CHECK CONSTRAINT [FK_treserv_tligues]
GO
ALTER TABLE [dbo].[treserv]  WITH CHECK ADD  CONSTRAINT [FK_treserv_tsalles] FOREIGN KEY([idsalle])
REFERENCES [dbo].[tsalles] ([idsalle])
GO
ALTER TABLE [dbo].[treserv] CHECK CONSTRAINT [FK_treserv_tsalles]
GO
ALTER TABLE [dbo].[tsalles]  WITH CHECK ADD  CONSTRAINT [FK_reserv_cat] FOREIGN KEY([idCat])
REFERENCES [dbo].[tcategories] ([idCat])
GO
ALTER TABLE [dbo].[tsalles] CHECK CONSTRAINT [FK_reserv_cat]
GO
USE [master]
GO
ALTER DATABASE [TravailLigue] SET  READ_WRITE 
GO
