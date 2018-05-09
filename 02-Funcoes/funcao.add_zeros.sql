USE [REPASSES_LEGAIS]
GO

/****** Object:  UserDefinedFunction [dbo].[add_zeros]    Script Date: 16/09/2016 13:21:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[add_zeros] (@num varchar(max), @pos Numeric)
returns varchar(max)
as
begin

if @pos>=len(rtrim(ltrim(@num)))
    begin
    set @num= ltrim(rtrim(replicate('0',(@pos - len(cast(@num as varchar)))) + cast(@num as Varchar)))
    end
else
    begin
    set @num= @num
    end

return @num
end




GO


