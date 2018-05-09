USE [REPASSES_LEGAIS]
GO

/****** Object:  UserDefinedFunction [dbo].[MesAbreviado]    Script Date: 16/09/2016 13:22:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[MesAbreviado](@mes varchar(2))
	returns varchar(3)
	as
	   begin
			declare @ext varchar(3)				

			if(@mes = 1)
				set @ext = 'JAN'
			if(@mes = 2)
				set @ext = 'FEV'
			if(@mes = 3)
				set @ext = 'MAR'
			if(@mes = 4)
				set @ext = 'ABR'
			if(@mes = 5)
				set @ext = 'MAI'
			if(@mes = 6)
				set @ext = 'JUN'
			if(@mes = 7)
				set @ext = 'JUL'
			if(@mes = 8)
				set @ext = 'AGO'
			if(@mes = 9)
				set @ext = 'SET'
			if(@mes = 10)
				set @ext = 'OUT'
			if(@mes = 11)
				set @ext = 'NOV'
			if(@mes = 12)
				set @ext = 'DEZ'

			return @ext
	   end;
GO


