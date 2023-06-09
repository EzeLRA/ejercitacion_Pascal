program ejercitacion2;
{
* Actividad:
* 
* Una carniceria necesita analizar la informacion de las compras a frigorificos realizadas en el ultimo año.
* 
* 	A.Realizar un modulo que cargue en una estructura de datos adecuada la informacion de las compras.
* 	  De cada compra se conoce el monto abonado, el mes en que se realizo la compra,la cantidad de kilos de carne comprados
* 	  y el nombre del frigorifico. Por cada frigorifico puede haber mas de una compra. La informacion de las compras debe
*	  quedar ordenada por nombre de frigorifico. La lectura finaliza al ingresar la compra con 100 kilos de carne, que debe
* 	  procesarse.
* 
* 	B.Realizar un programa que utilice la informacion generada en el inciso A. e informe:
* 		b1.Los nombres de los frigorificos para los cuales el monto total facturado supero los 45.000 pesos.
* 		b2.Los dos meses en los que se realizaron menor cantidad de compras.
* 		b3.El monto promedio de las compras realizadas durante el mes de septiembre.
}
type
	cadena20 = String[20];
	mesNum = 1 .. 12;
	
	Compra = record
		frigorificoNom: cadena20;
		montoAbonado : integer;
		mes: mesNum;
		kilosCarne : real;
	end;
	
	listaCompra =^ Nodo;
	
	Nodo = record
		elemento : Compra;
		siguiente : listaCompra;
	end;

procedure inicializarLista(var l:listaCompra);
begin
	l:=nil;
end;

procedure agregarCompra(var l:listaCompra);
var
	nuevaCompra:listaCompra;
begin
	new(nuevaCompra);
	
	//Ingresa elementos readln();
	
	if(l = nil)then l:=nuevaCompra;
	else begin
		nuevaCompra^.siguiente := l;
		l:= nuevaCompra;
	end;
	
end;

BEGIN
END.
