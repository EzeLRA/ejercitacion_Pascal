program ejercicio3.pas;
{
	Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
	consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
	cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
	y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
	la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
		a. Realizar un módulo que lea la información de una línea de teléfono.
		b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
		módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
	del cliente.
	
	Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.
}
const
	costoMinutos = 3.40;
	costoMB = 1.35;
type
	linea = record
		num_Tel:integer;
		min_Consum:integer;
		MB_Mensuales:real;
	end;
	cliente = record
		codigoCliente: integer;
		lineas_Cant: integer
	end;

{Procedimientos}

procedure leerLinea(var lineas:linea);
begin
	write('Ingrese numero de telefono: ');
	readln(lineas.num_Tel);
	write('Ingrese los minutos consumidos: ');
	readln(lineas.min_Consum);
	write('Ingrese los MB consumidos: ');
	readln(lineas.MB_Mensuales);
	writeln(' ');
end;

procedure procesarCliente(var usuario:cliente; var lineas:linea);
var
	MBTotal,FacturaCompleta:real;
	minutosTotal,i:integer;
begin
	minutosTotal:=0;
	MBTotal:=0;
	
	write('Ingrese codigo del cliente: ');
	readln(usuario.codigoCliente);
	writeln('Ingrese la cantidad de lineas:');
	readln(usuario.lineas_Cant);
	writeln(' ');
	for i:=1 to usuario.lineas_Cant do
	begin
		leerLinea(lineas);
		minutosTotal:=minutosTotal+lineas.min_Consum;
		MBTotal:=MBTotal+lineas.MB_Mensuales;
	end;
	FacturaCompleta := (minutosTotal * costoMinutos) + (MBTotal * costoMB);
	writeln('El total a cobrar sera de ',FacturaCompleta:0:2 ,' $');
	writeln('Por la cantidad de ',minutosTotal,' minutos usados en total y ',MBTotal:0:2 ,' MB consumidos en total.');
end;

{Programa Principal}

var
	numTel:linea;
	x:cliente;
BEGIN
	procesarCliente(x,numTel);
END.
