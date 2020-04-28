SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE DS_TRAINNING
GO

-- =============================================
-- Author:		Rodrigo Leal
-- Create date: 20200426
-- Description:	PROCEDURE QUE CRIA A TAB WRK_CLIENTES
-- =============================================
ALTER PROCEDURE SP_WRK_CLIENTES
		
AS
BEGIN

-- =============================================
-- DROP TABLE
-- =============================================

IF OBJECT_ID('WRK_CLIENTES') IS NOT NULL
DROP TABLE [dbo].[WRK_CLIENTES]

-- =============================================
-- CRIAÇÃO DA TABELA
-- =============================================

	CREATE TABLE WRK_CLIENTES
	(
		[RowNumber]			INT IDENTITY,
		[Customer ID]		VARCHAR(100),
		[City]				VARCHAR(100),
		[ZipCode]			VARCHAR(10),
		[Gender]			CHAR(1),
		[Age]				FLOAT
	)

-- =============================================
-- TRUNCATE DA TABELA
-- =============================================

TRUNCATE TABLE [dbo].[WRK_CLIENTES]

-- =============================================
-- INSERT DOS DADOS
-- =============================================

INSERT INTO [dbo].[WRK_CLIENTES]
	( 
		   [Customer ID],
           [City],
           [ZipCode],
           [Gender],
           [Age]
	)    
	SELECT  RIGHT('0000000' + [Customer ID],7),
		  	[City],
			[ZipCode],
			[Gender],
			[Age]
	FROM [DS_TRAINNING].[dbo].[RAW_Clientes_20200423]

END
GO

-- =============================================
-- 43 LINHAS INSERIDAS
-- =============================================