program ejercicio2.pas;
{	
	a.  Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
		la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
		procesarse. Nota: utilizar el módulo leer.
	
	b.  Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
		nombre del alumno con mejor promedio.
}
type
	str20 = string[20];
	alumno = record
		codigo : integer;
		nombre : str20;
		promedio : real;
	end;

procedure procesarMaximo(var max:real; promedio:real; nombre:str20; var nombreMax:str20);
begin
	if(promedio>max)then
	begin
		max:=promedio;
		nombreMax:= nombre;
	end;
end;

procedure contar(var contador:integer);
begin
	contador:=contador+1;
end;

procedure leer(var alu : alumno);
begin
	write('Ingrese el código del alumno: ');
	readln(alu.codigo);
	if(alu.codigo <> 0) then begin
		write('Ingrese el nombre del alumno: '); readln(alu.nombre);
		write('Ingrese el promedio del alumno: '); readln(alu.promedio);
	end;
	writeln(' ');
end;

{ declaración de variables del programa principal }
var
	aluTotal: integer;
	promedioM: real;
	a : alumno;
	nombreM: str20; 
	
{ cuerpo del programa principal }
BEGIN
	nombreM:=' ';
	promedioM:=-1;
	aluTotal:= 0;
	leer(a);
	while(a.codigo <> 0)do
	begin
		contar(aluTotal);
		procesarMaximo(promedioM,a.promedio,a.nombre,nombreM);
		leer(a);
	end;
	writeln('Se han leido ',aluTotal,' alumnos.');
	writeln('Y el nombre del alumno con mayor promedio es ',nombreM);
END.
