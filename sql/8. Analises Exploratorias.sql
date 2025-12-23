USE QualidadeArPR

-- Metricas basicas para entender os dados

-- Volume de dados

SELECT
	COUNT(*) AS total_registros
FROM FatoPoluicao

-- Registros por Estacao

SELECT 
	e.Estacao,
	COUNT(*) AS total_registros
FROM FatoPoluicao f
JOIN DIMEstacao e ON f.IdEstacao = e.IdEstacao
GROUP BY e.Estacao
ORDER BY total_registros DESC;


