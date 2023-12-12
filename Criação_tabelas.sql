create database if not exists EMP;

USE emp;
CREATE TABLE IF NOT EXISTS CNPJ (
id_cnpj int(4) auto_increment primary key not null,
natureza_juridica varchar(300) not null,
abertura date not null,
situacao varchar(45) not null,
porte varchar(100) not null,
nome  varchar(200) not null,
tipo varchar (200) not null,
atividade_principal varchar (400) not null
);

CREATE TABLE IF NOT EXISTS Usuario_cnpj (
cnpj varchar(14)  not null primary key,
cpf varchar(11) not null,
data_nascimento date not null,
telefone varchar(14) not null,
cep int(8) not null,
email varchar(40) not null,
senha varchar(40) not null,
status_usuario boolean not null,
data_cadastro date not null,
id_cnpj INT(4) NOT NULL,
foreign key (id_cnpj) references CNPJ (id_cnpj)
);

/*
CREATE TABLE IF NOT EXISTS Usuario_pf (
cpf varchar(11) primary key not null,
nome_cliente varchar(200) not null,
cnpj varchar(14),
data_nascimento date not null,
telefone varchar(14) not null,
cep int(8) not null,
email varchar(40) not null,
senha varchar (40) not null,
status_usuario boolean,
data_cadastro date
);
*/
CREATE TABLE IF NOT EXISTS Usuario_pf (
cpf varchar(11) primary key,
nome_cliente varchar(200),
cnpj varchar(14),
data_nascimento date,
telefone varchar(14),
cep int(8),
email varchar(40),
senha varchar (40),
status_usuario boolean,
data_cadastro date
);

CREATE TABLE IF NOT EXISTS Lancamento (
id_lancamento int(4),
data_lancamento datetime,
descricao varchar (300),
tipo_lancamento varchar(16),
valor decimal (20),
forma_pagamento varchar(16),
numero_parcela int(2),
status_lancamento varchar(45),
observacao_lancamento varchar(200),
id_cnpj INT(4),
cpf varchar(11) not null,
foreign key (id_cnpj) references CNPJ (id_cnpj),
foreign key (cpf) references Usuario_pf(cpf)
);

CREATE INDEX idx_id_lancamento ON Lancamento(id_lancamento);
CREATE TABLE IF NOT EXISTS Conta (
id_contas int(4) primary key,
nome_conta  varchar(45) not null,
tipo_conta varchar (45) not null,
id_lancamento int(4) not null,
cpf varchar(11) not null,
id_cnpj INT(4),
foreign key (id_lancamento) references Lancamento(id_lancamento),
foreign key (cpf) references Usuario_pf(cpf),
foreign key (id_cnpj) references CNPJ (id_cnpj)
);

CREATE TABLE IF NOT EXISTS Impostos (
id_imposto int(4) primary key not null,
nome_imposto varchar (45) not null,
id_contas int(4),
foreign key (id_contas) references Conta(id_contas)
);

CREATE TABLE IF NOT EXISTS Despesas_categoria (
valor decimal not null,
categoria int not null,
id_despesas int not null,
id_despesas_categoria int primary key
);

CREATE TABLE IF NOT EXISTS Resultados_mensais (
id_resultados int primary key not null,
resultado_mes decimal (10,2)not null,
saldo_anterior decimal (10,2)not null,
saldo_atual decimal(10,2) not null,
receitas decimal (10,2) not null,
mes date not null,
depesas decimal (10,2) not null
);

CREATE TABLE IF NOT EXISTS DRE (
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
