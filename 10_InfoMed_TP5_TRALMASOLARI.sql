SELECT
    Consultas.id_consulta,
    Consultas.fecha,
    Pacientes.nombre AS paciente,
    Medicos.nombre AS medico,
    Consultas.diagnostico,
    Consultas.snomed_codigo,
    Consultas.tratamiento
FROM
    Consultas
JOIN
    Pacientes ON Consultas.id_paciente = Pacientes.id_paciente
JOIN
    Medicos ON Consultas.id_medico = Medicos.id_medico
WHERE
    Consultas.id_medico = 3
    AND Consultas.fecha BETWEEN '2024-08-01' AND '2024-08-31'
ORDER BY
    Consultas.fecha;
