create table CLIENTES(
    cliente     number(6)       not null,
    nome        varchar(100)    not null,
    endereco    varchar(100)    not null,
    fone        varchar(20)     not null,
    cidade      varchar(50)     not null,
constraint pk_cliente primary key(cliente));


create table LOCACOES(
    locacao         number(6)    not null,
    dt_locacao      date         not null,
    cliente         number(6)    not null,
    dt_devolucao    date         not null,
constraint pk_locacao primary key(locacao));


create table GENEROS(
    genero      number(3)       not null,
    descricao   varchar(50)     not null,
constraint pk_genero primary key(genero));


create table ITENS_LOCACAO(
    locacao     number(6)       not null,
    filme       number(6)       not null,
    desconto    number(8,2)     null,
constraint pk_locacao_filme primary key(locacao, filme));


create table filmes(
    filme           number(6)       not null,
    nome            varchar(100)    not null,
    genero          number(3)       not null,
    preco           number(8,2)     not null,
    dt_compra       date            not null,
    hrs_devolucao   number(2)       not null,
constraint pk_filme primary key(filme));


create table precos(
    preco       number(4)       not null,
    categoria   number(3)       not null,
    valor       number(8,2)     not null,
constraint pk_preco primary key(preco));


create table filme_ator(
    filme       number(6)       not null,
    ator        number(6)       not null,
constraint pk_filme_ator primary key(filme, ator));


create table categorias(
    categoria   number(3)   not null,
    descricao   varchar(20) not null,
constraint pk_categoria primary key(categoria));


create table atores(
    ator    number(6)        not null,
    nome    varchar2(100)    not null,
constraint pk_ator primary key(ator));

--CHAVES ESTRANGEIRAS
--LOCACOES
alter table locacoes
add constraint fk_cliente_locacoes
foreign key (cliente) references CLIENTES(cliente);

--ITENS_LOCACAO
alter table ITENS_LOCACAO
ADD CONSTRAINT fk_locacao_itensloc
foreign key(locacao) REFERENCES LOCACOES(locacao);

alter table ITENS_LOCACAO
ADD CONSTRAINT fk_filme_itensloc
FOREIGN KEY(filme) REFERENCES FILMES(filme);

--FILMES
alter table FILMES
ADD CONSTRAINT fk_genero_filme
FOREIGN KEY(genero) REFERENCES GENEROS(genero);

alter table FILMES
ADD CONSTRAINT fk_preco_filme
FOREIGN KEY(preco) REFERENCES PRECOS(preco);

--PRECOS
ALTER TABLE PRECOS
ADD CONSTRAINT fk_categoria_precos
FOREIGN KEY(categoria) REFERENCES CATEGORIAS(categoria);

--FILMES_ATOR
ALTER TABLE FILME_ATOR
ADD CONSTRAINT fk_filme_fAtor
FOREIGN KEY (filme) REFERENCES FILMES(filme);

ALTER TABLE FILME_ATOR
ADD CONSTRAINT fk_ator_fAtor
FOREIGN KEY(ator) REFERENCES ATORES(ator);

-- NOMES DIFERENTES DAS TABELAS DAS ATIVIDADES
-- AO INVÉS DE >>>FILMES_ATOR<<< coloquei >>>FILME_ATOR<<<