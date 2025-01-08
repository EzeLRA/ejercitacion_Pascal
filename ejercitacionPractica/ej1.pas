program ej;
//
//	Se dispone de la informacion de los productos de un supermercado. De cada producto se tiene
//	 codigo,nombre,rubro(1..20) y precio. Se pide implementar un programa que guarde en una estructura adecuada los
//	 productos de los rubros que tengan 10 productos.
//
const
	dimF = 20;
type
	rubros = 1..dimF;
	producto = record
		codigo:integer;
		nombre:String;
		rubro:rubros;
		precio:real;
	end;
	lista =^ nodo;
	nodo = record
		dat : producto;
		sig : lista;
	end;
	
	rubrosProductos = array[rubros] of lista;
	rubrosCant = array[rubros] of integer;
	
procedure cargarProductos(var l:lista); //Se dispone
begin
end;

procedure iniciarVector(var r:rubrosProductos);
var
	i:integer;
begin	
	for i:=1 to dimF do
		r[i] := nil;
end;

procedure iniciarVContador(var r:rubrosCant);
var
	i:integer;
begin	
	for i:=1 to dimF do
		r[i] := 0;
end;

procedure agregarAdelante(var l:lista; p:producto);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dat := p;
	nuevo^.sig := l;
	l:= nuevo;
end;

//Opcional
procedure liberarLista(var l: lista);
var
  aux: lista;
begin
  while l <> nil do begin
    aux := l;
    l := l^.sig;
    dispose(aux);
  end;
end;


procedure procesarProductos(l:lista;var r:rubrosProductos);
var
	v:rubrosCant; i:integer;
begin
	iniciarVContador(v);
	//Cuenta los productos
	while(l <> nil)do begin
		agregarAdelante(r[l^.dat.rubro],l^.dat);
		v[l^.dat.rubro] := v[l^.dat.rubro] + 1;
		l:=l^.sig;
	end;
	//Filtra los rubros con cantidad exacta de 10 productos
	for i:= 1 to dimF do begin
		if(v[i] <> 10)then
			liberarLista(r[i]);	
	end;
	
end;


VAR
	Lpri:lista; Lnuevo:rubrosProductos;
BEGIN
	Lpri:=nil;
	cargarProductos(Lpri);
	iniciarVector(Lnuevo);
	procesarProductos(Lpri,Lnuevo);
END.
