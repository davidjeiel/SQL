USE [BASE DE DADOS A VERIFICAR]
GO
 
-- Iniciando a pesquisa nas tabelas de sistemas
 
SELECT A.NAME, A.TYPE, B.TEXT
  FROM SYSOBJECTS  A (nolock)
  JOIN SYSCOMMENTS B (nolock) 
    ON A.ID = B.ID
WHERE B.TEXT LIKE '%INFORMA��O A PESQUISAR%'  --- Informa��o a ser procurada no corpo da procedure, funcao ou view
  AND A.TYPE = 'P'							  --- Tipo de objeto a ser localizado no caso procedure
 ORDER BY A.NAME