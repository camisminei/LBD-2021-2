set search_path=public;

DROP TABLE if EXISTS cliente CASCADE;
DROP TABLE if EXISTS endereco CASCADE;
DROP TABLE if EXISTS pedido CASCADE;
DROP TABLE if EXISTS produto CASCADE;
DROP TABLE if EXISTS itempedido CASCADE;
DROP TABLE if EXISTS pagamento CASCADE;

CREATE TABLE cliente (
	idcliente SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	idade integer
);

CREATE TABLE endereco (
	idendereco SERIAL PRIMARY KEY,
	rua VARCHAR(100),
	cidade VARCHAR(100),
	estado VARCHAR(200),
	entrega BOOLEAN NOT NULL,
	cobranca BOOLEAN NOT NULL,
	idcliente INTEGER NOT NULL,
	UNIQUE(idcliente, cobranca)
);

CREATE TABLE pagamento (
	idpagamento SERIAL PRIMARY KEY,
	tipo varchar(100) check(tipo in ('CARTAO CREDITO', 'CARTAO DEBITO', 'PIX', 'DINHEIRO')),
	valor_pago numeric(10,2) NOT NULL,
	desconto numeric(10,2) DEFAULT 0,
	idpedido INTEGER
);

CREATE TABLE pedido (
	idpedido SERIAL PRIMARY KEY,
	data TIMESTAMP,
	idcliente INTEGER NOT NULL
);

CREATE TABLE itempedido (
	idpedido INTEGER,
	idproduto INTEGER,
	PRIMARY KEY (idpedido, idproduto)
);

CREATE TABLE produto (
	idproduto SERIAL PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
	preco_unitario NUMERIC(10,2) NOT NULL,
	categoria VARCHAR(300),
	qtd_estoque INTEGER NOT NULL
);

INSERT INTO cliente (nome, idade) VALUES 
('Ana Francine',20),
('Carlos Barbosa',32),
('Ricardo Vasconcelos',57),
('Roberto Carlos',41),
('Fatima Bernardes',57),
('Fauto Silva',82);

INSERT INTO pedido (data, idcliente) VALUES 
('11-01-2019',1),
('02-04-2020',1),
('02-04-2020',2),
('02-05-2020',3),
('05-05-2018',4),
('10-10-2019',6);

INSERT INTO pagamento (tipo, valor_pago, desconto, idpedido) VALUES 
('CARTAO CREDITO', 330 ,0,1), 
('PIX', 500 ,0,2),
('DINHEIRO', 1400 ,10, 3); 

INSERT INTO endereco (rua, cidade, estado, entrega, cobranca, idcliente) VALUES 
('Sabia','Sao Paulo','SP', TRUE, TRUE, 1),
('Sabia Segundo','Sao Paulo','SP', TRUE, FALSE, 1),
('Jacutinga','Sao Paulo','SP', TRUE, FALSE, 2),
('Faria Lima','Sao Paulo','SP', FALSE, TRUE, 2);


INSERT INTO produto (nome, categoria, preco_unitario, qtd_estoque) VALUES 
('Gopro','Acessorio',500,10),
('Mouse','Computadores',120,120),
('Teclado','Computadores',210,30),
('Monitor','Computadores',900,70),
('Mesa escritorio tipo 1','Escritorio',2900,10),
('Cadeira Gamer Azul','Escritorio',3200,5),
('Jogo de canetas coloridas',NULL,10,5),
('Placa de video asus', 'Hardware', 2300,9),
('HD SSD Kingston','Hardware', 750,0),
('Cooler FAN', 'Hardware', 20,30),
('Memoria Gamer','Hardware',300,2),
('Smartfone Motorola','Telefonia',1274,2),
('Smartfone ASUS','Telefonia',1529,7),
('Fone de ouvido earpods', 'Acessorio',130,50);


INSERT INTO itempedido (idpedido, idproduto) VALUES 
(1,2),
(1,3), 
(2,1), 
(3,1), 
(3,4),
(3,7),
(4,3),
(4,4),
(5,5),
(6,8),
(6,10),
(6,11);


ALTER TABLE endereco ADD CONSTRAINT endcliidfk FOREIGN KEY (idcliente) REFERENCES cliente(idcliente) ON DELETE CASCADE;
ALTER TABLE itempedido ADD CONSTRAINT itempedidpedkf FOREIGN KEY (idpedido) REFERENCES pedido(idpedido) ON DELETE CASCADE; 
ALTER TABLE itempedido ADD CONSTRAINT itempedidprodkf FOREIGN KEY (idproduto) REFERENCES produto(idproduto) ON DELETE CASCADE;
ALTER TABLE pagamento ADD CONSTRAINT pagidpedfk FOREIGN KEY (idpedido) REFERENCES pedido(idpedido) ON DELETE CASCADE; 
ALTER TABLE pedido ADD CONSTRAINT ppedidclikf FOREIGN KEY (idcliente) REFERENCES cliente(idcliente) ON DELETE CASCADE;
