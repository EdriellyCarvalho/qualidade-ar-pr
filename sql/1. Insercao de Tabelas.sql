
-- Inserindo todas as tabelas na tabela fato

INSERT INTO FatoPoluicao
SELECT * FROM PR2015;

INSERT INTO FatoPoluicao
SELECT * FROM PR2016;

INSERT INTO FatoPoluicao
SELECT * FROM PR2017;

INSERT INTO FatoPoluicao
SELECT * FROM PR2019

INSERT INTO FatoPoluicao
SELECT * FROM PR2020


-- Alterando tabela fato para aceitar valores nulos
ALTER TABLE FatoPoluicao
ALTER COLUMN Valor FLOAT NULL;

-- Inserindo tabela 2018, que nao estava indo por ter valores nulos na tabela fato
INSERT INTO FatoPoluicao
SELECT 
    Data,
    Hora,
    Estacao,
    Codigo,
    Poluente,
    CASE 
        WHEN ISNUMERIC(Valor) = 1 THEN CAST(Valor AS FLOAT)
        ELSE NULL
    END AS Valor,
    Unidade,
    Tipo
FROM PR2018;
