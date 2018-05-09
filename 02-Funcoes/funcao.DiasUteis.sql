
CREATE function [dbo].[DiasUteis] (@DateStart smalldatetime , @DateEnd Datetime) 
RETURNS Int 
AS 
BEGIN 
 Declare @Count Int 
 Select @Count = 0
 While @DateStart <= @DateEnd 
 Begin 
  If DatePart(WeekDay, @DateStart) Not In (7,1) And @DateStart Not In ( Select feriado from dbo.feriados_nacionais ) 
      Select @Count = @Count + 1 

    Select @DateStart = Dateadd(day,1,@DateStart)
 End 
 RETURN  @Count
END  
GO


