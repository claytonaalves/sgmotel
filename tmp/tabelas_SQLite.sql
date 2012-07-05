CREATE TABLE produtos_tipos (
   id INTEGER PRIMARY KEY,
   nome VARCHAR(20)
);

CREATE TABLE produtos (
   id INTEGER PRIMARY KEY,
   codigo VARCHAR(5),
   nome VARCHAR(30),
   quantidade INTEGER,
   estoq_min INTEGER,
   tipo_id INTEGER,
   unidade VARCHAR(8),
   valor DOUBLE
);

CREATE TABLE funcionarios (
   id INTEGER PRIMARY KEY,
   nome VARCHAR(50),
   cargo VARCHAR(15),
   endereco VARCHAR(80),
   telefone VARCHAR(10),
   celular VARCHAR(10),
   login VARCHAR(8),
   senha VARCHAR(8)
);

CREATE TRIGGER on_delete_produtos
AFTER DELETE ON produtos
FOR EACH ROW WHEN ((SELECT id FROM produtos WHERE tipo_id=old.tipo_id) IS NULL)
BEGIN
   DELETE FROM produtos_tipos WHERE id=old.tipo_id;
END;

CREATE TRIGGER on_update_produtos
AFTER UPDATE ON produtos
FOR EACH ROW WHEN ((SELECT id FROM produtos WHERE tipo_id=old.tipo_id) IS NULL)
BEGIN
   DELETE FROM produtos_tipos WHERE id=old.tipo_id;
END;