-- Buenos Aires
UPDATE pacientes SET ciudad = 'Buenos Aires'
WHERE TRIM(LOWER(ciudad)) IN (
  'bs aires', 'buenos aires', 'buenos   aires', 'buenos aires ',
  'buenos aiers', '  buenos aires'
);

-- Córdoba
UPDATE pacientes SET ciudad = 'Córdoba'
WHERE TRIM(LOWER(ciudad)) IN ('cordoba', 'córdoba', 'córdobá', 'córodba');

-- Mendoza
UPDATE pacientes SET ciudad = 'Mendoza'
WHERE TRIM(LOWER(ciudad)) IN ('mendoza', 'mendzoa');

-- Rosario
UPDATE pacientes SET ciudad = 'Rosario'
WHERE TRIM(LOWER(ciudad)) = 'rosario';

-- Santa Fe
UPDATE pacientes SET ciudad = 'Santa Fe'
WHERE TRIM(LOWER(ciudad)) = 'santa fe';

SELECT
    id_paciente,
    nombre,
    fecha_nacimiento,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_nacimiento)) AS edad,
    numero,
    calle,
    ciudad
FROM pacientes
ORDER BY id_paciente;
