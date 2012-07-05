DROP TABLE apartamentos;
DROP TABLE apartamentos_tipos;
DROP TABLE valores_momentos;
DROP TABLE funcionarios;
DROP TABLE produtos;
DROP TABLE movimentacao;
DROP TABLE movimentacao_consumo;

DROP VIEW resumo_tipos;
DROP VIEW movimentacao_aberta;
DROP VIEW tipos_valores;

-- =================================================================================

CREATE TABLE funcionarios (
   id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   nome VARCHAR(50) NOT NULL,
   endereco VARCHAR(80) NULL,
   telefone VARCHAR(10) NULL,
   senha VARCHAR(10) DEFAULT '1234' NULL
);

CREATE TABLE apartamentos (
   nome VARCHAR(3) PRIMARY KEY NOT NULL,
   tipo_apto_id INTEGER NOT NULL
);

CREATE TABLE tipos_apartamentos (
   id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
   nome VARCHAR(20) NOT NULL
);

CREATE TABLE tipos_momentos (
   id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   tipo_id INTEGER DEFAULT '0' NOT NULL,
   descricao VARCHAR(50) DEFAULT 'MOMENTO 2 HORAS' NOT NULL,
   tempo INTEGER DEFAULT '2' NULL,
   tolerancia INTEGER DEFAULT '5' NULL,
   valor FLOAT DEFAULT '0.0' NULL
);

CREATE TABLE produtos (
   id INTEGER PRIMARY KEY NOT NULL,
   nome VARCHAR(50) NOT NULL,
   quantidade INTEGER DEFAULT '0' NULL,
   estoque_minimo INTEGER DEFAULT '0' NOT NULL,
   valor FLOAT DEFAULT '0.0' NULL
);

CREATE TABLE movimentacao (
   id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
   ativo BOOLEAN DEFAULT '1' NOT NULL,
   apartamento_id VARCHAR(3) DEFAULT '00' NOT NULL,
   -- tipo_id VARCHAR(20) DEFAULT '---' NOT NULL,
   entrada TIMESTAMP NOT NULL,
   saida TIMESTAMP NULL,
   veiculo VARCHAR(30) NULL,
   aberto_por VARCHAR(50) NOT NULL,
   fechado_por VARCHAR(50) NULL,
   momento_id VARCHAR(50) NULL,
   momento_qtde
   -- total_momento FLOAT DEFAULT 0.0 NULL,
   total_consumo FLOAT DEFAULT 0.0 NULL,
   desconto FLOAT DEFAULT 0.0 NULL,
   total_geral FLOAT DEFAULT 0.0 NULL
);

CREATE TABLE movimentacao_consumo (
   id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   movimentacao_id INTEGER NOT NULL,
   produto_id INTEGER NOT NULL,
   -- produto VARCHAR(50) NOT NULL,
   quantidade INTEGER NOT NULL,
   -- valor_unitario FLOAT NOT NULL
);

-- =================================================================================

/* 
Se um tipo de apartamento for excluido:
  - Excluir todos os apartamentos que estejam associados a este tipo
  - Excluir todos os valores de momentos associados ao tipo
*/
CREATE TRIGGER deleta_apartamentos 
AFTER DELETE ON apartamentos_tipos
FOR EACH ROW BEGIN
   DELETE FROM apartamentos WHERE id_tipo_apto=OLD.id;
   DELETE FROM valores_momentos WHERE id_tipo=OLD.id;
END;

/*
Atualiza estoque
Ao lancar uma entrada no estoque, a tabela "produtos" deve
ser atualizada;
*/
CREATE TRIGGER remove_estoque
BEFORE INSERT ON movimentacao_consumo
FOR EACH ROW BEGIN
   UPDATE produtos SET quantidade=quantidade-NEW.quantidade WHERE id=NEW.id_produto;
END;

CREATE TRIGGER repoe_estoque
AFTER DELETE ON movimentacao_consumo
FOR EACH ROW BEGIN
   UPDATE produtos SET quantidade=quantidade+OLD.quantidade WHERE id=OLD.id_produto;
END;

CREATE TRIGGER atualiza_estoque
BEFORE UPDATE ON movimentacao_consumo
FOR EACH ROW BEGIN
   UPDATE produtos SET quantidade=quantidade+(OLD.quantidade-NEW.quantidade) WHERE id=NEW.id_produto;
END;

CREATE TRIGGER [remove_item_zerado]
AFTER UPDATE ON [movimentacao_consumo]
WHEN NEW.quantidade=0
BEGIN
   DELETE FROM movimentacao_consumo WHERE id=NEW.id;
END;

CREATE TRIGGER [cancela_abertura]
AFTER DELETE ON [movimentacao]
FOR EACH ROW BEGIN
   DELETE FROM movimentacao_consumo WHERE id_movimentacao=OLD.id;
END;

-- =================================================================================

CREATE VIEW resumo_tipos AS
SELECT 
   tp.id as id,
   tp.nome as tipo, 
   min(vl.tempo) as tempo, 
   min(vl.valor) as valor
FROM apartamentos_tipos tp
LEFT JOIN valores_momentos vl on tp.id=vl.id_tipo
GROUP BY tp.nome;

CREATE VIEW movimentacao_aberta AS
SELECT
   id,
   apartamento,
   entrada,
   veiculo,
   total_momento,
   total_consumo,
   total_geral,
   aberto_por
FROM movimentacao
WHERE ativo=1;

CREATE VIEW tipos_valores AS
SELECT
  tp.nome,
  vl.id,
  vl.id_tipo,
  vl.descricao,
  vl.tempo,
  vl.tolerancia,
  vl.valor
FROM apartamentos_tipos tp
LEFT JOIN valores_momentos vl on vl.id_tipo=tp.id;

-- =================================================================================
-- =================================================================================
-- =================================================================================

INSERT INTO funcionarios (nome, endereco, telefone, senha) VALUES ('CLAYTON','','','1234');

-- Cria os tipos
INSERT INTO apartamentos_tipos VALUES (null, 'SIMPLES');
INSERT INTO apartamentos_tipos VALUES (null, 'LUXO');

-- Cria os valores dos momentos
INSERT INTO valores_momentos VALUES (NULL, 1, 'MOMENTO 2 HORAS', 2, 5, 20);
INSERT INTO valores_momentos VALUES (NULL, 1, 'MOMENTO 3 HORAS', 3, 5, 30.1);
INSERT INTO valores_momentos VALUES (NULL, 2, 'MOMENTO 2 HORAS', 2, 5, 30.2);
INSERT INTO valores_momentos VALUES (NULL, 2, 'MOMENTO 3 HORAS', 3, 5, 40);

-- Cria os apartamentos
INSERT INTO apartamentos VALUES ('01', 1);
INSERT INTO apartamentos VALUES ('02', 1);
INSERT INTO apartamentos VALUES ('03', 1);
INSERT INTO apartamentos VALUES ('04', 1);
INSERT INTO apartamentos VALUES ('05', 1);
INSERT INTO apartamentos VALUES ('06', 2);
INSERT INTO apartamentos VALUES ('07', 2);
INSERT INTO apartamentos VALUES ('08', 2);
INSERT INTO apartamentos VALUES ('09', 2);
INSERT INTO apartamentos VALUES ('10', 2);
INSERT INTO apartamentos VALUES ('11', 1);
INSERT INTO apartamentos VALUES ('12', 1);
INSERT INTO apartamentos VALUES ('13', 1);
INSERT INTO apartamentos VALUES ('14', 1);
INSERT INTO apartamentos VALUES ('15', 1);

--INSERT INTO movimentacao (apartamento, tipo, entrada, veiculo, aberto_por) 
--VALUES ('03', 'SIMPLES', datetime('now'), 'MOTO', 'ADM');

--INSERT INTO movimentacao (ativo,apartamento,tipo,entrada,saida,veiculo,aberto_por,fechado_por,total_momento) 
--VALUES (0, '04', 'SIMPLES', datetime('now'), datetime('now'), 'MOTO', 'ADM', 'CLAYTON', 43.50);

--DELETE FROM movimentacao_consumo;
-- INSERT INTO movimentacao_consumo VALUES (NULL, 1, 'CAMISINHA', 1, 1.5);
-- INSERT INTO movimentacao_consumo VALUES (NULL, 1, 'CAMISINHA', 1, 1.5);
-- INSERT INTO movimentacao_consumo VALUES (NULL, 1, 'CAMISINHA', 3, 1.5);
-- INSERT INTO movimentacao_consumo VALUES (NULL, 1, 'CAMISINHA', 1, 1.5);
-- INSERT INTO movimentacao_consumo VALUES (NULL, 1, 'CAMISINHA', 1, 1.5);
-- INSERT INTO movimentacao_consumo VALUES (NULL, 1, 'CAMISINHA', 5, 1.5);
-- INSERT INTO movimentacao_consumo VALUES (NULL, 1, 'CAMISINHA', 1, 1.5);
-- INSERT INTO movimentacao_consumo VALUES (NULL, 1, 'CAMISINHA', 1, 1.5);
-- INSERT INTO movimentacao_consumo VALUES (NULL, 1, 'CAMISINHA', 1, 1.5);
-- INSERT INTO movimentacao_consumo VALUES (NULL, 1, 'CAMISINHA', 1, 1.5);

INSERT INTO produtos (nome, quantidade, estoque_minimo, valor) VALUES ('ENERGÉTICO',10,5,2);
INSERT INTO produtos (nome, quantidade, estoque_minimo, valor) VALUES ('GATORADE',20,5,7);
INSERT INTO produtos (nome, quantidade, estoque_minimo, valor) VALUES ('CHOCOLATE',100,10,2);
INSERT INTO produtos (nome, quantidade, estoque_minimo, valor) VALUES ('CIGARRO',100,10,6);
INSERT INTO produtos (nome, quantidade, estoque_minimo, valor) VALUES ('CALCINHA',20,5,15);
INSERT INTO produtos (nome, quantidade, estoque_minimo, valor) VALUES ('CERVEJA',300,100,3);
INSERT INTO produtos (nome, quantidade, estoque_minimo, valor) VALUES ('RUFFLES',33,10,4);


-- delete from apartamentos;
-- delete from apartamentos_tipos;
-- delete from valores_momentos;


-- =================================================================================
   
-- Movimentacao
SELECT
   ap.nome as apartamento,
   tp.tipo as tipo,
   tp.valor as valor2horas,
   IFNULL(mv.id, 0) AS ativo,
   mv.entrada,
   mv.veiculo,
   mv.aberto_por,
   mv.total_consumo,
   mv.total_geral
FROM apartamentos ap
LEFT JOIN movimentacao_aberta mv on ap.nome=mv.apartamento
LEFT JOIN resumo_tipos tp on ap.id_tipo_apto=tp.id
ORDER BY ap.nome


-- Consumo
SELECT
   produto,
   quantidade,
   valor_unitario,
   (quantidade*valor_unitario) AS total
FROM movimentacao_consumo;

-- CADASTRO DE apartamentos_tipos
SELECT ap.nome as apartamento, tp.nome as tipo
FROM apartamentos ap
LEFT JOIN apartamentos_tipos tp on ap.id_tipo_apto=tp.id


-- =================================================================================
-- FECHAMENTO
-- =================================================================================
SELECT * FROM movimentacao WHERE id=:id

SELECT * FROM movimentacao_consumo WHERE id_movimentacao=:id

SELECT
  t1.nome as tipo,
  t2.descricao as descricao,
  (t2.tempo*60)+t2.tolerancia as tempo,
  t2.valor as valor
FROM apartamentos_tipos t1
LEFT JOIN valores_momentos t2 ON t2.id_tipo=t1.id
WHERE t1.nome=:nome_tipo
ORDER BY tempo

SELECT SUM(quantidade*valor_unitario) AS total FROM movimentacao_consumo WHERE id_movimentacao=14
