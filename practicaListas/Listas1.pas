program vectores;
const
	dimF=10;
type
	vector = array[1..dimF]of integer;

{
*	Inicializar vector 
}

procedure inicializarV(var v:vector);
var
	i:integer;
begin
	for i:=1 to 10 do
		v[i]:=0;
end;

{
*	Ordenar vector 
}

procedure ordenarMayorMenor(var v:vector);
var
	i,j,aux:integer;
begin
 	for i:=1 to dimF-1 do begin		//Recorrido e intercambio
		for j:=i+1 to dimF do begin
			if(v[i]<v[j])then begin
				aux := v[i];
				v[i]:=v[j];
				v[j]:=aux; 
			end;
		end;
	end;
end;
procedure ordenarMenorMayor(var v:vector);
var
	i,j,aux:integer;
begin
 	for i:=1 to dimF-1 do begin		//Recorrido e intercambio
		for j:=i+1 to dimF do begin
			if(v[i]>v[j])then begin
				aux := v[i];
				v[i]:=v[j];
				v[j]:=aux; 
			end;
		end;
	end;
end;

{
*	Carga aleatoria (Completo)
}

procedure cargarAleatorio(var v:vector;entrada:integer;var dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		v[i]:=random(entrada);
		dimL:=dimL+1;
	end;
end;

{
*	Busqueda(Completa)
}

procedure buscarMax(v:vector);
var
	Max,i:integer;
begin
	Max:=-1;
	for i:=1 to dimF do begin
		if(Max < v[i])then
			Max:=v[i];
	end;
	writeln('maximo:',Max);
end;
procedure buscarMin(v:vector);
var
	Min,i:integer;
begin
	Min:=9999;
	for i:=1 to dimF do begin
		if(Min > v[i])then
			Min:=v[i];
	end;
	writeln('minimo:',Min);
end;
procedure buscarDato(v:vector;entrada:integer);
var
	encontro:boolean;
	i:integer;
begin
	encontro:=false;
	for i:=1 to dimF do begin
		if(v[i] = entrada)then
			encontro:=true;
	end;
	if(encontro = true)then
		writeln('encontrado')
	else
		writeln('no encontrado');
end;
procedure buscarEliminar(var v:vector;entrada:integer);
var
	encontro:boolean;
	i:integer;
begin
	encontro:=false;
	for i:=1 to dimF-1 do begin
		if(encontro=true)then
			v[i]:=v[i+1];
		if(v[i] = entrada)then begin
			v[i]:=v[i+1];
			encontro:=true;
		end else
			encontro:=false;
		
	end;
	if(encontro = true)then
		writeln('encontrado')
	else
		writeln('no encontrado');
end;
{
*	Impresion de vector 
}

procedure imprimirV(v:vector);
var
	i:integer;
begin
	for i:=1 to dimF do
		writeln(v[i]);
end;



function par(v:vector;dl:integer):boolean;
var
	i:integer;
	pares:integer;
	impares:integer;
	dig:integer;
	parV:integer;
	imparV:integer;
begin
	parV:=0;
	imparV:=0;
	for i:=1 to dl do begin 
		pares:=0;
		impares:=0;
		while(v[i]>0)do begin
			dig:=v[i] MOD 10;
			if((dig MOD 2)=0)then
				pares:=pares+1
			else
				impares:=impares+1;
			v[i]:=v[i] DIV 10 ;
		end;
		if(pares>impares)then
			parV:=parV+1
		else
			imparV:=imparV+1;
		
		pares:=0;
		impares:=0;
	end;
	par:=(parV>imparV);
end;

VAR
	dimL:integer;
    v:vector;
BEGIN
	dimL:=0;
    inicializarV(v);
    cargarAleatorio(v,40,dimL);
    ordenarMenorMayor(v);
    
    if(par(v,dimL) = true)then
		writeln('Vector par')
	else
		writeln('Vector impar');
	
	//imprimirV(v);
	//buscarMax(v);
	//buscarMin(v);
	//buscarDato(v,24);
	//buscarEliminar(v,24);
	imprimirV(v);
END.
