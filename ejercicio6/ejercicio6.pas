program ejercicio6.pas;
{
	Realizar un programa que lea y almacene la información de 400 alumnos ingresantes de una Facultad. 
	De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
	año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
		a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
		b) Apellido y nombre de los dos alumnos de mayor edad.
}
type
	anio= 0..2000;
	cadena20=String[20];
	entero10= 0..10;
	
	alumno = record
		nro_inscripcion:entero10;
		dni:integer;
		apellido:cadena20;
		nombre:cadena20;
		anio_nacimiento:anio;
	end;
	
procedure leerAlumnos(var a:alumno;var cont:integer);
begin
	writeln('Ingrese numero de inscripcion:');
	readln(a.nro_inscripcion);
	writeln('Ingrese nombre del ingresante:');
	readln(a.nombre);
	writeln('Ingrese apellido del ingresante:');
	readln(a.apellido);
	writeln('Ingrese anio de nacimiento del ingresante:');
	readln(a.anio_nacimiento);
	writeln('Ingrese DNI del ingresante:');
	readln(a.dni);
	writeln(' ');
	cont:=cont+1;
end;

procedure procesarDNIs(a:alumno;var Pares:integer);	{Procesa los DNIs compuestos solo con digitos pares}
var
	dig,digPar:integer;
begin
	dig:=0;
	digPar:=0;
	while((a.dni DIV 10)<> 0)do
	begin
		if(((a.dni MOD 10)MOD 2) = 0)then
			digPar:=digPar+1;
		dig:=dig+1;
		
		a.dni:=a.dni DIV 10;
	end;
	
	if(((a.dni MOD 10)MOD 2) = 0)then
			digPar:=digPar+1;
	dig:=dig+1;
	
	if(dig=digPar)then	{Cuenta los DNIs con todos los digitos pares}
		Pares:=Pares+1;	
	
end;


var
	i,contIncs,DNIsPar:integer;
	porcentaje:real;
	a:alumno;
BEGIN
	contIncs:=0;
	DNIsPar:=0;
	for i:=1 to 5 do
	begin
		leerAlumnos(a,contIncs);
		procesarDNIs(a,DNIsPar);
	end;
	porcentaje:=((DNIsPar*100)/contIncs);
	writeln(porcentaje:0:2,'%');
END.
