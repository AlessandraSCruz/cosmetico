/**create database perfumaria;*/

use perfumaria;
create table cliente (
id_cliente int not null,
nome varchar(100) not null ,
cpf char(11) not null,
end varchar(200) not null,
idade int not null,
sexo char(1)
);

create table venda (
codigo_venda int not null,
id_cliente int not null,
id_produto int not null,
data_venda datetime not null
);

create table produto (
id_produtos int not null,
nome varchar(50) not null,
preço float not null,
codigo_categora int not null,
codigo_fornecedor int not null
);

create table fornecedor (
codigo_fornecedor int not null,
nome_fornecedor varchar(150),
estado_fornecedor char(2)
);

create table categoria (
codigo_categoria int not null,
descricao varchar(100)
);

alter table categoria
add primary key (codigo_categoria);

alter table cliente
add primary key (id_cliente);

alter table fornecedor
add primary key (codigo_fornecedor);

alter table produto
add primary key (id_produtos);

alter table produto
add foreign key (codigo_fornecedor) references fornecedor (codigo_fornecedor);

alter table produto
add foreign key (codigo_categora) references categoria (codigo_categoria);

alter table venda
add primary key (codigo_venda);

alter table venda
add foreign key (id_cliente) references cliente (id_cliente);

alter table venda
add foreign key (id_produto) references produto (id_produtos);

insert into categoria (codigo_categoria, descricao) values 
(2, 'facial'),
(3, 'mãos'),
(4, 'cabelo'),
(5, 'maquiagem');

insert into fornecedor (codigo_fornecedor, nome_fornecedor, estado_fornecedor) 
values
(1, 'Boticário', 'SP'),
(2, 'Natura', 'RJ'),
(3, 'Avon', 'CE'),
(4, 'Jequiti', 'ES');

insert into cliente (id_cliente, nome, cpf, end, idade, sexo)
values
(1, 'Ana', 0, 'rua 1', 25, 'F'),
(2, 'Maira', 11111111111, 'rua 2', 18, 'F'),
(3, 'Mateus', 22222222222, 'rua 3', 27, 'M'),
(4, 'Mônica', 33333333333, 'rua 4', 30, 'F'),
(5, 'Will', 33333333333, 'rua 5', 48, 'M'),
(6, 'Gabriele', 44444444444, 'rua 6', 25, 'F');

insert into produto (id_produtos, nome, preço, codigo_categora, codigo_fornecedor)
values
(1, 'shampoo', 8.00, 4, 1),
(2, 'creme rosto', 5.00, 2, 3),
(3, 'condicionador', 11.50, 4, 1),
(4, 'batom', 5.00, 5, 4),
(5, 'base líquida', 17.00, 5, 4),
(6, 'creme mãos', 9.90, 3, 3),
(7, 'creme corporal', 15.00, 1, 1),
(8, 'óleo corporal', 25.00, 1, 2),
(9, 'rímel', 12.00, 5, 4),
(10, 'perfume', 80.00, 1, 2);

insert into venda (codigo_venda, id_cliente, id_produto, data_venda)
values
(1, 1, 1, '2021-11-01'),
(2, 2, 2, '2021-11-02'),
(3, 3, 3, '2021-11-03'),
(4, 4, 4, '2021-11-04'),
(5, 5, 5, '2021-11-05');


select A.codigo_venda, C.nome, C.cpf, B.nome, B.preço
from venda as A 
left join produto as B
on A.id_produto = B.id_produtos
left join cliente as C 
on A.id_cliente = C.id_cliente;




