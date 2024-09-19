drop schema loja_1;

create schema loja_1;

use loja_1;

desc produtos;

-- 1. criação de tabelas:

create table produtos(
	id_produtos int auto_increment primary key,
    nome varchar(100) not null,
    categoria varchar(50),
    preco decimal(10,2),
    estoque int
);

create table clientes(
	id_clientes int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100),
    telefone varchar(50)
);

create table vendas(
	id_vendas int auto_increment primary key,
    quantidade int,
    data_venda date,
    id_produtos int, foreign key (id_produtos) references produtos(id_produtos),
    id_clientes int, foreign key (id_clientes) references clientes(id_clientes)
);

-- 2. inserção de dados:

insert into produtos(nome, categoria, preco, estoque)
values ('prato','utensilios de cozinha',26.00,100),
('iphone 15','smartphone',4599.99,80),
('galaxy s24','smartphone',6499.00,80),
('pera','alimento',24.99,80),
('copo','utensilios de cozinha',8.99,50);

select * from produtos;

insert into clientes(nome, email, telefone)
values ('pedro','pedro@gmail.com','81988442200'),
('paulo','paulo@gmail.com','81988440102'),
('vanessa','vanessa@gmail.com','81988447015'),
('cecilia','cecilia@gmail.com','81988440000'),
('gabriel','gabriel@gmail.com','81988444503');

select * from clientes;

insert into vendas(quantidade, data_venda, id_produtos, id_clientes)
values ('5','2024-02-05','1','1'), -- pedro comprou 5 pratos
('2','2014-12-03','2','3'), -- vanessa comprou 2 iphone 15
('9','2021-01-01','2','4'), -- cecilia comprou 9 iphone 15
('14','2024-08-25','5','2'), -- paulo comprou 14 copos
('1','2019-10-10','1','5'), -- gabriel comprou 1 prato
('10','2024-08-25','4','2'), -- paulo comprou 10 pera
('11','2021-01-01','3','4'), -- cecilia comprou 11 galaxy s24
('20','2014-12-03','3','3'); -- vanessa comprou 20 galaxy s24

select * from vendas;
SELECT nome FROM produtos;
SELECT nome, email FROM clientes ORDER BY nome ASC;

-- 3. Atualização de dados:

UPDATE clientes SET email = 'paulo_novo@gmail.com' where id_clientes = 2;
UPDATE produtos SET preco = 5.50 where id_produtos = 5;
UPDATE clientes SET telefone = '81988444590' where id_clientes = 2;

-- 4. remoção de dados:

DELETE FROM vendas WHERE id_clientes = 1;
delete from clientes where id_clientes = 1;
delete from vendas where id_produtos = 4;
delete from produtos where id_produtos = 4;

-- 5. consultas: a. consulta com WHERE

SELECT * FROM produtos WHERE categoria = 'smartphone';
SELECT * FROM vendas WHERE data_venda = '2021-01-01';

-- b. consulta com GROUP BY:

SELECT 
    id_produtos, SUM(quantidade) AS total_vendas
FROM
    vendas
GROUP BY id_produtos;

SELECT
	clientes.id_clientes,
    clientes.nome,
    SUM(vendas.quantidade * produtos.preco) as receita_total
    FROM vendas
    JOIN produtos ON vendas.id_produtos = produtos.id_produtos
    JOIN clientes ON vendas.id_clientes = clientes.id_clientes
    GROUP BY clientes.id_clientes;


-- c. ordenação com ASC e desc

SELECT nome FROM produtos ORDER BY nome ASC;
SELECT nome FROM clientes ORDER BY nome DESC;

