USE [AGENCY]
GO
/****** Object:  Table [dbo].[Flights]    Script Date: 11/02/2013 09:32:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flights](
	[flight_id] [int] IDENTITY(180,21) NOT NULL,
	[status_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[flight_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesStatus]    Script Date: 11/02/2013 09:32:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesStatus](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PassengerType]    Script Date: 11/02/2013 09:32:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PassengerType](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WaitingList]    Script Date: 11/02/2013 09:32:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WaitingList](
	[waiting_id] [int] IDENTITY(2,2) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[last_name] [varchar](20) NOT NULL,
	[birthdate] [datetime] NOT NULL,
	[country] [varchar](20) NOT NULL,
	[adress] [varchar](50) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[seats] [int] NULL,
	[flight_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[waiting_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 11/02/2013 09:32:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales](
	[ticket_id] [varchar](20) NOT NULL,
	[buy_date] [datetime] NOT NULL,
	[status_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 11/02/2013 09:32:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reservations](
	[reservation_code] [varchar](20) NOT NULL,
	[passenger_id] [int] NOT NULL,
	[reservation_date] [datetime] NOT NULL,
	[flight_id] [int] NOT NULL,
	[ticket_id] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[reservation_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 11/02/2013 09:32:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Passenger](
	[passenger_id] [int] IDENTITY(1,2) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[last_name] [varchar](20) NOT NULL,
	[birthdate] [datetime] NOT NULL,
	[country] [varchar](20) NULL,
	[adress] [varchar](50) NULL,
	[email] [varchar](40) NULL,
	[phone] [varchar](20) NULL,
	[reservation_code] [varchar](20) NOT NULL,
	[type_id] [int] NOT NULL,
	[flight_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[passenger_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Passenger_code]    Script Date: 11/02/2013 09:32:56 ******/
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_code] FOREIGN KEY([reservation_code])
REFERENCES [dbo].[Reservations] ([reservation_code])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_code]
GO
/****** Object:  ForeignKey [FK_Passenger_id]    Script Date: 11/02/2013 09:32:56 ******/
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_id] FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flights] ([flight_id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_id]
GO
/****** Object:  ForeignKey [FK_Passenger_type]    Script Date: 11/02/2013 09:32:56 ******/
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_type] FOREIGN KEY([type_id])
REFERENCES [dbo].[PassengerType] ([type_id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_type]
GO
/****** Object:  ForeignKey [FK_Reservations_fid]    Script Date: 11/02/2013 09:32:56 ******/
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_fid] FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flights] ([flight_id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_fid]
GO
/****** Object:  ForeignKey [FK_Reservations_id]    Script Date: 11/02/2013 09:32:56 ******/
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_id] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[Sales] ([ticket_id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_id]
GO
/****** Object:  ForeignKey [FK_Sales_id]    Script Date: 11/02/2013 09:32:56 ******/
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_id] FOREIGN KEY([status_id])
REFERENCES [dbo].[SalesStatus] ([status_id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_id]
GO
/****** Object:  ForeignKey [FK_WaitingList_id]    Script Date: 11/02/2013 09:32:56 ******/
ALTER TABLE [dbo].[WaitingList]  WITH CHECK ADD  CONSTRAINT [FK_WaitingList_id] FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flights] ([flight_id])
GO
ALTER TABLE [dbo].[WaitingList] CHECK CONSTRAINT [FK_WaitingList_id]
GO
