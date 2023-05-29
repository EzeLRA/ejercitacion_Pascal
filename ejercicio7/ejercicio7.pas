program ejercicio7.pas;
{	Programa calculadora(BINARIO a DECIMAL)
* 
* 	Ejercitacion con numeros binarios 
* 	
* 		Proceso 1: Pasaje ordinario de Binario a Decimal
* 			En cuenta con lo siguiente:
* 
* 			Decimal = DigitoBinario*2^n + (...)  <= Sumatoria con tamaño dependiente de la cadena ingresada
* 			n = posicion en la cadena binaria en base a 2  
* 	
}

function potencia_dos(x:integer):integer;
var
	i,salida:integer;
begin
	salida:=1;
	if(x>=1)then
	begin
		for	i:=1 to x do
			salida:=salida*2;
	end;
	potencia_dos:=salida;
end;

function devolverDecimal(cadena:String):integer;
var
	x,i:integer;
begin
	x:=0;
	
	for i:=1 to length(cadena) do
	begin

		if(cadena[i]='1')then	//De la cadena que lee , opera el 1 para generar el resultado. Sumando segun el tamaño capaz.
		begin
			x:= x + (1*potencia_dos(length(cadena)-i));
		end;
		
	end;
	
	devolverDecimal:=x;
	
end;

var
	x:String;
BEGIN
	
	writeln('Ingrese una cadena binaria:');
	readln(x);
	writeln('Se obtuvo el numero: ',devolverDecimal(x));
END.
