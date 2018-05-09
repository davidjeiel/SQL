
CREATE FUNCTION [dbo].[limpa_num_dec](@texto varchar(max))
RETURNS VARCHAR(max)  
AS  
BEGIN

        declare @lista_branca varchar (max)

        -- Deixa Somente Números, Pontos, Vírgulas, Parênteses e Hífen
        set @lista_branca='0-9.,(-'

        while @texto<>stuff(@texto,patindex('%[^'+@lista_branca+']%',@texto),1,'')
        set @texto=stuff(@texto,patindex('%[^'+@lista_branca+']%',@texto),1,'')

        set @texto=rtrim(ltrim(@texto))

        -- Troca a Vírgula da Casa Decimal por Ponto e Remove Separador de Milhar
        set @texto=reverse(@texto)
        if patindex('%[0-9],%',@texto) between 1 and 2
        begin
        set @texto=stuff(@texto,patindex('%[0-9],%',@texto)+1,0,'&$#@*')
        end
        if patindex('%[0-9].%',@texto) between 1 and 2
        begin
        set @texto=stuff(@texto,patindex('%[0-9].%',@texto)+1,0,'&$#@*')
        end
        set @texto=replace(@texto,'.','')
        set @texto=replace(@texto,',','')
        set @texto=replace(@texto,'&$#@*','.')
        set @texto=reverse(@texto)

        -- Troca Parênteses pelo Hífen do Sinal Negativo
        set @texto=replace(@texto,'(','-')

        -- Remove Hífen que Não Seja Sinal Negativo
        if patindex('-[0-9]%',@texto) = 1
        begin
        set @texto=stuff(@texto,patindex('-[0-9]%',@texto)+1,0,'&$#@*')
        end
        set @texto=replace(@texto,'-','')
        set @texto=replace(@texto,'&$#@*','-')

        -- Troca Vazio por Nulo
        if @texto=''
        begin
        set @texto=null
        end

        return (UPPER(@texto))  

END
GO


