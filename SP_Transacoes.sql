SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE DS_TRAINNING
GO

-- =============================================
-- Author:		RODRIGO LEAL
-- Create date: 20200426
-- Description:	PROCEDURE QUE CRIA A TAB WRK_TRANSACOES
-- =============================================
ALTER PROCEDURE [dbo].[SP_WRK_TRANSACOES]

AS
BEGIN

-- =============================================
-- DROP TABLE
-- =============================================

IF OBJECT_ID('WRK_TRANSACOES') IS NOT NULL
DROP TABLE [dbo].[WRK_TRANSACOES]

-- =============================================
-- CRIAÇÃO DA TABELA
-- =============================================

	CREATE TABLE WRK_TRANSACOES
	(
		[RowNumber]		INT IDENTITY,
		[Order ID]		VARCHAR(100),
		[Order Date]	DATE,
		[Customer ID]	VARCHAR(100),
		[Region]		VARCHAR(100),
		[Rep]			VARCHAR(100),
		[Item]			VARCHAR(100),
		[Units]			NUMERIC,
		[Unit Price]	FLOAT
	)

-- =============================================
-- TRUNCATE DA TABELA
-- =============================================

TRUNCATE TABLE [dbo].[WRK_TRANSACOES]

-- =============================================
-- INSERT DOS DADOS
-- =============================================

INSERT INTO [dbo].[WRK_TRANSACOES]
	(
			[Order ID],
			[Order Date],
			[Customer ID],
			[Region],
			[Rep],
			[Item],
			[Units],
			[Unit Price]
	
	)
	SELECT
			[Order ID],
			[Order Date],
			RIGHT('0000000' + [Customer ID],7),
			[Region],
			[Rep],
			[Item],
			[Units],
			[Unit Price]
	FROM [DS_TRAINNING].[dbo].[RAW_Transacoes_20200423]

END
GO

-- =============================================
-- 43 LINHAS INSERIDAS
-- =============================================