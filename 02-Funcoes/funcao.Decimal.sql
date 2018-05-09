USE [PREVIDENCIA]
GO

/****** Object:  UserDefinedFunction [dbo].[decimal]    Script Date: 16/09/2016 13:48:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[decimal](@Texto varchar(8000))
returns decimal(38,2)  
AS  

BEGIN
       declare @Numero varchar(50)  
 
       select @Numero = case When       PATINDEX('%,%',ltrim(replace(reverse(@Texto),')','')))=3
                                Then convert(decimal,dbo.limpa_numero(@Texto),2)/100
                                
                                When    PATINDEX('%,%',ltrim(replace(reverse(@Texto),')','')))=2
                                Then    convert(decimal,dbo.limpa_numero(@Texto),2)/10

                                When    dbo.limpa_numero(dbo.trim(@Texto)) in ('',null)
                                Then    '0'
                                
                                Else convert(decimal,dbo.limpa_numero(@Texto),2) 
                                end   

       return (dbo.trim(@Numero))  
END
;
GO


