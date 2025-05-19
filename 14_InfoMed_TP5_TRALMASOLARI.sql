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
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_medicamento) REFERENCES medicamentos(id_medicamento)
);

INSERT INTO recetas (id_medico, id_paciente, id_medicamento, fecha) VALUES
(2, 1, 1, '2024-01-15'),
(2, 1, 1, '2024-02-10'),
(2, 1, 2, '2024-03-05'),
(1, 1, 3, '2024-04-01');

SELECT 
    m.nombre,
    COUNT(r.id_receta) AS cantidad_recetas
FROM medicamentos m
JOIN recetas r ON m.id_medicamento = r.id_medicamento
GROUP BY m.nombre
ORDER BY cantidad_recetas DESC
LIMIT 1;
