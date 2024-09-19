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

--INSERINDO ALGUMAS INFORMAÇÕES

--GENEROS
INSERT INTO GENEROS (genero, descricao) VALUES (1, 'ação');
INSERT INTO GENEROS (genero, descricao) VALUES (2, 'comédia');
INSERT INTO GENEROS (genero, descricao) VALUES (3, 'drama');
INSERT INTO GENEROS (genero, descricao) VALUES (4, 'terror');
INSERT INTO GENEROS (genero, descricao) VALUES (5, 'ficção científica');

-- CATEGORIAS
INSERT INTO CATEGORIAS (categoria, descricao) VALUES (1, 'Normal');
INSERT INTO CATEGORIAS (categoria, descricao) VALUES (2, 'VIP');
INSERT INTO CATEGORIAS (categoria, descricao) VALUES (3, 'Premium');

--PRECOS
INSERT INTO PRECOS (preco, categoria, valor) VALUES (1, 1, 15.00);  -- Normal
INSERT INTO PRECOS (preco, categoria, valor) VALUES (2, 2, 25.00);  -- VIP
INSERT INTO PRECOS (preco, categoria, valor) VALUES (3, 3, 35.00);  -- Premium

--FILMES
INSERT INTO FILMES (filme, nome, genero, preco, dt_compra, hrs_devolucao) 
VALUES (101, 'Missão Impossível', 1, 1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 48);

INSERT INTO FILMES (filme, nome, genero, preco, dt_compra, hrs_devolucao) 
VALUES (102, 'Os Vingadores', 1, 2, TO_DATE('2023-02-10', 'YYYY-MM-DD'), 72);

INSERT INTO FILMES (filme, nome, genero, preco, dt_compra, hrs_devolucao) 
VALUES (103, 'O Poderoso Chefão', 3, 1, TO_DATE('2023-03-15', 'YYYY-MM-DD'), 96);

--CLIENTES
INSERT INTO CLIENTES (cliente, nome, endereco, fone, cidade) 
VALUES (201, 'João Silva', 'Rua A, 123', '9999-9999', 'São Paulo');

INSERT INTO CLIENTES (cliente, nome, endereco, fone, cidade) 
VALUES (202, 'Maria Souza', 'Rua B, 456', '8888-8888', 'Rio de Janeiro');

--LOCACOES
INSERT INTO LOCACOES (locacao, dt_locacao, cliente, dt_devolucao) 
VALUES (301, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 201, TO_DATE('2023-05-03', 'YYYY-MM-DD'));

INSERT INTO LOCACOES (locacao, dt_locacao, cliente, dt_devolucao) 
VALUES (302, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 202, TO_DATE('2023-06-12', 'YYYY-MM-DD'));

--ITENS_LOCACOES
INSERT INTO ITENS_LOCACAO (locacao, filme, desconto) 
VALUES (301, 101, 0.00);  -- Locação de 'Missão Impossível' por João Silva

INSERT INTO ITENS_LOCACAO (locacao, filme, desconto) 
VALUES (301, 103, 5.00);  -- Locação de 'O Poderoso Chefão' com desconto

INSERT INTO ITENS_LOCACAO (locacao, filme, desconto) 
VALUES (302, 102, 0.00);  -- Locação de 'Os Vingadores' por Maria Souza

--ATORES
INSERT INTO ATORES (ator, nome) 
VALUES (401, 'Tom Cruise');

INSERT INTO ATORES (ator, nome) 
VALUES (402, 'Robert Downey Jr.');

INSERT INTO ATORES (ator, nome) 
VALUES (403, 'Marlon Brando');

--FILME ATOR
INSERT INTO FILME_ATOR (filme, ator) 
VALUES (101, 401);  -- Tom Cruise em 'Missão Impossível'

INSERT INTO FILME_ATOR (filme, ator) 
VALUES (102, 402);  -- Robert Downey Jr. em 'Os Vingadores'

INSERT INTO FILME_ATOR (filme, ator) 
VALUES (103, 403);  -- Marlon Brando em 'O Poderoso Chefão'



-- NOMES DIFERENTES DAS TABELAS DAS ATIVIDADES
-- AO INVÉS DE >>>FILMES_ATOR<<< coloquei >>>FILME_ATOR<<<
--ATIVIDADE 2 - 4
ALTER TABLE PRECOS
ADD CONSTRAINT ck_valor
CHECK (valor>= 2.5);

ALTER TABLE FILMES
ADD CONSTRAINT ck_data_compra
CHECK (dt_compra >= TO_DATE('10-01-2020', 'DD-MM-YYYY'));

ALTER TABLE LOCACOES
ADD CONSTRAINT ck_data_locacao
CHECK (dt_locacao >= TO_DATE('01-03-2020', 'DD-MM-YYYY'));
-- ATIVIDADE 05
ALTER TABLE PRECOS
DROP CONSTRAINT ck_valor;

ALTER TABLE FILMES
DROP CONSTRAINT ck_data_compra;

ALTER TABLE LOCACOES
DROP CONSTRAINT ck_data_locacao;
--ATIVIDADE 06
SELECT filme, nome
FROM FILMES
JOIN GENEROS ON GENEROS.genero = FILMES.genero
WHERE GENEROS.descricao = 'ação';

--ATIVIDADE 07
--INCLUIR DADOS

INSERT INTO GENEROS (genero, descricao) VALUES (6, 'Documentário');
INSERT INTO ATORES (ator, nome) VALUES (404, 'Pedro Silva');
INSERT INTO ATORES (ator, nome) VALUES (405, 'Mara Souza');
INSERT INTO FILMES (filme, nome, genero, preco, dt_compra, hrs_devolucao) 
VALUES (106, 'Título do Documentário', 6, 1, TO_DATE('2023-09-15', 'YYYY-MM-DD'), 72);
INSERT INTO FILME_ATOR (filme, ator) VALUES (106, 404);  -- Pedro Silva
INSERT INTO FILME_ATOR (filme, ator) VALUES (106, 405);  -- Mara Souza
--ATIVIDADE

SELECT F.filme, F.nome
FROM FILMES F
JOIN GENEROS G ON F.genero = G.genero
JOIN FILME_ATOR FA ON F.filme = FA.filme
JOIN ATORES A ON FA.ator = A.ator
WHERE G.descricao = 'Documentário'
  AND A.nome IN ('Pedro Silva', 'Mara Souza')
GROUP BY F.filme, F.nome
HAVING COUNT(DISTINCT A.nome) = 2;

