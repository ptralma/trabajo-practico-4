CREATE INDEX idx_ciudad_normalizada
ON pacientes (TRIM(LOWER(ciudad)));
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'pacientes';
