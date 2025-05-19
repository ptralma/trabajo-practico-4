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

CREATE TABLE medicamentos (
    id_medicamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
);

INSERT INTO medicamentos (nombre) VALUES
('Paracetamol'),
('Ibuprofeno'),
('Amoxicilina');

CREATE TABLE recetas (
    id_receta SERIAL PRIMARY KEY,
    id_medico INT,
    id_paciente INT,
    id_medicamento INT,
    fecha DATE,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_medicamento) REFERENCES medicamentos(id_medicamento)
);

INSERT INTO recetas (id_medico, id_paciente, id_medicamento, fecha) VALUES
(2, 1, 1, '2024-01-15'),
(2, 1, 1, '2024-02-10'),
(2, 1, 2, '2024-03-05'),
(1, 1, 3, '2024-04-01');

SELECT
    medicamentos.nombre AS medicamento,
    COUNT(recetas.id_receta) AS cantidad_prescripciones
FROM
    recetas
JOIN
    medicamentos ON recetas.id_medicamento = medicamentos.id_medicamento
WHERE
    recetas.id_medico = 2
GROUP BY
    medicamentos.id_medicamento, medicamentos.nombre
HAVING
    COUNT(recetas.id_receta) > 1
ORDER BY
    medicamentos.nombre;
