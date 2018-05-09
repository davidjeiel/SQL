USE [REPASSES_LEGAIS]
GO

/****** Object:  UserDefinedFunction [funcao].[IdentificaEnte]    Script Date: 16/09/2016 13:23:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [funcao].[IdentificaEnte](@CodIBGE int)
	returns varchar(max)
		
	as
		begin
			declare  @ente as varchar(100)
				    ,@selecao as varchar(max)
				
				if(len(@CodIBGE) = 2)
					set @ente = (select top 1 dbo.EscreveEstado(uf) from CADASTRO.Entes where CodIBGE = @CodIBGE)

				else if(len(@CodIBGE) > 2)
					set @ente = (select top 1 UPPER(municipio) from CADASTRO.Entes where CodIBGE = @CodIBGE)

				return @ente
		end;
GO


