# -*- coding: latin1 -*-

"""
Converte o banco de dados de MDB para sqlite 
FORMAT INTERMEDIARIO
"""

import mdb
import re
import sqlite3

db = mdb.AccessDb('db.mdb','admin')

conn = sqlite3.connect('intermediario.s3db')
qry = conn.cursor()

# -----------------------------------------------------------------------
# APARTAMENTOS

rs = db.getRecordset('select * from apartamentos order by codigo', dict=False)

for r in rs:
    codigo = r[0]
    nome = r[1]
    tipo = r[2]
    
    print 'INSERT INTO apartamentos VALUES (%d, "%s", %d)' % (codigo, nome, tipo)
    qry.execute('INSERT INTO apartamentos VALUES (%d, "%s", %d)' % (codigo, nome, tipo))

conn.commit()


# -----------------------------------------------------------------------
#~ CREATE TABLE funcionarios (
   #~ codigo INTEGER,
   #~ nome VARCHAR(50),
   #~ endereco VARCHAR(80),
   #~ telefone VARCHAR(10),
   #~ senha VARCHAR(10)
#~ );

# -----------------------------------------------------------------------
#~ CREATE TABLE movimento (
   #~ codigo INTEGER,
   #~ situacao BOOLEAN,
   #~ cod_apto INTEGER,
   #~ data_ent VARCHAR(10),
   #~ data_sai VARCHAR(10),
   #~ entrada VARCHAR(5),
   #~ saida VARCHAR(5),
   #~ consumo FLOAT,
   #~ veiculo VARCHAR(20)
#~ );

# -----------------------------------------------------------------------
#~ CREATE TABLE movimento_fluxo (
   #~ codigo INTEGER,
   #~ cod_apto INTEGER,
   #~ data_ent VARCHAR(10),
   #~ data_sai VARCHAR(10),
   #~ entrada VARCHAR(5),
   #~ saida VARCHAR(5),
   #~ consumo FLOAT,
   #~ desconto FLOAT,
   #~ veiculo VARCHAR(20)
#~ );

# -----------------------------------------------------------------------
#~ CREATE TABLE movimento_produtos (
   #~ cod_movimento INTEGER,
   #~ cod_fluxo INTEGER,
   #~ cod_produto INTEGER,
   #~ -- num_produto
   #~ quantidade INTEGER
#~ );

# -----------------------------------------------------------------------
#~ CREATE TABLE produtos (
   #~ codigo INTEGER,
   #~ nome VARCHAR(50),
   #~ quantidade INTEGER,
   #~ valor FLOAT
#~ );

# -----------------------------------------------------------------------
#~ CREATE TABLE tipos_apto (
   #~ codigo INTEGER,
   #~ nome VARCHAR(20),
   #~ valor FLOAT
#~ );