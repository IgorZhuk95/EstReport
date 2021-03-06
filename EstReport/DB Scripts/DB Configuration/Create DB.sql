USE [master]
GO
/****** Object:  Database [EstateEvaluation]    Script Date: 5/24/2016 1:10:56 PM ******/
CREATE DATABASE [EstateEvaluation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EstateEvaluation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EstateEvaluation.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EstateEvaluation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EstateEvaluation_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EstateEvaluation] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EstateEvaluation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EstateEvaluation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EstateEvaluation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EstateEvaluation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EstateEvaluation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EstateEvaluation] SET ARITHABORT OFF 
GO
ALTER DATABASE [EstateEvaluation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EstateEvaluation] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EstateEvaluation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EstateEvaluation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EstateEvaluation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EstateEvaluation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EstateEvaluation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EstateEvaluation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EstateEvaluation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EstateEvaluation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EstateEvaluation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EstateEvaluation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EstateEvaluation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EstateEvaluation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EstateEvaluation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EstateEvaluation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EstateEvaluation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EstateEvaluation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EstateEvaluation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EstateEvaluation] SET  MULTI_USER 
GO
ALTER DATABASE [EstateEvaluation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EstateEvaluation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EstateEvaluation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EstateEvaluation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EstateEvaluation]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 5/24/2016 1:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [uniqueidentifier] NOT NULL,
	[Region] [nvarchar](256) NULL,
	[City] [nvarchar](256) NULL,
	[Street] [nvarchar](256) NULL,
	[HouseNumber] [nvarchar](256) NULL,
	[FlatNumber] [nvarchar](256) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Estates]    Script Date: 5/24/2016 1:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estates](
	[Id] [uniqueidentifier] NOT NULL,
	[AddressId] [uniqueidentifier] NOT NULL,
	[TypeId] [uniqueidentifier] NOT NULL,
	[Square] [decimal](18, 2) NULL,
	[Price] [decimal](18, 2) NULL,
	[EstateOwner] [nvarchar](max) NULL,
 CONSTRAINT [PK_Estates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EstateTypes]    Script Date: 5/24/2016 1:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstateTypes](
	[id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
 CONSTRAINT [PK_EstateTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EvaluationTypes]    Script Date: 5/24/2016 1:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_EvaluationTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reports]    Script Date: 5/24/2016 1:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[Id] [uniqueidentifier] NOT NULL,
	[Customer] [nvarchar](256) NULL,
	[DateOfEvaluation] [date] NULL,
	[DateOfReportFinish] [date] NULL,
	[ExchangeRate] [decimal](18, 4) NULL,
	[ExpirationDate] [date] NULL,
	[EvaluationGoal] [nvarchar](max) NULL,
	[Evaluator] [nvarchar](256) NULL,
	[EstateId] [uniqueidentifier] NOT NULL,
	[EvaluationTypeId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/24/2016 1:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/24/2016 1:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Mail] [nvarchar](256) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_Address]
GO
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_EstateTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[EstateTypes] ([id])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_EstateTypes]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Estates] FOREIGN KEY([EstateId])
REFERENCES [dbo].[Estates] ([Id])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Estates]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_EvaluationTypes] FOREIGN KEY([EvaluationTypeId])
REFERENCES [dbo].[EvaluationTypes] ([Id])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_EvaluationTypes]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [EstateEvaluation] SET  READ_WRITE 
GO
