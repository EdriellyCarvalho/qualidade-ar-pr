-- Corrigindo nomes das estações e padronizando tudo

UPDATE FatoPoluicao
SET Estacao = 'Assis'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%Assis%';

UPDATE FatoPoluicao
SET Estacao = 'Boqueirao'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%Boqueir%';

UPDATE FatoPoluicao
SET Estacao = 'Cascavel'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%Cascavel%';

UPDATE FatoPoluicao
SET Estacao = 'Cidade Industrial'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%Cidade Industrial%';

UPDATE FatoPoluicao
SET Estacao = 'CSN'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%CSN%';

UPDATE FatoPoluicao
SET Estacao = 'Foz do Iguacu'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%Foz%' OR Estacao LIKE '%Igua%';

UPDATE FatoPoluicao
SET Estacao = 'Londrina'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%Londrina%';

UPDATE FatoPoluicao
SET Estacao = 'Petrosix'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%Petrosix%';

UPDATE FatoPoluicao
SET Estacao = 'Ponta Grossa'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%Ponta Grossa%';

UPDATE FatoPoluicao
SET Estacao = 'Praca Ouvidor Pardinho'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%Ouvidor%' OR Estacao LIKE '%Prac%';

UPDATE FatoPoluicao
SET Estacao = 'REPAR'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%REPAR%';

UPDATE FatoPoluicao
SET Estacao = 'Santa Candida'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%Santa%' AND Estacao LIKE '%C%nd%';

UPDATE FatoPoluicao
SET Estacao = 'UEG'
WHERE Estacao COLLATE Latin1_General_CI_AI LIKE '%UEG%';
