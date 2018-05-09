
CREATE function [dbo].[AddDiaUtil] (@DateStartSup smalldatetime , @Dias int) 
RETURNS smalldatetime 
AS 
BEGIN 
 Declare @Start Int 
 Declare @Count Int 
 Declare @DateStart Datetime 
 Select @DateStart = Dateadd(Day,1,@DateStartSup),  @Count = 0, @Start = 0 
 While @Count < @Dias 
 Begin 
  If DatePart(WeekDay, @DateStart) Not In (7,1) And @DateStart Not In ( Select feriado from dbo.feriados_nacionais) 
      Select @Count = @Count + 1
    Select @DateStart = Dateadd(day,1,@DateStart), @Start = @Start + 1 
 End 
 RETURN  DateAdd(day,@Start,@DateStartSup) 
END  

GO


