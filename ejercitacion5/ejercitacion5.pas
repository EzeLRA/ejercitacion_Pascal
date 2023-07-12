program ejercitacion4;
{
	Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020. 
	De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de destino y 
	kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto y 
	para un mismo código de auto pueden existir 1 o más viajes. Se pide:
		a. Informar los dos códigos de auto que más kilómetros recorrieron.
		b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de 
		viaje.
}
type
	viaje = record
		numero : integer;
		codigo : integer;
		direccionOrigen : String;
		direccionDestino : String;
		recorridosKM : real;
	end;
	
	lista =^ nodo;
	
	nodo = record
		dato : viaje;
		siguiente : lista;
	end;

//Inciso A
procedure definirMaximos(entrada:real;var m1,m2:real;cod:integer;var codM1,codM2:integer);
begin
	entrada:=0;
	if(entrada > m1)then begin
		m2:=m1;
		m1:=entrada;
		codM2:=codM1;
		codM1:=cod;
	end else
	if(entrada > m2)then	begin
		m2:=entrada;
		codM2:=cod;
	end;
end;

procedure informarCodigos(l:lista);
var
	cod,codM1,codM2:integer;
	km,km1,km2:real;
begin
	km1:=0;
	km2:=0;
	while(l<>nil)do begin
		km:=0;
		cod:=l^.dato.codigo;
		while((l<>nil)AND(cod = l^.dato.codigo))do begin	//corte de control para cada codigo
			
			km:=km+l^.dato.recorridosKM;
			cod:=l^.dato.codigo;
			
			l:=l^.siguiente;
		end;
		definirMaximos(km,km1,km2,cod,codM1,codM2);
	end;
	writeln(codM1,codM2,km1,km2);
end;


//Inciso B
procedure agregarOrdenado(var l: lista; v:viaje);
var
	actual,anterior,nuevo:lista;	//Utiliza listas auxiliares para referenciar a las direcciones de l para desplazarse y insertar elementos
begin
	new (nuevo);
	nuevo^.dato:=v;
	nuevo^.siguiente:=nil;
	
	if (l = nil) then 	//Si es el primer elemento
		l:= nuevo
	else begin
		actual:= l; 
		anterior:=l;
		while (actual <> nil)AND(actual^.dato.numero <> nuevo^.dato.numero) do		//Condicion a ordenar en la lista (En este caso de menor a mayor y en grupos)
		begin
			anterior:=actual;
			actual:= actual^.siguiente;	//Recorre hasta ubicarse
		end;
	
	
		if (actual = l) then
		begin
			nuevo^.siguiente:= l; 
			l:= nuevo;
		end
		else
		begin
			anterior^.siguiente:= nuevo; 
			nuevo^.siguiente:= actual;
		end;
	end;
End;

procedure seleccionarViajes(l:lista;var lN:lista);
begin
	while(l<>nil)do begin
		if(l^.dato.recorridosKM < 5)then
			agregarOrdenado(lN,l^.dato);
		l:=l^.siguiente;
	end;
end;

VAR
	lPri,lB:lista;
BEGIN
	lPri:=nil;
	lB:=nil;
	informarCodigos(lPri);		//Inciso A
	seleccionarViajes(lPri,lB);	//Inciso B
END.

