program ejercicio1;
{ 06/02/24
	Una empresa dispone de una estructura de datos con las ventas de su comercio. De cada venta se conoce
	 numero de venta, cantidad de productos y tipo de pago(efectivo o tarjeta).Se pide implementar un programa
	 que genere una segunda estructura con las ventas cuya cantidad de productos tenga mas digitos pares que
	 impares. En la estructura generada deben quedar almacenadas las ventas de tipo de pago efectivo antes que las
	 de tipo de pago tarjeta.
}
type

	opcionesPago = 1..2;	//Efectivo:1	Tarjeta:2
	
	venta = record
		numero : integer;
		cantidadProductos : integer;
		tipodePago : opcionesPago;
	end;
	
	lista =^ nodo;
	nodo = record
		dat : venta;
		sig : lista;
	end;
	
procedure cargarVentas(var l:lista);
begin
	//Se dispone
end;

procedure agregarAdelante(var l:lista; v:venta);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dat := v;
	nuevo^.sig := l;
	l:=nuevo;
end;

procedure agregarAtras(var l,ult:lista; v:venta);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dat := v;
	nuevo^.sig := nil;
	if(l = nil)then
		l:=nuevo
	else
		ult^.sig := nuevo;
	ult := nuevo;
end;

function masPares(num:integer):boolean;
var
	pares,impares:integer;
begin
	pares:=0;
	impares:=0;
	while(num > 0)do begin
		if((num MOD 2)=0)then
			pares := pares + 1
		else
			impares := impares + 1;
		num := num DIV 10;
	end;
	masPares := (pares > impares);
end;

procedure generarLista2(var l2:lista; l:lista);
var
	ult:lista;
begin
	ult:=l2;
	while(l <> nil)do begin
		if(masPares(l^.dat.cantidadProductos)=true)then begin
			if(l^.dat.tipodePago = 2)then
				agregarAdelante(l2,l^.dat)
			else
				agregarAtras(l2,ult,l^.dat);
		end;
		l:=l^.sig;
	end;
end;

//Opcional
procedure generarVenta(var v:venta);
begin
	v.numero := random(100);
	if(v.numero <> 0)then begin
		v.cantidadProductos := random(1000)+1;
		v.tipodePago := random(2)+1;
	end;
end;

procedure generarLista(var l:lista);
var
	v:venta;
begin
	generarVenta(v);
	while(v.numero <> 0)do begin
		agregarAdelante(l,v);
		generarVenta(v);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while(l<>nil)do begin
		writeln(l^.dat.numero);
		writeln(l^.dat.cantidadProductos);
		writeln(l^.dat.tipodePago);
		writeln;
		l:=l^.sig;
	end;	
end;


VAR
	l,l2:lista;
BEGIN
	randomize;


	l:=nil;
	l2:=nil;
	
	cargarVentas(l); //Se dispone
	generarLista2(l2,l);

END.
