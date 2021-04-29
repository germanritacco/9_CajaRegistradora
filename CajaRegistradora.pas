unit CajaRegistradora;

interface

uses
  SysUtils, Typinfo;

type

  Billetes = (B1, B2, B5, B10, B20, B50, B100, B200, B500, B1000); // Enumerado de Billetes

  Caja = object
  private
    Contenedor: array [B1 .. B1000] of Integer; // Caja Registrdora, solo visible por el TAD
  public
    Auxiliar: array [B1 .. B1000] of Integer; // Caja auxiliar, para intercambios, entrada/salida de billetes y backups
    function EnumToInt(B: Billetes): Integer; // Convierte Enumerado a Entero
    function EnumToStr(B: Billetes): string; // Convierte Enumerado a String
    procedure Inicializar(); // Pone en 0 el vector Contenedor
    procedure InicializarAUX(); // Pone en 0 vector Auxiliar
    procedure Cargar(); // Carga los billetes a la caja
    function EstadoySaldo: Integer; // Devuelve el monto total de bielletes y cantidad de cada denominacion
    function DarVuelto(MontoCobrar: Integer; var Vuelto: Integer): Boolean; // Da el vuelto si es posible del cobro
  end;

implementation

// Convierte un Enumerado a Entero
function Caja.EnumToInt(B: Billetes): Integer;
var
  S: string;
begin
  S:= GetEnumName(TypeInfo(Billetes), Integer(B));
  S:= Copy(S, 2, Length(S));
  Result:= StrToInt(S);
end;

// Convierte un Enumerado a String
function Caja.EnumToStr(B: Billetes): string;
var
  S: string;
begin
  S:= GetEnumName(TypeInfo(Billetes), Integer(B));
  S:= Copy(S, 2, Length(S));
  Result:= S;
end;

// Pone en 0 todos los valores del vector privado
procedure Caja.Inicializar();
var
  I: Billetes;
begin
  for I:= B1 to B1000 do
    Contenedor[I]:= 0;
end;

// Pone en 0 todos los valores del vector publico
procedure Caja.InicializarAUX();
var
  I: Billetes;
begin
  for I:= B1 to B1000 do
    Auxiliar[I]:= 0;
end;

// Agrega billetes a la caja
procedure Caja.Cargar();
var
  I: Billetes;
begin
  for I:= B1 to B1000 do
    Contenedor[I]:= Contenedor[I] + Auxiliar[I];
end;

// Devuelve el saldo total del cajero y la disponibilidad de cada tipo de billete.
function Caja.EstadoySaldo: Integer;
var
  I: Billetes;
  Total: Integer;
begin
  Total:= 0;
  for I:= B1 to B1000 do
    begin
      Auxiliar[I]:= Contenedor[I];
      Total:= Total + (Contenedor[I] * EnumToInt(I));
    end;
  Result:= Total;
end;

function Caja.DarVuelto(MontoCobrar: Integer; var Vuelto: Integer): Boolean;
var
  MontoBilletes, C: Integer;
  I: Billetes;
  B: Boolean;
  RespaldoCaja, RespaldoCobro: array [B1 .. B1000] of Integer;
begin
  C:= 0;
  MontoBilletes:= 0;
  for I:= B1 to B1000 do
    begin
      MontoBilletes:= MontoBilletes + (Auxiliar[I] * EnumToInt(I)); // Suma el total de billetes para pagar
      RespaldoCaja[I]:= Contenedor[I]; // Respalda la caja antes del pago
    end;
  Cargar; // Cargar el cobro a la caja
  InicializarAUX(); // Pone en 0 el vector donde guardara los billetes del vuelto
  I:= B1000; // Contador descendente de los billetes
  B:= False; // Corta ciclo de contar billetes a dar
  Vuelto:= MontoBilletes - MontoCobrar;
  while (Vuelto > 0) and (B = False) do // Mientras Vuelto sea mayor a 0, y disponga de billetes a dar (B)
    if (Contenedor[I] > 0) and (EnumToInt(I) <= Vuelto) then // comparo si el billete actual es menor o igual al vuelto
      begin
        Vuelto:= Vuelto - EnumToInt(I); // Al vuelto le resto el billete
        Auxiliar[I]:= Auxiliar[I] + 1; // Al auxiliar le aumento de 1 la cantidad de billetes de esa denominacion
        Contenedor[I]:= Contenedor[I] - 1; // A la caja le decremento de 1 la cantidad de billetes de esa denominacion
      end
    else
      begin
        Inc(C);
        Dec(I); // Decremento el valor de I para trabajar con una denominacion menor
        if C = 10 then // Si ya recorri todas las denominaciones, corto el ciclo
          B:= True;
      end;
  if Vuelto <> 0 then // Si no hay plata suficiente para dar el vuelto, o ingresaron menos billetes del cobro
    begin
      Result:= False;
      for I:= B1 to B1000 do
        Contenedor[I]:= +RespaldoCaja[I]; // Vuelve el estado de la caja antes del cobro
    end
  else
    Result:= True;
  Vuelto:= MontoBilletes - MontoCobrar;
end;

end.
