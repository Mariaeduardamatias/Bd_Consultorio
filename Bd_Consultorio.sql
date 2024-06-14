create database bd_Consultorio;
use bd_Consultorio;

 
create table tb_Paciente(
	id_Paciente int not null auto_increment, /* chave primária */
    Nome_Paciente varchar(100) not null, /* aceita letras, números e caracteres especiais */
    Data_Nascimento_Paciente date, /* segue o modelo americano ano/mes/dia */
    Genero_Paciente enum ('f','m','nao-binario','trans'),
    Cpf_Paciente varchar (14),/* campo aceita valores pré determinados */
    constraint pk_id_Paciente primary key (id_Paciente) /*aviso de primary key */
    );
describe tb_Paciente; /* exibe a estrutura da tabela */
 
insert into tb_Paciente 
(Nome_Paciente, Data_Nascimento_Paciente, Genero_Paciente, Cpf_Paciente) values 
('Roberto Carlos','1941-04-19','m','999.999.999-99'),
('MaTuê','1993-10-11','m','888.888.888-63'),
('Pedro Paulo Soares Pereira','1970-04-22','m','666.666.666-66'),
('Clarisse Linspector','1920-12-10','f','222.222.222-22'),
('Senior Abravanel','1930-12-12','m','777.777.777-77')
; /*Insere dados nos campos da tabela */
 
select * from tb_Paciente;
 
create  table tb_Medico(
	id_Medico int auto_increment not null,
	Nome_Medico varchar (100) not null,
	Data_Nascimento_Medico date not null,
	Crm_Medico varchar (13) not null,
	Genero_Medico enum ('m','f','nao-binario','trans'),
	Cpf_Medico varchar (14) not null, 
	Especialidade_Medico varchar (30) not null,
	Turno_Medico enum ('manha','tarde','noite','madrugada') not null,
	Contato_Medico varchar (15) not null,
    constraint pk_id_Medico primary key (id_Medico)
);
insert into tb_Medico 
(Nome_Medico, Data_Nascimento_Medico, Crm_Medico, Genero_Medico, Cpf_Medico, Especialidade_Medico, Turno_Medico, Contato_Medico) values 
('Alicia Rodrigues','1941-04-20','CRM/SP 555555','f', '999.999.999-99', 'Ginecologista','manha','1199999-9999'),
('Francisco Dantas ', '1975-11-21','CRM/SP 777777','m', '222.222.222-22', 'Fisioterapeuta','manha','1199999-9999'),
('Robyn Rihanna Fenty ','1941-04-20','CRM/SP 555555','f', '999.999.999-99', 'Ginecologista','manha','1199999-9999'),
('Shaffer Chimere Smith', '1941-04-20','CRM/SP 555555','f', '999.999.999-99', 'Ginecologista','manha','1199999-9999'),
('Beyonce', '1941-04-20','CRM/SP 555555','f','999.999.999-99','Ortopedista','manha','1199999-9999');
 
select * from Tb_Medico;
 
create table tb_Consulta(
	id_Consulta int not null auto_increment,
    Data_Consulta date not null,
    Hora_Consulta time not null,
    fk_id_Paciente int not null,
    fk_id_Medico int not null,
    constraint pk_id_Consulta primary key (id_Consulta),    
    constraint fk_id_Paciente foreign key (fk_id_Paciente)
    references tb_Paciente (id_Paciente),
    constraint fk_id_Medico foreign key (fk_id_Medico)
    references tb_Medico (id_Medico)
    );
    describe tb_Consulta;
	insert into tb_Consulta (Data_Consulta,Hora_Consulta,fk_id_Paciente,fk_id_Medico) values
    ('2024-05-01','08:30:10','1','1'),
	('2024-04-10','09:30:10','2','1'),
    ('2024-03-11','07:30:10','3','1'),
	('2024-02-15','10:30:10','4','1'),
	('2024-01-01','11:30:10','1','2');
    select * from tb_Consulta;
    Select * from tb_Consulta as c /* exibir tudo das tabelas */
    join tb_Paciente as p /* juntando (unindo) a tabela consulta com a tabela paciente*/
    on c.id_Consulta = p.id_Paciente; /* onde a ligação será pelo Id das duas tabelas */
  /* os apelidos são registrados através da clausula AS que tb podem ser chamdos de ALIAS */
	select c.Data_Consulta, p.Nome_Paciente from tb_Consulta as c
    join tb_Paciente as p
    on c.id_Consulta = p.id_Paciente;
    /* usando o INNER JOIN */
    Select * from tb_Consulta as c
    join tb_Paciente as p
    on c.id_Consulta = p.id_Paciente
    join tb_Medico as m
    on c.id_Consulta = m.id_Medico;

	Select c.Data_Consulta, p.Nome_Paciente, m.Nome_Medico from tb_Consulta as c
    join tb_Paciente as p
    on c.id_Consulta = p.id_Paciente
    join tb_Medico as m
    on c.id_Consulta = m.id_Medico
    order by m.Nome_Medico; /* order by coloca em ordem alfabética */
    select * from tb_Consulta;
    delete from tb_Consulta
    where fk_id_Medico = 1;

 
    /* usando o Join */
    select * from tb_Consulta as c
    join tb_Paciente as p
    on c.id_Consulta = p.id_Paciente;
    /* usando o Inner Join */
	select c.id_Consulta, p.Nome_Paciente, m.Nome_Medico from tb_Consulta as c
    join tb_Paciente as p
    on c.id_Consulta = p.id_Paciente
    join tb_Medico as m
    on c.id_Consulta = m.id_medico;
    /*order by p.Nome_Paciente;*/


    alter table tb_Paciente
    add column convenio varchar(50) ; /* alteração na estrutura da tabela */
    describe tb_Paciente;
  /* alter table tb_livro 
	add constraint fk_id_autor foreign key (fk_id_autor)
	references tb_autor(pk_id_autor); */
    select Nome_Paciente, Genero_Paciente from tb_Paciente;

	drop table tb_Consulta;
    /*INSERT INTO tb_Consulta
    (Data_Consulta, Hora_Consulta,fk_id_Paciente,fk_id_Medico) VALUES 
    ('2024-05-24','08:50:10', 1, 1)*/
  describe tb_Paciente;
	select * from tb_Paciente;
 
	update tb_Paciente
    set convenio = 'Porto Seguro'
    where id_Paciente = 1;