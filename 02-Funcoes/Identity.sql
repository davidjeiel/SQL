
-- Zera o identity de uma tabela, usualmente trabalhado quando truncamos ou deletamos os dados de uma tabela
	DBCC CHECKIDENT('DB7004_FAR.registro.areas_comuns', RESEED, 0)

-- Identifica de a tabela contém algum campo com identity
	SELECT case  OBJECTPROPERTY(OBJECT_ID(N'registro.pagamento'),'TableHasIdentity')
					when 1 then 'Sim'
					when 0 then 'Não'
				end as contem_identity

-- Desabilitar o identity da tabela
		SET IDENTITY_INSERT SUA_TABELA ON

-- Habilitar o identity da tabela
		SET IDENTITY_INSERT SUA_TABELA OFF