/* =====================================================

Tabelas:

	#aptos
	#aptos_tipos
	#aptos_limpeza
	#movimentos
	#movimentos_produtos
	#produtos
	#produtos_tipos
	#funcionarios

*/

/* =====================================================

#aptos

numero       - Numero do Apto
tipo_apto_id - Codigo de identificacao do tipo na tabela #aptos_tipos
situacao     - Situacao atual do apto:
				   L = Livre
				   O = Ocupado
				   I = Inativo
				   R = Reservado
				   C = Em Limpeza

*/

CREATE TABLE aptos (
   numero INTEGER NOT NULL PRIMARY KEY,
   tipo_apto_id INTEGER NOT NULL,
   situacao CHAR(1)
);

/* =====================================================

#aptos_tipos

id            - Chave PRIMÁRIA de identificação do tipo de apto
nome          - Nome do tipo (Simples, Luxo, Suite)
Valor01       - Valor do momento de 2 horas
Valor02       - Valor do momento acima de 3 horas
Valor03       - Valor do momento acima de 4 horas
Valor04       - Valor cobrado da Diária

*/

CREATE TABLE aptos_tipos (
   id COUNTER NOT NULL PRIMARY KEY,
   nome VARCHAR(15),
   valor01 CURRENCY,
   valor02 CURRENCY,
   valor03 CURRENCY,
   valor04 CURRENCY
);

/* =====================================================

#movimentos (Contem toda a movimentação de entrada
             e saida dos quartos)

id
numero_apto    - Numero do Apto (literal)
funcionario_id - Id do funcionario no turno
tipo_apto      - Tipo do Apto (literal)
valor_cobrado  - Valor Recebido no momento
status         - Indica a situacao do apartamento no momento
					 True  = Em Aberto
					 False = Fechado
					 
dt_entrada     - Data de entrada
dt_saida       - Data de saida
hr_entrada     - Hora de entrada
hr_saida       - Hora de Saida
veiculo        - Veiculo (Registrado na entrada)
obs            - Observacoes

*/

CREATE TABLE movimentos (
   id COUNTER NOT NULL PRIMARY KEY,
   funcionario_id INTEGER,
   numero_apto INTEGER,
   tipo_apto VARCHAR(15),
   valor_cobrado CURRENCY,
   status LOGICAL,
   dt_entrada DATE,
   dt_saida DATE,
   hr_entrada TIME,
   hr_saida TIME,
   veiculo VARCHAR(20),
   obs VARCHAR(255)
);

/* =====================================================

#movimentos_produtos

   (Relacionada a tabela #movimentos
   Indica os produtos consumidos em determinada movimentação)

id
movimento_id  - Indica a qual movimento esse produto faz parte
nome_produto  - Nome do produto (Literal)
produto_id    - usado apenas no lancamento de produtos
quantidade    - Quantidade
valor         - Valor unitario do produto

*/

CREATE TABLE movimentos_produtos (
   id COUNTER NOT NULL PRIMARY KEY,
   movimento_id INTEGER,
   nome_produto VARCHAR(30),
   produto_id INTEGER,
   quantidade INTEGER,
   valor CURRENCY
);

/* =====================================================

#produtos

id         - Identificacao do Registro
nome       - Nome do produto
quantidade - Quantidade
estoq_min  - Estoque minimo
tipo_id    - Tipo do Produto (relacionado a tabela #produtos_tipos)
unidade    - Unidade ex: und, ltr, mtr
valor      - Valor unitario

*/

CREATE TABLE produtos (
   id COUNTER NOT NULL PRIMARY KEY,
   nome VARCHAR(30),
   quantidade INTEGER,
   estoq_min INTEGER,
   tipo_id INTEGER,
   unidade VARCHAR(8),
   valor CURRENCY
);

/* =====================================================

#produtos_tipos

id
nome

*/

CREATE TABLE produtos_tipos (
   id COUNTER NOT NULL PRIMARY KEY,
   nome VARCHAR(20)
);

/* =====================================================

#funcionarios

id            - Campo de identificacao do Registro
nome          - Nome do Funcionario
cargo         - Cargo do Funcionario
					Ex: Camareira, Cozinheira, Zelador, Guarda
					
endereco      - Endereco
telefone      - Telefone
celular       - Celular
login         - Login para acesso ao programa
senha         - Senha de acesso

*/

CREATE TABLE funcionarios (
   id COUNTER NOT NULL PRIMARY KEY,
   nome VARCHAR(50),
   cargo VARCHAR(15),
   endereco VARCHAR(80),
   telefone VARCHAR(10),
   celular VARCHAR(10),
   login VARCHAR(8),
   senha VARCHAR(8)
);

/* =====================================================

#aptos_limpeza

id             - id da limpeza
funcionario_id - Id da funcionaria que limpou
nome_funcion   - Nome do funcionario que limpou o quarto
numero_apto    - Numero do apartamento que foi limpo
data_limpeza   - Data em que a limpeza foi efetuada
hora_limpeza   - Hora em que a limpeza foi efetuada
obs            - Observacoes

*/

CREATE TABLE aptos_limpeza (
   id COUNTER NOT NULL PRIMARY KEY,
   funcionario_id INTEGER,
   nome_funcion VARCHAR(15),
   numero_apto INTEGER,
   data_limpeza DATE,
   hora_limpeza TIME,
   obs VARCHAR(255)
);
