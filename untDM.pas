unit untDM;

interface

uses
  SysUtils, Windows, Forms, Classes, Graphics, DB, ADODB, IniFiles,
  ZConnection, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset;

type
  TdmPrincipal = class(TDataModule)
    conn: TADOConnection;
    ZConn: TZConnection;
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;
  sOperador, sDBPath: string;

  bmpOk,
  bmpCancel,
  bmpCross,
  bmpNovo,
  bmpEditar,
  bmpExcluir,
  bmpImprimir,
  bmpEntrada,
  bmpSaida,
  bmpCompra: TBitmap;

implementation

{$R *.dfm}

// =============================================================================
// Carrega o caminho do BD do arquivo conf.ini
// Carrega as imagens da DLL recursos.dll
// =============================================================================

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
var
   hArq_DLL: THandle;
   iniConf: TIniFile;
   sCaminho_BD, sNome_BD, sNome_Recursos: string;

begin

   // Pega a Configuracao do arquivo ini
   iniConf := TIniFile.Create('c:\projetos\motel\conf.ini');

   try
      sCaminho_BD := iniConf.ReadString('PRINCIPAL', 'CAMINHO', sCaminho_BD);
      sNome_BD := iniConf.ReadString('PRINCIPAL', 'BASE', sNome_BD);
      sNome_Recursos := iniConf.ReadString('OUTROS', 'RECURSOS', sNome_Recursos);

   finally
      iniConf.Free;

   end;

   // Carrega a DLL de recursos na memoria
   hArq_DLL := loadlibrary(PChar(sCaminho_BD+sNome_Recursos));

   // Carrega as Imagens da DLL na memoria e libera a DLL
   try
      if ( hArq_DLL <> 0 ) then begin
         bmpOK := TBitmap.Create;
         bmpCancel := TBitmap.Create;
         bmpCross := TBitmap.Create;
         bmpNovo := TBitmap.Create;
         bmpEditar := TBitmap.Create;
         bmpExcluir := TBitmap.Create;
         bmpImprimir := TBitmap.Create;
         bmpEntrada := TBitmap.Create;
         bmpSaida := TBitmap.Create;
         bmpCompra := TBitmap.Create;

         bmpOK.LoadFromResourceName(hArq_DLL, 'bmp_ok');
         bmpCancel.LoadFromResourceName(hArq_DLL, 'bmp_cancel');
         bmpCross.LoadFromResourceName(hArq_DLL, 'bmp_cross');
         bmpNovo.LoadFromResourceName(hArq_DLL, 'bmp_new');
         bmpEditar.LoadFromResourceName(hArq_DLL, 'bmp_edit');
         bmpExcluir.LoadFromResourceName(hArq_DLL, 'bmp_delete');
         bmpImprimir.LoadFromResourceName(hArq_DLL, 'bmp_print');
         bmpEntrada.LoadFromResourceName(hArq_DLL, 'bmp_sigin');
         bmpSaida.LoadFromResourceName(hArq_DLL, 'bmp_sigou');
         bmpCompra.LoadFromResourceName(hArq_DLL, 'bmp_buy');
      end
      else begin
         MessageBox(0,PChar(sNome_Recursos),'Atenção!', 0);
         Application.Terminate;
      end;

   finally
      FreeLibrary(hArq_DLL);

   end;

end;

end.
