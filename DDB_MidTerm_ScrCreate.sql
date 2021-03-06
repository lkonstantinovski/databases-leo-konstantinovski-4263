USE [Master]
CREATE DATABASE [BusSchedule]
GO


USE [BusSchedule]
GO
/****** Object:  Table [dbo].[Bus]    Script Date: 05.11.2016 11:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bus](
	[vehicle] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleId] [int] NOT NULL,
	[fleet_Id] [int] NULL,
	[last_main] [datetime] NULL,
 CONSTRAINT [PK_Bus] PRIMARY KEY CLUSTERED 
(
	[vehicle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Driver]    Script Date: 05.11.2016 11:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BusVehicle] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[employ_Date] [datetime] NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[driverStat]    Script Date: 05.11.2016 11:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[driverStat](
	[ID_STAT] [int] IDENTITY(1,1) NOT NULL,
	[OPIS_STAT] [nvarchar](500) NULL,
	[DATUM_STAT] [datetime] NULL,
 CONSTRAINT [PK_driverStat] PRIMARY KEY CLUSTERED 
(
	[ID_STAT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Route]    Script Date: 05.11.2016 11:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fare] [float] NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RouteStop]    Script Date: 05.11.2016 11:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteStop](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[StopId] [int] NOT NULL,
 CONSTRAINT [PK_RouteStop] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 05.11.2016 11:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[departure] [datetime] NULL,
	[arrival]  AS (dateadd(hour,(3),[departure])),
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stop]    Script Date: 05.11.2016 11:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stop](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Terminus] [nvarchar](max) NULL,
 CONSTRAINT [PK_Stop] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Schedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedule] ([id])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Schedule]
GO
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_Bus] FOREIGN KEY([BusVehicle])
REFERENCES [dbo].[Bus] ([vehicle])
GO
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_Bus]
GO
ALTER TABLE [dbo].[RouteStop]  WITH CHECK ADD  CONSTRAINT [FK_RouteStop_Route] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Route] ([id])
GO
ALTER TABLE [dbo].[RouteStop] CHECK CONSTRAINT [FK_RouteStop_Route]
GO
ALTER TABLE [dbo].[RouteStop]  WITH CHECK ADD  CONSTRAINT [FK_RouteStop_Stop] FOREIGN KEY([StopId])
REFERENCES [dbo].[Stop] ([id])
GO
ALTER TABLE [dbo].[RouteStop] CHECK CONSTRAINT [FK_RouteStop_Stop]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Route] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Route] ([id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Route]
GO
