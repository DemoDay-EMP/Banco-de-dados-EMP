-- tabela alterado por mim (Estou usando esse código)
drop database emp;
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

CREATE TABLE IF NOT EXISTS Usuario_pf (
cpf varchar(11) primary key not null,
nome_cliente varchar(200) not null,
cnpj varchar(14),
data_nascimento date not null,
telefone varchar(14) not null,
cep varchar(10) not null,
email varchar(40) not null,
senha varchar (40) not null,
status_usuario boolean,
data_cadastro date
);

CREATE TABLE IF NOT EXISTS Lancamento (
  id_lancamento int(4) primary key auto_increment,
  valor decimal (10, 2),
  tipo_conta varchar(16),
  data_lancamento datetime,
  tipo_lancamento varchar(40),
  cpf varchar(11) NOT NULL,
  forma_pagamento varchar(16),
  observacao varchar(200),
  status_lancamento boolean,
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


INSERT INTO Usuario_pf (cpf, nome_cliente,cnpj, data_nascimento, telefone, cep, email, senha, status_usuario, data_cadastro)
VALUES ('12345678901', 'Leia Lima', '76632691000108','1990-01-15', '123456789', '01153000', 'leia.lima@gmail.com', '123456', true, '2023-01-01');

-- Vamos assumir que o ID do usuário "Leia Lima" na tabela Usuario_pf seja 'leia123'
-- Gere alguns lançamentos para esse usuário

-- Inserção 1
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-150.00, 'Despesa', '2023-12-01', 'Material de escritório', '12345678901', 'Cartão', 'Compra de um telefone', true);

-- Inserção 2
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (800.00, 'Receita', '2023-12-01', 'Venda de serviço', '12345678901', 'Dinheiro', 'Formatei um computador', true);

-- Inserção 3
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-100.00, 'Despesa', '2023-12-02', 'Material de escritório', '12345678901', 'Boleto Bancário', 'Folhas de sulfite', true);

-- Inserção 4
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-50.00, 'Despesa', '2023-12-03', 'Embalagens', '12345678901', 'Débito', 'Embalagem de carregador', true);

-- Inserção 5
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (200.00, 'Receita', '2023-12-02', 'Venda de produto', '12345678901', 'Débito', 'Venda de 5 mouses', true);

-- Inserção 6
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-70.00, 'Despesa', '2023-12-03', 'Comissão', '12345678901', 'Dinheiro', 'Comissão de venda', true);

-- Inserção 7
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (150.00, 'Receita', '2023-12-04', 'Venda de serviço', '12345678901', 'Boleto', 'Serviço de manutenção', true);

-- Inserção 8
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-30.00, 'Despesa', '2023-12-05', 'Material de consumo', '12345678901', 'Débito', 'Compra de canetas', true);

-- Inserção 9
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-20.00, 'Despesa', '2023-12-06', 'Embalagens', '12345678901', 'Débito', 'Embalagem de produto', true);

-- Inserção 10
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (180.00, 'Receita', '2023-12-07', 'Venda de serviço', '12345678901', 'Débito', 'Consultoria em TI', true);

-- Inserção 11
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-25.00, 'Despesa', '2023-12-08', 'Água', '12345678901', 'Boleto Bancário', 'Pagamento mensal', true);

-- Inserção 12
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-40.00, 'Despesa', '2023-12-09', 'Luz', '12345678901', 'Débito', 'Pagamento mensal', true);

-- Inserção 13
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (300.00, 'Receita', '2023-12-10', 'Venda de produto', '12345678901', 'Dinheiro', 'Venda de computador', true);

-- Inserção 14
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-60.00, 'Despesa', '2023-12-11', 'Internet', '12345678901', 'Cartão', 'Pagamento mensal', true);

-- Inserção 15
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-90.00, 'Despesa', '2023-12-12', 'Frete', '12345678901', 'Dinheiro', 'Frete de entrega', true);

-- Inserção 16
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (250.00, 'Receita', '2023-12-13', 'Rendimento financeiro', '12345678901', 'Débito', 'Investimento', true);

-- Inserção 17
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-35.00, 'Despesa', '2023-12-14', 'Condomínio', '12345678901', 'Débito', 'Pagamento mensal', true);

-- Inserção 18
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-75.00, 'Despesa', '2023-12-15', 'Juros e multas', '12345678901', 'Boleto', 'Multa por atraso', true);

-- Inserção 19
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (120.00, 'Receita', '2023-12-16', 'Venda de serviço', '12345678901', 'Dinheiro', 'Manutenção de computadores', true);

-- Inserção 20
INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-45.00, 'Despesa', '2023-12-17', 'Frete', '12345678901', 'Cartão', 'Envio de mercadorias', true);

INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (850.00, 'Receita', '2023-12-17', 'Venda de produto', '12345678901', 'Débito', 'Venda de 10 teclados', true);

INSERT INTO Lancamento (valor, tipo_conta, data_lancamento, tipo_lancamento, cpf, forma_pagamento, observacao, status_lancamento)
VALUES (-850.00, 'Despesa', '2023-12-17', 'ICMS', '12345678901', 'Débito', 'Impostos', true);
