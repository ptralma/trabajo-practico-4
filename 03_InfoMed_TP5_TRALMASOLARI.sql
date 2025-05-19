SELECT * FROM pacientes WHERE nombre = 'Luciana Gómez';
UPDATE pacientes
SET calle = 'Calle Corrientes',
    numero = '500',
    ciudad = 'Buenos Aires'
WHERE nombre = 'Luciana Gómez';
SELECT * FROM pacientes WHERE nombre = 'Luciana Gómez';
