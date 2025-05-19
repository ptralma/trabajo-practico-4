SELECT
    p.nombre,
    COUNT(r.id_receta) AS cantidad_recetas
FROM Pacientes p
LEFT JOIN Recetas r ON p.id_paciente = r.id_paciente
GROUP BY p.nombre;
ORDER BY cantidad_recetas DESC;
