
create function [dbo].[RetiraZeroEsquerda] (@campo Varchar(60))
Returns VARCHAR(60)
as
begin
 Declare @flag bit, @cont integer, @var VARCHAR(30)
 SET @cont = 1
 SET @flag = 0
 while (@flag = 0) 
 begin  
   set @var = substring(@campo,@cont,1)
   if @var = '0' 
   begin
    set @cont = @cont+1
   end
   else
    set @flag = 1   
 end 
 
 return SUBSTRING(@CAMPO,@cont,LEN(@CAMPO))
end
GO


