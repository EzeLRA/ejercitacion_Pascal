program ejercicio5.pas;
{
	Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
		a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
		b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
		c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
		desde la mitad más uno hacia la última posición.
		d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
		posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
		que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
		e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c. 
}
const
	dimF = 7;	{Determina el tamaño fijo del arreglo o vector}
	
type
	arreglo = array[1 .. dimF] of integer;

procedure agregarElementos(var v:arreglo;var dimL:integer);
var
	x:integer;
begin
	for x:=1 to dimF do
	begin
		writeln('Ingrese un numero');
		readln(v[x]);
		dimL:=dimL+1;
	end;
end;

procedure recorrerAdelante(v:arreglo;dimL:integer);
var
	x:integer;
begin
	for x:=1 to (dimL-1) do
	begin
		write(v[x],',');
	end;
	write(v[dimL]);
end;

procedure recorrerAtras(v:arreglo;dimL:integer);
var
	x:integer;
begin
	for x:=dimL downto 2 do
	begin
		write(v[x],',');
	end;
	write(v[1]);
end;

procedure recorrerMitad(v:arreglo;dimL:integer);	{Imprime la mitad del arreglo incluyendo el ultimo}
var
	x:integer;
begin
	if((dimL MOD 2)=0)then
	begin
		for x:=1 to ((dimL DIV 2)-1) do
		begin
			write(v[x],',');
		end;
		write(v[(dimL DIV 2)]);
	end
	else
	begin
		for x:=1 to (dimL DIV 2) do
		begin
			write(v[x],',');
		end;
		write(v[(dimL DIV 2)+1]);
	end;
	
end;
{
procedure recorrerMitad(v:arreglo;dimL:integer);	//Alternativa al anterior
var
	x:integer;
begin
		for x:=1 to ((dimL DIV 2)-1) do
		begin
			write(v[x],',');
		end;
		write(v[(dimL DIV 2)]);
	
end;
}

procedure recorridoDefinido2(v:arreglo;x:integer;y:integer);
var
	i:integer;
begin
	if(x<y)then	//Lectura hacia adelante
	begin
		for i:=x to (y-1) do
		begin
			write(v[i],',');
		end;
		write(v[y]);
	end else
	if(x>y)then	//Lectura hacia atras
	begin
		for i:=x downto y+1 do
		begin
			write(v[i],',');
		end;
		write(v[y]);
	end else		//Lectura de la primer entrada(Si X e Y son iguales)
		write(v[x]);
	
end;

procedure recorridoDefinido(v:arreglo);
var
	x,y:integer;
begin
	writeln('Ingrese un valor para x');
	readln(x);
	writeln('Ingrese un valor para y');
	readln(y);
	write('Y se ingresaron los siguientes numeros desde x hasta y:');
	recorridoDefinido2(v,x,y);
	writeln(' ');
end;

var
	dimL: integer;	{Determina el espacio ocupado del arreglo o vector}
	vector : arreglo;
BEGIN
	dimL:=0;
	agregarElementos(vector,dimL);
	writeln('Se ocupo la capacidad del vector hasta ',dimL);
	//Recorrido hacia adelante
	write('Y se ingresaron los siguientes numeros en orden ascendente:');
	recorrerAdelante(vector,dimL);
	writeln(' ');
	//Recorrido hacia atras
	write('Y se ingresaron los siguientes numeros en orden descendente:');
	recorrerAtras(vector,dimL);
	writeln(' ');
	//Recorrido parcial
	write('Y se ingresaron los siguientes numeros de la mitad del vector:');
	recorrerMitad(vector,dimL);    
	writeln(' ');
	//Recorrido definido   
	recorridoDefinido(vector); 
END.
