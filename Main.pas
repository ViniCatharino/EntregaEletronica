unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs;

type
  TService1 = class(TService)
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  Service1: TService1;

implementation

{$R *.dfm}
uses
     Horse,
     Horse.Jhonson,
     Horse.CORS,
     DataSet.Serialize.Config,
     Controllers.Entregas;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  Service1.Controller(CtrlCode);
end;

function TService1.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TService1.ServiceCreate(Sender: TObject);
begin
  THorse.Use(Jhonson());
  THorse.Use(CORS);

  TDataSetSerializeConfig.GetInstance.CaseNameDefinition      := cndLower;
  TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator := '.';

  // Regitrar Rotas..
  Controllers.Entregas.RegistrarRotas;
end;

procedure TService1.ServiceStart(Sender: TService; var Started: Boolean);
begin
   THorse.Listen(3005);
   Started := True;
end;

procedure TService1.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  Thorse.StopListen;
  Stopped := True;
end;

end.
