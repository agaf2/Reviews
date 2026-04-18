Scenario: Filtragem de público na camada de serviço
Given que no banco de dados a obra "Curta Metragem" possui média 5.0 baseada em 5 avaliações
And a obra "O Poderoso Chefão" possui média 4.9 baseada em 1.200 avaliações
And a regra do serviço exige um quórum mínimo de 50 avaliações para o ranking
When o serviço recebe uma requisição para gerar a lista de "Mais Bem Avaliados"
Than o serviço processa a agregação de notas validando o quórum
And retorna um conjunto de dados que inclui a obra "O Poderoso Chefão"
And omite completamente a obra "Curta Metragem" da resposta gerada.

Scenario: Cálculo temporal para o ranking "Em Alta"
Given que a obra "Clássico Antigo" possui 100.000 avaliações no total, sendo apenas 10 registradas nos últimos 7 dias
And a obra "Lançamento Recente" possui 500 avaliações no total, sendo 450 registradas nos últimos 7 dias
When o serviço recebe uma requisição para processar o ranking "Em Alta" considerando a janela temporal de 7 dias
Than o serviço realiza a consulta filtrando as interações apenas pelo período recente
And retorna a lista de resultados classificando a obra "Lançamento Recente" em uma posição superior à obra "Clássico Antigo".
