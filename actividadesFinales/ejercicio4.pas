program ejercicio4;
{
	Realice un modulo que lee numeros enteros entre 0 y 100 y devuelva un vector que contenga la cantidad de
	 ocurrencias de los valores leidos. La lectura finaliza cuando se lee el valor 0.
}
const
	dimF = 100;

type
	
	valores = 1..dimF;
	
	vectorContador = array[valores]of integer;
	
	
procedure iniciarV(var v:vectorContador);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i] := 0;
end;

procedure cargarNumeros(var v:vectorContador);
var
	num:integer;
begin
	readln(num);
	while(num > 0)do begin
		v[num] := v[num] + 1;
		readln(num);
	end;
end;

VAR
	v:vectorContador;
BEGIN
	iniciarV(v);
	cargarNumeros(v);
END.
