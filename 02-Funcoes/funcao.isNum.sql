

CREATE FUNCTION [dbo].[ISNUMERO]
(
      @X VARCHAR(14)
)
      RETURNS INT
AS
BEGIN
      DECLARE @Y INT
      SET @Y = 0
      IF ISNUMERIC(@X)=1 AND @X NOT LIKE '%[A-Z]%'
      SET @Y = 1
      RETURN @Y
END
GO


