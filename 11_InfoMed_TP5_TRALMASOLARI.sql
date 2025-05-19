CREATE TABLE medicos (
    id_medico SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    matricula VARCHAR(50),
    especialidad_id INT
);

INSERT INTO medicos (nombre, matricula, especialidad_id) VALUES
('Dr. Juan Pérez', 'MP12345', 4),
('Dra. Ana López', 'MP67890', 4),
('Dr. Carlos Gómez', 'MP54321', 3);

CREATE TABLE consultas (
    id_consulta SERIAL PRIMARY KEY,
    id_medico INT,
    id_paciente INT,
    fecha DATE,
    diagnostico VARCHAR(200),
    snomed_codigo VARCHAR(50),
    tratamiento TEXT,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
);

INSERT INTO consultas (id_medico, id_paciente, fecha, diagnostico, snomed_codigo, tratamiento) VALUES
(3, 1, '2024-08-15', 'Gripe', 'SNOMED-123', 'Reposo y paracetamol'),
(3, 1, '2024-08-20', 'Alergia', 'SNOMED-456', 'Antihistamínicos'),
(1, 1, '2024-07-10', 'Control', 'SNOMED-789', 'Ninguno');

SELECT
    pacientes.nombre AS paciente,
    consultas.fecha,
    consultas.diagnostico
FROM
    consultas
JOIN
    pacientes ON consultas.id_paciente = pacientes.id_paciente
JOIN
    medicos ON consultas.id_medico = medicos.id_medico
WHERE
    consultas.fecha BETWEEN '2024-08-01' AND '2024-08-31'
ORDER BY
    consultas.fecha;
