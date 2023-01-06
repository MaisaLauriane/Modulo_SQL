-- Exercicio 1: Quantos itens distintos foram vendidos (item_id)?

SELECT 
	COUNT(DISTINCT(item_id)) AS total_itens_dist
FROM  
	sales 
-- Exercicio 2: Quantas lojas existem na base (loja_id)?

SELECT 
	COUNT(DISTINCT(loja_id)) AS total_lojas
FROM  
	sales; 

-- Exercicio 3: Qual Ã© a cidade que mais tem lojas (loja_id)?

SELECT 
	cidade,
	COUNT(DISTINCT(loja_id)) AS total_lojas
FROM 
	sales 
GROUP BY cidade 
ORDER BY total_lojas DESC 

-- Exercicio 4: Em qual municipio foi vendido mais itens?

SELECT 
	municipio,
	SUM((garrafas_vendidas)) AS total_item
FROM 
	sales 
GROUP BY municipio
ORDER BY total_item DESC 
LIMIT 1;
-- vizualizar
SELECT 
	*
FROM 
	sales 
LIMIT 3

-- Exercicio 5: Qual a cidade mais vendeu em dolares?
SELECT 
	cidade,
	sum(5.35*((venda_garrafa - custo_garrafa)*garrafas_vendidas)) AS lucro_dolar
FROM 
	sales 
GROUP BY cidade 
ORDER BY lucro_dolar DESC 
LIMIT 1
-- Exercicio 6: Qual foi o dia que mais vendeu itens distintos?
SELECT 
	data_pedido,
	COUNT(Distinct(item_id)) AS total_item
FROM 
	sales 
GROUP BY data_pedido
ORDER BY total_item DESC 


-- Exercicio 7: Monte o top 5 bebidas (item_id) mais vendidas por valor?

SELECT 
	item_id,
	sum(((venda_garrafa - custo_garrafa)*garrafas_vendidas)) AS lucro_dolar
FROM 
	sales 
GROUP BY item_id
ORDER BY lucro_dolar DESC 
LIMIT 5

-- Exercicio 8: Monte o top 5 bebidas (item_id) mais vendidas por volume em litros

SELECT 
	item_id,
	sum(volume_litros_vendidos) AS volume_total
FROM 
	sales 
GROUP BY item_id
ORDER BY volume_total DESC 
LIMIT 5


-- Exercicio 9: Quais sÃ£o as 10 empresas (marca_id) que mais lucram com a venda de bebidas?

SELECT 
	marca_id,
	sum(((venda_garrafa - custo_garrafa)*garrafas_vendidas)) AS lucro_dolar
FROM 
	sales 
GROUP BY marca_id
ORDER BY lucro_dolar DESC 
LIMIT 10


-- Exercicio 10: Monte uma tabela com a quantidade de vendas distintas por dia.

SELECT 
	data_pedido,
	COUNT(DISTINCT pedido_id) AS quat_vendas
FROM 
	sales 
GROUP BY data_pedido
ORDER BY quat_vendas DESC 
LIMIT 5