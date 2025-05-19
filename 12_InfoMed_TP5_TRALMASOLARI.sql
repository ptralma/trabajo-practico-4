SELECT
    Medicamentos.nombre AS medicamento,
    COUNT(Recetas.id_receta) AS cantidad_prescripciones
FROM
    Recetas
JOIN
    Medicamentos ON Recetas.id_medicamento = Medicamentos.id_medicamento
WHERE
    Recetas.id_medico = 2
GROUP BY
    Medicamentos.id_medicamento, Medicamentos.nombre
HAVING
    COUNT(Recetas.id_receta) > 1
ORDER BY
    Medicamentos.nombre;
