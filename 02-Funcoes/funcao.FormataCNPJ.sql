
CREATE FUNCTION [dbo].[cnpj](@Texto varchar(8000))

returns varchar(50)  

AS  

BEGIN

         declare @cnpj varchar(50)  

         select @cnpj = dbo.limpa_dado(@Texto) 
         select @cnpj = CASE
    				WHEN @cnpj in ('',null)
        				THEN 	''
    					ELSE
        					substring(right('00000000000000'+convert(varchar,@cnpj),14),1,2)
                    				+'.'+
                    				substring(right('00000000000000'+convert(varchar,@cnpj),14),3,3)
                    				+'.'+
                    				substring(right('00000000000000'+convert(varchar,@cnpj),14),6,3)
                    				+'/'+
                                    substring(right('00000000000000'+convert(varchar,@cnpj),14),9,4)
                                    +'-'+
                    				substring(right('00000000000000'+convert(varchar,@cnpj),14),13,2)
			END          



return (@cnpj)  

END
;
GO


