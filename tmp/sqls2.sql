BEGIN TRANSACTION;
   CREATE TABLE [produtos] (
      [id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      [nome] varchar(20)  NULL,
      [idtipo] integer  NULL
   );

   INSERT INTO "produtos" VALUES(1,'Refrigerante',1);
   INSERT INTO "produtos" VALUES(2,'Cerveja',1);
   INSERT INTO "produtos" VALUES(3,'Suco',1);
   INSERT INTO "produtos" VALUES(4,'Camisinha',4);
   INSERT INTO "produtos" VALUES(5,'Salgadinho',2);
   INSERT INTO "produtos" VALUES(6,'Doce',2);
   INSERT INTO "produtos" VALUES(7,'teste',3);
   
   CREATE TRIGGER [on_delete_produtos]
   AFTER DELETE ON [produtos]
   FOR EACH ROW WHEN ((SELECT ID FROM PRODUTOS WHERE IDTIPO=OLD.IDTIPO) IS NULL)
   BEGIN
      delete from prodtipos where id=OLD.idtipo;
   END;
   
   CREATE TRIGGER on_update_produtos
   after update on produtos
   for each row when ((select id from produtos where idtipo=OLD.idtipo) is null)
   begin
      delete from prodtipos where id=OLD.idtipo;
   end;
COMMIT;