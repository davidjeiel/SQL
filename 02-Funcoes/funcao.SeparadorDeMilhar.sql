
create function [dbo].[SeparadorMilhar] (@Valor int) 
returns varchar(30)
begin
declare @X varchar(30);
set @X=replace(
               replace(
                       replace(convert(varchar, cast(@Valor AS money), 1),
                               '.', 'x'),
                       ',','.'),
               'x',',')
return left(@X, len(@X)-3);
end;

GO


