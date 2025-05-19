SELECT
    p.nombre,
    c.fecha,
    c.diagnostico
FROM Pacientes p
JOIN Consultas c ON p.id_paciente = c.id_paciente
WHERE (p.id_paciente, c.fecha) IN (
    SELECT id_paciente, MAX(fecha)
    FROM Consultas
    GROUP BY id_paciente);
