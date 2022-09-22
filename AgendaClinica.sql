use AgendaClinica;
-- Usando DDL para criação da estrutura de dados
create table paciente (
	cod_pac int primary key identity(1,1),
	nom_pac varchar(50) not null,
	cpf_pac bigint,
	rua_pac varchar(60),
	cep_pac int,
	bai_pac varchar(40),
	cid_pac varchar(50)
)

-- Alterando a tabela 

alter table paciente 
	add dat_pac date

alter table paciente
	add alt_pac decimal(8,2)


alter table paciente
	drop column alt_pac

alter table paciente
	drop column cpf_pac

alter table paciente
	add cpf_pac bigint unique 

alter table paciente
	add cor_pac varchar(10) default 'branco'

alter table paciente
	add sal_pac decimal(8,2) check (sal_pac>0)

-- Inserindo os dados do paciente

insert into paciente
-- datas e caracteres devem estar em aspas simples
	values ('pedro frederico de carvalho',
			'dr alberto andalo 3232',
			15067232,
			'jardim mirassolandia',
			'bady bassit',
			getdate(),
			25067834529,
			default,
			5000)

-- Verificando os dados do paciente

select * from paciente


insert into paciente
-- datas e caracteres devem estar em aspas simples
	values ('Luís Eduardo Pollo Indalecio',
			'rua luiz dias 4430',
			15041232,
			'jardim anielli',
			'são josé do rio preto',
			getdate(),
			36078075829,
			default,
			700000)

insert into paciente
-- datas e caracteres devem estar em aspas simples
	values ('Leandra Diane Rodriguez',
			'rua luiz dias 4430',
			15041232,
			'jardim anielli',
			'são josé do rio preto',
			getdate(),
			67878072345,
			default,
			200)

insert into paciente
-- datas e caracteres devem estar em aspas simples
	values ('Gustavo Scarpa',
			'rua luiz dias 4430',
			15041232,
			'jardim anielli',
			'são josé do rio preto',
			getdate(),
			87636867536,
			default,
			999999)
			
insert into paciente
-- datas e caracteres devem estar em aspas simples
	values ('Gustavo Gómez',
			'apt. cu do macaco 34',
			15041232,
			'Eldorado',
			'são josé do rio preto',
			getdate(),
			12554763529,
			default,
			999999)
			
insert into paciente
-- datas e caracteres devem estar em aspas simples
	values ('Raphael Veiga',
			'rua luiz dias 4430',
			15041232,
			'jardim anielli',
			'são josé do rio preto',
			getdate(),
			67878089045,
			default,
			999999)

-- Verificando os dados do paciente
select * from paciente

-- criando a coluna SEXO e acertando os dados com o comando update

alter table paciente
	add sex_pac varchar(2)

	select * from paciente

update paciente	
	set sex_pac = 'M'
	where cod_pac in(1,2,4,5,6)

update paciente
	set sex_pac = 'F'
	where cod_pac in(3)

update paciente
	set cep_pac = 15067262
	where cod_pac in(5)

select * from paciente

delete from paciente
	where cod_pac = 9
-- Criando tabela nova
create table telefonepaciente (
	cod_pac int,
	num_tel bigint
)
-- Criando relacionamento entre as tabelas
alter table telefonepaciente 
	add constraint fk_tel_pac foreign key(cod_pac)
		references paciente(cod_pac)

select * from paciente
insert into telefonepaciente values (1, 17991154455)
insert into telefonepaciente values (2, 17991487334)
insert into telefonepaciente values (2, 17991241817)
insert into telefonepaciente values (2, 17988182737)
insert into telefonepaciente values (2, 17988345745)
insert into telefonepaciente values (3, 11275935435)
insert into telefonepaciente values (3, 11981241355)
insert into telefonepaciente values (4, 99981128412)
insert into telefonepaciente values (5, 82991234737)
insert into telefonepaciente values (5, 12982124124)
insert into telefonepaciente values (6, 11997123124)
insert into telefonepaciente values (6, 22981782632)
insert into telefonepaciente values (6, 17991263557)

select * from paciente
select * from telefonepaciente

-- Fazer JOIN para relacionar as tabelas
select p.nom_pac, t.num_tel
	from paciente p, telefonepaciente t
		where p.cod_pac = t.cod_pac

create table medico (
	cod_med int primary key,
	crm_med bigint,
	nom_med varchar(60) not null,
	rua_med varchar(60),
	cep_med int,
	bai_med varchar(60),
	cid_med varchar(50),
	alt_med decimal(8,2),
	pes_med decimal(8,2) check(pes_med>0)
)
-- Criando tabela especialidade medica
create table especialidademedico (
	cod_med int,
	nom_esp varchar(60)
)
-- Criando tabela telefone do medico
create table telefonemedico (
	cod_med int,
	tel_med bigint
)
-- relacionamento entre telefone e medico
alter table telefonemedico
	add constraint fk_tel_med foreign key(cod_med)
		references medico(cod_med)
-- relacionamento entre especialidade e medico
alter table especialidademedico
	add constraint fk_esp_med foreign key(cod_med)
		references medico(cod_med)

-- Apagando constraint e corrigindo erro na tabela medico
alter table telefonemedico
	drop constraint fk_tel_med

alter table especialidademedico
	drop constraint fk_esp_med

alter table medico
	drop PK__medico__F822D54412D63103

alter table medico
	drop column cod_med

-- adicionando novamente o cod_med após remoção
alter table medico
	add cod_med int primary key identity(1,1)

-- relacionamento entre telefone e medico
alter table telefonemedico
	add constraint fk_tel_med foreign key(cod_med)
		references medico(cod_med)
-- relacionamento entre especialidade e medico
alter table especialidademedico
	add constraint fk_esp_med foreign key(cod_med)
		references medico(cod_med)

-- inserindo valores na coluna medico
insert into medico values (
    1444,
    'Claudemar dos Santos',
    'Rua Vladimir Putin',
    15024545,
    'jardim ana lucia',
    'sao jose do rio preto',
    1.50,
    67.50
)

insert into medico values (
    97,
    'JosÃ© da silva junior',
    'Rua waldemiro lopez',
    15024243,
    'jardim feliz',
    'sao jose do rio preto',
    1.89,
    80.25
)

insert into medico values (
    12,
    'Joao Augusto',
    'Rua felipin batista',
    15964979,
    'bairro augusto vieira',
    'sao jose do rio preto',
    1.98,
    75.30
)

insert into medico values (
    192,
    'Nilto Costa',
    'Rua Rogerio Cozzi',
    15024545,
    'jardim Anielli',
    'sao jose do rio preto',
    1.76,
    68.30
)

insert into medico values (
    192,
    'Julia Silva Junior',
    'rua general peixoto',
    15024545,
    'Bairro santa lucia',
    'sao jose do rio preto',
    1.58,
    65.70
)

insert into medico values (
    192,
    'Helena Santos Vieira',
    'Rua Firmino souza',
    15024545,
    'jardim da paz',
    'sao jose do rio preto',
    1.65,
    72.10
)
