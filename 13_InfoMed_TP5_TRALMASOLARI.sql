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
    id_medicamento INT,
    fecha DATE,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
);

INSERT INTO recetas (id_medico, id_paciente, fecha) VALUES
(1, 1, '2024-01-15'),
(1, 1, '2024-02-10'),
(2, 1, '2024-03-05');

SELECT 
    p.nombre,
    COUNT(r.id_receta) AS cantidad_recetas
FROM pacientes p
LEFT JOIN recetas r ON p.id_paciente = r.id_paciente
GROUP BY p.nombre;
