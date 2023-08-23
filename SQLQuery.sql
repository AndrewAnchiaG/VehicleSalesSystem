CREATE DATABASE [VehicleAgency]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VehicleAgency', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LOCALSERVER\MSSQL\DATA\VehicleAgency.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VehicleAgency_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LOCALSERVER\MSSQL\DATA\VehicleAgency_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 COLLATE Latin1_General_100_CS_AS_KS_WS_SC_UTF8
 WITH LEDGER = OFF
GO
ALTER DATABASE [VehicleAgency] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [VehicleAgency] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VehicleAgency] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VehicleAgency] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VehicleAgency] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VehicleAgency] SET ARITHABORT OFF 
GO
ALTER DATABASE [VehicleAgency] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VehicleAgency] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VehicleAgency] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [VehicleAgency] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VehicleAgency] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VehicleAgency] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VehicleAgency] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VehicleAgency] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VehicleAgency] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VehicleAgency] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VehicleAgency] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VehicleAgency] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VehicleAgency] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VehicleAgency] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VehicleAgency] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VehicleAgency] SET  READ_WRITE 
GO
ALTER DATABASE [VehicleAgency] SET RECOVERY FULL 
GO
ALTER DATABASE [VehicleAgency] SET  MULTI_USER 
GO
ALTER DATABASE [VehicleAgency] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VehicleAgency] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VehicleAgency] SET DELAYED_DURABILITY = DISABLED 
GO
USE [VehicleAgency]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [VehicleAgency]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [VehicleAgency] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO


USE [VehicleAgency]
GO
CREATE TABLE Client (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Code INT NOT NULL,    
	DNI VARCHAR(15) NOT NULL,  
	Name VARCHAR(25) NOT NULL,  
	FirstName VARCHAR(25) NOT NULL,
	LastName VARCHAR(25),
	Email VARCHAR(40) NOT NULL,
	Birth DATETIME,
	Mobile VARCHAR(15),
	Phone VARCHAR(15), 
	RegisterDate DATETIME,
	Status INT NOT NULL DEFAULT 1
);

GO
CREATE TABLE Vehicle (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Code INT NOT NULL,
	Model VARCHAR(20) NOT NULL,
	Mark VARCHAR(20) NOT NULL,
	Year INT NOT NULL,
	Color VARCHAR(25) NOT NULL,
	Passenger INT NOT NULL,
	Tire VARCHAR(12),
	Engine VARCHAR(50),
	Fuel VARCHAR(12) NOT NULL,
    Tank INT NOT NULL,
	Type INT NOT NULL,
	Count INT NOT NULL,
	Price FLOAT NOT NULL,
	Entry DATETIME NOT NULL,
	EntryBy INT NOT NULL,
	Status INT NOT NULL DEFAULT 1
	);
	
GO
CREATE TABLE Bill(
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Consecutive INT NOT NULL,
	NumericalKey VARCHAR(70) NOT NULL,   
	InternalCode INT NOT NULL,
	SalesPerson VARCHAR(60) NOT NULL,
	Client INT NOT NULL,
	Price FLOAT NOT NULL,
	IVA FLOAT,
	Total FLOAT NOT NULL,
	Date DATETIME NOT NULL,                                                                                                                                                                                                                                                                                                                                          
	Warranty DATETIME NOT NULL,
	Status INT NOT NULL DEFAULT 1,
	CONSTRAINT FK_Bill_Client FOREIGN KEY(Id) REFERENCES Client (Id),
	CONSTRAINT fk_Bill_Vehicle FOREIGN KEY(Id) REFERENCES Vehicle(Id)
);
GO
CREATE TABLE ListVehicle(
	IdBill INT NOT NULL,
	IdVehicle INT NOT NULL, 
	Status INT NOT NULL DEFAULT 1
);

GO
INSERT INTO [dbo].[Vehicle]
           ([Code],[Model],[Mark],[Year], [Color],[Passenger],[Tire],[Engine],[Fuel],[Tank],[Type],[Count],[Price],[Entry],[EntryBy],[Status])
     VALUES
		(1030,'HILUX SRV','TOYOTA',2024, 'Rojo',5,'265/70R17','2.8L 4CYL 16V DOHC D-4D 201HP@3400RPM', 'DIESEL' ,80 ,5 ,12 ,63900,'2023-08-22 11:30:00',1 ,1),
		(1031,'RAV4','TOYOTA',2024,'Negro',5,'225/65R17','2.0L 4CYL 16V DUAL VVT-iE 170HP 6600RPM','GASOLINA' ,55,1,6,34100,'2023-08-23 1:30:00',3,1),
		(1020,'FRONTIER NP300','NISSAN',2024,'Naranja Imperial',5 ,'265/70R18','2.5L PRO-X 4X4 188HP@3600RPM', 'DIESEL',60,5,8,63900,'2023-08-23 11:30:00',3,1)
GO

INSERT INTO [dbo].[Client] 
		([Code],[DNI] ,[Name]  ,[FirstName] ,[LastName],[Email],[Birth] ,[Mobile],[Phone],[RegisterDate],[Status])
     VALUES
        (1075,'207820248','Andrew O.','Anchía','González','andrewoag98@gmail.com','1998-07-30 9:45:10','+506 8575 8771','+506 8575 8771','2023-07-30 9:45:10',1),
        (1076,'402740569','Karen C.','Lopez','Caraz','karenlc@gmail.com','1980-04-25 5:20:00','+506 6563 8546','+506 8426 6522','2023-08-23 9:45:10',1);
GO
	
-----------------------------------------------------------------------------------------------------------------	 
CREATE PROCEDURE SelectAllActiveClient
AS
SELECT [Id],[Code],[DNI],[Name],[FirstName],[LastName] ,[Email],[Birth],[Mobile],[Phone],[RegisterDate],[Status]
  FROM [dbo].[Client] WHERE Status = 1;
GO
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE DeleteClient
@Id INT
AS 
UPDATE [dbo].[Client]
   SET [Status] = 0 
 WHERE Id = @Id;
GO
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE UpdateClient
	@Id INT,@Code INT, @DNI  VARCHAR(15), @Name VARCHAR(25), @FirstName VARCHAR(25), @LastName VARCHAR(25),
   @Email VARCHAR(40), @Birth datetime, @Mobile VARCHAR(15),  @Phone VARCHAR(15), @Status INT
AS
UPDATE [dbo].[Client]
   SET [Code] = @Code ,[DNI] = @DNI ,[Name] = @Name ,[FirstName] = @FirstName ,[LastName] = @LastName
      ,[Email] = @Email ,[Birth] = @Birth ,[Mobile] = @Mobile ,[Phone] = @Phone ,[Status] = @Status
 WHERE Id = @Id;
 GO
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertClient
	@Code INT,@DNI VARCHAR(15),@Name VARCHAR(25),@FirstName VARCHAR(25)
	,@LastName VARCHAR(25),@Email VARCHAR(40),@Birth DATETIME,@Mobile VARCHAR(15)
	,@Phone VARCHAR(15),@RegisterDate DATETIME,@Status INT
AS
INSERT INTO [dbo].[Client]
		([Code],[DNI] ,[Name] ,[FirstName] ,[LastName] ,[Email] ,[Birth] ,[Mobile] ,[Phone] ,[RegisterDate],[Status])
    VALUES(
		@Code,@DNI,@Name ,@FirstName ,@LastName ,@Email ,@Birth ,@Mobile ,@Phone,@RegisterDate,@Status)
GO
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertVehicle
@Code INT, @Model VARCHAR(20), @Mark VARCHAR(20) ,@Year INT, @Color VARCHAR(25), @Passenger INT, @Tire VARCHAR(12), @Engine VARCHAR(50),
@Fuel VARCHAR(12), @Tank INT, @Type INT, @Count INT, @Price FLOAT ,@Entry DATETIME,@EntryBy INT ,@Status INT
AS
INSERT INTO [dbo].[Vehicle]
            ([Code],[Model] ,[Mark] ,[Year] ,[Color] ,[Passenger] ,[Tire] ,[Engine],[Fuel] ,[Tank],[Type],[Count],[Price],[Entry],[EntryBy],[Status])
     VALUES(
		 @Code, @Model, @Mark, @Year, @Color, @Passenger ,@Tire, @Engine ,@Fuel ,@Tank ,@Type ,@Count ,@Price,@Entry,@EntryBy, @Status);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SearchVehicleBySalesPerson
@SalesPerson INT 
AS	
SELECT [Id] ,[Code],[Model],[Mark],[Year],[Color],[Passenger],[Tire],[Engine],[Fuel],[Tank],[Type],[Count],[Price],[Entry],[EntryBy],[Status]
  FROM [dbo].[Vehicle]
  WHERE Entry = @SalesPerson;
GO
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SearchVehicleByDateEntry
@DateEntry DATETIME 
AS	
SELECT [Id] ,[Code],[Model],[Mark],[Year],[Color],[Passenger],[Tire],[Engine],[Fuel],[Tank],[Type],[Count],[Price],[Entry],[EntryBy],[Status]
  FROM [dbo].[Vehicle]
  WHERE EntryBy = @DateEntry;
GO
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SelectAllActiveVehicle
AS	
SELECT [Id]
      ,[Code]
      ,[Model]
      ,[Mark]
      ,[Year]
      ,[Color]
      ,[Passenger]
      ,[Tire]
      ,[Engine]
      ,[Fuel]
      ,[Tank]
      ,[Type]
      ,[Count]
      ,[Price]
      ,[Entry]
      ,[EntryBy]
      ,[Status]
  FROM [dbo].[Vehicle]
  WHERE Status = 1;
GO
GO