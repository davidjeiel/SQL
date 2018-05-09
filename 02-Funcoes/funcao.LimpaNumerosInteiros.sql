

CREATE FUNCTION [dbo].[limpa_num_int](@texto varchar(max))

returns varchar(max)  

AS  

BEGIN

        declare @lista_branca varchar (max)  

        
        -- Deixa somente números
        set @lista_branca='0-9'

        while @texto<>stuff(@texto,patindex('%[^'+@lista_branca+']%',@texto),1,'')
        set @texto=stuff(@texto,patindex('%[^'+@lista_branca+']%',@texto),1,'')

        set @texto=rtrim(ltrim(@texto))

        -- Troca Vazio por Nulo
        if @texto=''
        begin
        set @texto=null
        end

        return (UPPER(@texto))  

END
GO


