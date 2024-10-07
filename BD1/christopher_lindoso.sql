create schema BD1_AT2;

use BD1_AT2;

create table vendas(
id_venda int auto_increment primary key,
produto varchar(100),
categoria varchar(50),
quantidade int,
preco_unidade decimal(10,2),
data_venda date
);

INSERT INTO vendas (produto, categoria, quantidade, preco_unidade, data_venda) VALUES
("arroz", "alimentos", "5", "10.00", "2024-09-01"),
("feijão", "alimentos", "3", "7.50", "2024-09-02"),
("sabão", "limpeza", "2", "12.00", "2024-09-02"),
("café", "alimentos", "6", "8.00", "2024-09-03"),
("detergente", "limpeza", "4", "5.00", "2024-09-03"),
("leite", "alimentos", "10", "4.50", "2024-09-04"),
("sabonete", "higiene", "6", "3.00", "2024-09-04"),
("pão", "alimentos", "15", "1.50", "2024-09-05"),
("shampoo", "higiene", "1", "15.00", "2024-09-05"),
("creme dental", "higiene", "3", "8.00", "2024-09-06")
;

select * from vendas;

-- 1.a. quantidade de vendas de produtos da categoria "alimento"
SELECT COUNT(*) AS total_vendas_alimentos
FROM vendas
WHERE categoria = 'alimentos';

-- 1.b. total de vendas realizadas
SELECT SUM(quantidade) AS total_itens_alimentos
FROM vendas
WHERE categoria = 'alimentos';

-- 2.a. preço médio por unidade dos produtos vendidos
SELECT AVG(preco_unidade) AS media_preco_unidade
FROM vendas;

-- 2.b. quantidade média de produtos vendidos por venda
SELECT AVG(quantidade) AS media_quantidade_vendida
FROM vendas;

-- 3.a. menor preço por unidade vendido
SELECT MIN(preco_unidade) AS menor_preco_unidade
FROM vendas;

-- 3.b. maior preço por unidade vendido
SELECT MAX(preco_unidade) AS maior_preco_unidade
FROM vendas;

-- 3.c. a menor e a maior quantidade de produtos vendidos em uma venda
SELECT 
    MIN(quantidade) AS menor_quantidade_vendida,
    MAX(quantidade) AS maior_quantidade_vendida
FROM vendas;

-- 4.a. o maior valor total de uma venda
SELECT MAX(quantidade * preco_unidade) AS maior_valor_venda
FROM vendas;

-- 4.b. a média de valor das vendas realizadas na categoria "Higiene"
SELECT AVG(quantidade * preco_unidade) AS media_valor_vendas_higiene
FROM vendas
WHERE categoria = 'higiene';