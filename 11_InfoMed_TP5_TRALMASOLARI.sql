SELECT
	Pacientes.nombre AS paciente,
    Consultas.fecha,
    Consultas.diagnostico
FROM
    Consultas
JOIN
    Pacientes ON Consultas.id_paciente = Pacientes.id_paciente
JOIN
    Medicos ON Consultas.id_medico = Medicos.id_medico
WHERE
Consultas.fecha BETWEEN '2024-08-01' AND '2024-08-31'
ORDER BY
    Consultas.fecha;

