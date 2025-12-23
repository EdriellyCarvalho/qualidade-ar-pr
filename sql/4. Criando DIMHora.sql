
-- Criando DIMHora

CREATE TABLE DimHora (
    IdHora INT PRIMARY KEY,
    HoraCompleta TIME NOT NULL,
    Hora INT NOT NULL,
    Periodo VARCHAR(20)
);

-- Inserir os 24 registros automaticamente

INSERT INTO DimHora (IdHora, HoraCompleta, Hora, Periodo)
SELECT 
    n AS IdHora,
    TIMEFROMPARTS(n, 0, 0, 0, 0) AS HoraCompleta,
    n AS Hora,
    CASE 
        WHEN n BETWEEN 0 AND 5 THEN 'Madrugada'
        WHEN n BETWEEN 6 AND 11 THEN 'Manhã'
        WHEN n BETWEEN 12 AND 17 THEN 'Tarde'
        WHEN n BETWEEN 18 AND 23 THEN 'Noite'
    END AS Periodo
FROM (
    SELECT TOP 24 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n
    FROM master..spt_values
) AS horas;

-- Ajustar tabela FATO

ALTER TABLE FatoPoluicao
ADD IdHora INT;

-- Preenchendo a tabela

UPDATE f
SET f.IdHora = d.IdHora
FROM FatoPoluicao f
INNER JOIN DimHora d
    ON f.Hora = d.HoraCompleta;

-- Criar a FK

ALTER TABLE FatoPoluicao
ADD CONSTRAINT FK_FatoPoluicao_DimHora
FOREIGN KEY (IdHora) REFERENCES DimHora(IdHora);

-- Testando

--TESTANDO
SELECT TOP 50 *
FROM dbo.FatoPoluicao;

-- Verificando se deu tudo certo - ambas precisam retornar ZERO
SELECT Hora, IdHora
FROM FatoPoluicao
WHERE IdHora IS NULL;

SELECT Data, Id_tempo
FROM FatoPoluicao
WHERE Id_tempo IS NULL;

-- Removendo colunas Data e Hora da tabela fato e deixando apenas os codigos

ALTER TABLE dbo.FatoPoluicao DROP COLUMN Hora;
ALTER TABLE dbo.FatoPoluicao DROP COLUMN Data;