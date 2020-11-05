USE tienda;

CREATE VIEW puesto AS
SELECT empleado.nombre as empleado, puesto.nombre as puesto
FROM empleado
JOIN puesto 
USING (id_puesto);

CREATE VIEW articulo_vendido_empleado AS
SELECT empleado.nombre as empleado, articulo.nombre as articulo
FROM empleado
JOIN venta USING (id_empleado)
JOIN articulo USING (id_articulo);

CREATE VIEW ventas_por_puesto AS
SELECT puesto.nombre, count(venta.clave) as total
FROM puesto
JOIN empleado USING (id_puesto)
JOIN venta USING (id_empleado)
GROUP BY puesto.nombre;