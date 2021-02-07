USE tienda;
SELECT * FROM empleado WHERE id_puesto = 4;
SELECT * FROM puesto WHERE salario > 10000;
SELECT * FROM articulo 	WHERE precio > 1000 AND iva > 100;
SELECT * FROM venta WHERE id_articulo IN (135, 963) AND id_empleado IN (835, 369);