
CREATE TABLE DIM_DataHora (
	id_datahora INT IDENTITY(1, 1) PRIMARY KEY,
	id_tempo INT NOT NULL,
	IdHora INT NOT NULL,
	datahora_completa DATETIME NOT NULL,

	CONSTRAINT FK_DataHora_Tempo FOREIGN KEY (id_tempo)
		REFERENCES DIMTempo (id_tempo),

	CONSTRAINT FK_DataHora_Hora FOREIGN KEY (IdHora)
		REFERENCES DIMHora (IdHora)
);

-- POPULANDO A TABELA NOVA

INSERT INTO DIM_DataHora (id_tempo, IdHora, datahora_completa)
SELECT 
	t.id_tempo,
	h.IdHora,
	CAST(t.date_date AS DATETIME) + CAST(h.HoraCompleta AS DATETIME)
FROM DIMTempo t
CROSS JOIN DIMHora H;

-- VALIDACAO

SELECT TOP 10 *
FROM DIM_DataHora
ORDER BY datahora_completa

-- add na tabela fato

ALTER TABLE FatoPoluicao
ADD id_datahora INT;

-- PREENCHER id_datahora

UPDATE f
SET id_datahora = dh.id_datahora
FROM FatoPoluicao f
JOIN DIM_DataHora dh
    ON f.id_tempo = dh.id_tempo
   AND f.IdHora  = dh.IdHora;

-- VALIDAO DOIS

SELECT COUNT(*) AS registros_sem_datahora
FROM FatoPoluicao
WHERE id_datahora IS NULL;

-- CRIANDO FK

ALTER TABLE FatoPoluicao
ADD CONSTRAINT FK_Fato_DataHora
FOREIGN KEY (id_datahora)
REFERENCES DIM_DataHora (id_datahora);

