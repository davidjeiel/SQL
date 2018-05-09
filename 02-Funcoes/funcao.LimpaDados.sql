CREATE FUNCTION [dbo].[limpa_dado](@Texto varchar(8000))

returns varchar(8000)  

AS  

BEGIN

         declare @dado varchar(8000)  

 
         select @dado = dbo.remove_acento(@Texto)   
         select @dado = replace(@dado,'	','')
	 select @dado = replace(@dado,'''','')   
         select @dado = replace(@dado,'.','')
         select @dado = replace(@dado,' ','')
         select @dado = replace(@dado,',','')
         select @dado = replace(@dado,'R$','')
         select @dado = replace(@dado,'(','')
         select @dado = replace(@dado,')','') 
         select @dado = replace(@dado,'/','') 
         select @dado = replace(@dado,'\','') 
         select @dado = replace(@dado,'-','')	 
         return (UPPER(@dado))  

END
;
GO


