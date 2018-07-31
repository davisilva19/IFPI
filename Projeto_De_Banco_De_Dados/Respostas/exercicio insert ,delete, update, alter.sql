create database olxpi;

use olxpi;

create table Estado(
UF varchar(2) not null,
nome varchar(20) not null,
primary key(UF)
);

create table Categoria(
Id_categoria int not null,
nome varchar(30) not null,
primary key(Id_categoria)
);

create table Usuario(
IdUsuario int not null,
nome varchar(30) not null,
primary key (IdUsuario)
);

create table Postagem(
numPostagem int not null,
Id_categoria int not null,
IdUsuario int not null,
descricao varchar(30),
primary key (numPostagem),
foreign key (Id_categoria) references Categoria (Id_categoria),
foreign key (IdUsuario) references Usuario (IdUsuario)
);

insert into Estado 
values ('Pi','Piaui'),
('CE','Ceara'),
('MA','Maranhão');

delete from Estado
where UF = "MA";

insert into Categoria
values ('1','Imoveis'),('2','Veiculos'),('3','Emprego');

alter table Usuario
add column idade int ;

insert into Usuario
values ('1','Denival','39'),('2','Marilia','30'),('3','Jamile','10'),('4','Athanio','40')

alter table Postagem
add column Estado varchar(2) not null;

alter table Postagem
add foreign key(Estado) references Estado (UF);

-- fazer as ultimas 3 questoes 