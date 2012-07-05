unit funcionarios;

interface

uses SysUtils, ClasseMae;

type
  TFuncionario = class(TClasseMae)
  private
    query: string;

  public
    Id: integer;
    Nome: string;
    Endereco: string;
    Telefone: string;
    Senha: string;

    procedure Novo; override;
    procedure Grava; override;
    procedure Exclui; override;
  end;

const
  sql_insert = 'INSERT INTO funcionarios (id, nome, endereco, telefone, senha) VALUES (NULL,"%s","%s","%s","%s")';
  sql_update = 'UPDATE funcionarios SET nome="%s", endereco="%s", telefone="%s", senha="%s" WHERE id=%d';
  sql_delete = 'DELETE FROM funcionarios WHERE id=%d';

implementation

// -----------------------------------------------------------------------------

{ TFuncionario }

procedure TFuncionario.Exclui;
begin
  FConexao.ExecuteDirect(Format(sql_delete, [id]));
end;

procedure TFuncionario.Grava;
begin
  if id = 0 then
    query := Format(sql_insert, [Nome, Endereco, Telefone, Senha])
  else
    query := Format(sql_update, [Nome, Endereco, Telefone, Senha]);

  FConexao.ExecuteDirect(query);
end;

procedure TFuncionario.Novo;
begin
//  inherited;
  id := 0;
  nome := '';
  endereco := '';
  telefone := '';
  senha := '';
end;

end.
