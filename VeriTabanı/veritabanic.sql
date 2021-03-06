USE [master]
GO
/****** Object:  Database [Okul]    Script Date: 28.12.2016 10:38:04 ******/
CREATE DATABASE [Okul]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Okul', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Okul.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Okul_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Okul_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Okul] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Okul].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Okul] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Okul] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Okul] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Okul] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Okul] SET ARITHABORT OFF 
GO
ALTER DATABASE [Okul] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Okul] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Okul] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Okul] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Okul] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Okul] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Okul] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Okul] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Okul] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Okul] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Okul] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Okul] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Okul] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Okul] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Okul] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Okul] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Okul] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Okul] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Okul] SET  MULTI_USER 
GO
ALTER DATABASE [Okul] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Okul] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Okul] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Okul] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Okul]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 28.12.2016 10:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminAd] [varchar](50) NOT NULL,
	[AdminSoyad] [varchar](50) NOT NULL,
	[AdminSifre] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AkademikBirim]    Script Date: 28.12.2016 10:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AkademikBirim](
	[AkademikBirimID] [int] IDENTITY(1,1) NOT NULL,
	[AkademikBirimAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_AkademikBirim] PRIMARY KEY CLUSTERED 
(
	[AkademikBirimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bolumler]    Script Date: 28.12.2016 10:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bolumler](
	[BolumlerID] [int] IDENTITY(1,1) NOT NULL,
	[BolumAdi] [nvarchar](50) NOT NULL,
	[AkademikBirimID] [int] NOT NULL,
 CONSTRAINT [PK_Bolumler] PRIMARY KEY CLUSTERED 
(
	[BolumlerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dersler]    Script Date: 28.12.2016 10:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dersler](
	[DersID] [int] IDENTITY(1,1) NOT NULL,
	[DersKodu] [nvarchar](50) NULL,
	[BolumlerID] [int] NULL,
	[DönemID] [int] NULL,
 CONSTRAINT [PK_Dersler] PRIMARY KEY CLUSTERED 
(
	[DersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Devamsızlık]    Script Date: 28.12.2016 10:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devamsızlık](
	[OgrenciID] [int] NULL,
	[DersID] [int] NULL,
	[Tarih] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donem]    Script Date: 28.12.2016 10:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donem](
	[DönemID] [int] IDENTITY(1,1) NOT NULL,
	[DönemAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Donem] PRIMARY KEY CLUSTERED 
(
	[DönemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OgrElemani]    Script Date: 28.12.2016 10:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OgrElemani](
	[OgrElemaniTC] [varchar](11) NOT NULL,
	[OgrElemaniAdi] [nvarchar](50) NOT NULL,
	[OgrElemaniSoyad] [nvarchar](50) NOT NULL,
	[BolumlerID] [int] NOT NULL,
	[OgrElemaniSifre] [nvarchar](50) NOT NULL,
	[OgrElemaniSicilNo] [int] NOT NULL,
 CONSTRAINT [PK_OgrElemani] PRIMARY KEY CLUSTERED 
(
	[OgrElemaniTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OgrElemaniDers]    Script Date: 28.12.2016 10:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OgrElemaniDers](
	[OgrElemaniTC] [varchar](11) NOT NULL,
	[DersID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ogrenciler]    Script Date: 28.12.2016 10:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenciler](
	[OgrenciID] [int] IDENTITY(1,1) NOT NULL,
	[OgrenciNo] [int] NOT NULL,
	[OgrenciAdi] [varchar](50) NOT NULL,
	[OgrenciSoyadi] [varchar](50) NOT NULL,
	[OgrenciSifre] [varchar](10) NOT NULL,
	[BolumlerID] [int] NOT NULL,
 CONSTRAINT [PK_Ogrenciler] PRIMARY KEY CLUSTERED 
(
	[OgrenciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OgrenciNot]    Script Date: 28.12.2016 10:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OgrenciNot](
	[NotID] [int] IDENTITY(1,1) NOT NULL,
	[OgrenciID] [int] NULL,
	[DönemID] [int] NULL,
	[SınavTipID] [int] NULL,
	[DersKodu] [nvarchar](50) NULL,
 CONSTRAINT [PK_OgrenciNot] PRIMARY KEY CLUSTERED 
(
	[NotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SınavTipleri]    Script Date: 28.12.2016 10:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SınavTipleri](
	[SınavTipID] [int] IDENTITY(1,1) NOT NULL,
	[SınavTipAdi] [nvarchar](50) NULL,
	[Agırlık] [int] NULL,
 CONSTRAINT [PK_SınavTipleri] PRIMARY KEY CLUSTERED 
(
	[SınavTipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Bolumler]  WITH CHECK ADD  CONSTRAINT [FK_Bolumler_AkademikBirim] FOREIGN KEY([AkademikBirimID])
REFERENCES [dbo].[AkademikBirim] ([AkademikBirimID])
GO
ALTER TABLE [dbo].[Bolumler] CHECK CONSTRAINT [FK_Bolumler_AkademikBirim]
GO
ALTER TABLE [dbo].[Dersler]  WITH CHECK ADD  CONSTRAINT [FK_Dersler_Bolumler] FOREIGN KEY([BolumlerID])
REFERENCES [dbo].[Bolumler] ([BolumlerID])
GO
ALTER TABLE [dbo].[Dersler] CHECK CONSTRAINT [FK_Dersler_Bolumler]
GO
ALTER TABLE [dbo].[Dersler]  WITH CHECK ADD  CONSTRAINT [FK_Dersler_Donem] FOREIGN KEY([DönemID])
REFERENCES [dbo].[Donem] ([DönemID])
GO
ALTER TABLE [dbo].[Dersler] CHECK CONSTRAINT [FK_Dersler_Donem]
GO
ALTER TABLE [dbo].[Devamsızlık]  WITH CHECK ADD  CONSTRAINT [FK_Devamsızlık_Dersler] FOREIGN KEY([DersID])
REFERENCES [dbo].[Dersler] ([DersID])
GO
ALTER TABLE [dbo].[Devamsızlık] CHECK CONSTRAINT [FK_Devamsızlık_Dersler]
GO
ALTER TABLE [dbo].[Devamsızlık]  WITH CHECK ADD  CONSTRAINT [FK_Devamsızlık_Ogrenciler] FOREIGN KEY([OgrenciID])
REFERENCES [dbo].[Ogrenciler] ([OgrenciID])
GO
ALTER TABLE [dbo].[Devamsızlık] CHECK CONSTRAINT [FK_Devamsızlık_Ogrenciler]
GO
ALTER TABLE [dbo].[OgrElemani]  WITH CHECK ADD  CONSTRAINT [FK_OgrElemani_Bolumler] FOREIGN KEY([BolumlerID])
REFERENCES [dbo].[Bolumler] ([BolumlerID])
GO
ALTER TABLE [dbo].[OgrElemani] CHECK CONSTRAINT [FK_OgrElemani_Bolumler]
GO
ALTER TABLE [dbo].[OgrElemaniDers]  WITH CHECK ADD  CONSTRAINT [FK_OgrElemaniDers_Dersler] FOREIGN KEY([DersID])
REFERENCES [dbo].[Dersler] ([DersID])
GO
ALTER TABLE [dbo].[OgrElemaniDers] CHECK CONSTRAINT [FK_OgrElemaniDers_Dersler]
GO
ALTER TABLE [dbo].[OgrElemaniDers]  WITH CHECK ADD  CONSTRAINT [FK_OgrElemaniDers_OgrElemani] FOREIGN KEY([OgrElemaniTC])
REFERENCES [dbo].[OgrElemani] ([OgrElemaniTC])
GO
ALTER TABLE [dbo].[OgrElemaniDers] CHECK CONSTRAINT [FK_OgrElemaniDers_OgrElemani]
GO
ALTER TABLE [dbo].[Ogrenciler]  WITH CHECK ADD  CONSTRAINT [FK_Ogrenciler_Bolumler] FOREIGN KEY([BolumlerID])
REFERENCES [dbo].[Bolumler] ([BolumlerID])
GO
ALTER TABLE [dbo].[Ogrenciler] CHECK CONSTRAINT [FK_Ogrenciler_Bolumler]
GO
ALTER TABLE [dbo].[OgrenciNot]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciNot_Donem] FOREIGN KEY([DönemID])
REFERENCES [dbo].[Donem] ([DönemID])
GO
ALTER TABLE [dbo].[OgrenciNot] CHECK CONSTRAINT [FK_OgrenciNot_Donem]
GO
ALTER TABLE [dbo].[OgrenciNot]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciNot_Ogrenciler] FOREIGN KEY([OgrenciID])
REFERENCES [dbo].[Ogrenciler] ([OgrenciID])
GO
ALTER TABLE [dbo].[OgrenciNot] CHECK CONSTRAINT [FK_OgrenciNot_Ogrenciler]
GO
ALTER TABLE [dbo].[OgrenciNot]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciNot_SınavTipleri] FOREIGN KEY([SınavTipID])
REFERENCES [dbo].[SınavTipleri] ([SınavTipID])
GO
ALTER TABLE [dbo].[OgrenciNot] CHECK CONSTRAINT [FK_OgrenciNot_SınavTipleri]
GO
USE [master]
GO
ALTER DATABASE [Okul] SET  READ_WRITE 
GO
