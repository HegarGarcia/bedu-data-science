USE tienda;
SELECT AVG(salario) FROM puesto;
SELECT COUNT(*) FROM articulo WHERE nombre LIKE "%Pasta%";
SELECT MAX(salario), MIN(salario) FROM puesto;
SELECT SUM(salario) FROM (SELECT salario FROM puesto ORDER BY id_puesto DESC LIMIT 5) as tmp_puesto;
