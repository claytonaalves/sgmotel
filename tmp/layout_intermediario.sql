CREATE TABLE apartamentos (
   codigo INTEGER,
   nome VARCHAR(3),
   cod_tipo_apto INTEGER
);

CREATE TABLE funcionarios (
   codigo INTEGER,
   nome VARCHAR(50),
   endereco VARCHAR(80),
   telefone VARCHAR(10),
   senha VARCHAR(10)
);

CREATE TABLE movimento (
   codigo INTEGER,
   situacao BOOLEAN,
   cod_apto INTEGER,
   -- data_ent VARCHAR(10),
   -- data_sai VARCHAR(10),
   -- entrada VARCHAR(5),
   -- saida VARCHAR(5),
   entrada TIMESTAMP,
   saida TIMESTAMP,
   consumo FLOAT,
   veiculo VARCHAR(20)
);

CREATE TABLE movimento_fluxo (
   codigo INTEGER,
   cod_apto INTEGER,
   -- data_ent VARCHAR(10),
   -- data_sai VARCHAR(10),
   -- entrada VARCHAR(5),
   -- saida VARCHAR(5),
   entrada TIMESTAMP,
   saida TIMESTAMP,
   consumo FLOAT,
   desconto FLOAT,
   veiculo VARCHAR(20)
);

CREATE TABLE movimento_produtos (
   cod_movimento INTEGER,
   cod_fluxo INTEGER,
   cod_produto INTEGER,
   -- num_produto
   quantidade INTEGER
);

CREATE TABLE produtos (
   codigo INTEGER,
   nome VARCHAR(50),
   quantidade INTEGER,
   valor FLOAT
);

CREATE TABLE tipos_apto (
   codigo INTEGER,
   nome VARCHAR(20),
   valor FLOAT
);