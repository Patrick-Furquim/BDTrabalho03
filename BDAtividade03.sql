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

INSERT INTO LOCACOES (locacao, dt_locacao, cliente, dt_devolucao) 
VALUES (303, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 202, TO_DATE('2023-06-12', 'YYYY-MM-DD'));
--ITENS_LOCACOES
INSERT INTO ITENS_LOCACAO (locacao, filme, desconto) 
VALUES (301, 101, 0.00);  -- Locação de 'Missão Impossível' por João Silva

INSERT INTO ITENS_LOCACAO (locacao, filme, desconto) 
VALUES (301, 103, 5.00);  -- Locação de 'O Poderoso Chefão' com desconto

INSERT INTO ITENS_LOCACAO (locacao, filme, desconto) 
VALUES (305, 102, 0.00);  -- Locação de 'Os Vingadores' por Maria Souza

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
CHECK (dt_compra >= TO_DATE('10-01-2020', 'DD-MM-YY'));

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
SELECT F.filme, F.nome
FROM FILMES F
JOIN GENEROS ON GENEROS.genero = F.genero
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
--ATIVIDADE 07

SELECT F.filme, F.nome
FROM FILMES F
JOIN GENEROS G ON F.genero = G.genero
JOIN FILME_ATOR FA ON F.filme = FA.filme
JOIN ATORES A ON FA.ator = A.ator
WHERE G.descricao = 'Documentário'
  AND A.nome IN ('Pedro Silva', 'Mara Souza')
GROUP BY F.filme, F.nome
HAVING COUNT(DISTINCT A.nome) = 2;

--ATIVIDADE 08
SELECT C.cliente, C.nome, C.endereco, C.fone, C.cidade
FROM CLIENTES C
WHERE C.nome like 'ant%' AND C.cidade = 'maresias';

--ATIVIDADE 09
SELECT F.filme, F.nome
FROM FILMES F
JOIN GENEROS G ON G.genero = F.genero
where G.descricao = 'Policial' 
AND F.hrs_devolucao = 24;

--ATIVIDADE 10
SELECT F.filme, F.nome, P.preco, P.categoria
FROM FILMES F
JOIN PRECOS P  ON P.preco = F.preco
WHERE P.valor >3.50;

--ATIVIDADE 11
SELECT F.filme, F.nome, A.ator, A.nome
FROM FILMES F
JOIN FILME_ATOR FA ON FA.filme = F.filme
JOIN ATORES A ON A.ator = FA.ator
JOIN PRECOS P ON P.preco = F.preco
WHERE P.valor < 2.00;

--ATIVIDADE 12
SELECT C.cliente, C.nome
FROM CLIENTES C
JOIN LOCACOES L ON L.cliente = C.cliente
JOIN ITENS_LOCACAO IL ON IL.locacao = L.locacao
JOIN FILMES F ON F.filme = IL.filme
JOIN GENEROS G ON G.genero = F.genero
WHERE G.descricao = 'épico';

--ATIVIDADE 13
SELECT A.ator, A.nome
FROM ATORES A
JOIN FILME_ATOR FA ON FA.ator = A.ator
JOIN FILMES F ON F.filme = FA.filme
WHERE F.genero = 4;

--ATIVIDADE 14
SELECT F.filme, F.nome, G.descricao, F.dt_compra
FROM FILMES F
JOIN GENEROS G ON G.genero = F.genero
WHERE F.dt_compra BETWEEN TO_DATE('01-01-2021', 'DD-MM-YY') AND TO_DATE('31-12-2021', 'DD-MM-YY')
AND G.descricao = 'adulto';

--ATIVIDADE 15
SELECT L.locacao, L.dt_locacao
FROM LOCACOES L
JOIN CLIENTES C ON C.cliente = L.cliente
WHERE C.nome = 'ana terra'
AND L.dt_locacao BETWEEN TO_DATE('01-01-2020', 'DD-MM-YY') AND TO_DATE('31-12-2020', 'DD-MM-YY');

--ATIVIDADE 16
SELECT L.locacao, L.dt_locacao, F.filme, F.nome
FROM LOCACOES L
JOIN ITENS_LOCACAO IL ON IL.locacao = L.locacao
JOIN FILMES F ON F.filme = IL.filme
JOIN CLIENTES C ON C.cliente = L.cliente
WHERE C.nome = 'jorge tabajara'
    AND L.dt_locacao BETWEEN TO_DATE('01-01-2020', 'DD-MM-YY') AND TO_DATE('30-06-2020', 'DD-MM-YY')
ORDER BY L.dt_locacao;

--ATIVIDADE 17
SELECT C.nome, L.dt_locacao
FROM CLIENTES C
JOIN LOCACOES L ON L.cliente = C.cliente
WHERE L.dt_locacao BETWEEN TO_DATE('01-09-2020', 'DD-MM-YY')
    AND TO_DATE('30-09-2020', 'DD-MM-YY');

--ATIVIDADE 18
SELECT F.filme, F.nome, L.dt_locacao
FROM FILMES F
JOIN GENEROS G ON G.genero = F.genero
JOIN ITENS_LOCACAO IL ON IL.filme = F.filme
JOIN LOCACOES L ON L.locacao = IL.locacao
JOIN CLIENTES C ON C.cliente = L.cliente
WHERE C.nome = 'Antonio ferreira'
    AND L.dt_locacao BETWEEN TO_DATE('01-07-2020', 'DD-MM-YY') AND TO_DATE('31-07-2020', 'DD-MM-YY')
        AND G.descricao = 'drama';
    
--ATIVIDADE 19
SELECT G.genero, F.filme, F.nome
FROM FILMES F
JOIN GENEROS G ON G.genero = F.genero
ORDER BY G.genero;

--ATIVIDADE 20
SELECT F.nome, F.filme, A.nome
FROM FILMES F
JOIN FILME_ATOR FA ON FA.filme = F.filme
JOIN ATORES A ON A.ator = FA.ator
JOIN GENEROS G ON G.genero = F.genero
WHERE G.descricao = 'comédia';

--ATIVIDADE 21
--ADICIONANDO INFORMAÇÕES
INSERT INTO CLIENTES (cliente, nome, endereco, fone, cidade) 
VALUES (205, 'Pedro Augusto', 'Rua B, 123', '9799-9999', 'São Paulo');

INSERT INTO CLIENTES (cliente, nome, endereco, fone, cidade) 
VALUES (206, 'Marina Oliveira', 'Rua C, 123', '8999-9999', 'Uberaba');

INSERT INTO LOCACOES (locacao, dt_locacao, cliente, dt_devolucao) 
VALUES (305, TO_DATE('2023-06-11', 'YYYY-MM-DD'), 205, TO_DATE('2023-06-13', 'YYYY-MM-DD'));

SELECT DISTINCT C.cidade
FROM CLIENTES C
JOIN LOCACOES L ON L.cliente = C.cliente;

--ATIVIDADE 22
SELECT C.cidade, COUNT(C.cliente)
FROM CLIENTES C
GROUP BY C.cidade;

--ATIVIDADE 23

SELECT c.cliente, c.nome
FROM CLIENTES c
LEFT JOIN LOCACOES l ON l.cliente = c.cliente
WHERE l.locacao IS NULL;

--ATIVIDADE 24
SELECT C.cliente, C.nome
FROM CLIENTES C
JOIN LOCACOES L ON L.cliente = C.cliente
JOIN ITENS_LOCACAO IL ON IL.locacao = L.locacao
JOIN FILMES F ON F.filme = IL.filme
WHERE F.nome = 'a espera de um milagre';

--ATIVIDADE 25
SELECT F.filme, F.nome
FROM FILMES F
LEFT JOIN ITENS_LOCACAO IL ON IL.filme = F.filme
LEFT JOIN LOCACOES L ON L.locacao = IL.locacao
WHERE L.locacao IS NULL;

--ATIVIDADE 26
SELECT F.filme, F.nome
FROM FILMES F
LEFT JOIN ITENS_LOCACAO IL ON IL.filme = F.filme
LEFT JOIN LOCACOES L ON L.locacao = IL.locacao
WHERE L.locacao IS NULL
AND F.dt_compra BETWEEN TO_DATE('01-01-2020','DD-MM-YY') AND TO_DATE('31-12-2020', 'DD-MM-YY');

--ATIVIDADE 27
SELECT AVG(filmes_por_locacao) AS media_filmes
FROM (SELECT COUNT(IL.filme) as filmes_por_locacao
    FROM LOCACOES L
    JOIN ITENS_LOCACAO IL ON IL.locacao = L.locacao
    WHERE L.dt_locacao BETWEEN TO_DATE('01-01-2020','DD-MM-YY') AND TO_DATE('31-12-2020', 'DD-MM-YY')
    GROUP BY L.locacao);

--ATIVIDADE 28
SELECT COUNT(filmes_locados)
FROM (SELECT DISTINCT IL.filme as filmes_locados
    FROM ITENS_LOCACAO IL
    JOIN LOCACOES L ON L.locacao = IL.locacao
    WHERE EXTRACT(YEAR FROM L.dt_locacao) = 2020
    GROUP BY IL.filme);

--ATIVIDADE 29
SELECT C.cliente, COUNT(L.locacao)
FROM CLIENTES C
JOIN LOCACOES L ON L.cliente = C.cliente
GROUP BY C.cliente;

--ATIVIDADE 30
SELECT C.cliente, COUNT(IL.filme) as total_filmes
FROM CLIENTES C
JOIN LOCACOES L ON L.cliente = C.cliente
JOIN ITENS_LOCACAO IL ON IL.locacao = L.locacao
GROUP BY C.cliente
ORDER BY total_filmes DESC;

--ATIVIDADE 31
UPDATE PRECOS P
SET P.valor = P.valor *1.125
WHERE P.categoria = (
    SELECT C.categoria
    FROM CATEGORIAS C
    WHERE C.descricao = 'selo ouro'
    );
    
--ATIVIDADE 32
SELECT F.nome, F.filme, G.descricao, (F.preco * 1.20) as "Com Aumento de 20%"
FROM FILMES F
JOIN GENEROS G on G.genero = F.genero;