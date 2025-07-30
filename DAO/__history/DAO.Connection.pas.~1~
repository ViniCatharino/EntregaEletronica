unit DAO.Connection;

interface

Uses System.SysUtils, System.IniFiles, FireDAC.Comp.Client, FireDAC.Stan.Def,
  FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Stan.Option, FireDAC.Stan.Pool,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.DApt, FireDAC.Phys;

type
  TDAOConnection = class
  private
    FConnection: TFDConnection;
    FDriverLink: TFDPhysFBDriverLink;
  public
    constructor Create;
    destructor Destroy; override;
    property Connection: TFDConnection read FConnection;

    procedure StartTransaction;
    procedure Commit;
    procedure Rollback;
  end;

implementation

{ TDAOConnection }

constructor TDAOConnection.Create;
var
  ini: TIniFile;
  arq_ini: string;
begin
  // Arquivo de configuração
  arq_ini := ExtractFilePath(ParamStr(0)) + 'server.ini' ;
 // arq_ini := 'C:\Dev\Comanda\Servidor\bin\server.ini' ;


  if NOT FileExists(arq_ini) then
    raise Exception.Create('Arquivo de configuração não encontrado: ' + arq_ini);

  ini := TIniFile.Create(arq_ini);

  FDriverLink := TFDPhysFBDriverLink.Create(nil);
  FConnection := TFDConnection.Create(nil);

  try
    try
      FConnection.DriverName := ini.ReadString('Banco de Dados', 'DriverID', 'FB');
      FConnection.LoginPrompt := False;

      FConnection.Params.Add('DriverID=' + ini.ReadString('Banco de Dados', 'DriverID', 'FB'));
      FConnection.Params.Add('Database=' + ini.ReadString('Banco de Dados', 'Database', ''));
      FConnection.Params.Add('User_Name=' + ini.ReadString('Banco de Dados', 'User_name', ''));
      FConnection.Params.Add('Password=' + ini.ReadString('Banco de Dados', 'Password', ''));
      FConnection.Params.Add('CharacterSet=UTF8');
      FConnection.Params.Add('Protocol=TCPIP');
      FConnection.Params.Add('Server=' + ini.ReadString('Banco de Dados', 'Server', ''));
      FConnection.Params.Add('Port=' + ini.ReadString('Banco de Dados', 'Port', ''));
      FDriverLink.VendorLib := ini.ReadString('Banco de Dados', 'VendorLib', '');

      FConnection.Connected := true;

    except on ex:exception do
      begin
        FreeAndNil(FConnection);
        FreeAndNil(FDriverLink);
        raise Exception.Create('Erro ao conectar ao banco de dados: ' + ex.Message);
      end;
    end;

  finally
    FreeAndNil(ini);
  end;

end;

destructor TDAOConnection.Destroy;
begin
  if Assigned(FConnection) then
  begin
    FConnection.Connected := False;
    FConnection.Free;
  end;

  if Assigned(FDriverLink) then
    FDriverLink.Free;

  inherited;
end;

procedure TDAOConnection.Rollback;
begin
  FConnection.Rollback;
end;

procedure TDAOConnection.Commit;
begin
  FConnection.Commit;
end;

procedure TDAOConnection.StartTransaction;
begin
  FConnection.StartTransaction;
end;

end.
