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
	
procedure calcularEdad(a:alumno;var min1:integer;var min2:integer;var nom1:cadena20;var nom2:cadena20);
begin
	if(a.anio_nacimiento<min1)then		
	begin
			min2:=min1;
			min1:=a.anio_nacimiento;
			
			nom2:=nom1;
			nom1:=a.nombre;
	end
	else
		if(a.anio_nacimiento<=min2)then
		begin
			min2:=a.anio_nacimiento;
			
			nom2:=a.nombre;
		end;
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
	i,contIncs,DNIsPar,edad1,edad2:integer;
	porcentaje:real;
	a:alumno;
	nomM1,nomM2:cadena20;
BEGIN
	contIncs:=0;
	DNIsPar:=0;
	
	edad1:=2023;
	edad2:=2023;
	
	nomM1:=' ';
	nomM2:=' ';
	
	for i:=1 to 5 do
	begin
		leerAlumnos(a,contIncs);
		calcularEdad(a,edad1,edad2,nomM1,nomM2);
		procesarDNIs(a,DNIsPar);
	end;
	
	porcentaje:=((DNIsPar*100)/contIncs);
	writeln('De lo leido se obtuvo el porcentaje de tantos DNIs con digitos pares: ',porcentaje:0:2,'%');
	writeln('Y se registro a las personas de mayor edad con el siguiente orden:');
	writeln('El primero mayor de edad: ',nomM1);
	writeln('El segundo mayor de edad: ',nomM2);
END.
