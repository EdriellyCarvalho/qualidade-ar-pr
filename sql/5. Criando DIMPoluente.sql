
-- Criando tabela DIMPoluente

CREATE TABLE dbo.DIMPoluente (
	id_poluente INT IDENTITY (1, 1) PRIMARY KEY,
	nome_poluente VARCHAR(50) NOT NULL,
	codigo VARCHAR(50) NULL,
	unidade VARCHAR(50) NULL,
	tipo VARCHAR(50) NULL
);

-- Popular DIMPoluente com os valores da Fato

INSERT INTO dbo.DIMPoluente (nome_poluente, codigo, unidade, tipo)
SELECT DISTINCT
    Poluente,
    Codigo,
    Unidade,
    Tipo
FROM dbo.FatoPoluicao;

-- Add coluna ID_Poluente na FAto

ALTER TABLE dbo.FatoPoluicao
ADD id_poluente INT NULL;

-- Popular ID_Poluente na FAto

UPDATE f
SET f.id_poluente = p.id_poluente
FROM dbo.FatoPoluicao f
JOIN dbo.DIMPoluente p
  ON  f.Poluente = p.nome_poluente
  AND f.Codigo   = p.codigo
  AND f.Unidade  = p.unidade
  AND f.Tipo     = p.tipo;

-- Validando - tem que dar 0 

SELECT COUNT(*) AS LinhasSemPoluente
FROM dbo.FatoPoluicao
WHERE id_poluente IS NULL;

-- Tornar obrigatoria e criar FK

ALTER TABLE dbo.FatoPoluicao
ALTER COLUMN id_poluente INT NOT NULL;

ALTER TABLE dbo.FatoPoluicao
ADD CONSTRAINT FK_FatoPoluicao_DIMPoluente
FOREIGN KEY (id_poluente)
REFERENCES dbo.DIMPoluente(id_poluente);

-- Limpando a Fato e deixando ela com apenas os codigos

ALTER TABLE dbo.FatoPoluicao
DROP COLUMN Poluente,
            Codigo,
            Unidade,
            Tipo;
ALTER TABLE dbo.FatoPoluicao
DROP COLUMN Estacao;

--TESTANDO
SELECT TOP 50 *
FROM dbo.FatoPoluicao;



-- Garantia de Integridade

EXEC sp_help 'dbo.FatoPoluicao';