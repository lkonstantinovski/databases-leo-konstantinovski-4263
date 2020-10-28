-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Stops @vehicle NUMERIC
AS
SELECT * 
FROM    [dbo].[Bus] as B
        INNER JOIN 
        [dbo].[Schedule] as S
            ON B.ScheduleId = S.id
        INNER JOIN
        [dbo].[Route] AS R
            ON R.id = S.RouteId
        INNER JOIN
        [dbo].[RouteStop] AS RS
            ON RS.RouteId = R.id
        INNER JOIN 
        [dbo].[Stop] AS St
            ON St.id = RS.StopId
WHERE vehicle = @vehicle
GO
