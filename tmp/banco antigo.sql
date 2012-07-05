
/*
Primeiro seleciono (nome, valor) da lista de tipos antiga e jogo
na tabela "apartamentos_tipos" nova, criando novos ids

Pra cada tipo, criar uma entrada em "valores_momentos"
para o momento de 2 horas.
*/

-- TIPOS DE APARTAMENTO

select nome, valor from tipos_apto

-- APARTAMENTOS

select
   apartamentos.nome,
   tipos_apto.nome,
   tipos_apto.valor
from apartamentos
left join tipos_apto on apartamentos.cod_tipo_apto=tipos_apto.codigo
where tipos_apto.nome is not null
order by apartamentos.nome, tipos_apto.nome

-- FUNCIONARIOS
select nome, endereco, telefone, senha from funcionarios

-- PRODUTOS
select codigo, nome, quantidade, valor from produtos


-- MOVIMENTACAO GERAL
select
   mv.codigo as id,
   ap.nome as apartamento,
   -- tipo
   mv.data_ent+' '+mv.entrada as entrada,
   mv.data_sai+' '+mv.saida as saida,
   mv.veiculo as veiculo,
   -- aberto_por
   -- fechado_por
   -- total_momento
   mv.consumo as total_consumo,
   mv.desconto as desconto
   -- total_geral
from movimento_fluxo mv
left join apartamentos ap on mv.cod_apto=ap.codigo
order by mv.codigo


-- MOVIMENTACAO ATIVA


-- PRODUTOS DOS MOVIMENTOS
select
   mv.cod_fluxo as id_movimentacao,
   mv.cod_produto as id_produto,
   pr.nome as produto,
   mv.quantidade as quantidade,
   pr.valor as valor_unitario
from movimento_produtos mv
left join produtos pr on mv.cod_produto=pr.codigo
   


id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
id_movimentacao INTEGER NOT NULL,
id_produto INTEGER NOT NULL,
produto VARCHAR(50) NOT NULL,
quantidade INTEGER NOT NULL,
valor_unitario FLOAT NOT NULL
