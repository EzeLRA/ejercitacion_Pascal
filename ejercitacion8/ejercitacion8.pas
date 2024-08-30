program tercerFecha;
const
	dimF = 18;
type
	codigoEquipo = 1..20;
	//calificacion = 0..10;
	calificaciones = array[1..dimF]of real;
	equiposEdad = array[codigoEquipo]of integer;
	
	jugador = record
		codigo : integer;
		apellido : String;
		nombres : String;
		codEquipo : codigoEquipo;
		califiFechas : calificaciones;
		anioNacimiento : integer;
	end;
	
	Lista =^ Nodo;
	Nodo = record
		dat : jugador;
		sig : Lista;
	end;

procedure inicializarV(var V:equiposEdad);
var
	i:integer;
begin
	for i:=0 to 20 do
	begin
		V[i] := 0;
	end;
end;

procedure cargarJugadores(var ListaJug:Lista); //Se dispone
begin
end;

procedure seleccionarJugadores(naci:integer; c:codigoEquipo; var V:equiposEdad);
begin
	if((2022-naci)<30)then
		V[c]:=V[c]+1;
end;

function calcularProm(cali:calificaciones):real;
var
	i,dimPosfechas,fechasCont:integer;
	prom:real;
begin
	prom:=0;
	dimPosfechas:=0;
	fechasCont:=0;
	for i:=1 to dimF do begin	//Verifica si tiene que recorrerse completamente el vector
		if(cali[i]<>0)then begin
			dimPosfechas := i;
			fechasCont := fechasCont + 1;
		end;
	end;
		
	for i:=1 to dimPosfechas do
		prom := prom + cali[i];
	prom := prom / fechasCont;
	calcularProm:= prom;
end;

function participoMas(cali:calificaciones):boolean;
var
	i,fechas:integer;
begin
	fechas:=0;
	for i:=1 to dimF do begin
		if(cali[i]<>0)then
			fechas:=fechas+1;
	end;
	if(fechas > 9)then
		participoMas:=true
	else
		participoMas:=false;
end;

procedure determinarMin(var c1,c2:integer; var m1,m2:real; codP:integer; fechas:calificaciones);
var
	participacion:boolean;
	promObt:real;
begin
	participacion := participoMas(fechas);
	promObt := calcularProm(fechas);
	
	if(participacion = true)then begin
		if(promObt < m1)then begin
			m2:=m1;
			m1:=promObt;
			c2:=c1;
			c1:=codP;
		end else if(promObt < m2)then begin
			m2:=promObt;
			c2:=codP;
		end;
	end;
end;

//Inciso C
function dosPares(cod:integer):boolean;
var
	digP:integer;
begin
	digP:=0;
	while((cod<>0)AND(digP<2))do begin
		if(((cod MOD 10)MOD 2) = 0)then
			digP:=digP+1;
		cod := cod DIV 10;
	end;
	if(digP=2)then
		dosPares:=true
	else
		dosPares:=false;
end;

function verifiNacimiento(anio:integer):boolean;
begin
	if((anio >= 1987)AND(anio <= 1991))then
		verifiNacimiento := true
	else
		verifiNacimiento := false;
end;

procedure insertarOrdenado(var L:Lista; j:jugador);
var
	nuevo,ant,act:Lista;
begin
	new(nuevo);
	nuevo^.dat:=j;
	nuevo^.sig:=nil;
	
	if(L = nil)then
		L:= nuevo
	else begin
		ant:=L;
		act:=L;
		while((act <> nil)AND(act^.dat.codigo <> nuevo^.dat.codigo))do
		begin
			ant := act;
			act := act^.sig;
		end;
		
		if (act = L) then
		begin
			nuevo^.sig:= L; 
			L:= nuevo;
		end
		else
		begin
			ant^.sig:= nuevo; 
			nuevo^.sig:= act;
		end;
	end;
end;

procedure procesarJugadores(var Ln:Lista; Lj:Lista;var c1,c2:integer; var m1,m2:real; var Vedad:equiposEdad);
begin
	while(Lj <> nil)do begin
		seleccionarJugadores(Lj^.dat.anioNacimiento,Lj^.dat.codEquipo,Vedad);	//A
		determinarMin(c1,c2,m1,m2,Lj^.dat.codigo,Lj^.dat.califiFechas);			//B
		
		if((verifiNacimiento(Lj^.dat.anioNacimiento)=true)AND(dosPares(Lj^.dat.codigo)=true))then	//C
			insertarOrdenado(Ln,Lj^.dat);
		
		Lj:=Lj^.sig;
	end;
end;

procedure informarEquipos(V:equiposEdad);
var
	i:integer;
begin
	for i:=1 to 20 do
		writeln(i,': ', V[i]);
end;


VAR
	cod1,cod2:integer;
	m1,m2:real;
	Vedad:equiposEdad;
	Lj,Ln:Lista;
BEGIN
	m1:=11;
	m2:=11;
	Ln:=nil;
	Lj:=nil;
	inicializarV(Vedad);
	cargarJugadores(Lj);	//Se dispone
	procesarJugadores(Ln,Lj,cod1,cod2,m1,m2,Vedad);	//C
	informarEquipos(Vedad);	//A
	writeln(m1,m2);		//B
END.
