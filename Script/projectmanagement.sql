USE [master]
GO
/****** Object:  Database [Project management]    Script Date: 01/12/2017 2:20:28 AM ******/
CREATE DATABASE [Project management] ON  PRIMARY 
( NAME = N'pProject management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\pProject management.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'pProject management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\pProject management_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Project management] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project management] SET  MULTI_USER 
GO
ALTER DATABASE [Project management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project management] SET DB_CHAINING OFF 
GO
USE [Project management]
GO
/****** Object:  Table [dbo].[ProjectAssing]    Script Date: 01/12/2017 2:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectAssing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NULL,
	[PersonsUserId] [int] NULL,
 CONSTRAINT [PK_ProjectAssing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectInfo]    Script Date: 01/12/2017 2:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ProjectName] [nvarchar](max) NULL,
	[CodeName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[PossibleStartDate] [datetime2](7) NULL,
	[PossibleEndDate] [datetime2](7) NOT NULL,
	[Duration] [nvarchar](50) NULL,
	[UploadFile] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[ShortName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProjectInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaskAssign]    Script Date: 01/12/2017 2:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskAssign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NULL,
	[PersonUserId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[DueDate] [datetime] NULL,
	[Priority] [nvarchar](50) NULL,
	[TaskAssignBy] [int] NULL,
 CONSTRAINT [PK_TaskAssign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 01/12/2017 2:20:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[Id] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](50) NULL,
	[DefaultPassword] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[Designation] [nvarchar](max) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_UserInformation_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 01/12/2017 2:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 01/12/2017 2:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 01/12/2017 2:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 01/12/2017 2:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 01/12/2017 2:20:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ProjectAssing] ON 

INSERT [dbo].[ProjectAssing] ([Id], [ProjectId], [PersonsUserId]) VALUES (20, 15, 41)
INSERT [dbo].[ProjectAssing] ([Id], [ProjectId], [PersonsUserId]) VALUES (21, 15, 40)
SET IDENTITY_INSERT [dbo].[ProjectAssing] OFF
SET IDENTITY_INSERT [dbo].[ProjectInfo] ON 

INSERT [dbo].[ProjectInfo] ([Id], [UserId], [ProjectName], [CodeName], [Description], [PossibleStartDate], [PossibleEndDate], [Duration], [UploadFile], [Status], [ShortName]) VALUES (15, 40, N'School Automation', N'SA01', N'A simple school automation website', CAST(N'2017-12-04 00:00:00.0000000' AS DateTime2), CAST(N'2017-12-20 00:00:00.0000000' AS DateTime2), N'17', NULL, N'Started', N'SA        ')
INSERT [dbo].[ProjectInfo] ([Id], [UserId], [ProjectName], [CodeName], [Description], [PossibleStartDate], [PossibleEndDate], [Duration], [UploadFile], [Status], [ShortName]) VALUES (16, 40, N'Test Project', N'TP01', N'A simple school automation website', CAST(N'2017-12-14 00:00:00.0000000' AS DateTime2), CAST(N'2017-12-21 00:00:00.0000000' AS DateTime2), N'8', NULL, N'Started', N'TP        ')
INSERT [dbo].[ProjectInfo] ([Id], [UserId], [ProjectName], [CodeName], [Description], [PossibleStartDate], [PossibleEndDate], [Duration], [UploadFile], [Status], [ShortName]) VALUES (17, 0, N'tamims project', NULL, N'des', CAST(N'2017-12-08 00:00:00.0000000' AS DateTime2), CAST(N'2017-12-29 00:00:00.0000000' AS DateTime2), N'22', NULL, N'Started', NULL)
INSERT [dbo].[ProjectInfo] ([Id], [UserId], [ProjectName], [CodeName], [Description], [PossibleStartDate], [PossibleEndDate], [Duration], [UploadFile], [Status], [ShortName]) VALUES (18, 0, N'dsf', NULL, N'asdf', CAST(N'2017-12-05 00:00:00.0000000' AS DateTime2), CAST(N'2017-11-17 00:00:00.0000000' AS DateTime2), N'-17', NULL, N'Started', NULL)
INSERT [dbo].[ProjectInfo] ([Id], [UserId], [ProjectName], [CodeName], [Description], [PossibleStartDate], [PossibleEndDate], [Duration], [UploadFile], [Status], [ShortName]) VALUES (19, 45, N'fgsdf', N'dfgdsf', N'dsfgsd', CAST(N'2017-12-06 00:00:00.0000000' AS DateTime2), CAST(N'2017-12-27 00:00:00.0000000' AS DateTime2), N'22', NULL, N'Started', N'sgdfg     ')
INSERT [dbo].[ProjectInfo] ([Id], [UserId], [ProjectName], [CodeName], [Description], [PossibleStartDate], [PossibleEndDate], [Duration], [UploadFile], [Status], [ShortName]) VALUES (20, 45, N'dfas', N'asdfasdf', N'asdf', CAST(N'2017-12-07 00:00:00.0000000' AS DateTime2), CAST(N'2017-12-15 00:00:00.0000000' AS DateTime2), N'9', NULL, N'Started', N'dasdf     ')
INSERT [dbo].[ProjectInfo] ([Id], [UserId], [ProjectName], [CodeName], [Description], [PossibleStartDate], [PossibleEndDate], [Duration], [UploadFile], [Status], [ShortName]) VALUES (21, 45, N'sdafasd', N'asdf', N'asdf', CAST(N'2017-12-06 00:00:00.0000000' AS DateTime2), CAST(N'2017-12-20 00:00:00.0000000' AS DateTime2), N'15', N'C:\Users\Ttami\Desktop\Nerd Castle Limited\Project\Project Management\Project Management\Images\Assignment - .Net Jr. Software Engineer.docx', N'Started', N'afd       ')
SET IDENTITY_INSERT [dbo].[ProjectInfo] OFF
SET IDENTITY_INSERT [dbo].[TaskAssign] ON 

INSERT [dbo].[TaskAssign] ([Id], [ProjectId], [PersonUserId], [Description], [DueDate], [Priority], [TaskAssignBy]) VALUES (22, 15, 41, N'simple test', CAST(N'2017-12-31 00:00:00.000' AS DateTime), N'High', 40)
SET IDENTITY_INSERT [dbo].[TaskAssign] OFF
INSERT [dbo].[UserInformation] ([Id], [UserName], [UserEmail], [DefaultPassword], [Status], [Designation], [UserId]) VALUES (40, N'Projectmanager', N'Projectmanager', N'Projectmanager123', N'Active', N'ProjectManager', 39)
INSERT [dbo].[UserInformation] ([Id], [UserName], [UserEmail], [DefaultPassword], [Status], [Designation], [UserId]) VALUES (41, N'developer', N'developer', N'developer123', N'Active', N'Developer', 39)
INSERT [dbo].[UserInformation] ([Id], [UserName], [UserEmail], [DefaultPassword], [Status], [Designation], [UserId]) VALUES (42, N'qaengineer', N'qaengineer', N'qaengineer123', N'Active', N'QAEngineer', 39)
INSERT [dbo].[UserInformation] ([Id], [UserName], [UserEmail], [DefaultPassword], [Status], [Designation], [UserId]) VALUES (43, N'uxengineer', N'uxengineer', N'uxengineer123', N'Active', N'UXEngineer', 39)
INSERT [dbo].[UserInformation] ([Id], [UserName], [UserEmail], [DefaultPassword], [Status], [Designation], [UserId]) VALUES (45, N'tamim2', N'tamim2', N'tamim2123', N'Active', N'ProjectManager', 44)
INSERT [dbo].[UserInformation] ([Id], [UserName], [UserEmail], [DefaultPassword], [Status], [Designation], [UserId]) VALUES (46, N'tamim3', N'tamim3', N'tamim3123', N'Active', N'Developer', 44)
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (41, N'developer')
INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (39, N'ItAdmin')
INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (40, N'Projectmanager')
INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (42, N'qaengineer')
INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (1, N'tamim')
INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (43, N'uxengineer')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(N'2017-11-30 16:17:51.750' AS DateTime), NULL, 1, NULL, 0, N'AMJ5W4/L1hb1ZNCI1npt0mUg0VH9lB6wU0aJHp4O6tHDIdlm2gDfqSMGLhzvUY4uZQ==', CAST(N'2017-11-30 16:17:51.750' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (39, CAST(N'2017-11-30 19:32:57.000' AS DateTime), NULL, 1, NULL, 0, N'AM1jalmTYFtpN8HkT1D+ag35gOsuiHyOCaMuYu85jXiEN1WuGrtEehAS1Uprh5gWNQ==', CAST(N'2017-11-30 19:32:57.000' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (40, CAST(N'2017-11-30 19:34:10.000' AS DateTime), NULL, 1, CAST(N'2017-11-30 19:36:18.000' AS DateTime), 0, N'AGf2ZHKFkbqYoJ+ohETft8EwwJqQItSLuZSOrVOVNKuI3atwQXfHGflK+3gFrUjY3g==', CAST(N'2017-11-30 19:34:10.000' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (41, CAST(N'2017-11-30 19:34:34.000' AS DateTime), NULL, 1, NULL, 0, N'ALF8TYwI+nisJ49kmjQ+LXxJ5pgIDRQSzs7aQclL8wiOWf9U6laLtmZoz9omQpbC2Q==', CAST(N'2017-11-30 19:34:34.000' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (42, CAST(N'2017-11-30 19:35:16.000' AS DateTime), NULL, 1, NULL, 0, N'AAuUMtQEhIPkbWrU+7vGNPmf7zRbAaTnEQeRWEa9YojDjpD5BAI3wpihBO2xzJzL3g==', CAST(N'2017-11-30 19:35:16.000' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (43, CAST(N'2017-11-30 19:35:45.000' AS DateTime), NULL, 1, NULL, 0, N'ANouzmTM7+vViCqX9/7NATDAq64BCxLmr+CLSek3yLo8CxJGZnjeokjWHnSy8iT6nA==', CAST(N'2017-11-30 19:35:45.000' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (44, CAST(N'2017-11-30 19:47:58.000' AS DateTime), NULL, 1, NULL, 0, N'AII6QI1YOHP9V7JZ4Zae/hvK6pU9d+KioDWTP8LiKrShTMsq33yTG8kOfrCD1fboFg==', CAST(N'2017-11-30 19:47:58.000' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (45, CAST(N'2017-11-30 19:48:24.000' AS DateTime), NULL, 1, NULL, 0, N'AOiWthVr8tbSxUxPBKbAEym+fN0RzfeLtWnFnRpv6SjewAItCiZOgyXsC52FiBFaNA==', CAST(N'2017-11-30 19:48:24.000' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (46, CAST(N'2017-11-30 19:48:39.000' AS DateTime), NULL, 1, NULL, 0, N'AMg7nNlNzSEm4KEx/pkn1iSbpRP3nwPZfcASJ8lXbnT6inel8cp2rZ0IJsdysIgMIg==', CAST(N'2017-11-30 19:48:39.000' AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (6, N'Developer')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'ITAdmin')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'ProjectManager')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (4, N'QAEngineer')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (3, N'TeamLead')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (5, N'UXEngineer')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (39, 1)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (40, 2)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (41, 6)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (42, 4)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (43, 5)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserProf__C9F28456023D5A04]    Script Date: 01/12/2017 2:20:29 AM ******/
ALTER TABLE [dbo].[UserProfile] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B61601273C1CD]    Script Date: 01/12/2017 2:20:29 AM ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
USE [master]
GO
ALTER DATABASE [Project management] SET  READ_WRITE 
GO
