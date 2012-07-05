unit untClasses;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XiPanel, Menus, DB, ADODB;


const
   LIVRE   : integer = 1;
   ATIVO   : integer = 1;
   OCUPADO : integer = 2;
   INATIVO : integer = 3;

// =============================================================================
// =============================================================================

type
   TApto = class(TXiPanel)

   private
      FNumApto      : integer;
      FsNumero      : string;
      FTipoApto     : string;
      FMenuPopUp    : TPopUpMenu;
      FSituacao     : integer;
      FData_Entrada : TDateTime;
      FHora_Entrada : TDateTime;
      FTranscorrido : integer;

      FOnDuploClique: TNotifyEvent;

      lblNumApto,
      lblTipoApto,
      lblSituacao,
      lblTipo,
      lblSit: TLabel;

      procedure SetNumeroApto(const Value: integer);
      procedure SetTipoApto(const Value: string);
      procedure SetSituacao(const Value: integer);
      procedure ConfiguraPopUp(const Value: TPopUpMenu);
      procedure SetEventoDuploClique(const Value: TNotifyEvent);

      procedure SetData_Entrada(const Value: TDateTime);
      procedure SetHora_Entrada(const Value: TDateTime);
    function GetTranscorrido: integer;

   public
      constructor Cria(AOwner: TComponent);
      destructor Destroy; override;


   published
      property Numero: integer read FNumApto write SetNumeroApto;
      property sNumero: string read FsNumero;
      property Tipo: string read FTipoApto write SetTipoApto;
      property Situacao: integer read FSituacao write SetSituacao;
      property Menu: TPopUpMenu read FMenuPopUp write ConfiguraPopUp;
      property OnDuploClique: TNotifyEvent read FOnDuploClique write SetEventoDuploClique;
      property Hora_Entrada: TDateTime read FHora_Entrada write SetHora_Entrada;
      property Data_Entrada: TDateTime read FData_Entrada write SetData_Entrada;
      property Transcorrido: integer read GetTranscorrido;

      //property Ocupado: boolean read FOcupado write AlteraSituacao;
      //property Ativo: boolean read FAtivo write AtivaApto;
      //property OnMouseMove2: TMouseMoveEvent read FOnMouseMove write ConfiguraEvento;
      //property Visivel: boolean read FVisivel write SetFVisivel;

   end;


implementation

uses untDM;

{ TApto }

// =============================================================================
// =============================================================================

constructor TApto.Cria(AOwner: TComponent);
begin
   inherited Create(AOwner);

   Parent  := TWinControl(AOwner);
   Visible := false;

   // Configura o Panel
   Height := 75;
   Width  := 150;

   ColorFace  := clWhite;
   ColorGrad  := $00DAE0DE;
   ColorLight := $007D7D7D;
   ColorDark  := $00626262;

   // Cria os Labels
   lblNumApto  := TLabel.Create(Self);
   lblTipoApto := TLabel.Create(Self);
   lblSituacao := TLabel.Create(Self);
   lblTipo     := TLabel.Create(Self);
   lblSit      := TLabel.Create(Self);

   // Configura o Label do Numero do Apto
   lblNumApto.Font.Name   := 'Verdana';
   lblNumApto.Font.Size   := 14;
   lblNumApto.Font.Style  := [fsBold];
   lblNumApto.Font.Color  := $00CAD1D5;
   lblNumApto.Transparent := True;
   lblNumApto.Top         := 6;
   lblNumApto.Left        := 6;

   // Configura o Label de Tipo do Apto
   lblTipoApto.Font.Name   := 'Lucida Console';
   lblTipoApto.Font.Size   := 8;
   lblTipoApto.Font.Color  := $00CAD1D5;
   lblTipoApto.Transparent := True;
   lblTipoApto.Top         := 36;
   lblTipoApto.Left        := 8;
   lblTipoApto.Caption     := 'Tipo....:';

   // Configura o Label de Situacao
   lblSituacao.Font.Name := 'Lucida Console';
   lblSituacao.Font.Size := 8;
   lblSituacao.Font.Color := $00CAD1D5;
   lblSituacao.Transparent := true;
   lblSituacao.Top := 52;
   lblSituacao.Left := 8;
   lblSituacao.Caption := 'Situacao:';

   // Configura o Label que descreve o Tipo
   lblTipo.Font.Name   := 'Lucida Console';
   lblTipo.Font.Size   := 8;
   lblTipo.Font.Color  := $00CAD1D5;
   lblTipo.Transparent := True;
   lblTipo.Top         := 36;
   lblTipo.Left        := 79;
   lblTipo.Caption     := '-------';

   // Configura o Label que descreve a Situacao
   lblSit.Font.Name   := 'Lucida Console';
   lblSit.Font.Size   := 8;
   lblSit.Font.Color  := $00CAD1D5;
   lblSit.Transparent := true;
   lblSit.Top         := 52;
   lblSit.Left        := 79;
   lblSit.Caption     := 'INATIVO';

   // Mostra os Labels dentro do Panel
   lblNumApto.Parent := Self;
   lblTipoApto.Parent := Self;
   lblSituacao.Parent := Self;
   lblTipo.Parent := Self;
   lblSit.Parent := Self;

end;

// =============================================================================

destructor TApto.Destroy;
begin

   lblNumApto.Free;
   lblTipoApto.Free;
   lblSituacao.Free;
   lblTipo.Free;
   lblSit.Free;

   lblNumApto := nil;
   lblTipoApto := nil;
   lblSituacao := nil;
   lblTipo := nil;
   lblSit := nil;

   inherited Destroy;
end;

// =============================================================================
// Altera a propriedade Numero do Objeto TApto
// Altera o Caption do Label do Numero do Apartamento
// =============================================================================

procedure TApto.SetNumeroApto(const Value: integer);
begin
  FNumApto := Value;

  FsNumero := RightStr('00'+IntToStr(Value),2);

  lblNumApto.Caption := FsNumero;

end;

// =============================================================================

procedure TApto.SetTipoApto(const Value: string);
begin

   FTipoApto := Value;

   lblTipo.Caption := Value;

end;

// =============================================================================

procedure TApto.ConfiguraPopUp(const Value: TPopUpMenu);
begin

   FMenuPopUp := Value;
   PopupMenu := Value;

end;

// =============================================================================

procedure TApto.SetEventoDuploClique(const Value: TNotifyEvent);
begin
  FOnDuploClique := Value;

  OnDblClick := FOnDuploClique;

  lblNumApto.OnDblClick  := FOnDuploClique;
  lblTipoApto.OnDblClick := FOnDuploClique;
  lblSituacao.OnDblClick := FOnDuploClique;
  lblTipo.OnDblClick     := FOnDuploClique;
  lblSit.OnDblClick      := FOnDuploClique;

end;

// =============================================================================

procedure TApto.SetSituacao(const Value: integer);
var
   sSituacao: string;
   dDataEntrada, dHoraEntrada: TDateTime;

   rRegistro: _RecordSet;

begin

   FSituacao := Value;

   // Sinaliza como "LIVRE" o objeto Apto
   if ( FSituacao = LIVRE ) then begin
      lblSit.Caption := 'LIVRE';

      ColorFace  := clWhite;
      ColorGrad  := $00DAE0DE;
      ColorLight := $007D7D7D;
      ColorDark  := $00626262;

      lblNumApto.Font.Color  := clBlack;
      lblTipoApto.Font.Color := clBlack;
      lblSituacao.Font.Color := clBlack;

      lblTipo.Font.Color := clNavy;
      lblSit.Font.Color := clNavy;

      sSituacao := 'L';

   end

   // Sinaliza como "OCUPADO" o objeto Apto
   else if ( FSituacao = OCUPADO ) then begin
      lblSit.Caption := 'OCUPADO';

      ColorDark  := $0000009D;
      ColorFace  := clWhite;
      ColorGrad  := $000076EC;
      ColorLight := $000651CC;

      sSituacao := 'O';

      rRegistro := dmPrincipal.conn.Execute('SELECT dt_entrada, hr_entrada FROM movimentos WHERE numero_apto=' + IntToStr(Numero) + ' AND status=true');

      FData_Entrada := rRegistro.Fields[0].Value;
      FHora_Entrada := rRegistro.Fields[1].Value;

   end

   // Sinaliza como "INATIVO" o objeto Apto
   else begin

      lblNumApto.Font.Color  := $00CAD1D5;
      lblTipoApto.Font.Color := $00CAD1D5;
      lblSituacao.Font.Color := $00CAD1D5;

      lblTipo.Font.Color := $00CAD1D5;
      lblSit.Font.Color := $00CAD1D5;

      lblTipo.Caption := '-------';
      lblSit.Caption := 'INATIVO';

      ColorFace  := clWhite;
      ColorGrad  := $00DAE0DE;
      ColorLight := $007D7D7D;
      ColorDark  := $00626262;

      sSituacao := 'I';

   end;


   sSituacao := QuotedStr(sSituacao);

   // Atualiza a base de dados
   dmPrincipal.conn.Execute('UPDATE aptos SET situacao=' + sSituacao + ' WHERE numero=' + IntToStr( Numero ));

end;

// =============================================================================

procedure TApto.SetData_Entrada(const Value: TDateTime);
begin
  FData_Entrada := Value;
end;

// =============================================================================

procedure TApto.SetHora_Entrada(const Value: TDateTime);
begin
  FHora_Entrada := Value;
end;

// =============================================================================
// Pega o tempo transcorrido apos o registro de Entrada no Apartamento
// =============================================================================

function TApto.GetTranscorrido: integer;
var
   x: TDateTime;

begin
  // x := FData_Entrada - Date();

  // Result := StrToInt(DateToStr

end;

end.
