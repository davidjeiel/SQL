
CREATE FUNCTION [dbo].[limpa_numero](@Texto varchar(8000))

returns varchar(50)  

AS  

BEGIN

         declare @SemAcento varchar(50)  

 
         select @SemAcento = replace(@Texto,'"','') 
	 select @SemAcento = replace(@Texto,'''','')   
         select @SemAcento = replace(@SemAcento,'.','')
         select @SemAcento = replace(@SemAcento,' ','')
         select @SemAcento = replace(@SemAcento,',','')
         select @SemAcento = replace(@SemAcento,'R$','')

         select @SemAcento = case When PATINDEX('%-%',ltrim(@Texto))=1 and len(ltrim(rtrim(@Texto)))>1
                                  Then @SemAcento
                                                               
                                  Else replace(@SemAcento,'-','')
                                  end

         select @SemAcento = replace(@SemAcento,'(','-')
         select @SemAcento = replace(@SemAcento,')','') 
         select @SemAcento = replace(@SemAcento,'/','') 
         select @SemAcento = replace(@SemAcento,'\','') 
         return (UPPER(@SemAcento))  

END
;
GO


