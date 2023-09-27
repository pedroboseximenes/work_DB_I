#CIDADES
INSERT INTO Cidade(nome)
VALUES("Rio de janeiro");
INSERT INTO Cidade(nome)
VALUES("Niteroi");

#DISCIPLINA
INSERT INTO Disciplina(nome)
VALUES("Estrutura de Dados");
INSERT INTO Disciplina(nome)
VALUES("Calculo");
INSERT INTO Disciplina(nome)
VALUES("Algebra");
INSERT INTO Disciplina(nome)
VALUES("Geometria");

#PROFESSORES
INSERT INTO Pessoa(nome,telefone,codigoCidade)
values("José", 9814485, 1);
insert INTO Professor(codigoPessoa,RG,CPF,Titulo)
VALUES(1,306486457, 167720977, "Doutorado");

INSERT INTO Pessoa(nome,telefone,codigoCidade)
values("PAULO", 9814485, 1);
insert INTO Professor(codigoPessoa,RG,CPF,Titulo)
VALUES(10,306486457, 167720977, "Doutorado");

INSERT INTO Pessoa(nome,telefone,codigoCidade)
values("Rafael", 31231231, 2);
insert INTO Professor(codigoPessoa,RG,CPF,Titulo)
VALUES(5,306486457, 129393, "");
select * from pessoa;
#ESCOLA
INSERT INTO Escola(nome,codigoDiretor,codigoCidade)
VALUES("DEAAZ",1,1);

INSERT INTO Escola(nome,codigoDiretor,codigoCidade)
VALUES("Pensi",5,2);

INSERT INTO Escola(nome,codigoDiretor,codigoCidade)
VALUES("Anchieta",10,2);

INSERT INTO Turma(nome,codigoEscola)
VALUES("A1", 2);

INSERT INTO Turma(nome,codigoEscola)
VALUES("B1", 3);


INSERT INTO Turma(nome,codigoEscola)
VALUES("C1",2 );
select * from turma;

#ALUNOS
INSERT INTO Pessoa(nome,telefone,codigoCidade)
values("Pedro", 3746507, 1);
INSERT INTO Aluno(codigoPessoa, Matricula, DataNasc, codigoTurma)
VALUES(2,1234567,"2002-12-16", 2);

INSERT INTO Pessoa(nome,telefone,codigoCidade)
values("Carlos", 5123432, 2);
INSERT INTO Aluno(codigoPessoa, Matricula, DataNasc, codigoTurma)
VALUES(3,12312312,"2005-10-16", 2);

INSERT INTO Pessoa(nome,telefone,codigoCidade)
values("Silvana", 513993, 2);
INSERT INTO Aluno(codigoPessoa, Matricula, DataNasc, codigoTurma)
VALUES(4,12312312,"1999-05-16", 2);

INSERT INTO Pessoa(nome,telefone,codigoCidade)
values("Luisa", 513993, 2);
INSERT INTO Aluno(codigoPessoa, Matricula, DataNasc, codigoTurma)
VALUES(6,12312312,"1999-05-16", 3);

INSERT INTO Pessoa(nome,telefone,codigoCidade)
values("Ximenes", 513993, 2);
INSERT INTO Aluno(codigoPessoa, Matricula, DataNasc, codigoTurma)
VALUES(9,12312312,"1999-05-16", 2);
select * from aluno;


#CONTATO
INSERT INTO Contato(nome,codigoAluno,telefone)
VALUES("Pedro",2,21981445);
INSERT INTO Contato(nome,codigoAluno,telefone)
VALUES("Luciana",2,21764532);

INSERT INTO Contato(nome,codigoAluno,telefone)
VALUES("Alfredo",3,94811234);

#MINISTRA_DISCIPLINA
INSERT INTO Ministra(codigoDisciplina,codigoProfessor)
VALUES(1,1);
INSERT INTO Ministra(codigoDisciplina,codigoProfessor)
VALUES(2,1);
INSERT INTO Ministra(codigoDisciplina,codigoProfessor)
VALUES(4,1);

INSERT INTO Ministra(codigoDisciplina,codigoProfessor)
VALUES(3,5);
INSERT INTO Ministra(codigoDisciplina,codigoProfessor)
VALUES(2,5);

 INSERT INTO Ministra(codigoDisciplina,codigoProfessor)
VALUES(4,10);


#PROFESSOR TEM TURMA

INSERT INTO professor_pertence_turma(codigoDisciplina,codigoProfessor,codigoTurma)
VALUES(1,1,2);
INSERT INTO professor_pertence_turma(codigoDisciplina,codigoProfessor,codigoTurma)
VALUES(1,1,4);
INSERT INTO professor_pertence_turma(codigoDisciplina,codigoProfessor,codigoTurma)
VALUES(1,1,3);
INSERT INTO professor_pertence_turma(codigoDisciplina,codigoProfessor,codigoTurma)
VALUES(2,1,2);

INSERT INTO professor_pertence_turma(codigoDisciplina,codigoProfessor,codigoTurma)
VALUES(4,10,2);


INSERT INTO professor_pertence_turma(codigoDisciplina,codigoProfessor,codigoTurma)
VALUES(2,5,2);
INSERT INTO professor_pertence_turma(codigoDisciplina,codigoProfessor,codigoTurma)
VALUES(3,5,3);
