

CREATE FUNCTION [dbo].[corrige_decimal_plan](@Texto varchar(8000))
returns decimal(38,2)  
AS  

BEGIN
       declare @SemAcento varchar(50)  
 
       select @SemAcento = case When    upper(@Texto) not like upper('%governo do%')
                                        and len(substring(ltrim(replace(@Texto,'.','')),0,PATINDEX('%,%',ltrim(replace(@Texto,'.','')))))>9
                                        and reverse(substring(ltrim(replace(reverse(@Texto),'.','')),0,PATINDEX('%,%',ltrim(replace(reverse(@Texto),'.','')))))='00'
                                Then convert(decimal,dbo.limpa_numero(@Texto),2)/10000
                                
                                When    dbo.limpa_numero(dbo.trim(@Texto)) = '' 
                                Then    '0'
                                
                                Else convert(decimal,dbo.limpa_numero(@Texto),2)/100 
                                end   

       return (dbo.trim(@SemAcento))  
END
;
GO


