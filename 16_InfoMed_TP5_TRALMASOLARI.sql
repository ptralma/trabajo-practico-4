SELECT 
    m.nombre AS medico,
    p.nombre AS paciente,
    COUNT(c.id_consulta) AS total_consultas
FROM medicos m
JOIN consultas c ON m.id_medico = c.id_medico
JOIN pacientes p ON c.id_paciente = p.id_paciente
GROUP BY m.nombre, p.nombre
ORDER BY m.nombre, p.nombre;
