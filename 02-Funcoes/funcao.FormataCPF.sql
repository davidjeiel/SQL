

CREATE FUNCTION [dbo].[cpf](@Texto varchar(8000))

returns varchar(50)  

AS  

BEGIN

         declare @cpf varchar(50)  

         select @cpf = dbo.limpa_dado(@Texto) 
         select @cpf = CASE
    				WHEN @cpf in ('',null)
        				THEN 	''
    					ELSE
                                    substring(right('0000'+convert(varchar,@cpf),11),1,3)
                    				+'.'+
                    				substring(right('0000'+convert(varchar,@cpf),11),4,3)
                    				+'.'+
                    				substring(right('0000'+convert(varchar,@cpf),11),7,3)
                    				+'-'+
                    				substring(right('0000'+convert(varchar,@cpf),11),10,2)
                    END          

return (@cpf)  

END
;
GO


