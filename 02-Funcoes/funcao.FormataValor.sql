
create FUNCTION [dbo].[formata_valor](@Valor Numeric(18,4),@SepMilhar char(1),@SepDecimal Char(1))
Returns Varchar(50) AS
Begin
Declare @Inteiro int,
@Texto varchar(50),
@ValorDecimal varchar(04)

Set @Texto = RTrim(Cast(@Valor as varchar(50)))
Set @Inteiro = Cast(@Valor as Integer)
Set @ValorDecimal = SubString(@Texto,Len(@Texto)-3,2)

If Len(@Inteiro) = 1
Set @Texto = Cast(@Inteiro as varchar(10)) + Replace(@SepMilhar, '.',',') + @ValorDecimal

If Len(@Inteiro) = 2
Set @Texto = Cast(@Inteiro as varchar(10)) + Replace(@SepMilhar, '.',',') + @ValorDecimal

If Len(@Inteiro) = 3
Set @Texto = Cast(@Inteiro as varchar(10)) + Replace(@SepMilhar, '.',',') + @ValorDecimal

If Len(@Inteiro) = 4
Set @Texto = SubString(Cast(@Inteiro as varchar(10)),1,1) + @SepMilhar + SubString(Cast(@Inteiro as varchar(10)),2,3) + @SepDecimal + @ValorDecimal

If Len(@Inteiro) = 5
Set @Texto = SubString(Cast(@Inteiro as varchar(10)),1,2) + @SepMilhar + SubString(Cast(@Inteiro as varchar(10)),3,5) + @SepDecimal + @ValorDecimal

If Len(@Inteiro) = 6
Set @Texto = SubString(Cast(@Inteiro as varchar(10)),1,3) + @SepMilhar + SubString(Cast(@Inteiro as varchar(10)),4,7) + @SepDecimal + @ValorDecimal

If Len(@Inteiro) = 7
Set @Texto = SubString(Cast(@Inteiro as varchar(10)),1,1) + @SepMilhar + SubString(Cast(@Inteiro as varchar(10)),2,3) + @SepMilhar + SubString(Cast(@Inteiro as varchar(10)),5,7) + @SepDecimal + @ValorDecimal

Return @Texto
End
GO


