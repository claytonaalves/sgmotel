unit ClasseMae;

interface

uses Classes, ZConnection;

type
  TClasseMae = class(TObject)
    FConexao: TZConnection;

    procedure Novo; virtual; abstract;
    procedure Grava; virtual; abstract;
    procedure Exclui; virtual; abstract;

  private
  //
  public
    constructor Create;

  end;

implementation

{ TClasseMae }

// -----------------------------------------------------------------------------

constructor TClasseMae.Create;
begin
//
end;

end.
