USE [master]
GO
/****** Object:  Database [TopCV]    Script Date: 4/12/2024 10:20:52 AM ******/
CREATE DATABASE [TopCV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TopCV', FILENAME = N'T:\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\TopCV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TopCV_log', FILENAME = N'T:\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\TopCV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TopCV] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TopCV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TopCV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TopCV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TopCV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TopCV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TopCV] SET ARITHABORT OFF 
GO
ALTER DATABASE [TopCV] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TopCV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TopCV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TopCV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TopCV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TopCV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TopCV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TopCV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TopCV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TopCV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TopCV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TopCV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TopCV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TopCV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TopCV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TopCV] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TopCV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TopCV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TopCV] SET  MULTI_USER 
GO
ALTER DATABASE [TopCV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TopCV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TopCV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TopCV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TopCV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TopCV] SET QUERY_STORE = OFF
GO
USE [TopCV]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/12/2024 10:20:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/12/2024 10:20:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/12/2024 10:20:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/12/2024 10:20:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/12/2024 10:20:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/12/2024 10:20:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/12/2024 10:20:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/12/2024 10:20:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobApplication]    Script Date: 4/12/2024 10:20:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobApplication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UploadFile] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NULL,
	[JobListingId] [int] NULL,
 CONSTRAINT [PK_JobApplication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobListing]    Script Date: 4/12/2024 10:20:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobListing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CompanyName] [nvarchar](max) NULL,
	[Position] [nvarchar](max) NULL,
	[Salary] [nvarchar](max) NULL,
	[LocationId] [int] NOT NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_JobListing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 4/12/2024 10:20:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] NOT NULL,
	[LocationName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'7.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240409121902_intialCreate', N'7.0.17')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'AD', N'Admin', N'Admin', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'EE', N'Employee', N'Employee', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ER', N'Employer', N'Employer', N'Employer')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cb9354db-be85-44fb-a67a-78151b0b1e57', N'AD')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'456f5a32-743e-42b7-8de9-172bf6fd1856', N'EE')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'75cb11ec-068e-4897-935a-d0a12c02c66a', N'EE')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0a42bd8f-65ec-41b6-9777-f1a921a89669', N'ER')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c01ff7c4-42e4-4dc0-8d34-72155c983870', N'ER')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0a42bd8f-65ec-41b6-9777-f1a921a89669', N'Employer1@gmail.com', N'EMPLOYER1@GMAIL.COM', N'Employer1@gmail.com', N'EMPLOYER1@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEF0rsMbCNUiGzWgbkCxuSjvwp7hy1K3+WBlc8ztyeIuDqCQU55HSBqicIXhvQfPaJw==', N'SUMXYTAIQ3QW55WN5NS4UIXJOK5XTQKD', N'7995456e-dc06-475a-99ab-28d7276d074d', N'51591951', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'456f5a32-743e-42b7-8de9-172bf6fd1856', N'Employee1@gmail.com', N'EMPLOYEE1@GMAIL.COM', N'Employee1@gmail.com', N'EMPLOYEE1@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAELVGiQcjbha9wnqCXig0Lx6Xlc4QU/y+q04f6hYNzMOm+Y2BPAoQSZy21wMhGkWzRQ==', N'DVDPIZ5MQCZQELJ4HT4TAQKWGAG7A4BZ', N'b0431e98-89ba-42b8-a169-c67538c0dbbe', N'0911496608', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'75cb11ec-068e-4897-935a-d0a12c02c66a', N'Employee@gmail.com', N'EMPLOYEE@GMAIL.COM', N'Employee@gmail.com', N'EMPLOYEE@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEG7aWLkH2+2D8y/RSFQkliiKi96ZDUfzTm95teJJTB0nDHSgcgGtHONmeWH+mdENig==', N'V2AZELSXUO72252HYNLPNQJB7BDRHPBO', N'122f4e5e-0f05-4fa8-800d-3410ce0f998f', N'6126541684', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c01ff7c4-42e4-4dc0-8d34-72155c983870', N'Employer@gmail.com', N'EMPLOYER@GMAIL.COM', N'Employer@gmail.com', N'EMPLOYER@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEFLQN9sB9LYZqM0+sXcAkAbyc8gBamZSMVBNetzNc1EbSv8HPJSoYyk/TaS3FwNWRw==', N'T76B734Y4NC4DTRP4UC5QTXLYSMZJ5NZ', N'e7bd3289-d08d-4e78-8fdc-61f10433748e', N'21549846516', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'cb9354db-be85-44fb-a67a-78151b0b1e57', N'Admin@gmail.com', N'ADMIN@GMAIL.COM', N'Admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEAjPDmQl3vtrKt5o8pVykpST9+ejL6RPzyl6d1Bo9VrJ0aLW+Ay0iDGSIgY+QYc3kA==', N'S4SV3KMHAWQN52O6Y7NY6FOLLPD2SCT7', N'6b7077de-e849-4147-81c5-83546d1e58aa', N'649416484', 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[JobApplication] ON 

INSERT [dbo].[JobApplication] ([Id], [UploadFile], [UserId], [JobListingId]) VALUES (5, N'Assignment 1 guide.docx', N'75cb11ec-068e-4897-935a-d0a12c02c66a', 6)
INSERT [dbo].[JobApplication] ([Id], [UploadFile], [UserId], [JobListingId]) VALUES (6, N'Assignment 1 guide.docx', N'75cb11ec-068e-4897-935a-d0a12c02c66a', 5)
INSERT [dbo].[JobApplication] ([Id], [UploadFile], [UserId], [JobListingId]) VALUES (7, N'Assignment 1 guide.docx', N'456f5a32-743e-42b7-8de9-172bf6fd1856', 8)
INSERT [dbo].[JobApplication] ([Id], [UploadFile], [UserId], [JobListingId]) VALUES (8, N'Assignment 1 guide.docx', N'456f5a32-743e-42b7-8de9-172bf6fd1856', 3)
SET IDENTITY_INSERT [dbo].[JobApplication] OFF
GO
SET IDENTITY_INSERT [dbo].[JobListing] ON 

INSERT [dbo].[JobListing] ([Id], [Title], [Description], [CompanyName], [Position], [Salary], [LocationId], [UserId]) VALUES (3, N'Chuyên Viên Tài Chính Gennerali', N'Thời Gian Làm Việc Linh Hoạt', N'Gennerali', N'Staff', N'700$', 30, N'c01ff7c4-42e4-4dc0-8d34-72155c983870')
INSERT [dbo].[JobListing] ([Id], [Title], [Description], [CompanyName], [Position], [Salary], [LocationId], [UserId]) VALUES (4, N'Chuyên Viên Phát Triển Thương Hiệu', N'Ứng viên nộp hồ sơ trực tuyến bằng cách bấm Ứng tuyển ngay dưới đây', N'Người Bạn Vàng', N'Employer Branding', N'600$', 21, N'c01ff7c4-42e4-4dc0-8d34-72155c983870')
INSERT [dbo].[JobListing] ([Id], [Title], [Description], [CompanyName], [Position], [Salary], [LocationId], [UserId]) VALUES (5, N'Bán Hàng Ô Tô VinFast Long Biên', N'Tiếp cận và tìm kiếm khách hàng qua nguồn Marketing online, hội nhóm Facebook, diễn đàn Ô tô, mối quan hệ cá nhân bạn bè, người thân, ngân hàng, các hãng bảo hiểm, trực Showroom, data khách hàng của Tập đoàn Vingroup', N'Vinfast', N'Nhân Viên Kinh Doanh', N'2000$', 21, N'c01ff7c4-42e4-4dc0-8d34-72155c983870')
INSERT [dbo].[JobListing] ([Id], [Title], [Description], [CompanyName], [Position], [Salary], [LocationId], [UserId]) VALUES (6, N'Nhân Viên Kinh Doanh Ô Tô Nissan', N'Tìm kiếm khách hàng tiềm năng thông qua internet, mối quan hệ (KH cũ, đơn vị khác, gia đình, bạn bè...).', N'Nissan', N'Nhân Viên Kinh Doanh', N'500$', 30, N'0a42bd8f-65ec-41b6-9777-f1a921a89669')
INSERT [dbo].[JobListing] ([Id], [Title], [Description], [CompanyName], [Position], [Salary], [LocationId], [UserId]) VALUES (7, N'Sản Phẩm Quản Lý Giáo Dục(Product Owner)', N'Nghiên cứu, phân tích xu hướng sản phẩm để tìm kiếm những ý tưởng vượt trội, đề xuất phương án phát triển sản phẩm để mang lại nhiều giá trị cho khách hàng và công ty.', N'MiSa', N'Product Owner', N'1200$', 30, N'0a42bd8f-65ec-41b6-9777-f1a921a89669')
INSERT [dbo].[JobListing] ([Id], [Title], [Description], [CompanyName], [Position], [Salary], [LocationId], [UserId]) VALUES (8, N'Sales Manager Tại trung tâm Hà Nội', N'Nghiên cứu, phân tích thị trường, tình hình kinh doanh, lập kế hoạch, xác định mục tiêu kinh doanh và định hướng phát triển của bộ phận để đạt được những mục tiêu đề ra', N'Bảo Việt Life Pro', N'Nhân Viên Kinh Doanh', N'200$', 21, N'0a42bd8f-65ec-41b6-9777-f1a921a89669')
INSERT [dbo].[JobListing] ([Id], [Title], [Description], [CompanyName], [Position], [Salary], [LocationId], [UserId]) VALUES (9, N'Content Marketing Thương Mại Điện Tử Quốc Tế', N'9 MATE JSC là start up chuyên kinh doanh trên sàn thương mại điện tử Amazon tại các nước: Mỹ, Anh, Canada... với mô hình FBA. Founder là 1 người có 7 năm kinh nghiệm trong thương mại điện tử xuyên biên giới.', N'9 Meta', N'Content Creater', N'200$', 34, N'0a42bd8f-65ec-41b6-9777-f1a921a89669')
INSERT [dbo].[JobListing] ([Id], [Title], [Description], [CompanyName], [Position], [Salary], [LocationId], [UserId]) VALUES (10, N'Giáo Viên Tiếng Anh( Ielts 6.5 trở lên)', N'Giảng dạy ngữ pháp, kỹ năng đọc viết và quản lý trật tự lớp, giúp học sinh hiểu bài cặn kẽ và nhớ bài', N'PAN PACIFIC VIỆT NAM', N'Giáo Viên', N'200$', 30, N'c01ff7c4-42e4-4dc0-8d34-72155c983870')
SET IDENTITY_INSERT [dbo].[JobListing] OFF
GO
INSERT [dbo].[Location] ([Id], [LocationName]) VALUES (21, N'Yên Bái')
INSERT [dbo].[Location] ([Id], [LocationName]) VALUES (24, N'Lào Cai')
INSERT [dbo].[Location] ([Id], [LocationName]) VALUES (30, N'Hà Nội')
INSERT [dbo].[Location] ([Id], [LocationName]) VALUES (34, N'Hải Dương')
INSERT [dbo].[Location] ([Id], [LocationName]) VALUES (90, N'Hà Nam')
INSERT [dbo].[Location] ([Id], [LocationName]) VALUES (99, N'Bắc Ninh')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 4/12/2024 10:20:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 4/12/2024 10:20:53 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 4/12/2024 10:20:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 4/12/2024 10:20:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 4/12/2024 10:20:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 4/12/2024 10:20:53 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 4/12/2024 10:20:53 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobApplication_JobListingId]    Script Date: 4/12/2024 10:20:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_JobApplication_JobListingId] ON [dbo].[JobApplication]
(
	[JobListingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobListing_LocationId]    Script Date: 4/12/2024 10:20:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_JobListing_LocationId] ON [dbo].[JobListing]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[JobApplication]  WITH CHECK ADD  CONSTRAINT [FK_JobApplication_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[JobApplication] CHECK CONSTRAINT [FK_JobApplication_AspNetUsers]
GO
ALTER TABLE [dbo].[JobApplication]  WITH CHECK ADD  CONSTRAINT [FK_JobApplication_JobListing_JobListingId] FOREIGN KEY([JobListingId])
REFERENCES [dbo].[JobListing] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobApplication] CHECK CONSTRAINT [FK_JobApplication_JobListing_JobListingId]
GO
ALTER TABLE [dbo].[JobListing]  WITH CHECK ADD  CONSTRAINT [FK_JobListing_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[JobListing] CHECK CONSTRAINT [FK_JobListing_AspNetUsers]
GO
ALTER TABLE [dbo].[JobListing]  WITH CHECK ADD  CONSTRAINT [FK_JobListing_Location_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobListing] CHECK CONSTRAINT [FK_JobListing_Location_LocationId]
GO
USE [master]
GO
ALTER DATABASE [TopCV] SET  READ_WRITE 
GO
