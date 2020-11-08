USE tienda;

SELECT nombre, COUNT(*) FROM puesto GROUP BY nombre;
SELECT nombre, SUM(salario) FROM puesto GROUP BY nombre;
SELECT id_empleado, COUNT(clave) FROM venta GROUP BY id_empleado;
SELECT id_articulo, COUNT(*) FROM venta GROUP BY id_articulo;