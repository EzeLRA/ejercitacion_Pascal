{
cargar lista compras
ultima compra: 100k carne - SI debe procesarse
informacion ordenada por nombre frigorifico
más de una compra por frigorifico
nos pide informar:
- frigorificos cuyo monto total supere 45000
- 2 meses con menor cantidad de compras
- monto promedio compras durante el mes de septiembre
    promedio: monto-total-sep / cant-compras-sep
}
program parcial;
type
    compra = record
        monto: real;
        mes: 1..12;
        kilos: integer;
        frigorifico: string;
    end;

    lista= ^nodo

    nodo= record
        dato: compra;
        sig: lista;
    end;

    contador = array [1..12] of integer;

procedure insertarOrdenado (var L:lista; valor:compra);
var
  	nuevo,actual,ant:lista;
begin
	new (nuevo); 
	nuevo^.dato := valor; 
	nuevo^.sig:=nil;
	if (L = nil) then
		L:= nuevo
	else begin
		actual:= L; ant:=L;
		while (actual <> nil) and (actual^.dato.frigorifico < nuevo^.dato.frigorifico) do   
		begin
			ant:=actual;
			actual:= actual^.sig;
		end;
		if (actual = L) then 
		begin
			nuevo^.sig:= L;
			L:= nuevo;
		end
		else
		begin
			ant^.sig:=nuevo;
			nuevo^.sig:= actual;
		end
	end;
end;

procedure inicializarContador(var vc: contador);
var
    i: integer;
begin
    for i := 1 to 12 do begin
        vc[i]:= 0;
    end;
        
end;
procedure cargarRegistro(var c: compra);
begin
    readln(c.kilos);
    readln(c.monto);
    readln(c.mes);
    readln(c.frigorifico);
end;

procedure cargarCompras(var l:lista);
var
    com: compra
begin
    repeat
        cargarRegistro(com);
        insertarOrdenado(l, com);
    until (com.kilos = 100);
end;

procedure recorrerLista(l: lista, var vcont: contador);
var
    factual: string;
    mtotal: real;
    totalsep: real;
begin
    totalsep := 0;
    while (l<>nil) do begin
        facual:= l^.dato.frigorifico;
        mtotal:= 0;
        while (l<>nil) and (factual = l^.dato.frigorifico) do begin
            mtotal:= mtotal + l^.dato.monto;
            vcont[l^.dato.mes] := vcont[l^.dato.mes] + 1;
            if (l^.dato.mes = 9) then totalsep:= totalsep + l^.dato.monto;
            l:= l^.sig;
        end;
        if (mtotal > 45000) then writeln('supera 4500: ',factual);
    end;
    writeln('Monto promedio de las compras de septiembre: ', totalsep/vcont[9])
end;

procedure minimosMeses(vc: contador);
var
    i: integer;
    min1, min2, mesmin1, mesmin2: integer;
begin
    min1:= 9999;
    min2:= 9999;
    for i := 1 to 12 do begin
        if (vc[i]<min1) then begin
            min2 := min1;
            mesmin2 := mesmin1;
            min1 := vc[i];
            mesmin1 := i;
        end
        else if (vc[i]<min2) then
            min2 := vc[i];
            mesmin2 := i;
        end;
    end;
    write('Los meses con menos compras fueron: ',mesmin1,' y ',mesmin2);
end;

{Prog ppal}
var
    listaCompras: lista;
    vcontador: contador;
begin
    listaCompras := nil;
    cargarCompras(listaCompras);
    inicializarContador(vcontador);
    recorrerLista(listaCompras,vcontador);
    minimosMeses(vcontador);
end.
