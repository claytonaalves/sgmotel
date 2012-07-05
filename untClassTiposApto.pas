unit untClassTiposApto;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XiPanel, Menus, DB, ADODB;


// =============================================================================

type TTipoApto = class(TObject)

   private
      FNome: string;
      lNovoRegistro: boolean;
      FsValor1, FsValor2, FsValor3, FsValor4: string;
      FsCodigo: string;

   public
      constructor Criar(lNovo: boolean);
      constructor Create;

      procedure Abrir(nID: integer);
      procedure Novo;
      procedure Gravar;
      procedure Excluir;


   published
      property Codigo: string Read FsCodigo Write FsCodigo;
      property Nome: string Read FNome Write FNome;
      property Valor1: string Read FsValor1 Write FsValor1;
      property Valor2: string Read FsValor2 Write FsValor2;
      property Valor3: string Read FsValor3 Write FsValor3;
      property Valor4: string Read FsValor4 Write FsValor4;

end;

implementation

uses untDM;

// =============================================================================
// =============================================================================

constructor TTipoApto.Criar(lNovo: boolean);
begin
   lNovoRegistro := lNovo;
end;

constructor TTipoApto.Create;
begin
//
end;

// =============================================================================

procedure TTipoApto.Abrir(nID: integer);
begin
//
end;

// =============================================================================

procedure TTipoApto.Gravar;
var
   sSQL, sCod, sNom, Val1, Val2, Val3, Val4: string;

begin

   sCod := Codigo;
   sNom := QuotedStr(FNome);
   Val1 := QuotedStr(FsValor1);
   Val2 := QuotedStr(FsValor2);
   Val3 := QuotedStr(FsValor3);
   Val4 := QuotedStr(FsValor4);

   if lNovoRegistro then
      sSQL := Format('INSERT INTO aptos_tipos (nome,valor01,valor02,valor03,valor04) VALUES (%s, %s, %s, %s, %s)', [sNom, Val1, Val2, Val3, Val4])

   else
      sSQL := Format('UPDATE aptos_tipos SET nome=%s, valor01=%s, valor02=%s, valor03=%s, valor04=%s WHERE id=%s', [sNom, Val1, Val2, Val3, Val4, sCod]);

   dmPrincipal.conn.Execute(sSQL);

end;

// =============================================================================

procedure TTipoApto.Novo;
begin
//
end;

// =============================================================================

procedure TTipoApto.Excluir;
begin

   if MessageBox(0,'Apagar o Tipo de Apartamento selecionado?','Atenção!',MB_YESNO + MB_ICONERROR) = ID_YES then
      dmPrincipal.conn.Execute('DELETE * FROM aptos_tipos WHERE id=' + Codigo);

end;

end.
