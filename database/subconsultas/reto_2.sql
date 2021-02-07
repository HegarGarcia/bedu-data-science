USE tienda;

SELECT nombre, apellido_paterno
FROM venta
JOIN empleado USING (id_empleado)
ORDER BY clave;

SELECT nombre
FROM articulo
JOIN venta USING (id_articulo);

SELECT clave, sum(precio) AS total
FROM venta
JOIN articulo USING (id_articulo)
GROUP BY clave;