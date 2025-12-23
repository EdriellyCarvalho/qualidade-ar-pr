USE QualidadeArPR

-- Conectando tabela FatoPoluicao x DIMDataHora

SELECT 
	dh.IdHora,
	COUNT(*) total_medicoes
FROM FatoPoluicao fp
JOIN DIMDataHora dh
	ON fp.id_datahora = dh.id_datahora
GROUP BY dh.IdHora
ORDER BY dh.IdHora;

-- Media por hora e tipo de poluente

SELECT 
	dh.IdHora,
	dp.nome_poluente,
	AVG(fp.Valor) AS media_poluente
FROM FatoPoluicao fp
JOIN DIMDataHora dh
	ON fp.id_datahora = dh.id_datahora
JOIN DIMPoluente dp
	ON fp.id_poluente = dp.id_poluente
GROUP BY
	dh.IdHora,
	dp.nome_poluente
ORDER BY
	dp.nome_poluente,
	dh.IdHora

