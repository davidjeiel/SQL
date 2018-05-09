

CREATE FUNCTION [dbo].[convert_data]
(@Texto varchar(50))

returns datetime  

AS  

BEGIN

         declare @data varchar(50)  

         select @data = dbo.limpa_dado(@Texto) 
         select @data = CASE
    				WHEN @data ='' or @data is null
        				THEN 	null
    					ELSE
                                    substring(right('0000'+convert(varchar,@data),8),5,4)                                    
                    				+'/'+
                    				substring(right('0000'+convert(varchar,@data),8),3,2)
                    				+'/'+
                                    substring(right('0000'+convert(varchar,@data),8),1,2)                    				

                    END          

return (convert(datetime,@data,102))  

END
;
GO


