USE [BASE_DE_DADOS]
GO 
create procedure LOCALIZA_TERMO_EM_QUERY
	@TERMO AS VARCHAR(MAX),
	/**********************************************************************
		Informação a ser procurada no corpo da procedure, funcao ou view
		   Exemplo: "into dw_siconv" ou "from dbo.tb_tarifa_gestor"
	***********************************************************************/
	
	@TIPO AS VARCHAR(1)	
	/**************************************** 
		Tipo de objeto a ser localizado 
		-- U => Tabela Usuário
		-- S => Tabela de sistema
		-- P => Procedure
		-- V => View
		-- F => Function
	*****************************************/
AS
BEGIN
	DECLARE @VARIAVEL AS VARCHAR(MAX)
		SET @VARIAVEL = '%'+@TERMO+'%'
END;

SELECT A.NAME, A.TYPE, B.TEXT
  FROM SYSOBJECTS  A (nolock)
  JOIN SYSCOMMENTS B (nolock) 
    ON A.ID = B.ID
WHERE B.TEXT LIKE @VARIAVEL 
  AND A.TYPE = @TIPO			  
 ORDER BY A.NAME
