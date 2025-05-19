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
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
);

INSERT INTO consultas (id_medico, id_paciente, fecha, diagnostico) VALUES
(3, 1, '2024-08-15', 'Gripe'),
(3, 1, '2024-08-20', 'Alergia'),
(1, 1, '2024-07-10', 'Control');

SELECT 
    m.nombre,
    COUNT(DISTINCT c.id_paciente) AS total_pacientes
FROM medicos m
LEFT JOIN consultas c ON m.id_medico = c.id_medico
GROUP BY m.nombre
ORDER BY total_pacientes DESC;
