SELECT 
    m.nombre AS medicamento,
    COUNT(r.id_receta) AS total_recetas,
    med.nombre AS medico,
    p.nombre AS paciente
FROM medicamentos m
JOIN recetas r ON m.id_medicamento = r.id_medicamento
JOIN medicos med ON r.id_medico = med.id_medico
JOIN pacientes p ON r.id_paciente = p.id_paciente
GROUP BY m.nombre, med.nombre, p.nombre
ORDER BY total_recetas DESC;
