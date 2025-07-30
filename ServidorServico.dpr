program ServidorServico;

uses
  Vcl.SvcMgr,
  Main in 'Main.pas' {Service1: TService},
  Horse.Callback in 'modules\horse\src\Horse.Callback.pas',
  Horse.Commons in 'modules\horse\src\Horse.Commons.pas',
  Horse.Constants in 'modules\horse\src\Horse.Constants.pas',
  Horse.Core.Files in 'modules\horse\src\Horse.Core.Files.pas',
  Horse.Core.Group.Contract in 'modules\horse\src\Horse.Core.Group.Contract.pas',
  Horse.Core.Group in 'modules\horse\src\Horse.Core.Group.pas',
  Horse.Core.Param.Config in 'modules\horse\src\Horse.Core.Param.Config.pas',
  Horse.Core.Param.Field.Brackets in 'modules\horse\src\Horse.Core.Param.Field.Brackets.pas',
  Horse.Core.Param.Field in 'modules\horse\src\Horse.Core.Param.Field.pas',
  Horse.Core.Param.Header in 'modules\horse\src\Horse.Core.Param.Header.pas',
  Horse.Core.Param in 'modules\horse\src\Horse.Core.Param.pas',
  Horse.Core in 'modules\horse\src\Horse.Core.pas',
  Horse.Core.Route.Contract in 'modules\horse\src\Horse.Core.Route.Contract.pas',
  Horse.Core.Route in 'modules\horse\src\Horse.Core.Route.pas',
  Horse.Core.RouterTree.NextCaller in 'modules\horse\src\Horse.Core.RouterTree.NextCaller.pas',
  Horse.Core.RouterTree in 'modules\horse\src\Horse.Core.RouterTree.pas',
  Horse.EnvironmentVariables in 'modules\horse\src\Horse.EnvironmentVariables.pas',
  Horse.Exception.Interrupted in 'modules\horse\src\Horse.Exception.Interrupted.pas',
  Horse.Exception in 'modules\horse\src\Horse.Exception.pas',
  Horse.Mime in 'modules\horse\src\Horse.Mime.pas',
  Horse in 'modules\horse\src\Horse.pas',
  Horse.Proc in 'modules\horse\src\Horse.Proc.pas',
  Horse.Provider.Abstract in 'modules\horse\src\Horse.Provider.Abstract.pas',
  Horse.Provider.Apache in 'modules\horse\src\Horse.Provider.Apache.pas',
  Horse.Provider.CGI in 'modules\horse\src\Horse.Provider.CGI.pas',
  Horse.Provider.Console in 'modules\horse\src\Horse.Provider.Console.pas',
  Horse.Provider.Daemon in 'modules\horse\src\Horse.Provider.Daemon.pas',
  Horse.Provider.FPC.Apache in 'modules\horse\src\Horse.Provider.FPC.Apache.pas',
  Horse.Provider.FPC.CGI in 'modules\horse\src\Horse.Provider.FPC.CGI.pas',
  Horse.Provider.FPC.Daemon in 'modules\horse\src\Horse.Provider.FPC.Daemon.pas',
  Horse.Provider.FPC.FastCGI in 'modules\horse\src\Horse.Provider.FPC.FastCGI.pas',
  Horse.Provider.FPC.HTTPApplication in 'modules\horse\src\Horse.Provider.FPC.HTTPApplication.pas',
  Horse.Provider.FPC.LCL in 'modules\horse\src\Horse.Provider.FPC.LCL.pas',
  Horse.Provider.IOHandleSSL.Contract in 'modules\horse\src\Horse.Provider.IOHandleSSL.Contract.pas',
  Horse.Provider.IOHandleSSL in 'modules\horse\src\Horse.Provider.IOHandleSSL.pas',
  Horse.Provider.ISAPI in 'modules\horse\src\Horse.Provider.ISAPI.pas',
  Horse.Provider.VCL in 'modules\horse\src\Horse.Provider.VCL.pas',
  Horse.Request in 'modules\horse\src\Horse.Request.pas',
  Horse.Response in 'modules\horse\src\Horse.Response.pas',
  Horse.Rtti.Helper in 'modules\horse\src\Horse.Rtti.Helper.pas',
  Horse.Rtti in 'modules\horse\src\Horse.Rtti.pas',
  Horse.Session in 'modules\horse\src\Horse.Session.pas',
  Horse.WebModule in 'modules\horse\src\Horse.WebModule.pas' {HorseWebModule: TWebModule},
  ThirdParty.Posix.Syslog in 'modules\horse\src\ThirdParty.Posix.Syslog.pas',
  Web.WebConst in 'modules\horse\src\Web.WebConst.pas',
  Horse.CORS in 'modules\horse-cors\src\Horse.CORS.pas',
  Horse.Jhonson in 'modules\jhonson\src\Horse.Jhonson.pas',
  DataSet.Serialize.Config in 'modules\dataset-serialize\src\DataSet.Serialize.Config.pas',
  DataSet.Serialize.Consts in 'modules\dataset-serialize\src\DataSet.Serialize.Consts.pas',
  DataSet.Serialize.Export in 'modules\dataset-serialize\src\DataSet.Serialize.Export.pas',
  DataSet.Serialize.Import in 'modules\dataset-serialize\src\DataSet.Serialize.Import.pas',
  DataSet.Serialize.Language in 'modules\dataset-serialize\src\DataSet.Serialize.Language.pas',
  DataSet.Serialize in 'modules\dataset-serialize\src\DataSet.Serialize.pas',
  DataSet.Serialize.UpdatedStatus in 'modules\dataset-serialize\src\DataSet.Serialize.UpdatedStatus.pas',
  DataSet.Serialize.Utils in 'modules\dataset-serialize\src\DataSet.Serialize.Utils.pas',
  Controllers.Entregas in 'Controllers\Controllers.Entregas.pas',
  DAO.Connection in 'DAO\DAO.Connection.pas',
  DAO.Entregas in 'DAO\DAO.Entregas.pas',
  Horse.JWT in 'modules\horse-jwt\src\Horse.JWT.pas',
  JOSE.Builder in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Builder.pas',
  JOSE.Consumer in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Consumer.pas',
  JOSE.Consumer.Validators in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Consumer.Validators.pas',
  JOSE.Context in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Context.pas',
  JOSE.Core.Base in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Core.Base.pas',
  JOSE.Core.Builder in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Core.Builder.pas',
  JOSE.Core.JWA.Compression in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Core.JWA.Compression.pas',
  JOSE.Core.JWA.Encryption in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Core.JWA.Encryption.pas',
  JOSE.Core.JWA.Factory in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Core.JWA.Factory.pas',
  JOSE.Core.JWA in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Core.JWA.pas',
  JOSE.Core.JWA.Signing in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Core.JWA.Signing.pas',
  JOSE.Core.JWE in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Core.JWE.pas',
  JOSE.Core.JWK in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Core.JWK.pas',
  JOSE.Core.JWS in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Core.JWS.pas',
  JOSE.Core.JWT in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Core.JWT.pas',
  JOSE.Core.Parts in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Core.Parts.pas',
  JOSE.Producer in 'modules\delphi-jose-jwt\Source\JOSE\JOSE.Producer.pas',
  JOSE.Encoding.Base64 in 'modules\delphi-jose-jwt\Source\Common\JOSE.Encoding.Base64.pas',
  JOSE.Hashing.HMAC in 'modules\delphi-jose-jwt\Source\Common\JOSE.Hashing.HMAC.pas',
  JOSE.OpenSSL.Headers in 'modules\delphi-jose-jwt\Source\Common\JOSE.OpenSSL.Headers.pas',
  JOSE.Signing.Base in 'modules\delphi-jose-jwt\Source\Common\JOSE.Signing.Base.pas',
  JOSE.Signing.ECDSA in 'modules\delphi-jose-jwt\Source\Common\JOSE.Signing.ECDSA.pas',
  JOSE.Signing.RSA in 'modules\delphi-jose-jwt\Source\Common\JOSE.Signing.RSA.pas',
  JOSE.Types.Arrays in 'modules\delphi-jose-jwt\Source\Common\JOSE.Types.Arrays.pas',
  JOSE.Types.Bytes in 'modules\delphi-jose-jwt\Source\Common\JOSE.Types.Bytes.pas',
  JOSE.Types.JSON in 'modules\delphi-jose-jwt\Source\Common\JOSE.Types.JSON.pas',
  JOSE.Types.Utils in 'modules\delphi-jose-jwt\Source\Common\JOSE.Types.Utils.pas',
  uImpressao in 'Utils\uImpressao.pas',
  core.Utils.Tipos in '..\Core\core.Utils.Tipos.pas';

{$R *.RES}

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TService1, Service1);
  Application.Run;
end.
