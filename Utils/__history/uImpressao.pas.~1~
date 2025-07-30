unit uImpressao;

interface

uses
  System.Classes, Printers, System.SysUtils;

procedure Impressao(texto: TStringList; impressora: string);

implementation

procedure Impressao(texto: TStringList; impressora: string);
var
  i: Integer;
  LineHeight: Integer;
  CurrentY: Integer;
begin
  // Define a impressora
  Printer.PrinterIndex := Printer.Printers.IndexOf(impressora);
  if Printer.PrinterIndex = -1 then
    raise Exception.Create('Impressora não encontrada: ' + impressora);

  // Impressao
  Printer.BeginDoc;
  try
    LineHeight := Printer.Canvas.TextHeight('X');
    CurrentY := 0;

    for i := 0 to texto.Count - 1 do
    begin
      Printer.Canvas.TextOut(0, CurrentY, texto[i]);
      CurrentY := CurrentY + LineHeight;
    end;


    Printer.EndDoc;
  except on e: Exception do
    begin
      Printer.Abort;
      raise Exception.Create('Erro ao imprimir: ' + E.Message);
    end;
  end;
end;

end.
