USE MASTER IF EXISTS(SELECT * FROM SYS.databases WHERE NAME = 'NewFerret')
DROP DATABASE NewFerret
GO

CREATE DATABASE NewFerret
GO

USE NewFerret
GO


create table usuario
(
id int identity not null,
nome_usuario varchar(60) not null,
email varchar(60) not null,
foto varbinary(Max)  null,
senha varchar(50) not null,
nivel_acesso VARCHAR(10) NULL, --ADM, USER
telefone varchar(20) not NULL,
status_usuario VARCHAR(20) not null,
token char(7) null, --token
reset_password_otp varchar(200) null, --para reset da senha
reset_password_created_at bigInt null, -- o mesmo da de cima
primary key (id),
)

create table projeto
(
 id int identity not null,
 titulo varchar(40) not null,
 quant_membros int not null,
 descricao varchar(1000) not null,
 data_inicio smalldatetime not null,
 data_fim smalldatetime  null,
 status_projeto varchar(20) not null,
 foto_projeto varbinary(Max)  null,
 usuario_id int not null,
 primary key(id)
)

create table projeto_usuario
(
id int identity not null,
projeto_id int not null,
usuario_id int not null,
status_usuario bit not null,
primary key(id),
foreign key(projeto_id) references projeto(id),
foreign key(usuario_id) references usuario(id)
)


create table tarefa
(
id int identity not null,
projeto_id int not null,
titulo varchar(100) not null,
status_tarefa varchar(20) not null, --Feita ou não feita
primary key (id),
foreign key (projeto_id) references projeto(id)
)