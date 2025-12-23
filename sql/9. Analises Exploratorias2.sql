
USE QualidadeArPR

-- Analise exploratoria 1 - Cobertura temporal da tabela
SELECT 
	MIN(datahora_completa) AS data_inicial,
	MAX(datahora_completa) AS data_final,
	COUNT(*) AS total_registros,
	COUNT(DISTINCT CAST(datahora_completa AS DATE)) AS total_dias,
	COUNT(DISTINCT id_tempo) AS total_datas_distintas
FROM DIMDataHora;

-- Analise exploratoria 2 - Distribuicao de registros por hora do dia

SELECT 
	IdHora,
	COUNT(*) AS total_registros
FROM DIMDataHora
GROUP BY IdHora
ORDER BY IdHora;

