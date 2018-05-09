

create function [dbo].[ConverteMoedaReal] (@Numero varchar(40)) Returns Varchar(40)  
as
Begin
Declare @Contador int
Declare @Pontos int
Declare @CasasVirgula int
Declare @Parte1 varchar(40)
Declare @Parte2 varchar(40)

set @CasasVirgula = (len(substring (@Numero, charindex('.', @Numero)+1, len (@Numero))))

if @CasasVirgula > 2
  Set @Numero = (substring (@Numero, 1, (charindex('.', @Numero)) + 2) )

If charindex('.', @Numero) <> 0
Begin
  set @Numero = replace(@Numero, '.', ',')
  If len(substring(@Numero, charindex(',', @Numero)+1, 2)) = 1
    Set @Numero = @Numero + '0'
End
Else
  Set @Numero = @Numero + ',00'

Set @Contador = (charindex(',', @Numero)-1)
Set @Pontos = @Contador/3

While @Pontos <> 0
Begin
  Set @Contador = @Contador-3
  Set @Parte2 = (substring (@Numero, @Contador+1, len(@Numero)))
  Set @Parte1 = (substring (@Numero, 1, (charindex(@Parte2, @Numero)-1)))
  Set @Numero = @Parte1 + '.' + @Parte2
  Set @Pontos = @Pontos - 1
End

if (substring (@Numero, 1,1)) = '.'
Set @Numero = (substring (@Numero, 2,len(@Numero)))

Set @Numero = 'R$ ' + @Numero

return @Numero
end
GO


