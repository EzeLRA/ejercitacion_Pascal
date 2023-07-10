program ejercicio4;
{
	Implementar un programa que lea y almacene información de clientes de una empresa aseguradora 
	automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada 
	(1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente con código 
	1122, el cual debe procesarse. 
	La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el 
	cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene 
	contratada. 
	Una vez finalizada la lectura de todos los clientes, se pide:
		a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente 
		por su seguro automotriz (monto básico + monto adicional).
		b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
		c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la 
		estructura.
	 
	Se toma que los cliente al leer no pueden llegar a repetirse(debido al monto mensual que abona,si se repitiera tendria que sumar el monto)
	La lista no se encuentra ordenada	
}
const
	clienteFinal = 1122;
	montoAdicional = 100; //valor en suposicion
type
	cadena20=String[20];
	entero1a6= 1..6;
	
	cliente = record
		codigoCliente:integer;
		DNI:integer;
		apellido:cadena20;
		nombre:cadena20;
		codigoPoliza:entero1a6;
		montoBasico:real;
	end;
	
	lista=^nodo;
	
	nodo=record
		elementos:cliente;
		siguiente:lista;
	end;
	
procedure inicializarLista(var l:lista);
begin
	l:=nil;
end;

procedure leerClientes(var c:cliente);
begin
	writeln('Ingrese codigo del cliente:'); readln(c.codigoCliente);
	writeln('Ingrese DNI del cliente:'); readln(c.DNI);
	writeln('Ingrese nombre del cliente:'); readln(c.nombre);
	writeln('Ingrese apellido del cliente:'); readln(c.apellido);
	writeln('Ingrese codigo de poliza:'); readln(c.codigoPoliza);
	writeln('Ingrese el monto que abona:'); readln(c.montoBasico);
	writeln(' ');
end;

//Inciso A
procedure informarCliente(c:cliente);
begin
	writeln(' ');
	writeln('El codigo del cliente es: ',c.codigoCliente);
	writeln('El DNI del cliente: ',c.DNI);
	writeln('El nombre del cliente: ',c.nombre);
	writeln('El apellido del cliente: ',c.apellido);
	writeln('El codigo de poliza: ',c.codigoPoliza);
	writeln('El monto completo que abona mensualmente:', c.montoBasico + montoAdicional);
end;
//Inciso A
procedure informarClientes(l:lista);
begin
	while(l<>nil)do begin
		informarCliente(l^.elementos);
		l:=l^.siguiente;
	end;
end;

procedure agregarElemento(var l:lista; c:cliente);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.siguiente:=nil;
	nuevo^.elementos:=c;
	
	if(l = nil)then
		l := nuevo
	else begin
		nuevo^.siguiente:=l;
		l:=nuevo;
	end;
end;

procedure cargarClientes(var l:lista);
var
	cl:cliente;
begin
	repeat
		leerClientes(cl);
		agregarElemento(l,cl);
	until(l^.elementos.codigoCliente = clienteFinal);
end;

//Inciso B
function descomponerDNI(c:cliente):boolean;
var
	nueves,numero:integer;
begin
	nueves:=0;
	numero := c.DNI;
	while(numero <> 0 )do begin
		if((numero MOD 10)=9)then
			nueves:=nueves+1;
		numero:=numero DIV 10;
	end;
	if(nueves >= 2)then
		descomponerDNI:=true
	else
		descomponerDNI:=false;
end;
//Inciso B
procedure informarClientesNueve(l:lista);
begin
	while(l<>nil)do begin
		if(descomponerDNI(l^.elementos) = true)then
			informarCliente(l^.elementos);
		l:=l^.siguiente;
	end;
end;

//Inciso C
function buscar(var l:lista;codigo:integer):boolean;
var
	encontrado:boolean;
	actual,anterior:lista;
begin
	encontrado:=false;
	actual:=l;
	
	while((actual <> nil)AND(encontrado = false))do begin
		anterior:=actual;
		actual:= actual^.siguiente;
		if(codigo=actual^.elementos.DNI)then
			encontrado := true;
	end;
	
	if(encontrado=true)then begin
		if (actual <> nil) then
			if (actual = l) then
				l:= l^.siguiente
			else
				anterior^.siguiente:= actual^.siguiente;

		dispose (actual);
	end;
	
	buscar:=encontrado;
	
end;
//Inciso C
procedure buscarEliminar(var l:lista);
var
	codigo:integer;
begin
	writeln('Ingrese el codigo a eliminar: '); readln(codigo);
	
	if(buscar(l,codigo)=true)then begin
		writeln('Se encontro el elemento');
	end
	else
		writeln('No se encontro el elemento');
end;

VAR
	l:lista;
BEGIN
	cargarClientes(l);
	informarClientes(l);
	informarClientesNueve(l);
	buscarEliminar(l);
END.
