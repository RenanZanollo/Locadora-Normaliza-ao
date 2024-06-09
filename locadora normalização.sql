create database locadora;

use locadora;

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    nomeCliente VARCHAR(50) NOT NULL,
    nascimento DATE NOT NULL
);

CREATE TABLE veiculos (
    idVeiculo INT PRIMARY KEY NOT NULL,
    veiculo VARCHAR(50) NOT NULL,
    cor VARCHAR(50) NOT NULL,
    placa VARCHAR(8) NOT NULL,
    diaria DECIMAL(10, 2) NOT NULL
);

CREATE TABLE locacao (
    codigoLocacao INT PRIMARY KEY NOT NULL,
    dias INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    fk_cliente INT,
    fk_veiculos INT,
    FOREIGN KEY (fk_cliente) REFERENCES cliente(idCliente),
    FOREIGN KEY (fk_veiculos) REFERENCES veiculos(idVeiculo)
);

INSERT INTO cliente (idCliente, cpf, nomeCliente, nascimento) VALUES 
(1, '123.456.789-01', 'Ariano Suassuna', '1927-06-16'),
(2, '543.765.987-23', 'Grace Hopper', '1906-12-09'),
(3, '987.654.231-90', 'Richard Feynman', '1918-05-11'),
(4, '432.765.678-67', 'Edgar Poe', '1809-01-19'),
(5, '927.384.284-44', 'Gordon Freeman', '1963-10-17');

INSERT INTO veiculos (idVeiculo, veiculo, cor, placa, diaria) VALUES 
(1, 'Fusca', 'Preto', 'WER-3456', 30.00),
(2, 'Variante', 'Rosa', 'FDS-8384', 60.00),
(3, 'Comodoro', 'Preto', 'CVB-9933', 20.00),
(4, 'Delorean', 'Azul', 'DDI-3948', 80.00),
(5, 'Brasília', 'Amarela', 'FGH-2256', 45.00);

INSERT INTO locacao (codigoLocacao, dias, total, fk_cliente, fk_veiculos) VALUES 
(101, 3, 90.00, 1, 1),
(102, 7, 420.00, 2, 2),
(103, 1, 20.00, 3, 3),
(104, 3, 240.00, 4, 4),
(105, 7, 315.00, 5, 5);

CREATE VIEW LocaçõesDetalhadas AS
SELECT 
    locacao.codigoLocacao,
    locacao.dias,
    locacao.total,
    cliente.idCliente,
    cliente.nomeCliente,
    cliente.cpf,
    cliente.nascimento,
    veiculos.idVeiculo,
    veiculos.veiculo,
    veiculos.cor,
    veiculos.placa,
    veiculos.diaria
FROM 
    locacao
JOIN 
    cliente ON locacao.fk_cliente = cliente.idCliente
JOIN 
    veiculos ON locacao.fk_veiculos = veiculos.idVeiculo;

SELECT * FROM locacao;

SELECT * FROM cliente;

SELECT * FROM veiculos;

SELECT * FROM cliente 
JOIN locacao ON locacao.fk_cliente = cliente.idCliente;

SELECT * FROM veiculos 
JOIN locacao ON locacao.fk_veiculos = veiculos.idVeiculo;

