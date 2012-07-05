unit uProduto;

interface

uses
   Classes, SysUtils, ZDataset;

type
   // --------------------------------------
   TTipoProduto = class
      private
         qry : TZQuery;

      public
         Id   : string[4];
         Nome : string[20];

         constructor create(AOwner: TComponent);
         destructor Destroy; override;

         function PegaId: string;
   end;

   // --------------------------------------
   TProduto = class
      private
         qry   : TZQuery;

      public
         Id       : string[4];
         Nome     : string[30];
         Estoque  : string[5];
         EstoqMin : string[5];
         Unidade  : string[8];
         Valor    : string[8];
         Codigo   : string[8];
         Tipo     : TTipoProduto;

         constructor Create(AOwner: TComponent);
         destructor Destroy; override;

         procedure GravaInsercao;
         procedure GravaEdicao;
         procedure Excluir;
   end;

implementation

uses untDM;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

{ TProduto }

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

constructor TProduto.Create(AOwner: TComponent);
begin
   // Cria a query de consulta e atualiazacao do banco de dados para o objeto
   // TProduto
   qry := TZQuery.Create(AOwner);
   qry.Connection := dmPrincipal.ZConn;

   Tipo := TTipoProduto.Create(AOwner);
end;

destructor TProduto.Destroy;
begin
   qry.Free;
   Tipo.Free;
end;

// -----------------------------------------------------------------------------

procedure TProduto.Excluir;
begin
   qry.SQL.Clear;
   qry.SQL.Text := 'DELETE FROM produtos WHERE id="' + Id + '"';
   qry.ExecSQL;
   qry.Close;
end;

// -----------------------------------------------------------------------------

procedure TProduto.GravaEdicao;
var
   sql: string;

begin
   sql := 'UPDATE produtos SET nome="%s", quantidade="%s", estoq_min="%s", ' +
          'tipo_id="%s", unidade="%s", valor="%s" WHERE id="' + Id + '"';

   Valor := StringReplace(Valor,',','.',[]); // Ajuste para inserir valor com ',' no SQLite

   qry.SQL.Clear;
   qry.SQL.Text := Format(sql, [Nome, Estoque, EstoqMin, Tipo.PegaId, Unidade, Valor]);
   qry.ExecSQL;
end;

// -----------------------------------------------------------------------------

procedure TProduto.GravaInsercao;
var
   sql: string;

begin
   sql := 'INSERT INTO produtos (nome,quantidade,estoq_min,tipo_id,unidade,valor) ' +
          'VALUES ("%s","%s","%s","%s","%s","%s")';

   qry.SQL.Clear;
   qry.SQL.Text := Format(sql, [Nome, Estoque, EstoqMin, Tipo.PegaId, Unidade, Valor]);
   qry.ExecSQL;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

{ TTipoProduto }

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

constructor TTipoProduto.create(AOwner: TComponent);
begin
   qry := TZQuery.Create(AOwner);
   qry.Connection := dmPrincipal.ZConn;
end;

destructor TTipoProduto.Destroy;
begin
   qry.Free;
   inherited;
end;

// -----------------------------------------------------------------------------
//  Atualiza o campo Id do objeto TTipoProduto
//  Se o Tipo nao existir, cadastra o mesmo antes de retornar a ID
// -----------------------------------------------------------------------------

function TTipoProduto.PegaId: string;
begin
   Result := '';

   repeat
      qry.SQL.Clear;
      qry.SQL.Text := 'SELECT id FROM produtos_tipos WHERE nome="' + Nome +'"';
      qry.Open;

      // Se nao existir o Tipo, Insere ele na Tabela
      if ( qry.RecordCount = 0 ) then
      begin
         qry.SQL.Clear;
         qry.SQL.Text := 'INSERT INTO produtos_tipos (nome) VALUES ("'+ Nome +'")';
         qry.ExecSQL;
      end
      else
      begin
         Id := qry.FieldByName('id').AsString;
         Result := Id;
      end;

      qry.Close;

   until ( Result <> '' );

end;

end.
