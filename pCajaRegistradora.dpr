program pCajaRegistradora;

uses
  Vcl.Forms,
  frmCajaRegistradora in 'frmCajaRegistradora.pas' {Form1},
  CajaRegistradora in 'CajaRegistradora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
