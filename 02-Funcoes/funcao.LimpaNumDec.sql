
CREATE FUNCTION [dbo].[limpa_num_dec](@texto varchar(max))
RETURNS VARCHAR(max)  
AS  
BEGIN

        declare @lista_branca varchar (max)

        -- Deixa Somente N�meros, Pontos, V�rgulas, Par�nteses e H�fen
        set @lista_branca='0-9.,(-'

        while @texto<>stuff(@texto,patindex('%[^'+@lista_branca+']%',@texto),1,'')
        set @texto=stuff(@texto,patindex('%[^'+@lista_branca+']%',@texto),1,'')

        set @texto=rtrim(ltrim(@texto))

        -- Troca a V�rgula da Casa Decimal por Ponto e Remove Separador de Milhar
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

        -- Troca Par�nteses pelo H�fen do Sinal Negativo
        set @texto=replace(@texto,'(','-')

        -- Remove H�fen que N�o Seja Sinal Negativo
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


