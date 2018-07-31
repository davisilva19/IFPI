create database ESCOLA;

use ESCOLA;

create table Professor(
cpf_prof int not null,
nome varchar(30) not null,
titulacao varchar(25)
);

create table Disciplina(
cod_disc int not null,
cpf_prof int not null,
nome_disc varchar(25) not null,
carga_horaria time
);

create table Aluno(
matricula int not null,
nome varchar(25)
);

create table Turma(
cod_disc int  not null,
matricula int not null,
sala varchar(25)
);

alter table Professor
add primary key(cpf_prof);

alter table Disciplina
add primary key(cod_disc);

alter table Disciplina
add foreign key(cpf_prof) references Professor(cpf_prof);

alter table Aluno
add primary key(matricula);

alter table Turma
add primary key(cod_disc,matricula);

alter table Professor
add column tempo_servico int not null;

alter table Professor 
modify titulacao varchar(25) not null;

alter table Turma
drop column sala;

alter table Aluno
add column curso varchar(40) not null default 'informatica';

insert into Professor
values ('1','Denival','bancodeDados','20');
insert into Professor
values ('2','Athanio','Progamacao Web','20');
insert into Professor
values ('3','Clodoaldo','A.O.O','20');
insert into Professor
values ('4','Antonio','Algoritimo','20');

insert into Aluno
values ('1','Davi','informatica');
insert into Aluno
values ('2','Vitoria','informatica');
insert into Aluno
values ('3','Geyssy','informatica');
insert into Aluno
values ('4','Antonio','informatica');

update Aluno
set nome = "Breno"
where matricula = 4;

delete from Professor
where cpf_prof = 4;

