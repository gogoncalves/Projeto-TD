create database testeMod;

use testeMod;

create table usuario(
idUsuario int primary key auto_increment,
nome varchar(50),
email varchar(50),
senha varchar(50)
);

create table quiz (
idQuiz int primary key auto_increment,
tema varchar(45)
);

create table questoes (
fkQuiz int,
foreign key (fkQuiz) references quiz(idQuiz),
idQuestoes int,
primary key (fkQuiz, idQuestoes)
);

create table alternativas (
fkUsuario int,
foreign key (fkUsuario) references usuario (idUsuario),
fkQuiz int,
fkQuestoes int,
foreign key (fkQuiz, fkQuestoes) references questoes(fkQuiz, idQuestoes),
idAlternativas char(1) check (idAlternativas = 'A' or idAlternativas = 'B' or idAlternativas = 'C'),
primary key (fkUsuario, fkQuiz,fkQuestoes, idAlternativas),
statusAlternativa tinyint default 0
);

desc alternativas;

create table Gerador (
idGerador int primary key auto_increment,
tipo varchar(45)
);

create table Templates (
fkGerador int,
foreign key (fkGerador) references Gerador (idGerador),
idTemplates int,
primary key (fkGerador, idTemplates)
);

desc templates;

create table TemplatesUsuario (
fkUsuario int,
foreign key(fkUsuario) references usuario(idUsuario),
fkGerador int,
fkTemplates int,
foreign key(fkGerador, fkTemplates) references Templates(fkGerador, idTemplates),
primary key (fkUsuario, fkGerador, fkTemplates),
statusTemplate tinyint default 0 
);

desc templatesusuario;

create table contato (
idContato int primary key auto_increment,
nome varchar (45),
email varchar (50),
mensagem varchar(200)
) auto_increment = 100;


insert into usuario values (null, 'Gustavo', 'gusta.goncalves@hotmail.com', '123'),
							(null, 'Igor', 'gusta.goncalves@hotmail.com', '123'),
                            (null, 'Gian', 'gusta.goncalves@hotmail.com', '123');
                            
select * from usuario;

insert into quiz values (null, 'Sustentabilidade');

select * from quiz;

insert into questoes values (1, 1),
							(1, 2),
                            (1, 3),
                            (1, 4),
                            (1, 5);
                            
select * from questoes;

insert into alternativas values (1,1,1,'A', 1),
								(1,1,2,'B', 0),
                                (1,1,3,'C', 0),
                                (1,1,4,'A', 1),
                                (1,1,5,'C', 1);

DESC alternativas;

drop table alternativas;
select * from alternativas;

insert into Gerador values (null, 'Sustentabilidade Ecologica'),
							(null, 'Sustentabilidade Social'),
                            (null, 'Sustentabilidade Economica'),
                            (null, 'Sustentabilidade Empresarial');

select * from Gerador;

insert into Templates values (1, 1),
							(1, 2),
                            (1, 3),
                            (2, 1),
                            (2, 2),
                            (3, 1),
                            (3, 2),
                            (4, 1);

desc templates;

select * from templates;

SELECT Usuario.nome, count(statusAlternativa)
	FROM alternativas
		JOIN Usuario
			ON idUsuario = fkUsuario
				AND statusAlternativa = 1;

truncate table questoesusuario;