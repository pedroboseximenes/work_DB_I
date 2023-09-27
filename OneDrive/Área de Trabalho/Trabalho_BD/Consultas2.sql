#Parte 2 do trabalho

#Q1  - Alterar todos os contatos vinculados a um aluno A para um aluno B.
UPDATE contato
SET contato.codigoAluno = 'Inserir o codigo do aluno'
WHERE contato.codigoAluno = 'Inserir o codigo do aluno';


#Q2 - Forneça um conjunto de instruções SQL para remover da base de dados um professor qualquer. Caso o professor seja diretor de uma escola um novo diretor deverá ser definido.
SELECT * FROM escola WHERE escola.codigoDiretor = 1;
SELECT * FROM professor WHERE professor.codigoPessoa <> 'Inserir o codigo do professor' LIMIT 1;
DELETE FROM professor WHERE professor.id = 'Inserir o codigo do professor';
UPDATE escola SET escola.codigoDiretor = 'Inserir o codigo do professor' WHERE escola.codigoDiretor = 'Inserir o codigo do professor';

#Q3 - Considerando que um Professor P1 precisou sair de licença médica, substituí-lo por outro Professor P2 em todas as turmas onde P1 ministra disciplinas. Importante: Caso o Professor P2 não esteja vinculado a todas as disciplinas ministradas pelo Professor P1, inclua a informação de que o Professor P2 é capaz de ministrar todas as disciplinas ministradas pelo Professor P1.

SELECT disciplina.codigoDisciplina FROM turma WHERE professor.codigoPessoa = 'Inserir o codigo do professor do P1';
SELECT disciplina.codigoDisciplina FROM ministra WHERE professor.codigoPessoa = 'Inserir o codigo do professor do P2';
SELECT disciplina.codigoDisciplina FROM turma WHERE professor.codigoPessoa = 'Inserir o codigo do professor' AND disciplina.codigoDisciplina NOT IN (SELECT disciplina.codigodisciplina FROM ministra WHERE professor.codigoPessoa = 'Inserir o codigo do professor P2');
INSERT INTO ministra (professor.codigoPessoa, disciplina.codigoDisciplina) SELECT 'Inserir o codigo do professor P2', disciplina.codigoDisciplina FROM turma WHERE professor.codigoPessoa = 'Inserir o codigo do professor' AND disciplina.codigodisciplina NOT IN (SELECT disciplina.codigodisciplina FROM ministra WHERE professor.codigoPessoa ='Inserir o codigo do professor P2');
UPDATE turma SET professor.codigoPessoa = 'Inserir o codigo do professor P2' WHERE professor.codigoPessoa = 'Inserir o codigo do professor P1';
