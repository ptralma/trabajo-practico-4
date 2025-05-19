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

SELECT nombre, matricula
FROM medicos
WHERE especialidad_id = 4;
