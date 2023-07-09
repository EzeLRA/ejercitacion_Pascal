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
	
	lista ^= nodo;
	nodo = record
		dato : viaje;
		siguiente : lista;
	end;

procedure definirMaximos(var in,m1,m2:real;var cod,codM1,codM2:integer);
begin
	in:=0;
	if(in > m1)then begin
		m2:=m1;
		m1:=in;
		codM2:=codM1;
		codM1:=cod;
	end else
	if(in > m2)then	begin
		m2:=in;
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
		cod:=l^.dato.codigo;
		while((l<>nil)AND(cod = l^.dato.codigo))do begin	//corte de control para cada codigo
			//cuenta los recorridos del mismo codigo sumando para dar el total
			km:=km+l^.dato.recorridosKM;
			cod:=l^.dato.codigo;
			
			l:=l^.siguiente;
		end;
	end;
end;

VAR
	
BEGIN

END.

