CREATE DATABASE Cadastro;
show databases;
use Cadastro;
create table clientes (
nome varchar (40),
idade tinyint (3),
sexo char (1),
peso float,
altura float,
nacionalidade varchar (25)
);

drop database Cadastro;

create database cadastro;
use cadastro;
create table clientes (
nome varchar (45) not null,
nascimento date,
sexo enum ('M','F'),
peso decimal (5,2),
altura decimal (3,2),
nacionalidade varchar (25) default 'Brasil'
);
desc clientes;
alter table clientes add column id int not null auto_increment primary key;
desc clientes;
alter table clientes
drop column id;
desc clientes;
alter table clientes add column id int not null auto_increment primary key first;
alter table clientes add column estado_civil varchar (40) after nascimento;
alter table clientes drop column estado_civil;
insert into clientes(nome, nascimento, sexo, peso, altura, nacionalidade) values('Marcelo', '1968-11-15', 'M', '88.60','1.85', ' ');
select * from clientes;

update clientes set nacionalidade = 'Brasil' where id ='1';

desc clientes;

insert into clientes(nome, nascimento, sexo, peso, altura, nacionalidade) values('Simone', '1970-10-28', 'F', '75', '1.67', default);

select * from clientes;

alter table clientes modify column nome varchar(60); #modify PERMITE MUDAR O TIPO PRIMITIVOE AS CONSTRAINTS QUE SÃO AS RESTRIÇÕES DA TABELA
desc clientes;

alter table clientes change column sexo genero enum ('M','F');#change PARA ALTERAR O NOME DA COLUNA
desc clientes;

alter table clientes rename to clientes1; # rename PARA RENOMEAR A TABELA

show tables; # MOSTRA TODAS AS TABELAS DO BANCO DE DADOS EM USO

alter table clientes1 rename to clientes;

insert into clientes(nome, nascimento, genero, peso, altura, nacionalidade) values('Fernanda','1978-10-28','F','70.5','1.58',default);
insert into clientes (nome, nascimento, genero, peso, altura, nacionalidade) values('Julio','2010-08-26','M','55.6','1.69',default);
insert into clientes (nome, nascimento, genero, peso, altura, nacionalidade) values('Davi','2014-06-30','M','34.8','1.48',default);
insert into clientes (nome, nascimento, genero, peso, altura, nacionalidade) values('Silvana','1963-03-11','F','64.5','1.52',default);
desc clientes;
select * from clientes;

delete from  clientes where id='4'; # DELETE PARA APAGAR UMA ID

describe clientes; # describe VERIFICA A ESTRUTURA DA TABELA

# EXERCICIO DE FIXAÇÃO - ATIVIDADE 6 ( 22-01-2025)

describe clientes;

alter table clientes add column profissao varchar (20) after nome;

desc clientes;

alter table clientes change column profissao cargo varchar (20);

update clientes set cargo = 'Ti' Where id = '1';

#  ATIVIDADE 7  (22-01-2025)

update clientes set cargo = 'Gerente' where id = '6';
update clientes set cargo = 'Administrativo' where id = '7';
update clientes set cargo = 'Assist. contábil' where id = '8';
update clientes set cargo = 'Aux. ADM' where id = '9';
select * from clientes;

-- abaixo é um comando para criar uma nova tabela, colocamos o mesmo nome então não vai criar e aparece a mensagem de alerta
create table if not exists clientes (teste int);

create table if not exists cursos (
nome varchar (30) not null unique,
descricao text,
carga int unsigned,
qtdaulas int unsigned,
ano year default '2024');

-- ATIVIDADE - 8 - ADICIONAR id NA PRIMEIRA COLUNA
alter table cursos add column id int not null auto_increment primary key first;

select * from cursos;

-- ATIVIDADE - 9
insert into cursos(nome, descricao, carga, qtdaulas, ano)
 values ('Pacote officce','Nivel básico','96','24','2000'),
('Exel básico','Nivel intermediário','40','10','2012'),
('Excel Avançado','Nivel Avançado','60','15','2014'),
('Operador de Microcomputador','Nivel intermediário','160','40','2028'),
('SQL','Nivel Avançado','120','30','2004');

select * from cursos;
-- ALTERAR OS VALORES OU NOMES DOS DADOS DAS COLUNAS
update cursos set nome = 'Pacote Office' where id = '1';
update cursos set ano = '2025' where id = '4';
update cursos set nome = 'Excel Básico' where id = '2';

delete from cursos where id = '3';

update cursos
 set nome = 'Excel Básico',
 ano = '2020',
 carga = '40'
 where id = '2';
 
 -- Exemplo 3:
 update cursos
 set ano = '2040',
 carga = '500'
 where ano = '2020';
 
 -- Exemplo 4:
 update clientes
 set cargo = 'Aux. Administrativo'
 where cargo = 'Aux. ADM';
 select * from clientes;
 
 -- COMO CRIAR CÓPIAS DAS TABELAS E CRIAR NOVA TABELA
-- create table new_table as select * from original_table;
create table clientes2 as select * from clientes;
-- APAGA SOMENTE AS LINHAS DA TABELA
truncate table clientes2;
select * from clientes2;
drop table clientes2;

drop table cursos;

use cadastro;

show tables;

desc cursos;

create table cursos2 as select * from cursos;


drop table cursos;

select * from cursos
order by nome;

select * from cursos
order by nome desc;

select nome, carga, ano from cursos order by nome;

select nome, carga, ano from cursos order by ano;

select nome, carga, ano from cursos order by ano, nome;

select * from cursos where ano = '2016' order by nome;

select nome, carga from cursos where ano = '2016' order by nome;

select * from cursos;

select ano, nome, descricao from cursos where ano <= '2015' order by nome;

select ano, nome, descricao from cursos where ano <> '2016' order by ano, nome;

select ano, nome from cursos where ano between '2014' and '2016' order by nome;

select idcurso, ano, nome from cursos where ano in (2014, 2016, 2018) order by ano;

select * from cursos where carga > 35 and totaulas < 30 order by nome;

select nome, carga, totaulas from cursos where carga > 35 or totaulas < 30 order by nome;

use cadastro;

select * from cursos;

select nome, carga, ano from cursos group by nome, carga, ano order by ano;

select nome, carga, ano from cursos group by nome, carga, ano order by nome;

select nome, carga, ano from cursos group by nome, carga, ano order by carga;

select nome, carga, ano from cursos group by nome, carga, ano order by idcurso;

select idcurso, nome, carga, ano from cursos group by nome, carga, ano order by idcurso;

select nome, carga, ano from cursos group by nome, carga, ano order by ano;

select * from cursos;

select carga, count(carga) as qtd_dias from cursos group by carga order by carga;

-- -------------------------------------------------------------------------------

create database ti;

show databases;

use ti;

CREATE TABLE CLIENTES (
	CPF VARCHAR (18) PRIMARY KEY NOT NULL,
NOME VARCHAR (40),
NASC DATE,
ENDERECO VARCHAR (200),
CEP VARCHAR (12),
BAIRRO VARCHAR (100),
CIDADE VARCHAR (100),
UF CHAR (2)
);


ALTER TABLE CLIENTES
ADD COLUMN DATA_ULTIMA_COMPRA DATE;


desc clientes;

Insert Into clientes Values
('02296332780', 'Marcos da Silva', '1970-11-25', 'Rua Pedro Marques', '88045968', 'Santana', 'São Paulo','SP','2024-06-16'), 
('08285031490', 'Ana Julia', '1985-10-21', 'Rua Paradigma Novais', '99078923', 'Leblon', 'Rio de Janeiro', 'RJ','2024-06-17'),
('05550314905', 'Jorge Soares', '1989-03-05', 'Rua das Banguelas', '77048917', 'Copacabana', 'Rio de Janeiro', 'RJ','2024-06-18'),
('01150314905', 'Juvenal Soares', '1989-04-15', 'Rua das Tabuinhas', '69048917', 'Minerva', 'Minas Gerais', 'MG','2024-06-19');

select * from clientes;

SELECT * FROM CLIENTES
WHERE CIDADE = 'RIO DE JANEIRO';


ALTER TABLE CLIENTES
ADD COLUMN PRODUTO VARCHAR (60);

UPDATE CLIENTES 
SET PRODUTO = 'TV' 
WHERE CPF = '02296332780';

UPDATE CLIENTES 
SET PRODUTO = 'GELADEIRA'
WHERE CPF ='08285031490';

UPDATE CLIENTES  
SET PRODUTO = 'NOTEBOOK' 
WHERE CPF ='05550314905';

UPDATE CLIENTES 
SET PRODUTO = 'CELULAR'
WHERE CPF ='01150314905';
select * from clientes;

DELETE FROM CLIENTES  
WHERE CIDADE = 'São Paulo';

use cadastro;

select * from cursos
where nome like 'P%';

select * from cursos
where nome like '%a';

select * from cursos
where nome like '%a%';

select * from cursos
where nome not like '%a%';

select * from cursos
where nome like 'PH%P';

select * from cursos
where nome like 'PH%P%';

select * from cursos
where nome like 'PH%P_';

select count(*) from cursos;

select * from cursos
where carga > 40;

select count(*) from cursos
where carga > 40;

select max(carga) from cursos;

select max(totaulas) from cursos where ano = 2016;

select min(totaulas) from cursos;

select sum(totaulas) from cursos;

select avg(totaulas) from cursos;

select * from alunos;

select nome from alunos where sexo = 'F' order by nome;

select * from alunos where nascimento between '2000-01-01' and '2015-12-31' order by nascimento;

select * from alunos where sexo = 'M' and profissao = 'programador' order by nome;

select * from alunos where sexo = 'F' and nacionalidade = 'Brasil' and nome like 'J%';

select nome from alunos where sexo = 'M' and nacionalidade = 'Brasil' and nome like '%Silva%' and peso <80  order by nome;

select max(altura) from alunos where sexo = 'M' and nacionalidade = 'Portugal';

select avg(peso) from alunos;

select * from alunos where sexo = 'M' and nacionalidade not like 'Brasil' and nascimento between '1990-01-01' and '2000-12-31'  order by nome desc;

select min(peso) from alunos where sexo = 'F' and nacionalidade not like 'Brasil'and nascimento between '1990-01-01' and '2000-12-31';

select count(altura) from alunos where sexo = 'F' and altura >1.90;

select carga from cursos group by carga;

select carga, count(nome) from cursos group by carga;

select distinct totaulas from cursos order by totaulas;

select totaulas, count(*) from cursos group by totaulas order by totaulas;

select carga, totaulas from cursos where totaulas = 30 group by carga;

select carga, count(nome) from cursos where totaulas = 30 group by carga;

select ano, count(nome) from cursos group by ano;

select ano, count(nome) from cursos group by ano order by count(*);

select ano, count(nome) from cursos group by ano order by ano;

select ano, count(nome) from cursos group by ano order by count(*) desc;

select ano, count(nome) from cursos group by ano having count(ano) >= 5 order by count(*) desc;

select ano, count(nome) from cursos where totaulas > 30 group by ano having ano > 2013 order by count(*);

select * from cursos;

select carga, count(*) from cursos where ano > 2015 group by carga having carga > (select avg(carga) from cursos);

-- --------------------------------------------------------------------------------------------------------------

create database Livraria;
use Livraria;

create table Livros (
Id int auto_increment primary key,
Nome_Livro varchar (35),
Nome_Autor varchar (35),
Sexo_Autor enum ('M', 'F'),
Número_de_páginas smallint,
Nome_da_Editora varchar (35),
Valor_Livro decimal (7,2),
Estado_UF_da_Editora char (2),
Ano_Publicação year);

select * from livros;

insert into Livros (Nome_Livro, Nome_Autor, Sexo_Autor, Número_de_páginas, Nome_da_Editora, Valor_Livro, Estado_UF_da_Editora, Ano_Publicação) VALUES
('Cavaleiro Real', 'Ana Claudia', 'F', 465, 'Atlas', 49.9, 'RJ', 2009),
('SQL para leigos', 'João Nunes', 'M', 450, 'Addison', 98, 'SP', 2018),
('Receitas Caseiras', 'Celia Tavares', 'F', 210, 'Atlas', 45, 'RJ', 2008),
('Pessoas Efetivas', 'Eduardo Santos', 'M', 390, 'Beta', 78.99, 'RJ', 2018),
('Hábitos Saudáveis', 'Eduardo Santos', 'M', 630, 'Beta', 150.98, 'RJ', 2014),
('A Casa Marrom', 'Hermes Macedo', 'M', 250, 'Bubba', 60, 'MG', 2015),
('Estácio Querido', 'Geraldo Francisco', 'M', 310, 'Insignia', 100, 'ES', 2013),
('Pra sempre amigas', 'Leda Silva', 'F', 310, 'Insignia', 78.98, 'ES', 2018),
('Copas Inesquecíveis', 'Marco Alcantara', 'M', 200, 'Larson', 130.98, 'RS', 2015),
('O poder da mente', 'Clara Mafra', 'F', 120, 'Continental', 56.58, 'SP', 2017);

select * from livros;

select Nome_Livro, Nome_da_Editora from Livros;

select Nome_Livro, Estado_UF_da_Editora, Sexo_Autor from Livros where Sexo_Autor = 'M';

select Nome_Livro, Número_de_páginas, Sexo_Autor from Livros where Sexo_Autor = 'F';

select Valor_Livro, Estado_UF_da_Editora from Livros where Estado_UF_da_Editora = 'SP';

select * from Livros where Sexo_Autor = 'M' and (Estado_UF_da_Editora = 'SP' or Estado_UF_da_Editora = 'RJ');

-- -----------------------------------------------------------------------------------

USE Cadastro;

CREATE TABLE Vendas (

ID Smallint auto_increment Primary Key,

Nome_Vendedor Varchar(80),

Quantidade Int,

Produto Varchar(60),

Cidade Varchar(50),

UF Varchar (2)

);



INSERT INTO Vendas (ID, Nome_Vendedor, Quantidade, Produto, Cidade, UF)

VALUES

(default,'Luana',1800,'Celular','São Paulo', 'SP'),

(default,'Carla',2300,'Webcam','Recife', 'PE'),

(default,'Joao',1900,'Mouse','São Paulo', 'SP'),

(default,'Jorge',1700,'Webcam','Rio de Janeiro','RJ'),

(default,'Pedro',2120,'Celular','Recife', 'PE'),

(default,'andre',3980,'Mouse','São Paulo','SP'),

(default,'Fabiana',2120,'Webcam','Recife', 'PE'),

(default,'Rosana',1480,'Mouse','Rio de Janeiro','RJ'),

(default,'Roberto',4150,'Celular','Minas Gerais','MG'),

(default,'Rose',2100,'Celular','São Paulo','SP'),

(default,'Marcos',3200,'Mouse','Minas Gerais','MG'),

(default,'Davi',1500,'Webcam','Recife', 'PE'),

(default,'Marcelo',3010,'Mouse','Rio de Janeiro','RJ'),

(default,'Roberto',5620,'Celular','São Paulo','SP');

select * from vendas;

select sum(quantidade) as total_celular from vendas where produto = 'celular';

select cidade, sum(quantidade) as total from vendas group by cidade;

select cidade, sum(quantidade) as total from vendas group by cidade having cidade = 'Recife';

select cidade, sum(quantidade) as total from vendas group by cidade having cidade = 'São Paulo';

select * from alunos;

select profissao, count(profissao) as qtd_prof from alunos group by profissao;

select profissao, count(profissao) as qtd_prof from alunos group by profissao order by qtd_prof;

select sexo, count(*) as qtd from alunos where nascimento > '2005-01-01' group by sexo;

select nacionalidade, count(nome) from alunos where nacionalidade not like 'Brasil' group by nacionalidade having count(*) >3;

select avg(altura) from alunos;

select altura, count(*) from alunos where peso > 100 group by altura having altura > (select avg(altura) from alunos) order by altura;

-- ----------------------------------------------------------------------------------------------------

use cadastro;

desc alunos;

alter table alunos add column cursopreferido int;

desc alunos;

select * from alunos;

alter table alunos add foreign key (cursopreferido) references cursos (idcurso);

select * from alunos;

select * from cursos;

update alunos set cursopreferido = '6' where id = '1';

update alunos set cursopreferido = '22' where id = '2';

update alunos set cursopreferido = '12' where id = '3';

update alunos set cursopreferido = '7' where id = '4';

update alunos set cursopreferido = '1' where id = '5';

update alunos set cursopreferido = '8' where id = '6';

update alunos set cursopreferido = '4' where id = '7';

update alunos set cursopreferido = '5' where id = '8';

update alunos set cursopreferido = '3' where id = '9';

update alunos set cursopreferido = '30' where id = '10';

update alunos set cursopreferido = '22' where id = '11';

delete from cursos where idcurso = '9';

delete from cursos where idcurso = '28';

select * from cursos;

delete from cursos where idcurso = '6';

select nome, cursopreferido from alunos;

select alunos.nome, alunos.cursopreferido, cursos.nome, cursos.ano from alunos join cursos;
select alunos.nome, alunos.cursopreferido, cursos.nome, cursos.ano from alunos join cursos on cursos.idcurso = alunos.cursopreferido;

select a.nome, a.cursopreferido, c.nome, c.ano from alunos as a join cursos as c on c.idcurso = a.cursopreferido order by a.nome;

create table aluno_assiste_curso (
id int not null auto_increment,
data date,
idalunos int,
idcurso int,
primary key (id),
foreign key (idalunos) references alunos (id),
foreign key (idcurso) references cursos (idcurso)
);

insert into aluno_assiste_curso values
(default, '2014-03-01','1','2'),
(default, '2015-12-22','3','6'),
(default, '2014-01-01', '22', '12'),
(default, '2016-05-12', '1', '19');

select * from alunos;
select * from cursos;

select * from alunos join aluno_assiste_curso on alunos.id = aluno_assiste_curso.idalunos order by alunos.nome;

select alunos.nome, cursos.nome from alunos
join aluno_assiste_curso on alunos.id = aluno_assiste_curso.idalunos
join cursos on cursos.idcurso = aluno_assiste_curso.idcurso
order by alunos.nome;

select alunos.nome, cursos.nome from alunos
left join aluno_assiste_curso
on alunos.id = aluno_assiste_curso.idcurso
left join cursos
on cursos.idcurso = aluno_assiste_curso.idcurso;

select alunos.nome, cursos.nome from alunos
right join aluno_assiste_curso
on alunos.id = aluno_assiste_curso.idcurso
right join cursos
on cursos.idcurso = aluno_assiste_curso.idcurso;

create database joins;

use joins;

create table autor (
id_autor int primary key not null key auto_increment,
nome_autor varchar (30));

create table livro (
id_livro int primary key not null key auto_increment,
nome_livro varchar (30),
fk_a int,
foreign key (fk_a) references autor(id_autor));

insert into autor (id_autor, nome_autor) values
(default, 'Luana Farias'),
(default, 'Ronaldo'),
(default, 'Marcos'),
(default, 'Alessandra'),
(default, 'Fabiano');

insert into livro values
(default, 'CSS','5'),
(default, 'HTML','1'),
(default, 'C++','3'),
(default, 'Python', null),
(default, 'PHP','2');

select * from autor;

select * from livro;

select a.nome_autor, l.nome_livro from autor a join livro l on a.id_autor = l.fk_a;

select a.nome_autor, l.nome_livro from autor a left join livro l on a.id_autor = l.fk_a;

select a.nome_autor, l.nome_livro from autor a right join livro l on a.id_autor = l.fk_a;

select * from autor a right join livro l on a.id_autor = l.fk_a;

drop table autor;

drop table livro;

-- ---------------------------------------------------------------------------------------------------------------

create database comercio;
use comercio;

create table cliente (
idcliente int primary key auto_increment,
nome varchar(30) not null,
sexo enum ('M', 'F') not null,
email varchar(50) unique,
cpf varchar(15) unique);

insert into cliente values
(default,'Joao','M', 'joao@bol.com','76984352456'),
(default,'Carla','F', 'carla@bol.com','76984356699'),
(default,'Ana','F', 'ana@bol.com','76984357755'),
(default,'Clara','F', 'clara@bol.com','76984353344'),
(default,'Jorge','M', 'jorge@bol.com','76984352211'),
(default,'Celia','F', 'celia@bol.com','76984359988');

select * from cliente;

create table endereco (
idendereco int primary key auto_increment,
rua varchar(30) not null,
bairro varchar(30) not null,
cidade varchar(30) not null,
estado varchar(2) not null,
id_cliente int unique,
foreign key (id_cliente) references cliente(idcliente));

insert into endereco values
(default,'Rua Antonio SA','Centro','B. Horizonte','MG','4'),
(default,'Rua Capitao Hermes','Centro','Rio de Janeiro','RJ','1'),
(default,'Rua Pres Vargas','Jardins', 'Sao Paulo','SP','3'),
(default,'Rua Alfandega', 'Estacio', 'Rio de Janeiro', 'RJ','2'),
(default,'Rua do Ouvidor','Flamengo', 'Rio de Janeiro','RJ','6'),
(default,'Rua Uruguaiana','Centro','Vitoria','ES','5');

select * from endereco;

create table telefone (
idtelefone int primary key auto_increment,
tipo enum('Res','Com','Cel')not null,
numero varchar (10) not null,
id_cliente int,
foreign key (id_cliente) references cliente(idcliente));

insert into telefone values
(default,'cel','78458743','5'),
(default,'res','56576876','5'),
(default,'cel','87666898','1'),
(default,'com','54768899','2'),
(default,'res','78989765','1'),
(default,'cel','99766676','3'),
(default,'cel','78458743','3'),
(default,'com', '66687899','1'),
(default,'res','89986668','5'),
(default,'cel','88687909','2');

select * from telefone;

select cliente.nome, cliente.sexo, endereco.bairro, endereco.cidade  
from cliente  
join endereco on cliente.idcliente = endereco.id_cliente  
where cliente.sexo = 'F'
group by cliente.nome, cliente.sexo, endereco.bairro, endereco.cidade;

select cliente.nome, cliente.sexo, endereco.bairro, endereco.cidade, telefone.tipo, telefone.numero
from cliente
join endereco on cliente.idcliente = endereco.id_cliente
join telefone on cliente.idcliente = telefone.id_cliente
order by cliente.nome;

select cliente.nome, cliente.sexo, endereco.cidade, telefone.numero
from cliente
join endereco on cliente.idcliente = endereco.id_cliente
join telefone on cliente.idcliente = telefone.id_cliente
where cliente.sexo = 'M'
order by cliente.nome;

select cliente.idcliente, cliente.email, endereco.bairro, endereco.cidade, telefone.numero
from cliente
join endereco on cliente.idcliente = endereco.id_cliente
join telefone on cliente.idcliente = telefone.id_cliente
where endereco.cidade = 'Rio de Janeiro' and endereco.bairro = 'centro'
order by telefone.numero;

--                                                           AULA DIA 12-02-25
--                           VIEW
desc cliente;

desc endereco;

desc telefone;

create view v_relatorio as
select cliente.nome, cliente.sexo, cliente.email, telefone.tipo, telefone.numero, endereco.bairro, endereco.cidade, endereco.estado from cliente
join telefone
on cliente.id_cliente = telefone.id_cliente
join endereco
on cliente.id_cliente = endereco.id_cliente;

select * from v_relatorio;

-- PARA SABER QUAIS BANCOS DE DADOS TEMOS, UTILIZAMOS O COMANDO: SHOW DATABASE;

SHOW databases;

SELECT NOME, NUMERO, ESTADO FROM V_RELATORIO;

-- DELETAR O NOME JORGE, OBS. EM UMA VIEW NÃO É POSSÍVEL DELETAR DA VISUALIZAÇÃO DE ADESÃO 'COMERCIO.V_RELATORIO'.

DELETE FROM V_RELATORIO WHERE NOME = JORGE;

--  INSERIR OS DADOS NA VIEW V_RELATORIO,   OBS. NÃO É POSSÍVEL ADICIONAR VALORES EM UMA VIEW.

INSERT INTO V_RELATORIO VALUES ('CIDA', 'F', 'CIDA@BOL.COM', 'CEL', '77994457', 'CENTRO', 'VITORIA', 'ES');

--  FAÇA UMA ATUALIZAÇÃO: MUDE O NOME JORGE PARA JOSE.alter
-- A ATUALIZAÇÃO SOMENTE SERÁ POSSÍVEL SE A OPÇÃO SAFE UPDATES (REJECTS UPDATES AND DELETES WITH NO RESTRICTIONS) EM EDIT > PREFERENCES > SQL EDITOR, NAO ESTIVER TICADA.

UPDATE V_RELATORIO
SET NOME = 'JOSE'
WHERE NOME = 'JORGE';

-- É PERMITIDO FAZER UPDATE EM VIEWS COM JOIN, MAS DELETE E INSERT NÃO
-- FAZER UMA CONSULTA NA VIEW V_RELATORIO PARA MOSTRAR TODOS OS CAMPOS SOMENTE DAS MULHERES, ORDENAR POR NOME.

SELECT * FROM V_RELATORIO
WHERE SEXO = 'F'
ORDER BY 'NOME';

-- ADICIONE A TABELA CLIENTE, UMA COLUNA COM O NOME DATA_ULT_COMPRA TIPO DATE, AS DATAS QUE SERÃO ADICIONADAS SÃO: DO DIA 01/08/224 ATÉ 07/08/24, PARA OS ID_CLIENTE EM SEQUENCIA.

ALTER TABLE CLIENTE ADD COLUMN DATA_ULT_COMPRA DATE;

UPDATE CLIENTE SET DATA_ULT_COMPRA = '2024/08/01' WHERE ID_CLIENTE = '1';
UPDATE CLIENTE SET DATA_ULT_COMPRA = '2024/08/02' WHERE ID_CLIENTE = '2';
UPDATE CLIENTE SET DATA_ULT_COMPRA = '2024/08/03' WHERE ID_CLIENTE = '3';
UPDATE CLIENTE SET DATA_ULT_COMPRA = '2024/08/04' WHERE ID_CLIENTE = '4';
UPDATE CLIENTE SET DATA_ULT_COMPRA = '2024/08/05' WHERE ID_CLIENTE = '5';
UPDATE CLIENTE SET DATA_ULT_COMPRA = '2024/08/06' WHERE ID_CLIENTE = '6';

SELECT * FROM CLIENTE;

-- ADICIONE A TABELA CLIENTE, UMA COLUNA COM O NOME VALOR_COMPRA TIPO DECIMAL, OS VALORES QUE SERÃO ADICIONADAS SÃO: DE 1000 EM 1000 ATÉ 7000, PARA OS ID_CLIENTE EM SEQUENCIA.

ALTER TABLE CLIENTE ADD COLUMN VALOR_COMPRA DECIMAL;

UPDATE CLIENTE SET VALOR_COMPRA = '1000' WHERE ID_CLIENTE = '1';
UPDATE CLIENTE SET VALOR_COMPRA = '2000' WHERE ID_CLIENTE = '2';
UPDATE CLIENTE SET VALOR_COMPRA = '3000' WHERE ID_CLIENTE = '3';
UPDATE CLIENTE SET VALOR_COMPRA = '4000' WHERE ID_CLIENTE = '4';
UPDATE CLIENTE SET VALOR_COMPRA = '5000' WHERE ID_CLIENTE = '5';
UPDATE CLIENTE SET VALOR_COMPRA = '6000' WHERE ID_CLIENTE = '6';

SELECT * FROM CLIENTE;

DESC CLIENTE;

-- FAÇA UMA ALTERAÇÃONA VIEW V_RELATORIO PARA ACRESCENTAR OS NOVOS CAMPOS CRIADOS, DATA_ULT_COMPRA (inicio) E VALOR_COMPRA A DATA FINAL.

ALTER VIEW V_RELATORIO AS SELECT C.DATA_ULT_COMPRA, C.NOME, C.SEXO, C.EMAIL, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO, C.VALOR_COMPRA FROM CLIENTE C
join telefone t
on c.id_cliente = t.id_cliente_telefone
join endereco e
on c.id_cliente = e.id_cliente_endereco;

-- UTILIZANDOA TABELA DO BANCO DE DADOS COMERCIO, CRIE UMA VIEW COM O NOME V_COMPRAACIMA3000 QUE ARMAZENE TODAS AS COLUNAS DA TABELA CLIENTE
-- A VIEW DEVERÁ CONTER APENAS AS COMPRAS COM VALORES ACIMA DE 3.000,00.

CREATE VIEW V_COMPRAACIMA3000 AS
SELECT * FROM CLIENTE
WHERE VALOR_COMPRA > '3000';

SELECT * FROM V_COMPRAACIMA3000;

--  EXERCICIOS

-- Utilizando a tabela cliente do banco de dados comercio:
-- 1 - Crie uma View para mostrar o valor total das compras efetuadas pelos clientes.  

-- 2- Crie uma View para mostrar o menor valor de compras efetuadas pelos clientes.  

-- 3- Crie uma View para mostrar a média do valor de compras efetuadas pelos clientes.
 
-- 4- Crie uma View para mostrar o maior valor de compras efetuadas pelos clientes.  

-- 5- Crie uma View para mostrar o maior valor de compra efetuada pelo cliente e o nome do cliente.

SELECT * FROM CLIENTE;

-- EXERCICIO 1
CREATE VIEW VALOR_TOTAL AS
select sum(VALOR_COMPRA) as VALOR_TOTAL from CLIENTE;

SELECT * FROM VALOR_TOTAL;

-- EXERCICIO 2
CREATE VIEW VALOR_MENOR AS
select min(VALOR_COMPRA) as VALOR_MENOR from CLIENTE;

SELECT * FROM VALOR_MENOR;

-- EXERCICIO 3
CREATE VIEW VALOR_MEDIO AS
select AVG(VALOR_COMPRA) as VALOR_MEDIO from CLIENTE;

SELECT * FROM VALOR_MEDIO;

-- EXERCICIO 4
CREATE VIEW VALOR_MAIOR AS
select MAX(VALOR_COMPRA) as VALOR_MAIOR from CLIENTE;

SELECT * FROM VALOR_MAIOR;

-- EXERCICIO 5
CREATE VIEW VALOR_MAIOR_NOME AS
select NOME, VALOR_COMPRA from CLIENTE WHERE VALOR_COMPRA = (SELECT MAX(VALOR_COMPRA) FROM CLIENTE);

-- DROP VIEW VALOR_MAIOR_NOME;

SELECT * FROM VALOR_MAIOR_NOME;


delimiter $
create procedure nome_senai()
begin
select 'escola senai' as Nome_Escola;
end $
 delimiter ;
 
 call nome_senai();
 
-- drop procedure nome;

delimiter $$

create procedure soma(n1 int, n2 int)
begin
select n1 + n2 as soma;
end $$
delimiter ;

call soma(20,500);

-- -----------------------------------------------------------------------------------------------

CREATE DATABASE OFICINA;
USE OFICINA;

drop table cliente;

CREATE TABLE CLIENTE (
ID_CLIENTE INT PRIMARY KEY auto_increment,
ID_CARRO INT UNIQUE,
NOME VARCHAR(30) NOT NULL,
SEXO ENUM ("M", "F") NOT NULL);

ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_CARROS
FOREIGN KEY (ID_CARRO)
REFERENCES CARROS(ID_CARRO);

select * FROM CLIENTE;

CREATE TABLE TELEFONES_CLIENTES (
ID_TELEFONE INT primary KEY AUTO_INCREMENT ,
ID_CLIENTE INT,
TIPO ENUM("CEL", "RES", "COM") NOT NULL,
NUMERO VARCHAR(30));

ALTER TABLE TELEFONES_CLIENTES
ADD CONSTRAINT FK_TELEFONES_CLIENTES
FOREIGN KEY (ID_CLIENTE)
REFERENCES CLIENTE(ID_CLIENTE);

select * FROM TELEFONES_CLIENTES;

CREATE TABLE CARROS (
ID_CARRO INT UNIQUE primary KEY AUTO_INCREMENT ,
ID_MARCA INT,
MODELO VARCHAR(30),
PLACA VARCHAR(15));

ALTER TABLE CARROS
ADD CONSTRAINT FK_CARROS
FOREIGN KEY (ID_MARCA)
REFERENCES MARCA(ID_MARCA);

select * FROM CARROS;

CREATE TABLE MARCA (
ID_MARCA INT PRIMARY KEY AUTO_INCREMENT,
MARCA VARCHAR(30) UNIQUE);

select * FROM MARCA;

CREATE TABLE CARRO_COR (
ID_CARRO INT,
ID_COR INT);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO_COR
FOREIGN KEY (ID_CARRO) REFERENCES CARROS(ID_CARRO);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO_COR2
FOREIGN KEY (ID_COR) REFERENCES CORES(ID_COR);

SELECT * FROM CARRO_COR;

CREATE TABLE CORES (
ID_COR INT primary KEY auto_increment,
COR VARCHAR (40));

SELECT * FROM CORES;

-- ----------------------------------------------------------------------------------

create database exemplo;

use exemplo;

create table p_curso (
id_curso int primary key auto_increment,
nome_curso varchar (100),
preco_curso decimal (10,2));

insert into p_curso values
(null, 'Excel', '500.00'),
(null, 'VBA', '280.00'),
(null, 'Power BI', '150.00');

drop table p_curso;

select * from p_curso;

delimiter $
create procedure p_atualiza_preco (
novo_preco decimal (10,2),
id int)
begin
update p_curso
set preco_curso = novo_preco
where id_curso = id;
select 'Preço atualizado com sucesso!';
end $
delimiter ;

call p_atualiza_preco (600, 1);
call p_atualiza_preco (330, 2);

select * from p_curso;

delimiter $
create procedure p_cadastrar_cursos (
id int,
nome varchar (100),
preco decimal (10,2)
)
begin
insert into p_curso values
(null, nome, preco);
end $
delimiter ;

select * from p_curso;

call p_cadastrar_cursos
(null,'Banco de dados',1000);

call p_cadastrar_cursos
(null,'Python',2000);

select * from p_curso;

delimiter $

create procedure p_acrescimo_geral
(acrescimo decimal (10,2))
begin
update p_curso
set preco_curso = preco_curso * (1+acrescimo/100);
select 'Acrescimo atualizado com sucesso!' as situacao;
end $
delimiter ;

select * from p_curso;

call p_acrescimo_geral (10.00);

delimiter $
create procedure p_exclçuir_cursos(
id int)
begin
delete from p_curso
where id_curso = id;
end $
delimiter ;

call p_exclçuir_cursos (6);

call p_exclçuir_cursos (5);

select * from p_curso;

delimiter $
create procedure p_excluir_curso_por_nome (
nome varchar (100))
begin
delete from p_curso
where nome_curso = nome;
end $
delimiter ;

call p_excluir_curso_por_nome ('VBA');

select * from p_curso;




-- Exercicios procedure
CREATE DATABASE PROJETO;
USE PROJETO;
CREATE TABLE NEW_CURSOS(
IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(100) NOT NULL,
HORAS INT NOT NULL,
PRECO DECIMAL(10,2) NOT NULL
);
INSERT INTO NEW_CURSOS VALUES
(NULL, 'JAVA', 30, 500.00),
(NULL, 'BANCO DE DADOS', 30, 700.00);
SELECT * FROM NEW_CURSOS; 




-- 1

delimiter $
create procedure cadastro_cursos(
id int,
nome varchar (100),
horas int,
precos decimal (10,2)
)
begin
insert into new_cursos values
(null, nome, horas, precos);
end $
delimiter ;

select * from new_cursos;

call cadastro_cursos
(null, 'MySQL', '30', '100.00');

call cadastro_cursos
(null, 'Microsoft SQL Server', '35', '150.00');

call cadastro_cursos
(null, 'PostgreSQL', '40', '200.00');

call cadastro_cursos
(null, 'Oracle Database ', '50', '250.00');

select * from new_cursos;

-- 2
delimiter $
create procedure acrescimo
(id int, acrescimo decimal (10,2))
begin
update new_cursos
set preco = preco * (1+acrescimo/100)
where idcurso = id;
select 'Acrescimo atualizado com sucesso!' as situacao;
end $
delimiter ;

call acrescimo (1, 15);
call acrescimo (2, 18);
call acrescimo (3, 20);
call acrescimo (4, 22);
call acrescimo (5, 25);
call acrescimo (6, 28);

select * from new_cursos;

-- 3

delimiter $
create procedure atualiza_preco (
novo_preco decimal (10,2),
id int)
begin
update new_cursos
set preco = novo_preco
where idcurso = id;
select 'Preço atualizado com sucesso!';
end $
delimiter ;

call atualiza_preco (600, 1);
call atualiza_preco (800, 2);
call atualiza_preco (200, 3);
call atualiza_preco (250, 4);
call atualiza_preco (300, 5);
call atualiza_preco (350, 6);

select * from new_cursos;

-- 4

delimiter $
create procedure desconto
(id int, desconto decimal (10,2))
begin
update new_cursos
set preco = preco * (1-desconto/100)
where idcurso = id;
select 'Desconto realizado com sucesso!' as situacao;
end $
delimiter ;

call desconto (1,35);
call desconto (2,35);
call desconto (3,35);
call desconto (4,35);
call desconto (5,35);
call desconto (6,35);

select * from new_cursos;

-- 5

delimiter $
create procedure excluir_curso_por_id (
id int)
begin
delete from new_cursos
where idcurso = id;
end $
delimiter ;

call excluir_curso_por_id ('6');

select * from new_cursos;

-- 6

delimiter $
create procedure excluir_curso_por_nome (
nome_n varchar (100))
begin
delete from new_cursos
where nome_n = nome;
end $
delimiter ;

call excluir_curso_por_nome ('PostgreSQL');

select * from new_cursos;

drop database projeto;

-- ----------------------------------------------------------------------------------------

set@varQuantidade = 10;
set@varPreco = 10.9;
select (@varQuantidade * @varPreco) as 'Receita Total';
select round(@varQuantidade * @varPreco, 2) as 'Receita Total';

select
if (10>5, 'Verdadeiro','Falso') as situação;

select
if (10>12, 'Verdadeiro','Falso') as situação;

set @varNotaDesempenho = 8.5;
select
if (@varNotaDesempenho >= 7, 0.1, 'Sem bônus') as Bonus;

set @varNotaDesempenho = 5;
select
if (@varNotaDesempenho >= 7, 0.1, 'Sem bônus') as Bonus;

set @varNotaDesempenho = 9;
set @varNotaDesempenho = 6;
set @varNotaDesempenho = 2;

select
if (@varNotaDesempenho >= 7, 'recebe bônus de 10%',
if (@varNotaDesempenho >= 5, 'recebe bônus de 5%', 'Não recebe bonus' )) as resultado;



select * from lojas;

select
*,
if(Num_Funcionarios>= 20, 'Recebe reforma', 'Não recebe reforma')
as 'Status' from lojas;

select
ifnull(null, 'Valor alternativo') as Tipo;

select
ifnull(100, 'Valor alternativo') as Tipo;

select
*,
ifnull(Telefone, '0800-999-9999') as 'Telefone corrigido'
from lojas;

select * from clientes;

select
*,
isnull(Telefone) as 'Check'
from clientes;

select
*,
if(isnull(Telefone), 'Verificar', 'Ok') as 'Status'
from clientes;

set @var1 = 100;
set @var2 = 100;

select
nullif(@var1, @var2) as Tipo;

set @var1 = 50;
set @var2 = 500;

select
nullif(@var1, @var2) as Tipo;

-- Exercicio 1

set @varNota = 9;
select if (@varNota >= 6, 'Aprovado', 'Reprovado') as Resultado;

-- Exercicio 2

set @varNota = 3;
select
if (@varNota >= 6, 'Aprovado',
if (@varNota between 4 and 5, 'Recuperação', 'Reprovado')) as Resultado;

-- Exercicio 3

set @varPreco = 40000;

select
if (@varPreco >= 40000, 'Luxo',
if (@varPreco between 10000 and 39999, 'Econômico', 'Básico')) as Categoria;

-- when, then, case

-- exemplo 1
select
*,
case
when sexo= 'M' then 'Masculino'
else 'Feminino'
end as 'Sexo2'
from clientes;

-- exemplo 2
select
*,
case
when Receita_Venda >= 3000 then 'Faturamento Alto'
when Receita_Venda >= 1000 then 'Faturamento Médio'
else 'Faturamento Baixo'
end as 'Nivel de Faturamento'
from pedidos;

-- exemplo 3
select
*,
case
when sexo = 'F' and Qtd_Filhos >0 then 'Dia das Mães'
when sexo = 'M' and Qtd_Filhos >0 then 'Dia dos Pais'
else 'Sem ofertas'
end as 'Situação'
from clientes;

-- exemplo 4
select
*,
case
when marca_produto = 'Samsung' or marca_produto = 'Dell' then 'Receba 15% de desconto'
else 'Sem desconto'
end as 'Situação'
from produtos;

-- exemplo 5
select
*,
case
when marca_produto = 'Samsung' or marca_produto = 'Dell' then (1-0.15)* Custo_Unit
else Custo_Unit
end as 'Preco_com_Desconto?'
from produtos;

-- exemplo 6
select
*,
case
when marca_produto in ('Dell','Samsung') then (1-0.15)* Custo_Unit
else Custo_Unit
end as 'Preco_com_Desconto?'
from produtos;

-- Exercicios

-- 1

set @varVencimento = '2023-06-10';
set @varDataHoje = '2023-05-10';

select
case
when @varDataHoje > @varVencimento then 'Produto vencido'
else ('Na validade')
end as Situação;

-- 2
select
id_cliente, nome, estado_civil, renda_anual,
case
when renda_anual >= 80000 and estado_civil = 'C' then 0.07
when renda_anual >= 80000 then 0.05
when renda_anual >= 60000 then 0.1
when renda_anual >= 40000 then 0.15
when renda_anual < 40000 then 0.2
end as 'Bonus'
from clientes;

-- 3
select
*,
case
when renda_anual >= 80000 and estado_civil = 'C' then (1+0.07)
when renda_anual >= 80000 and estado_civil = 'S' then (1+0.05)
when renda_anual >= 60000 then (1+0.1)
when renda_anual >= 40000 then (1+0.15)
when renda_anual < 40000 then (1+0.2)
end as 'Preço com Bonus'
from clientes;

-- 4
select
*,
case
when renda_anual >= 80000 and estado_civil = 'C' then (1+0.07) * Renda_Anual
when renda_anual >= 80000 and estado_civil = 'S' then (1+0.05) * Renda_Anual
when renda_anual >= 60000 then (1+0.1) * Renda_Anual
when renda_anual >= 40000 then (1+0.15) * Renda_Anual
when renda_anual < 40000 then (1+0.2) * Renda_Anual
end as 'Preço com Bonus'
from clientes;

------------------------------------------------------------------------------------------

-- Funções
-- Exemplo 1
delimiter $
create function fn_BoasVindas (nome varchar(100))
returns varchar (100) deterministic
begin
return concat('Bem vindo', nome, ', tudo bem?');
end $
delimiter ;

select fn_BoasVindas (' Silvano') as 'Bom dia';

-- Exemplo 2
delimiter $
create function fn_Faturamento (preco decimal(10,2), quantidade int)
returns decimal (10,2) deterministic
begin
return preco * quantidade;
end $
delimiter ;

select fn_Faturamento (133,7) as 'Faturamento';

-- Exemplo 3
delimiter $
create function fn_Removeacentos (texto varchar(100))
returns varchar(100) deterministic
begin
set texto= replace (texto,'à', 'a'),
texto= replace (texto,'á', 'a'),
texto= replace (texto,'â', 'a'),
texto= replace (texto,'ã', 'a'),
texto= replace (texto,'ä', 'a'),
texto= replace (texto,'é', 'e'),
texto= replace (texto,'è', 'e'),
texto= replace (texto,'ê', 'e'),
texto= replace (texto,'ë', 'e'),
texto= replace (texto,'í', 'i'),
texto= replace (texto,'ì', 'i'),
texto= replace (texto,'î', 'i'),
texto= replace (texto,'ï', 'i'),
texto= replace (texto,'ò', 'o'),
texto= replace (texto,'ó', 'o'),
texto= replace (texto,'ö', 'o'),
texto= replace (texto,'ô', 'o'),
texto= replace (texto,'õ', 'o'),
texto= replace (texto,'ú', 'u'),
texto= replace (texto,'ù', 'u'),
texto= replace (texto,'û', 'u'),
texto= replace (texto,'ü', 'u'),
texto= replace (texto,'ç', 'c');
return texto;
end $
delimiter ;

select fn_Removeacentos ('à aliança da discípula alemã') as remove_acento;
select fn_Removeacentos ('Olá, você está bem, Müller?') as remove_acento;
select fn_Removeacentos ('João entrou no ônibus com carrinho de rolemã') as remove_acento;

-- Exemplo 4
delimiter $
create function data_hoje()
returns date deterministic
begin
return curdate();
end $
delimiter ;

select data_hoje();

-- Exemplo 5
delimiter $
create function data_mais_20_dias()
returns date deterministic
begin
return date_add(curdate(), interval 20 day);
end $
delimiter ;

select data_mais_20_dias();

-- Exemplo 6
delimiter $
create function data_mais_2_anos_5_meses_18_dias()
returns date deterministic
begin
return date_add(curdate(), interval 2 year) + interval 5 month + interval 18 day;
end $
delimiter ;

select data_mais_2_anos_5_meses_18_dias();

-- Exemplo 7
select * from funcionarios;

delimiter $
create function tempo_servico (data_inicio date)
returns int
deterministic
begin
declare data_atual date;
select current_date() into data_atual;
return year (data_atual) - year (data_inicio);
end $
delimiter ;

select id_funcionario, nome, sobrenome, tempo_servico (data_contratacao) as 'tempo de serviço'
from funcionarios;

-- Exercicio 1
delimiter $
create function fn_BoasVindas (nome varchar(100))
returns varchar (100) deterministic
begin
return concat('Seja bem-vindo', nome, ', ao curso de Banco de Dados');
end $
delimiter ;

select fn_BoasVindas (' Danilo') as 'Saudação';

-- 2
delimiter $
create function fn_total_vendas (preco decimal(10,2), quantidade int)
returns decimal (10,2) deterministic
begin
return preco * quantidade;
end $
delimiter ;

select fn_total_vendas (16000,1) as 'Total de vendas';

-- 3
delimiter $
create function fn_Removeacentos_loja (texto varchar(100))
returns varchar(100) deterministic
begin
set texto= replace (texto,'à', 'a'),
texto= replace (texto,'á', 'a'),
texto= replace (texto,'â', 'a'),
texto= replace (texto,'ã', 'a'),
texto= replace (texto,'ä', 'a'),
texto= replace (texto,'é', 'e'),
texto= replace (texto,'è', 'e'),
texto= replace (texto,'ê', 'e'),
texto= replace (texto,'ë', 'e'),
texto= replace (texto,'í', 'i'),
texto= replace (texto,'ì', 'i'),
texto= replace (texto,'î', 'i'),
texto= replace (texto,'ï', 'i'),
texto= replace (texto,'ò', 'o'),
texto= replace (texto,'ó', 'o'),
texto= replace (texto,'ö', 'o'),
texto= replace (texto,'ô', 'o'),
texto= replace (texto,'õ', 'o'),
texto= replace (texto,'ú', 'u'),
texto= replace (texto,'ù', 'u'),
texto= replace (texto,'û', 'u'),
texto= replace (texto,'ü', 'u'),
texto= replace (texto,'ç', 'c');
return texto;
end $
delimiter ;

select loja, endereco, fn_Removeacentos_loja(endereco) as 'Sem acento'
from lojas;

-- 4
delimiter $
create function data_mais_5_anos()
returns date deterministic
begin
return date_add(curdate(), interval 5 year);
end $
delimiter ;

select data_mais_5_anos();

-- 5
delimiter $
create function data_menos_2_anos_11_meses_29_dias()
returns date deterministic
begin
return date_sub(curdate(), interval 2 year) - interval 11 month - interval 29 day;
end $
delimiter ;

drop function data_menos_2_anos_11_meses_29_dias;

select data_menos_2_anos_11_meses_29_dias();

-- ------------------------------------------------------------------------------------------------

-- Commit e Rollback
create database tcl;
use tcl;

create table dados (
id int not null primary key auto_increment,
nome varchar (100),
endereco varchar (100),
cpf varchar (12),
sexo enum ('M','F')
);

insert into dados value
(null, 'Daniel', 'Rua Magalhães, 51', '12349528978', 'M'),
(null, 'Mariana', 'Rua Fortaleza, 30', '92882878978', 'F'),
(null, 'Mario', 'Rua da Feira, 457', '12301398978', 'M');

update dados
set nome = 'Naldo'
where id = '1';

select * from dados;

start transaction;

delete from dados where id = '3';

select * from dados;

rollback;

select * from dados;

start transaction;

delete from dados where id = '2';

commit;

rollback;

select * from dados;

--  ---------------------------------------------------------------

use diversas_tabelas;

select * from pedidos;

select * from lojas;

select * from pedidos
where ID_Loja = 3;

select id_loja from lojas where gerente= 'Pedro Martins';

set @varNomeGerente = 'Pedro Martins';

select * from pedidos where id_loja = (select id_loja from lojas where gerente= @varNomeGerente);

set @varNomeGerente = 'Carlos Henrique';

select * from pedidos where id_loja = (select id_loja from lojas where gerente= @varNomeGerente);

set @varNomeGerente = 'Amanda Lima';

select * from pedidos where id_loja = (select id_loja from lojas where gerente= @varNomeGerente);

select * from produtos;

select avg (preco_unit) from produtos;

select * from produtos where preco_unit > (select avg (preco_unit) from produtos);

select * from categorias;

select id_categoria from categorias where categoria = 'Notebook';

select * from produtos where ID_Categoria = 6;

select * from produtos where id_categoria = (select id_categoria from categorias where categoria = 'Notebook');

select * from pedidos;

select * from produtos where marca_produto = 'DELL';

select id_produto from produtos where marca_produto = 'DELL';

select * from pedidos where id_produto in (select id_produto from produtos where marca_produto = 'DELL');

select sum(receita_venda) as 'Receita marca Dell' from pedidos where ID_Produto in (select id_produto from produtos where marca_produto = 'Dell');

select concat('R$', replace(format(sum(receita_venda),2), ',' , '.')) as 'Receita marca Dell' from pedidos where id_produto in (select id_produto from produtos where marca_produto = 'Dell');

select concat('R$', format(sum(receita_venda),2, 'de_DE')) as 'Receita marca Dell' from pedidos where id_produto in (select id_produto from produtos where marca_produto = 'Dell');

-- -------------------------------//--------------------------//---------------------------

-- Exercicios

-- 1
select * from produtos;
select * from categorias;
set @varCategoriaProdutos = 'Microfone';

select * from produtos where id_categoria = (select id_categoria from categorias where categoria = @varCategoriaProdutos);

-- 2
select * from pedidos;
select id_produto, count(*) as 'Qtd_Vendas' from pedidos
group by id_produto
order by qtd_vendas;

select
max(qtd_vendas) as 'Qtd_Maxima',
min(qtd_vendas) as 'Qtd_Minima',
avg(qtd_vendas) as 'Qtd_Media'
from (
select id_produto, count(*) as 'Qtd_Vendas' from pedidos
group by id_produto
) as vendas_por_produto;

-- 3
select id_cliente, sum(receita_venda) from pedidos
group by id_cliente
order by sum(receita_venda) desc
limit 1;
select * from clientes where id_cliente = 72;

-- 4
select * from locais;
select * from lojas;
select * from pedidos;

select cidade from locais where região = 'sudeste';
select * from lojas where loja in (select cidade from locais where região = 'sudeste');
select id_loja from lojas where loja in (select cidade from locais where região = 'sudeste');
select * from pedidos where id_loja in (select id_loja from lojas where loja in (select cidade from locais where região = 'sudeste'));

-- -------------------------------------------------------------------------

-- Operadores exists e not exists
select * from categorias;
select * from produtos;

select id_categoria from categorias;
select id_categoria from produtos;

select id_categoria from categorias
where exists (select id_categoria from produtos
where categorias.id_categoria = produtos.id_categoria);

select id_categoria from categorias
where not exists (select id_categoria from produtos
where categorias.id_categoria = produtos.id_categoria);

select * from categorias where id_categoria = 7;

-- Exemplo de loop, while e repeat
delimiter $
create procedure acumula (limite int)
begin
declare contador int default 0;
declare soma int default 0;
loop_teste: loop
set contador = contador + 1;
set soma = soma + contador;
if contador >= limite then
leave loop_teste;
end if;
end loop loop_teste;
select soma;
end $
delimiter ;

call acumula (15);

-- -------------------------------------------------------------
-- Exemplo de loop
delimiter $
create procedure contadorL(limite int)
begin
declare x int default 0;
teste: loop
set x = x + 1;
select x;
if x = limite then
leave teste;
end if;
end loop teste;
end $
delimiter ;

call contadorL(2);

-- Exemplo de while
delimiter $
create procedure contadorW(limite int)
begin
declare x int default 0;
while x < limite do
select x;
set x = x + 1;
end while;
end $
delimiter ;

call contadorW (6);

-- Exemplo de repeat
delimiter $
create procedure contadorRR(limite int)
begin
declare x int default 0;
repeat
set x = x + 1;
select x;
until x = limite
end repeat;
end $
delimiter ;

call contadorRR (6);

-- -----------------------------------
-- Exercicios

-- 1
delimiter $
create procedure acumula_while (limite int)
begin
declare contador, limite int default 0;
declare soma int default 0;
while contador < limite do
set contador = contador + 1;
set soma = soma + contador;
end while;
select soma;
end $
delimiter ;

call acumula_while (5);

-- 2
DELIMITER $
CREATE PROCEDURE acumula_repeat (limite INT)
BEGIN
DECLARE contador INT DEFAULT 0;
DECLARE soma INT DEFAULT 0;
repeat
 SET contador = contador + 1;
 SET soma = soma + contador;
 until contador >= limite
 end repeat;
 select soma as resultado;
END $
DELIMITER ;
CALL acumula_repeat (6);

-- ---------------------------------------------
