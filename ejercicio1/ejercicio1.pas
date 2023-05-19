program ejercicio1.pas;
{
    Se lee desde teclado una secuencia de sitios turísticos hasta que llegue el sitio con
	nombre ‘fin’. De cada sitio se conoce: nombre, provincia a la que pertenece,
	cantidad de actividades, cantidad de personas que lo visitaron en un mes.
	 Se pide:
	 	a) El nombre del sitio con mayor cantidad de actividades.
		b) La cantidad de sitios con más de 20.000 personas que lo visitaron en un
		mes.
}

const
	visitantesMax = 20000;
	palabraClave = 'fin';

type
	cadena20 = String[20];
	
	sitio_reg = record
		nombre: cadena20;
		provinciaOrigen: cadena20;
		cant_actividades:integer;
		cant_visitas:integer;
	end;
		
var
	sitios: sitio_reg;
	max,cantSitios:integer;
	maxNom:String;

procedure procesarMaximo(var max:integer; var maxNom:String; actividades:integer; nombre:String);
begin
	if(actividades>=max)then begin
			max := actividades;
			maxNom := nombre;
		end;
	
end;

procedure contarSitios(var cantSitios:integer;maxVisitantes:integer; visitantes:integer);
begin
	if(visitantes>maxVisitantes)then
		cantSitios:= cantSitios + 1;
end;
		
		
		
BEGIN
	cantSitios:=0;
	max:=-1;
	maxNom:=' ';
	
	writeln('Ingrese el nombre de un sitio:');
	readln(sitios.nombre);
	
	while(sitios.nombre <> palabraClave)do begin
		writeln('Ingrese la cantidad de actividades:');
		readln(sitios.cant_actividades);
		
		writeln('Ingrese la cantidad de visitantes en un mes:');
		readln(sitios.cant_visitas);
		
		procesarMaximo(max,maxNom,sitios.cant_actividades,sitios.nombre);
		contarSitios(cantSitios,visitantesMax,sitios.cant_visitas);
			
		writeln(' ');
		writeln('Ingrese el nombre de un sitio:');
		readln(sitios.nombre);
	end;
	
	writeln(' ');
	writeln('Se registro el sitio con mas actividades como:');
	writeln(maxNom);
	writeln('Con: ',max);
	writeln('Y se registro ',cantSitios,' sitios con mas de 20000 visitas al mes');
	
END.
