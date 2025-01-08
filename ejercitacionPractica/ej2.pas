{
   Se dispone de la informacion de los participantes inscriptos a una carrera
   (a lo sumo 5000). De cada participante se tiene DNI,nombre,apellido,categoria(1..5)
   y fecha de inscripcion.Se pide implementar un programa que guarde en una estructura adecuada
   los participantes de aquellas categorias que posean a lo sumo 50 inscriptos. Se sabe que cada 
   participante se puede anotar en una sola categoria.
}
program ej;
const
	dimF = 5000;
	dimF2 = 5;
	dimF3 = 50;
type
	categorias = 1..dimF2;
	participante = record
		dni:integer;
		nombre:String;
		apellido:String;
		categoria:categorias;
		fechaInscripcion:integer;
	end;
	participantes = array[1..dimF]of participante;
	participantesNuevo = array[1..dimF3]of participante;
	
	participantesN = record
		dat : participantesNuevo;
		dL : integer;
	end;
	
	vectorCategorias = array[categorias]of ^participantesN;

procedure cargarParticipantes(var p:participantes;var dl:integer);
begin
	//Se dispone
end;

procedure iniciarV(var v:vectorCategorias);
var
	i:categorias;
begin
	for i:=1 to dimF2 do begin
		new(v[i]);
		v[i]^.dL := 0;
	end;
end;

procedure agregarElemento(var v:participantesNuevo;var dl:integer;p:participante);
begin
	if(dl < dimF3)then begin
		dl := dl + 1;
		v[dl] := p;
	end;
end;

procedure procesarListado(var v:participantes;dl:integer;var v2:vectorCategorias);
var
	i:integer;
	j:categorias;
begin
	//Procesa el vector principal
	for i:=1 to dl do begin
		agregarElemento(v2[v[i].categoria]^.dat,v2[v[i].categoria]^.dL,v[i]);
	end;
	//Filtra las categorias
	for j:=1 to dimF2 do begin
		if(v2[j]^.dL <> 50)then
			dispose(v2[j]);
	end;
end;

VAR
	v1:participantes;	dL:integer;
	v2:vectorCategorias;

BEGIN
	dL:=0;
	cargarParticipantes(v1,dL);
	iniciarV(v2);
	procesarListado(v1,dL,v2);
END.

