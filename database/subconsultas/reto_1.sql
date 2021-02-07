USE tienda;

SELECT nombre, apellido_paterno
FROM empleado
WHERE id_puesto IN (SELECT id_puesto FROM puesto WHERE salario > 10000);

SELECT id_empleado, min(total_ventas), max(total_ventas)
FROM (SELECT clave, id_empleado, count(*) AS total_ventas FROM venta GROUP BY clave, id_empleado) AS ventas_tmp
GROUP BY id_empleado;

SELECT clave, id_articulo FROM venta
WHERE id_articulo IN (SELECT id_articulo FROM articulo WHERE precio > 5000);