SELECT
    m.nombre,
    COUNT(r.id_receta) AS cantidad_recetas
FROM Medicamentos m
JOIN Recetas r ON m.id_medicamento = r.id_medicamento
GROUP BY m.nombre
ORDER BY cantidad_recetas DESC
LIMIT 1;
