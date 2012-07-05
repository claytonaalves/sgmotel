# -*- coding: latin1 -*-

import mdb
import re
#~ import sqlite3

db = mdb.AccessDb('db.mdb','admin')

#~ conn = sqlite3.connect('dados.s3db')
#~ qry = conn.cursor()

#~ qry.execute("""insert into stocks
          #~ values ('2006-01-05','BUY','RHAT',100,35.14)""")

#~ conn.commit()

# We can also close the cursor if we are done with it
#~ qry.close()

# -----------------------------------------------------------------------
# PRODUTOS

rs = db.getRecordset('select * from produtos order by codigo', dict=False)

fields = rs.getFieldNames()

for (iden, nome, qtde, valor) in rs:
    #~ iden = r[0]
    #~ nome = r[1]
    #~ qtde = r[2]
    #~ valor = r[3]

    nome = re.sub('\s+',' ', nome)
    nome = nome.upper()
    
    print nome

# -----------------------------------------------------------------------
# PRODUTOS

#~ s = u'Energ\xe9tico'
#~ print s
#~ s.decode('latin1')
#~ print s.decode('latin1')
#~ print s.decode('latin1').upper()


