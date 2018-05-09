
CREATE FUNCTION [dbo].[remove_espaco](@Texto varchar(8000))

returns varchar(50)  

AS  

BEGIN

         declare @SemEspaco varchar(50)  

 	 select @SemEspaco = replace(@Texto,' ','')   
         select @SemEspaco = ltrim(rtrim(@SemEspaco))

         return (UPPER(@SemEspaco))  

END
;

GO


