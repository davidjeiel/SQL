USE [REPASSES_LEGAIS]
GO

/****** Object:  UserDefinedFunction [dbo].[EscreveEstado]    Script Date: 16/09/2016 13:22:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[EscreveEstado](@uf varchar(100))
returns varchar(100)

as

	begin
		declare @estado as varchar(100)
		if (@uf = 'AC')
		set @estado = 'ACRE';
		if (@uf = 'AL')
		set @estado = 'ALAGOAS';
		if (@uf = 'AP')
		set @estado = 'AMAPÁ';
		if (@uf = 'AM')
		set @estado = 'AMAZONAS';
		if (@uf = 'BA')
		set @estado = 'BAHIA';
		if (@uf = 'CE')
		set @estado = 'CEARÁ';
		if (@uf = 'DF')
		set @estado = 'DISTRITO FEDERAL';
		if (@uf = 'ES')
		set @estado = 'ESPIRITO SANTO';
		if (@uf = 'GO')
		set @estado = 'GOIÁS';
		if (@uf = 'MA')
		set @estado = 'MARANHÃO';
		if (@uf = 'MT')
		set @estado = 'MATO GROSSO';
		if (@uf = 'MS')
		set @estado = 'MATO GROSSO';
		if (@uf = 'MG')
		set @estado = 'MINAS GERAIS';
		if (@uf = 'PA')
		set @estado = 'PARÁ';
		if (@uf = 'PR')
		set @estado = 'PARANÁ';
		if (@uf = 'PE')
		set @estado = 'PERNAMBUCO';
		if (@uf = 'PI')
		set @estado = 'PIAUÍ';
		if (@uf = 'PB')
		set @estado = 'PERNAMBUCO';
		if (@uf = 'RJ')
		set @estado = 'RIO DE JANEIRO';
		if (@uf = 'RN')
		set @estado = 'RIO GRANDE DO NORTE';
		if (@uf = 'RS')
		set @estado = 'RIO GRANDE DO SUL';
		if (@uf = 'RO')
		set @estado = 'RONDÔNIA';
		if (@uf = 'RR')
		set @estado = 'RORAIMA';
		if (@uf = 'SC')
		set @estado = 'SANTA CATARINA';
		if (@uf = 'SP')
		set @estado = 'SÃO PAULO';
		if (@uf = 'SE')
		set @estado = 'SERGIPE';
		if (@uf = 'TO')
		set @estado = 'TOCANTINS';
		return @estado;
	end;




GO


