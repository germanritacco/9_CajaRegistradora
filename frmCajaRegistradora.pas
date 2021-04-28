unit frmCajaRegistradora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, CajaRegistradora;

type
  TForm1 = class(TForm)
    Lbledt1: TLabeledEdit;
    Lbledt1000: TLabeledEdit;
    Lbledt500: TLabeledEdit;
    Lbledt200: TLabeledEdit;
    Lbledt100: TLabeledEdit;
    Lbledt50: TLabeledEdit;
    Lbledt20: TLabeledEdit;
    Lbledt10: TLabeledEdit;
    Lbledt5: TLabeledEdit;
    Lbledt2: TLabeledEdit;
    BtnCargar: TButton;
    Memo1: TMemo;
    BtnSaldo: TButton;
    BtnCobrar: TButton;
    GroupBox1: TGroupBox;
    Lbledtcobrar: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnLimpiar: TButton;
    procedure BtnCargarClick(Sender: TObject);
    procedure BtnSaldoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCobrarClick(Sender: TObject);
    procedure Lbledt1Exit(Sender: TObject);
    procedure Lbledt2Exit(Sender: TObject);
    procedure Lbledt5Exit(Sender: TObject);
    procedure Lbledt10Exit(Sender: TObject);
    procedure Lbledt20Exit(Sender: TObject);
    procedure Lbledt50Exit(Sender: TObject);
    procedure Lbledt100Exit(Sender: TObject);
    procedure Lbledt200Exit(Sender: TObject);
    procedure Lbledt500Exit(Sender: TObject);
    procedure Lbledt1000Exit(Sender: TObject);
    procedure BtnLimpiarClick(Sender: TObject);
    procedure EditEnCero();
    procedure LbledtcobrarExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Money: Caja;

implementation

{$R *.dfm}

procedure TForm1.BtnCargarClick(Sender: TObject);
begin
  try
    Money.Auxiliar[B1]:= StrToInt(Lbledt1.Text);
    Money.Auxiliar[B2]:= StrToInt(Lbledt2.Text);
    Money.Auxiliar[B5]:= StrToInt(Lbledt5.Text);
    Money.Auxiliar[B10]:= StrToInt(Lbledt10.Text);
    Money.Auxiliar[B20]:= StrToInt(Lbledt20.Text);
    Money.Auxiliar[B50]:= StrToInt(Lbledt50.Text);
    Money.Auxiliar[B100]:= StrToInt(Lbledt100.Text);
    Money.Auxiliar[B200]:= StrToInt(Lbledt200.Text);
    Money.Auxiliar[B500]:= StrToInt(Lbledt500.Text);
    Money.Auxiliar[B1000]:= StrToInt(Lbledt1000.Text);
    Money.Cargar();
    Application.MessageBox('Caja Cargada Correctamente', 'Informacion', MB_OK + MB_ICONINFORMATION);
    EditEnCero;
  except
    Application.MessageBox('Datos invalidos', 'Error', MB_OK + MB_ICONERROR);
  end;

end;

procedure TForm1.BtnSaldoClick(Sender: TObject);
var
  Saldo: Integer;
  I: Billetes;
begin
  Memo1.Clear;
  Saldo:= Money.EstadoySaldo();
  Memo1.Lines.Add('Cantidad de Billetes:');
  Memo1.Lines.Add('');
  for I:= B1 to B1000 do
    Memo1.Lines.Add('$' + Money.EnumToStr(I) + ': ' + IntToStr(Money.Auxiliar[I]));
  Memo1.Lines.Add('---------------------------------------------');
  Memo1.Lines.Add('Saldo Total: $' + IntToStr(Saldo));
end;

procedure TForm1.EditEnCero();
begin
  Lbledt1.Text:= '0';
  Lbledt2.Text:= '0';
  Lbledt5.Text:= '0';
  Lbledt10.Text:= '0';
  Lbledt20.Text:= '0';
  Lbledt50.Text:= '0';
  Lbledt100.Text:= '0';
  Lbledt200.Text:= '0';
  Lbledt500.Text:= '0';
  Lbledt1000.Text:= '0';
end;

procedure TForm1.BtnCobrarClick(Sender: TObject);
var
  I: Billetes;
  Vuelto: Integer;
  Estado: Boolean;
begin
  try
    Money.Auxiliar[B1]:= StrToInt(Lbledt1.Text);
    Money.Auxiliar[B2]:= StrToInt(Lbledt2.Text);
    Money.Auxiliar[B5]:= StrToInt(Lbledt5.Text);
    Money.Auxiliar[B10]:= StrToInt(Lbledt10.Text);
    Money.Auxiliar[B20]:= StrToInt(Lbledt20.Text);
    Money.Auxiliar[B50]:= StrToInt(Lbledt50.Text);
    Money.Auxiliar[B100]:= StrToInt(Lbledt100.Text);
    Money.Auxiliar[B200]:= StrToInt(Lbledt200.Text);
    Money.Auxiliar[B500]:= StrToInt(Lbledt500.Text);
    Money.Auxiliar[B1000]:= StrToInt(Lbledt1000.Text);
    EditEnCero;
  except
    Application.MessageBox('Datos invalidos', 'Error', MB_OK + MB_ICONERROR);
  end;
  if StrToInt(Lbledtcobrar.Text) > 0 then
    begin
      Estado:= Money.DarVuelto(StrToInt(Lbledtcobrar.Text), Vuelto);
      if Estado then
        begin
          Memo1.Clear;
          Memo1.Lines.Add('Vuelto a dar: $' + IntToStr(Vuelto));
          Memo1.Lines.Add('');
          Memo1.Lines.Add('Cantidad de Billetes:');
          Memo1.Lines.Add('');
          for I:= B1 to B1000 do
            Memo1.Lines.Add('$' + Money.EnumToStr(I) + ': ' + IntToStr(Money.Auxiliar[I]));
        end
      else
        Application.MessageBox('No hay billetes suficientes', 'Error', MB_OK + MB_ICONERROR);
    end
  else
    Application.MessageBox('El monto a cobrar debe ser > 0', 'Advertencia', MB_OK + MB_ICONWARNING);
end;

procedure TForm1.BtnLimpiarClick(Sender: TObject);
begin
  Money.Inicializar;
  Money.InicializarAUX;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Money.Inicializar();
end;

procedure TForm1.Lbledt1000Exit(Sender: TObject);
begin
  if Lbledt1000.Text = '' then
    Lbledt1000.Text:= '0';
end;

procedure TForm1.Lbledt100Exit(Sender: TObject);
begin
  if Lbledt100.Text = '' then
    Lbledt100.Text:= '0';
end;

procedure TForm1.Lbledt10Exit(Sender: TObject);
begin
  if Lbledt10.Text = '' then
    Lbledt10.Text:= '0';
end;

procedure TForm1.Lbledt1Exit(Sender: TObject);
begin
  if Lbledt1.Text = '' then
    Lbledt1.Text:= '0';
end;

procedure TForm1.Lbledt200Exit(Sender: TObject);
begin
  if Lbledt200.Text = '' then
    Lbledt200.Text:= '0';
end;

procedure TForm1.Lbledt20Exit(Sender: TObject);
begin
  if Lbledt20.Text = '' then
    Lbledt20.Text:= '0';
end;

procedure TForm1.Lbledt2Exit(Sender: TObject);
begin
  if Lbledt2.Text = '' then
    Lbledt2.Text:= '0';
end;

procedure TForm1.Lbledt500Exit(Sender: TObject);
begin
  if Lbledt500.Text = '' then
    Lbledt500.Text:= '0';
end;

procedure TForm1.Lbledt50Exit(Sender: TObject);
begin
  if Lbledt50.Text = '' then
    Lbledt50.Text:= '0';
end;

procedure TForm1.Lbledt5Exit(Sender: TObject);
begin
  if Lbledt5.Text = '' then
    Lbledt5.Text:= '0';
end;

procedure TForm1.LbledtcobrarExit(Sender: TObject);
begin
  if Lbledtcobrar.Text = '' then
    Lbledtcobrar.Text:= '0';
end;

end.
