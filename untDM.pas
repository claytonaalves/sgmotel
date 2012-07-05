unit untDM;

interface

uses
  SysUtils, Classes, DB, ADODB, Graphics, ZConnection, ZSqlUpdate,
  ZSqlProcessor;

function diff(d1, d2: tdatetime): string;

type
  TdmPrincipal = class(TDataModule)
    conn: TADOConnection;
    zconn: TZConnection;
    ZUpdateSQL1: TZUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  master='ADM';

var
  dmPrincipal: TdmPrincipal;
  operador: string;

implementation

{$R *.dfm}

function diff(d1, d2: tdatetime): string;
var Dias, Hor, Min, Seg: integer;
begin
  Seg  := Trunc((d2-d1)*86400);

  Dias := Seg div 86400;
  Seg  := Seg - (Dias * 86400);

  Hor := Seg div 3600;
  Seg := Seg - (Hor * 3600);

  Min := Seg div 60;
  Seg := Seg - (Min*60);

  if dias>0 then
//    Result := Format('%d dias %0.2d:%0.2d:%0.2d',[Dias, Hor, Min, Seg])
    Result := Format('%d dias %0.2d:%0.2d',[Dias, Hor, Min])
  else
//    Result := Format('%0.2d:%0.2d:%0.2d',[Hor, Min, Seg])
    Result := Format('%0.2d:%0.2d',[Hor, Min])
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  { TODO : Alterar isso aqui pra operador:='' }
  operador := 'ADM';
  DecimalSeparator := '.';
//  ZUpdateSQL1.
end;

end.
