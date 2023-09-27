#Parte 1 do trabalho - Consultas de 1 até 10 questões

#Q1 - Listar o nome e a cidade das escolas onde todos os alunos residam na mesma cidade onde a escola está localizada.
SELECT  quantidade_alunos_escola.nome_escola, estudam_na_mesma_cidade.cidade_nome
from (
Select escola.nome as nome_escola, Count(aluno.codigoPessoa) as quantidade_dealunos
from pessoa
join aluno on aluno.codigoPessoa = pessoa.codigoPessoa
join turma on turma.codigoTurma = aluno.codigoTurma
join escola on escola.codigoEscola = turma.codigoEscola 
group by escola.codigoescola) 
as quantidade_alunos_escola
join (
	SELECT escola.nome as nome_escola2, cidade.nome as cidade_nome, Count(aluno.codigoPessoa) as estuda_mesma_cidade
	from pessoa
	join aluno on aluno.codigoPessoa = pessoa.codigoPessoa
	join turma on turma.codigoTurma = aluno.codigoTurma
	join escola on escola.codigoEscola = turma.codigoEscola 
	join cidade on escola.codigoCidade = cidade.codigoCidade
	where cidade.codigoCidade = pessoa.codigoCidade
	group by escola.codigoEscola) as estudam_na_mesma_cidade 
on quantidade_alunos_escola.quantidade_dealunos = estudam_na_mesma_cidade.estuda_mesma_cidade 
and quantidade_alunos_escola.nome_escola = estudam_na_mesma_cidade.nome_escola2;

#Q2  -  Listar o nome e matrícula dos alunos sem nenhum contato cadastrado.

select p.nome, a.matricula
from pessoa as p, aluno as a
where p.codigoPessoa = a.codigoPessoa and a.codigoPessoa not in (select distinct contato.codigoAluno from contato);


#Q3
select t.codigoTurma, t.nome
from pessoa
join aluno a on pessoa.codigoPessoa = a.codigoPessoa
join turma t on t.codigoTurma = a.codigoTurma
group by t.nome
having count(a.codigoPessoa) > 5;

#Q4
select pessoa.nome,professor.codigoPessoa, professor.Titulo
from pessoa
join professor on professor.codigoPessoa = pessoa.codigoPessoa
join ministra on ministra.codigoProfessor = professor.codigoPessoa
join professor_pertence_turma on professor_pertence_turma.codigoProfessor  = professor.codigoPessoa
GROUP BY professor.codigoPessoa, pessoa.nome
having count(  distinct professor_pertence_turma.codigoTurma) >=3 ;

#Q5 - Listar por disciplina o número de professores que podem ministrá-la e quantos efetivamente ministram a mesma para uma turma.

SELECT professores_podem_ministrar_disciplina.disciplina_nome, professores_podem_ministrar_disciplina.ministra_disciplina, professores_de_fato_ministram_turma.tem_turma_com_disciplina
from (
	select disciplina.nome as disciplina_nome, count( distinct professor.codigoPessoa) as ministra_disciplina
	from pessoa
	join professor on professor.codigoPessoa = pessoa.codigoPessoa
	join ministra on ministra.codigoProfessor = professor.codigoPessoa
	join disciplina on disciplina.codigoDisciplina = ministra.codigoDisciplina
	group by disciplina.nome) as professores_podem_ministrar_disciplina
join(
	select disciplina.nome as nome_disciplina2, count( distinct professor.codigoPessoa) as tem_turma_com_disciplina
	from pessoa
	join professor on professor.codigoPessoa = pessoa.codigoPessoa
	join ministra on ministra.codigoProfessor = professor.codigoPessoa
	join disciplina on disciplina.codigoDisciplina = ministra.codigoDisciplina
	join professor_pertence_turma on professor_pertence_turma.codigoDisciplina = disciplina.codigoDisciplina
	group by disciplina.nome) as professores_de_fato_ministram_turma
    on professores_de_fato_ministram_turma.nome_disciplina2 = professores_podem_ministrar_disciplina.disciplina_nome;

    

#Q6 - Listar o nome da escola e o nome dos diretores de escola que residem em cidades diferentes da cidade da escola.
select e.nome, pessoa.nome
from pessoa
join professor on professor.codigoPessoa = pessoa.codigoPessoa
join escola e on  professor.codigoPessoa = e.codigoDiretor
where e.codigoCidade != pessoa.codigoCidade;


#Q7 Listar por escola o número de turmas e o número de professores que ministram alguma disciplina para turmas da escola em questão.
#calcular quantas turmas tem cada escola
select quantidade_turma_escola.nome_escola, quantidade_turma_Escola.quantidade_turma, quantidade_professor_escola.quantidade_professor
from (
	select escola.nome as nome_escola, count( distinct turma.codigoTurma) as quantidade_turma
	from turma
	join escola on turma.codigoEscola = escola.codigoEscola
	join professor_pertence_turma on professor_pertence_turma.codigoTurma = turma.codigoTurma
	group by escola.nome) as quantidade_turma_escola
join(
#calcular quantos professores ministram
	select escola.nome as nome_escola2, count( distinct professor.codigoPessoa) as quantidade_professor
	from professor
	join professor_pertence_turma on professor_pertence_turma.codigoProfessor = professor.codigoPessoa
	join turma on professor_pertence_turma.codigoTurma = turma.codigoTurma
	join escola on escola.codigoEscola = turma.codigoEscola
	group by escola.nome) as quantidade_professor_escola
    on quantidade_turma_escola.nome_escola = quantidade_professor_Escola.nome_escola2 ;


#Q8 - Listar por escola a razão entre o número de alunos da escola e o número de professores que ministram alguma disciplina na escola em questão.

SELECT e.nome AS nome_escola, COUNT(DISTINCT a.codigoPessoa) AS numero_alunos, COUNT(DISTINCT p.codigoPessoa) AS numero_professores, COUNT(DISTINCT a.codigoPessoa) / COUNT(DISTINCT p.codigoPessoa) AS razao_alunos_professores
FROM escola e
JOIN turma t ON e.codigoEscola = t.codigoEscola
join aluno a on a.codigoTurma = t.codigoTurma
join professor_pertence_turma on professor_pertence_turma.codigoTurma = t.codigoTurma
JOIN professor p ON p.codigoPessoa = professor_pertence_turma.codigoProfessor
GROUP BY e.nome;

    
    
#Q9 Listar todos os contatos dos alunos informando a matrícula e nome do aluno, nome e telefone do contato, ordenado por matrícula do aluno e nome do contato.
    
select pessoa.nome, a.Matricula, contato.nome, contato.telefone
from pessoa
join aluno as a on a.codigoPessoa = pessoa.codigoPessoa
join contato on contato.codigoAluno = a.codigoPessoa
order by a.matricula, contato.nome;
    
    
#Q10 Listar todos os professores que ministram disciplinas para apenas uma turma.
select pessoa.nome, professor.codigoPessoa, professor.Titulo
from pessoa
join professor on pessoa.codigoPessoa = professor.codigoPessoa
join ministra on ministra.codigoProfessor = professor.codigoPessoa
join professor_pertence_turma on professor_pertence_turma.codigoProfessor  = professor.codigoPessoa
group by professor.codigoPessoa
having count( distinct professor_pertence_turma.codigoTurma) = 1;


select * from turma;
select * from professor;
select * from ministra;
select * from disciplina;
select * from professor_pertence_turma;
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));