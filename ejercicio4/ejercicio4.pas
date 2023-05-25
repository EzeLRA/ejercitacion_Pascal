program ejercicio4.pas;
{
	En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
	irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
	Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
	Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
		a) La cantidad de galaxias de cada tipo.
		b) La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
		porcentaje que esto representa respecto a la masa de todas las galaxias.
		c) La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
		d) El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.
}
const
	masaCompleta = 100000; {Valor de ejemplo , aun que en escalas reales es inmenso para agregarlo con exactitud}
	
type
	clases = array [1..4] of integer;
	
	galaxias = record
		nombre : String;
		clase : integer;
		masa : real;
		distancia : real;	
	end;


function leerGalaxias(var objeto:galaxias):integer;
begin
	writeln('Ingrese el nombre de la galaxia:');
	readln(objeto.nombre);
	writeln('Ingrese la clasificacion de la galaxia:');
	writeln('1.Eliptica');
	writeln('2.Espiral');
	writeln('3.Lenticular');
	writeln('4.Irregular');
	readln(objeto.clase);
	
	case objeto.clase of
	1:leerGalaxias:=1;
	2:leerGalaxias:=2;
	3:leerGalaxias:=3;
	4:leerGalaxias:=4;
	else
	writeln('El tipo de galaxia no se identifica');
	end;
	writeln(' ');
end;





var
	i:integer;
	galax:galaxias;
	clasesCant:clases;
	
BEGIN
	for i:=1 to 4 do
	begin
		clasesCant[i]:=0;
	end;

	for i:=1 to 3 do	{Solo se leen 3 galaxias}
	begin
		clasesCant[leerGalaxias(galax)]:=clasesCant[leerGalaxias(galax)]+1;
	end;
	
	writeln(clasesCant[1]);
END.
