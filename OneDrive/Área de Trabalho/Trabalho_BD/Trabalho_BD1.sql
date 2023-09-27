
#Criação das Tabelas com base no esquema lógico;
CREATE TABLE Cidade(
codigoCidade int NOT NULL auto_increment,
nome varchar(50) NOT NULL,
Primary key(codigoCidade));

CREATE TABLE Disciplina(
codigoDisciplina int NOT NULL auto_increment,
nome varchar(100) NOT NULL,
Primary key(codigoDisciplina));

CREATE TABLE Pessoa(
codigoPessoa int NOT NULL  auto_increment,
nome varchar(100) NOT NULL,
telefone varchar(50),
codigoCidade int NOT NULL,
Primary key(codigoPessoa),
FOREIGN KEY(codigoCidade) REFERENCES Cidade(codigoCidade));

CREATE TABLE Professor(
codigoPessoa int NOT NULL,
RG varchar(50) NOT NULL,
CPF varchar(50) NOT NULL,
Titulo varchar(100),
PRIMARY KEY (codigoPessoa),
FOREIGN KEY (codigoPessoa) REFERENCES Pessoa(codigoPessoa));


CREATE TABLE Escola(
codigoEscola INT NOT NULL  auto_increment,
nome varchar(50) NOT NULL,
codigoDiretor int NOT NULL,
codigoCidade int NOT NULL,
PRIMARY KEY(codigoEscola),
FOREIGN KEY(codigoDiretor) REFERENCES Professor(codigoPessoa),
FOREIGN KEY(codigoCidade) REFERENCES Cidade(codigoCidade));


CREATE TABLE Turma(
codigoTurma INT NOT NULL  auto_increment,
nome varchar(100) NOT NULL,
codigoEscola INT NOT NULL,
PRIMARY KEY(codigoTurma),
FOREIGN KEY(codigoEscola) REFERENCES Escola(codigoEscola));

CREATE TABLE Aluno(
codigoPessoa int NOT NULL,
Matricula varchar(100) NOT NULL,
DataNasc Date NOT NULL,
codigoTurma int NOT NULL,
PRIMARY KEY (codigoPessoa),
FOREIGN KEY (codigoPessoa) REFERENCES Pessoa(codigoPessoa),
FOREIGN KEY (codigoTurma) REFERENCES Turma(codigoTurma));


CREATE TABLE Contato(
nome varchar(100) NOT NULL,
codigoAluno INT NOT NULL,
telefone varchar(50) NOT NULL,
PRIMARY KEY(nome,codigoAluno),
FOREIGN KEY(codigoAluno) REFERENCES Aluno(codigoPessoa));

CREATE TABLE Ministra(
codigoDisciplina INT NOT NULL,
codigoProfessor INT NOT NULL,
PRIMARY KEY(codigoDisciplina, codigoProfessor),
FOREIGN KEY(codigoDisciplina) REFERENCES Disciplina(codigoDisciplina),
FOREIGN KEY(codigoProfessor) REFERENCES Professor(codigoPessoa));

CREATE TABLE Professor_pertence_turma(
codigoDisciplina INT NOT NULL,
codigoProfessor INT NOT NULL,
codigoTurma INT NOT NULL,
PRIMARY KEY(codigoDisciplina, codigoProfessor, codigoTurma),
FOREIGN KEY(codigoDisciplina, codigoProfessor) REFERENCES Ministra(codigoDisciplina, codigoProfessor),
FOREIGN KEY(codigoTurma) REFERENCES Turma(codigoTurma)
);

