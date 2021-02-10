CREATE DATABASE Cadastro;
GO
USE Cadastro;
GO

CREATE TABLE Loja (
  Identificador INT IDENTITY(1,1),
  Nome VARCHAR(45) NOT NULL,
  PRIMARY KEY(Identificador)
);

CREATE TABLE Cliente (
  Identificador INT IDENTITY(1,1),
  Nome VARCHAR(45) NOT NULL,
  CPF VARCHAR(45) NOT NULL UNIQUE,
  RG VARCHAR(45) NOT NULL UNIQUE,
  DataNascimento DATETIME,
  Ativo BIT,
  PRIMARY KEY(Identificador)
);

CREATE TABLE Endereco (
  Identificador INT IDENTITY(1,1),
  IdentificadorCliente INT NOT NULL,
  Logradouro VARCHAR(50),
  Numero VARCHAR(15),
  Complemento VARCHAR(40),
  Cidade VARCHAR(40),
  UF VARCHAR(2),
  CEP VARCHAR(9),
  PRIMARY KEY(Identificador),
  FOREIGN KEY(IdentificadorCliente)
    REFERENCES Cliente(Identificador)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE Loja_has_Cliente (
  IdentificadorLoja INT NOT NULL,
  IdentificadorCliente INT NOT NULL,
  FOREIGN KEY(IdentificadorLoja)
    REFERENCES Loja(Identificador)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(IdentificadorCliente)
    REFERENCES Cliente(Identificador)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

INSERT INTO Loja (Nome) VALUES ('Computadores SA')
INSERT INTO Loja (Nome) VALUES ('Telefones SA')