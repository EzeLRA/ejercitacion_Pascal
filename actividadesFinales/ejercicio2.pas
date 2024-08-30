program ejercicio2;
{
	Un comercio dispone de la informacion de sus clientes. De cada cliente se conoce su DNI,fecha y monto de la compra.
	 La informacion esta ordenada por el DNI del cliente. Se pide implementar un programa que genere una estructura de datos que
	 contenga DNI del cliente,la cantidad de compras que realizo y el monto total de las compras, solo con los clientes que realizaron
	 mas de 5 compras.
}

type 
	
	cliente = record
		DNI:integer;
		fecha:integer;
		montoCompra:real;
	end;
	
	compra = record
		DNI:integer;
		cant:integer;
		montoTotal:real;
	end;
	
	lista =^ nodo;
	nodo = record
		dat : cliente;
		sig : lista;
	end;
	
	lista2 =^ nodo2;
	nodo2 = record
		dat : compra;
		sig : lista2;
	end;

procedure cargarLista(var l:lista); 
begin
	//Se dispone
end;

procedure cargarDatos(var l:lista2; dni,cant:integer; monto:real);
var
	nuevo:lista2;
begin
	new(nuevo);
	nuevo^.dat.DNI := dni;
	nuevo^.dat.cant := cant;
	nuevo^.dat.montoTotal := monto;
	nuevo^.sig := l;
	l:=nuevo;
end;

procedure generarLista2(var l2:lista2; l:lista);
var
	dni,cant:integer;
	mont:real;
begin
	cant := 0;
	mont := 0;
	while(l <> nil)do begin
		dni := l^.dat.DNI;
		while(l <> nil)and(dni = l^.dat.DNI)do begin
			cant := cant + 1;
			mont := mont + l^.dat.montoCompra;
			l := l^.sig;
		end;
		if(cant > 5)then
			cargarDatos(l2,dni,cant,mont);
		cant := 0;
		mont := 0;
	end;
end;

VAR
	l1:lista;
	l2:lista2;
BEGIN
	cargarLista(l1); //Se dispone
	generarLista2(l2,l1);
END.
