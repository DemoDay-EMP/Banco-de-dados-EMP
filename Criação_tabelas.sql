-- create database EMP;
use emp;
create table if not exists CNPJ(
id_cnpj int(4) auto_increment primary key not null,
natureza_juridica varchar(300) not null,
abertura date not null,
situacao varchar(45) not null,
porte varchar(100) not null,
nome  varchar(200) not null,
tipo varchar (200) not null,
atividade_principal varchar (400) not null

);


create table if not exists Usuario_cnpj(
cnpj varchar(14)  not null primary key,
CPF varchar(14) not null,
data_nascimento date not null,
telefone int not null,
cep int not null,
email varchar(40) not null,
senha varchar(40) not null,
status_usuario boolean not null,
data_cadastro date not null,
id_cnpj INT(4) NOT NULL,
foreign key (id_cnpj) references cnpj (id_cnpj)

);

create table if not exists Usuario_pf (
CPF varchar(14) primary key not null,
nome_cliente varchar(200) not null,
cnpj varchar(14),
data_nascimento date not null,
telefone int(11) not null,
cep int(8) not null,
email varchar(40) not null,
senha varchar (40) not null,
status_usuario boolean,
data_cadastro date
);

create table if not exists lancamento(
id_lancamento int(4),
data_lancamento datetime,
descricao varchar (300),
tipo_lancamento varchar(7),
valor decimal (20),
forma_pagamento varchar(7),
numero_parcela int(2),
status_lancamento varchar(45),
observacao_lancamento varchar(200),
id_cnpj INT(4),
CPF Varchar (14) not null,
foreign key (id_cnpj) references cnpj (id_cnpj),
foreign key (CPF) references usuario_pf(CPF)

);

CREATE INDEX idx_id_lancamento ON lancamento(id_lancamento);
create table if not exists conta(
id_contas int(4) primary key,
nome_conta  varchar(45) not null,
tipo_conta varchar (45) not null,
id_lancamento int(4) not null,
CPF Varchar (14) not null,
id_cnpj INT(4),
foreign key (id_lancamento) references lancamento(id_lancamento),
foreign key (CPF) references usuario_pf(CPF),
foreign key (id_cnpj) references cnpj (id_cnpj)

);

create table if not exists impostos(
id_imposto int(4) primary key not null,
nome_imposto varchar (45) not null,
id_contas int(4),
foreign key (id_contas) references conta(id_contas)
);

create table if not exists despesas_categoria(
valor decimal not null,
categoria int not null,
id_despesas  int not null,
idDespesas_categoria int primary key
);

create table if not exists resultados_mensais(
id_resultados int primary key not null,
resultado_mes decimal (10,2)not null,
saldo_anterior decimal (10,2)not null,
saldo_atual decimal(10,2) not null,
receitas decimal (10,2) not null,
mes date not null,
depesas decimal (10,2) not null
);

create table if not exists DRE(

mes date not null,
receitas_vendas decimal (10,2),
impostos decimal (10,2),
receita_liquida decimal (10,2),
custos_com_produtos decimal (10,2),
lucro_bruto decimal (10,2),
despesas_vendas decimal (10,2),
despesas_operacionais_fixas decimal (10,2),
receitas_desespesas_diversas decimal (10,2),
lucro_diverso decimal (10,2)
);


