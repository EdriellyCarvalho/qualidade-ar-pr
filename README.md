# Análise de Qualidade do Ar a partir de dados de Estação de Monitoramento do Paraná


## 📌 Contexto
A poluição do ar é um dos principais problemas ambientais e de saúde pública, estando associada ao aumento de doenças respiratórias e cardiovasculares.  
Este projeto tem como objetivo analisar dados de qualidade do ar provenientes de estações de monitoramento em municípios específicos, considerando diferentes poluentes atmosféricos e recortes temporais.

Os dados utilizados **não representam todos os municípios**, mas apenas aqueles que possuem estações de monitoramento ativas no período analisado.

## 🎯 Objetivos do Projeto
- Analisar o comportamento dos principais poluentes atmosféricos ao longo do tempo;  
- Comparar níveis de poluição entre municípios monitorados;  
- Identificar padrões sazonais e períodos críticos de pior qualidade do ar;  
- Disponibilizar os resultados de forma visual e interativa por meio de um dashboard.


## ❓ Perguntas Analíticas
Este projeto busca responder, entre outras, as seguintes perguntas:

[1] Quais poluentes apresentam maior concentração média nos municípios monitorados?
[2] Como os níveis de poluição variam ao longo do tempo (mensal/anual)?
[3] Existem diferenças significativas na qualidade do ar entre os municípios?
[4] Há períodos do ano com maior incidência de poluentes específicos?
[5] Quais estações registram os piores índices de qualidade do ar?

## 💡 Principais Insights

- A distribuição das concentrações dos poluentes é assimétrica, com a ocorrência de eventos extremos pontuais que influenciam significativamente os valores máximos, enquanto a maior parte das medições se concentra em níveis mais baixos.

- A análise temporal agregada sugere a presença de sazonalidade nos níveis de poluição. No entanto, ao detalhar os dados por mês e por ano, esse padrão não se mostrou consistente ao longo do período analisado, indicando ausência de uma sazonalidade clara e estável.

- Determinados poluentes apresentaram picos isolados em períodos específicos, caracterizando eventos pontuais em vez de um comportamento contínuo ou sazonal.

- Estações e municípios com maior volume de medições não apresentaram, necessariamente, maiores concentrações médias de poluentes, sugerindo que a intensidade da poluição não está diretamente associada à frequência de monitoramento.

Os insights abaixo foram obtidos a partir da análise exploratória e comparativa dos dados, buscando responder às perguntas analíticas propostas inicialmente.

## 🛠️ Ferramentas e Tecnologias
- **SQL**: tratamento, modelagem e consultas analíticas  
- **Power BI**: criação do dashboard interativo  
- **Modelo Estrela**: organização dos dados (tabelas fato e dimensões)  
- **GitHub**: versionamento e documentação do projeto 

## 📊 Dashboard
O dashboard interativo pode ser acessado pelo link abaixo:

🔗 **[Acessar Dashboard no Power BI Web](https://app.powerbi.com/view?r=eyJrIjoiZmVhYWI2MmMtMDE4YS00OGQ2LWI2YzQtYTM1NDNhOGRmZmM0IiwidCI6IjY1OWNlMmI4LTA3MTQtNDE5OC04YzM4LWRjOWI2MGFhYmI1NyJ9)**


## 🗂️ Estrutura do Projeto

qualidade-do-ar/
│
├── data-iema/
│
├── sql/
│ ├── create_tables.sql
│ ├── tratamento_dados.sql
│ └── queries_analise.sql
│
├── powerbi/
│ └── dashboard_qualidade_ar.pbix
│
└── README.md

## ⚠️ Observações
- Os dados analisados referem-se apenas aos municípios com estações de monitoramento disponíveis.
- A ausência de dados para determinados poluentes ou períodos pode impactar comparações diretas.
- Este projeto tem finalidade **educacional e demonstrativa**, compondo portfólio na área de dados.


## 👩‍💻 Autora
**Edrielly Carvalho**  
Projeto desenvolvido para fins de aprendizado e portfólio em Análise de Dados.