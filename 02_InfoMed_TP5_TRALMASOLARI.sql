CREATE OR REPLACE VIEW vista_pacientes_con_edad AS
SELECT
    id_paciente,
    nombre,
    fecha_nacimiento,
    ciudad,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_nacimiento)) AS edad
FROM pacientes;
SELECT * FROM vista_pacientes_con_edad;
