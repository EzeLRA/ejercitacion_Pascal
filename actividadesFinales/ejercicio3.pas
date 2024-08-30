program ejercicio3;
{
	Un comercio dispone de las ventas realizadas para sus productos. De cada venta se conoce numero de producto(1..300),
	 cantidad vendida y nombre de producto. Ademas el comercio cuenta con una tabla con el precio por unidad de cada uno de los 
	 300 productos. Se pide calcular el nombre del producto con el cual el comercio obtuvo la menor ganancia.
	 
	NOTA: las ventas estan ordenadas por numero de producto. Un producto pudo ser vendido 0,1 o mas veces.
	
	
}

//El programa no cumple con el inciso , calcula por orden de nombre y no por numero de producto.

type
	
	numerosProducto = 1..300;
	
	preciosProductos = array[numerosProducto]of real; //Se dispone
	
	venta = record
		numeroProducto : numerosProducto;
		cantVendida : integer;
		nombre : String;
	end;
	
	lista =^ nodo;
	
	nodo = record
		dat : venta;
		sig : lista;
	end;
	
procedure cargarPrecios(var v:preciosProductos);
begin
	//Se dispone
end;

procedure cargarVentas(var l:lista);
begin
	//Se dispone
end;

function calcularGanancia(cant:integer; montoT:real):real;
begin
	calcularGanancia := montoT * cant;
end;

procedure procesarMin(var montoM:real; var nomM:String; monto:real; nom:String);
begin
	if(montoM > monto)then begin
		montoM := monto;
		nomM := nom;
	end;
end;

procedure procesarLista(l:lista; vPrecios:preciosProductos; var nom:String);
var
	nomAux:String;
	montoMin,monto:real;
begin
	montoMin := 99999;
	while(l <> nil)do begin
		monto := 0;
		nomAux := l^.dat.nombre;
		while(l <> nil)and(l^.dat.nombre = nomAux)do begin
			monto := monto + calcularGanancia(l^.dat.cantVendida,vPrecios[l^.dat.numeroProducto]);
			l := l^.sig;
		end;
		procesarMin(montoMin,nom,monto,nomAux);
	end;
end;

VAR
	l:lista;
	v:preciosProductos;
	nom:String;
BEGIN
	cargarPrecios(v); //Se dispone
	cargarVentas(l); //Se dispone
	procesarLista(l,v,nom);
	writeln(nom); //Opcional
END.
