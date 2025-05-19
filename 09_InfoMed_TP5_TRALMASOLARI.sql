#Forma 1
SELECT id_medico, COUNT(*) AS cantidad_recetas
FROM recetas
GROUP BY id_medico
ORDER BY cantidad_recetas DESC;

#Forma 2
SELECT m.nombre, COUNT(*) AS cantidad_recetas
FROM recetas r
JOIN medicos m ON r.id_medico = m.id_medico
GROUP BY m.nombre
ORDER BY cantidad_recetas DESC;

