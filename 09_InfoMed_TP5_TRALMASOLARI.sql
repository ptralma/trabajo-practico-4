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

CREATE TABLE recetas (
    id_receta SERIAL PRIMARY KEY,
    id_medico INT,
    id_paciente INT,
    fecha DATE,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
);

INSERT INTO recetas (id_medico, id_paciente, fecha) VALUES
(1, 1, '2024-01-15'),
(1, 1, '2024-02-10'),
(2, 1, '2024-03-05');

-- Forma 1
SELECT id_medico, COUNT(*) AS cantidad_recetas
FROM recetas
GROUP BY id_medico
ORDER BY cantidad_recetas DESC;

-- Forma 2
SELECT m.nombre, COUNT(*) AS cantidad_recetas
FROM recetas r
JOIN medicos m ON r.id_medico = m.id_medico
GROUP BY m.nombre
ORDER BY cantidad_recetas DESC;
