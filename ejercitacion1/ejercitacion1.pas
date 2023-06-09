program ejercitacion1;
const
	DNIfin = '33555444';
type
	genCod = array[1..5]of Integer;
	genero = 1..5;
	cadena20 = String[20];
	persona = record
		DNI : cadena20;
		nombre : cadena20;
		apellido : cadena20;
		edad : integer;
		codigoG : genero;
	end;
	
	Lista =^ nodo;
	nodo = record
		elemento : persona;
		siguiente : Lista;
	end;

//Modulos para la lista:
procedure inicializarLista(var L:Lista);
begin
	L:=nil;
end;

procedure llenarLista(var L:Lista ; p:persona);
var
	nuevo:Lista;
begin

	repeat
	
	new(nuevo);
	
	writeln(' ');
	writeln('Ingrese el nombre:');
	readln(p.nombre);
	nuevo^.elemento.nombre := p.nombre;
	writeln('Ingrese el apellido:');
	readln(p.apellido);
	nuevo^.elemento.apellido := p.apellido;
	writeln('Ingrese el DNI:');
	readln(p.DNI);
	nuevo^.elemento.DNI := p.DNI;
	writeln('Ingrese la edad:');
	readln(p.edad);
	nuevo^.elemento.edad := p.edad;
	writeln(' ');
	writeln('Ingrese el codigo de genero del 1 al 5:');
	writeln('1.Drama');
	writeln('2.Romance');
	writeln('3.Accion');
	writeln('4.Suspenso');
	writeln('5.Terror');
	readln(p.codigoG);
	nuevo^.elemento.codigoG := p.codigoG;
	
	nuevo^.siguiente := nil;
	
	if(L=nil)then L:= nuevo
	else begin
		nuevo^.siguiente:= L;
		L:=nuevo;
	end;
	
	until(p.DNI = DNIfin);
	writeln(' ');
end;

procedure procesarDNIs(L:Lista;var p:integer);
var
	i,pares,impares:integer;
begin
	pares:=0;
	impares:=0;
	for i:=1 to length(L^.elemento.DNI) do
	begin
		
		if(((SmallInt(L^.elemento.DNI[i])) MOD 2)= 0)then pares:=pares+1
		else impares:=impares+1;
	
	end; 
	
	if(pares>impares)then p:=p+1;
	
end;

procedure contarCodigos(L:Lista;var r:genCod);
begin
	case L^.elemento.codigoG of
	1:r[1]:=r[1]+1;
	2:r[2]:=r[2]+1;
	3:r[3]:=r[3]+1;
	4:r[4]:=r[4]+1;
	5:r[5]:=r[5]+1;
	end;
end;

procedure imprimirCodigo(r:genCod);
var
	pos,max,i:integer;
begin
	pos:=0;
	max:=-1;
	for i:=1 to 5 do
	begin
		if(max < r[i])then
		begin
			max := r[i];
			pos := i;
		end;
	end;
	
	writeln('El codigo de genero mas elegido fue: ',pos);
	
end;

procedure procesarLista(L:Lista);
var
	r:genCod;
	i,dniPares:integer;
begin
	
	for i:=1 to 5 do
		r[i]:=0;
	
	dniPares:=0;
	
	while(L<>nil)do
	begin
		
		procesarDNIs(L,dniPares);
		contarCodigos(L,r);
		
		L:=L^.siguiente;
	end;
	
	imprimirCodigo(r);
	
	writeln('Hay ',dniPares,' DNIs compuestos por numeros pares');
	
end;

procedure buscarDNI(var L:Lista;p:persona);
var
	actual,ant:Lista;
begin
	actual:=L;
	writeln('Ingrese un DNI para borrarlo de la lista:');
	readln(p.DNI);
	
	while(actual<>nil)do
	begin
		if(actual^.elemento.DNI <> p.DNI)then begin
			ant:=actual;
			actual:= actual^.siguiente;
		end
		else begin
			if(actual = L)then 
				L:= L^.siguiente
			else
				ant^.siguiente:=actual^.siguiente;
			dispose(actual);
			actual:=ant;
		end;
	end;
end;

procedure recorrerLista(L:Lista);
var
	i:integer;
begin
	i:=1;
	writeln(' ');
	writeln('Ahora la lista queda armada como');
	while(l<>nil)do
	begin
		writeln('DNI Nro',i,': ',L^.elemento.DNI);
		L:= L^.siguiente;
		i:=i+1;
	end;
end;

var
	l:Lista;
	p:persona;
	
BEGIN
	inicializarLista(L);
	
	llenarLista(L,p);
	
	procesarLista(L);
	
	buscarDNI(L,p);
	
	recorrerLista(L);
	
END.
