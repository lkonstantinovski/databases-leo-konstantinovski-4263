-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TheTrigger]
   ON  [dbo].[Driver]
   AFTER INSERT
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    DECLARE @Id int
    DECLARE @Vehicle int
    SELECT    @Id = i.id,
            @Vehicle = i.BusVehicle
    FROM inserted i;

    -- Insert statements for trigger here

    INSERT INTO [dbo].[driverStat] (DESC_STAT, DATE_STAT) 
    VALUES ('A new driver is inserted with an ID = ' + CAST(@Id AS varchar(18)) + ', which will drive a Vehicle with an ID = ' + CAST(@Vehicle AS varchar(18)), GETDATE());
END
GO               



