
-- Criando tabela DIMTempo

CREATE TABLE dbo.DIMTempo (
	id_tempo INT IDENTITY(1, 1) PRIMARY KEY,
	date_date DATE NOT NULL UNIQUE,
	ano INT NOT NULL,
	mes INT NOT NULL,
	nome_mes VARCHAR(20) NOT NULL,
	dia INT NOT NULL,
	dia_semana INT NOT NULL,
	nome_dia_semana VARCHAR(20) NOT NULL,
	trimestre INT NOT NULL,
	semana_ano INT NOT NULL,
	estacao_ano VARCHAR(20) NOT NULL
);

-- Popular a DIMTempo

INSERT INTO DIMTempo (
	date_date, ano, mes, nome_mes, dia, dia_semana,
    nome_dia_semana, trimestre, semana_ano, estacao_ano
)
SELECT DISTINCT
	fp.[Data] AS date_date,
	  DATEPART(year, fp.[Data]) AS ano,
    DATEPART(month, fp.[Data]) AS mes,
    DATENAME(month, fp.[Data]) AS nome_mes,
    DATEPART(day, fp.[Data]) AS dia,
    DATEPART(weekday, fp.[Data]) AS dia_semana,
    DATENAME(weekday, fp.[Data]) AS nome_dia_semana,
    DATEPART(quarter, fp.[Data]) AS trimestre,
    DATEPART(iso_week, fp.[Data]) AS semana_ano,
    CASE DATEPART(month, fp.[Data])
        WHEN 12 THEN 'Verão'
        WHEN 1  THEN 'Verão'
        WHEN 2  THEN 'Verão'
        WHEN 3  THEN 'Outono'
        WHEN 4  THEN 'Outono'
        WHEN 5  THEN 'Outono'
        WHEN 6  THEN 'Inverno'
        WHEN 7  THEN 'Inverno'
        WHEN 8  THEN 'Inverno'
        WHEN 9  THEN 'Primavera'
        WHEN 10 THEN 'Primavera'
        WHEN 11 THEN 'Primavera'
    END AS estacao_ano
FROM dbo.FatoPoluicao fp
ORDER BY 1;

-- Relacionando a tabela DimTempo com FatoPoluicao

ALTER TABLE dbo.FatoPoluicao
ADD id_tempo INT NULL;

-- Popular a coluna
UPDATE f
SET f.id_tempo = t.id_tempo
FROM dbo.FatoPoluicao f
JOIN dbo.DIMTempo t
  ON f.[Data] = t.date_date;

-- Validando

SELECT COUNT(*) AS LinhasSemTempo
FROM dbo.FatoPoluicao
WHERE id_tempo IS NULL; -- o resultando tem uqe ser 0

-- Tornar NOT NULL + FK

ALTER TABLE dbo.FatoPoluicao
ALTER COLUMN id_tempo INT NOT NULL;

ALTER TABLE dbo.FatoPoluicao
ADD CONSTRAINT FK_FatoPoluicao_DIMTempo
FOREIGN KEY (id_tempo)
REFERENCES dbo.DIMTempo(id_tempo);