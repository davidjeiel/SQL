

CREATE FUNCTION [dbo].[data](@Texto varchar(50))

returns varchar(10)  

AS  

BEGIN

         declare @data varchar(50)  

         select @data = dbo.limpa_dado(@Texto) 
         select @data = CASE
    				WHEN @data in ('',null)
        				THEN 	''
    					ELSE
                                    substring(right('0000'+convert(varchar,@data),8),1,2)
                    				+'/'+
                    				substring(right('0000'+convert(varchar,@data),8),3,2)
                    				+'/'+
                    				substring(right('0000'+convert(varchar,@data),8),5,4)

                    END          

return (@data)  

END
;
GO


