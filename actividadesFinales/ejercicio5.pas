program ejercicio5;
{
	Una inmobiliaria de la ciudad de La Plata necesita un programa para administrar informacion sobre los inmuebles que tuvo alquilados en el
	 2016. Para ello se dispone de la informacion de los inmuebles. De cada inmueble se conoce: codigo de inmueble,
	 tipo de inmueble(1:monoambiente,2:departamento,3:casa,4:local), DNI del dueño , DNI del inquilino y precio del alquiler.
     La informacion esta almacenada de manera ordenada por DNI del dueño. 
	
	Procesar e Informar:
	
	1.Para cada dueño la cantidad de inmuebles que tuvo alquilados con precio de alquiler superior a 5000.
	
	2.El precio de alquiler promedio de aquellos inmuebles tipo departamento.
}

type
	
	inmueblesTipos = 1..4;
	
	inmueble = record
		codigo : integer;
		tipo : inmueblesTipos;
		DNIduenio : integer;
		DNIinquilino : integer;
		precioAlquiler : real;
	end;
	
	lista =^ nodo;
	nodo = record
		dat : inmueble;
		sig : lista;
	end;
	
procedure cargarInmuebles(var l:lista);
begin
	//Se dispone
end;

procedure procesarLista(l:lista);
var
	dni:integer;
	//1
		cant:integer;
	//2
		prom:real; cantP:integer;
begin
	
	cantP:=0;
	prom:=0;
	
	while(l <> nil)do begin
		
		cant:=0;
		
		dni := l^.dat.DNIduenio;
		
		while(l <> nil)and(dni = l^.dat.DNIduenio)do begin
			
			if(l^.dat.precioAlquiler > 5000)then
				cant := cant + 1;
			
			if(l^.dat.tipo = 2)then begin
				prom := prom + l^.dat.precioAlquiler;
				cantP := cantP + 1;
			end;
			
			l := l^.sig;
		
		end;
		
		writeln(cant);	//1
	
	end;
	
	writeln(prom / cantP);	//2
	
end;


VAR
	l:lista;
BEGIN
	l:=nil;
	cargarInmuebles(l);	//Se dispone
	procesarLista(l);	//1 , 2
END.

