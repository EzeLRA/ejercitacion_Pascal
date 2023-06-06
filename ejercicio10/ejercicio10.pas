program ejercicio10.pas;

type
	cadena = string[9];
	producto = record
		codigo: integer;
		descripcion: cadena;
		precio: real;
	end;
	
	puntero_producto = ^producto;

var
	p: puntero_producto;
	prod: producto;

BEGIN
	writeln(sizeof(p), ' bytes(p)');
	writeln(sizeof(prod), ' bytes(prod)');
		
		new(p);
	
	writeln(sizeof(p), ' bytes(p)');
		p^.codigo := 1;
		p^.descripcion := 'nuevo producto';
	writeln(sizeof(p^), ' bytes(p^)');
		p^.precio := 200;
	writeln(sizeof(p^), ' bytes(p^)');
	prod.codigo := 2;
	prod.descripcion := 'otro nuevo producto';
	writeln(sizeof(prod), ' bytes(prod)');
END.
