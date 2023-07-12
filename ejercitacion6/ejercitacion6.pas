program ejercitacion6;
{
	Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
	peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
	programa que analice esta información, determine e informe:
		a. Para cada embarazada, la semana con mayor aumento de peso.
		b. El aumento de peso total de cada embarazada durante el embarazo.
}

const
	dimF=42;

type
	
	pesoDiaSemana = array[1..dimF]of real;
	
	paciente = record
		nombre : String;
		apellido : String;
		pesos : pesoDiaSemana;
	end;
	
	lista=^nodo;
	nodo = record
		dat:paciente;
		sig:lista;
	end;

procedure determinarMaxSemana(V:pesoDiaSemana;var M:real);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		if(M < V[i])then
			M := V[i];
	end;
end;

procedure informarPesoMax(p:paciente);
var
	pesoMax:real;
begin
	pesoMax:=-1;
	determinarMaxSemana(p.pesos,pesoMax);
	writeln(pesoMax);
end;

procedure informarPromedioAumentoPeso(p:paciente);
var
	pesoPromedio:real;
	i:integer;
begin
	pesoPromedio:=0;
	for i:=1 to dimF do begin
		pesoPromedio := pesoPromedio + (p.pesos[1] - p.pesos[i]);
	end;
	writeln(pesoPromedio);
end;

VAR
	listaDispone:lista;	//Lista que dispone la maternidad
BEGIN
	while(listaDispone <> nil)do begin
		informarPesoMax(listaDispone^.dat);					//Inciso A
		informarPromedioAumentoPeso(listaDispone^.dat);		//Inciso B
	end;
END.
