
CREATE TABLE DimEstacao (
    IdEstacao INT IDENTITY(1,1) PRIMARY KEY,
    Estacao VARCHAR(200) NOT NULL,
    Municipio VARCHAR(200) NOT NULL
);

INSERT INTO DimEstacao (Estacao, Municipio)
VALUES
('REPAR', 'Araucaria'),
('Assis', 'Assis Chateaubriand'),
('Boqueirao', 'Curitiba'),
('Cidade Industrial', 'Curitiba'),
('Praca Ouvidor Pardinho', 'Curitiba'),
('Santa Candida', 'Curitiba'),
('UEG', 'Curitiba'),
('Ponta Grossa', 'Ponta Grossa'),
('Cascavel', 'Cascavel'),
('Londrina', 'Londrina'),
('Foz do Iguacu', 'Foz do Iguacu'),
('Petrosix', 'Sao Mateus do Sul'),
('CSN', 'Arapongas'); 

-- Inserir o codigo na tabela Fato para fazer a correspondencia

ALTER TABLE FatoPoluicao
ADD IdEstacao INT NULL;

-- Inserir os dados na tabela Fato

UPDATE FatoPoluicao
SET IdEstacao = d.IdEstacao
FROM FatoPoluicao f
JOIN DimEstacao d
    ON f.Estacao = d.Estacao;