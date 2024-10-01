-- ✏️ Actividad: Mi primera tabla
CREATE DATABASE mi__bd;

















-- ✏️ Actividad tabla Empleados

-- Crea la tabla 'empleados' con las columnas especificadas
CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,            -- Columna 'id' como entero, autoincremental, y clave primaria
    nombre VARCHAR(50) NOT NULL,                   -- Columna 'nombre' para el nombre del empleado, máximo 50 caracteres, no nulo
    apellido VARCHAR(50) NOT NULL,                 -- Columna 'apellido' para el apellido del empleado, máximo 50 caracteres, no nulo
    edad INT NOT NULL,                            -- Columna 'edad' para la edad del empleado, entero, no nulo
    salario DECIMAL(10, 2) NOT NULL,               -- Columna 'salario' para el salario del empleado, decimal con hasta 10 dígitos y 2 decimales, no nulo
    fecha_contratacion DATE NOT NULL               -- Columna 'fecha_contratacion' para la fecha en que el empleado fue contratado, tipo DATE, no nulo
);
-- Es para ver la tabla creada
SELECT * FROM mi__bd.empleados;
-- FIN DE ACTIVIDAD

















-- ✏️ Actividad : Aplicando DDL 
-- 1. Modifica la columna 'edad' para que no pueda tener valores nulos
ALTER TABLE empleados
MODIFY COLUMN edad INT NOT NULL;  -- Cambia la columna 'edad' para que sea un entero y no acepte valores nulos
-- Es para verificar que en la columna edad, en la columna Null, aparezca NO, lo que indica que no permite valores nulos.
DESCRIBE empleados;
SHOW COLUMNS FROM empleados;



-- 2. Modifica la columna 'salario' para que tenga un valor predeterminado de 0 en lugar de nulo
ALTER TABLE empleados
MODIFY COLUMN salario DECIMAL(10, 2) NOT NULL DEFAULT 0;    -- Cambia la columna 'salario' para que tenga un valor por defecto de 0
-- En la fila de salario, deberías ver que la columna ahora tiene un valor por defecto de 0.00 y no permite valores nulos (NO).
DESCRIBE empleados;
SHOW COLUMNS FROM empleados;



-- 3. Agrega una columna llamada 'departamento' de tipo VARCHAR(50) para almacenar el departamento
ALTER TABLE empleados
ADD COLUMN departamento VARCHAR(50) NOT NULL DEFAULT '';   -- Añade una nueva columna 'departamento' para almacenar el nombre del departamento
-- Aquí puedes ver que la nueva columna departamento aparece con el tipo varchar(50).
DESCRIBE empleados;
SHOW COLUMNS FROM empleados;








-- 4. Agrega una columna llamada 'correo_electronico' de tipo VARCHAR(100) para almacenar las direcciones de correo electrónico
ALTER TABLE empleados
ADD COLUMN correo_electronico VARCHAR(100) NOT NULL DEFAULT '';     -- Añade una nueva columna 'correo_electronico' para almacenar las direcciones de correo electrónico no permita valores nulos y tenga un valor predeterminado
-- Deberías ver la columna correo_electronico añadida al final de la lista de columnas
DESCRIBE empleados;
SHOW COLUMNS FROM empleados;







-- 5. Elimina la columna 'fecha_contratacion' de la tabla 'empleados'
ALTER TABLE empleados
DROP COLUMN fecha_contratacion;   -- Elimina la columna 'fecha_contratacion' de la tabla
-- La columna fecha_contratacion debería ser eliminada de la lista de columnas
DESCRIBE empleados;
SHOW COLUMNS FROM empleados;






-- 6. Vuelve a crear la columna 'fecha_contratacion' con un valor por default que sea la fecha actual
ALTER TABLE empleados
ADD COLUMN fecha_contratacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP;  -- Vuelve a añadir la columna 'fecha_contratacion' con un valor por defecto de la fecha actual
-- para ver resultado 
DESCRIBE empleados;







-- 7. Crea una nueva tabla llamada 'departamentos' con las siguientes columnas
CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,     -- Columna 'id' como entero, autoincremental, y clave primaria
    nombre VARCHAR(50)                     -- Columna 'nombre' para el nombre del departamento, máximo 50 caracteres
);
-- Verifica que la tabla se haya creado correctamente
SHOW TABLES;
-- DESCRIBE departamentos;
DESCRIBE departamentos;







-- 8. Agrega una nueva columna llamada 'departamento_id' en la tabla 'empleados' como clave foránea
ALTER TABLE empleados
ADD COLUMN departamento_id INT;   -- Añade una nueva columna 'departamento_id' para referenciar la tabla 'departamentos'
-- serve para la clave foránea para hacer referencia al departamento al que pertenece cada empleado.
ALTER TABLE empleados
ADD CONSTRAINT fk_departamento
FOREIGN KEY (departamento_id) REFERENCES departamentos(id);
-- para saber que la clave foránea se creo.
SHOW CREATE TABLE empleados;



-- 9. Modifica la tabla “empleados” y establece una restricción de clave foránea en la columna "departamento_id" para que haga referencia a la columna "id" en la tabla "departamentos".
-- primero elimine la clave foranea existente o crada en departamento_id
ALTER TABLE empleados
DROP FOREIGN KEY fk_departamento;

-- Volvi a crear la clave foranea a departamento
ALTER TABLE empleados
ADD CONSTRAINT fk_departamento
FOREIGN KEY (departamento_id) REFERENCES departamentos(id);
-- sirve para ver si se creo correctamente la clave foranea
SHOW CREATE TABLE empleados;





-- 10. Elimina el campo 'departamento' de la tabla 'empleados'
ALTER TABLE empleados
DROP COLUMN departamento;
-- verificar la estructura de la tabla empleados
SHOW CREATE TABLE empleados;
-- FIN DE ACTIVIDAD












-- DML (Data Manipulation Language)
-- ✏️ Actividad : Aplicando DML

-- 1.- Es para Inserta un departamento llamado "Ventas" en la tabla "departamentos".
INSERT INTO departamentos (nombre) VALUES ('Ventas');
-- Sirve para verificar que el nuevo departamento ha sido insertado correctamente
SELECT * FROM departamentos;

-- 2.- Inserte un departamento llamado "Recursos Humanos" en la tabla "departamentos".
-- Para insertar un nuevo departamento llamado "Recursos Humanos" en la tabla departamentos,
INSERT INTO departamentos (nombre) VALUES ('Recursos Humanos');
-- puedes verificar que el nuevo departamento ha sido insertado correctamente
SELECT * FROM departamentos;

-- 3.- Inserta un empleado en la tabla "empleados" con los siguientes valores
-- es para Encuentra el ID del departamento "Ventas"
SELECT id FROM departamentos WHERE nombre = 'Ventas'; -- al ejecutar el codigo el id devuelto es 1.
-- Con el id del departamento "Ventas", puedes proceder a insertar el nuevo empleado en la tabla empleados
INSERT INTO empleados (
    nombre, 
    apellido, 
    edad, 
    salario, 
    correo_electronico, 
    departamento_id
) VALUES (
    'Ana', 
    'Rodríguez', 
    28, 
    3000.00, 
    'anarodriguez@mail.com', 
    1  -- Verificación que el ID del departamento "Ventas" es 1
);
-- Verificación: Después de ejecutar la consulta, puedes verificar que el nuevo empleado ha sido insertado correctamente
SELECT * FROM empleados;

-- 4.- Primero, determina el id correspondiente al departamento "Recursos Humanos" en la tabla departamentos
SELECT id FROM departamentos WHERE nombre = 'Recursos Humanos';  -- Al ejecutar el codigo el id devuelto es 2

-- Con el id del departamento "Recursos Humanos", procede a insertar el nuevo empleado en la tabla empleados
INSERT INTO empleados (
    nombre, 
    apellido, 
    edad, 
    salario, 
    correo_electronico, 
    departamento_id
) VALUES (
    'Carlos', 
    'López', 
    32, 
    3200.50, 
    'carloslopez@mail.com', 
    2  -- Verificado que el ID del departamento "Recursos Humanos" es 2
);
-- Verificación: Después de ejecutar la consulta, puedes verificar que el nuevo empleado ha sido insertado correctamente 
SELECT * FROM empleados;

-- 5.  Inserta un empleado en la tabla "empleados" con los siguientes valores
-- Con el id del departamento "Ventas" que es 1, procede a insertar el nuevo empleado en la tabla empleados
INSERT INTO empleados (
    nombre, 
    apellido, 
    edad, 
    salario, 
    correo_electronico, 
    departamento_id
) VALUES (
    'Laura', 
    'Pérez', 
    26, 
    2800.75, 
    'lauraperez@mail.com', 
    1  -- Veificación que el ID del departamento "Ventas" es 1
);
-- Verificación: Después de ejecutar la consulta, puedes verificar que el nuevo empleado ha sido insertado correctamente
SELECT * FROM empleados;

-- 6.- Inserta otro empleado en la tabla "empleados" con los siguientes valores
-- Con el id del departamento "Recursos Humanos" que es 2, procede a insertar el nuevo empleado en la tabla empleados
INSERT INTO empleados (
    nombre, 
    apellido, 
    edad, 
    salario, 
    correo_electronico, 
    departamento_id
) VALUES (
    'Martín', 
    'González', 
    30, 
    3100.25, 
    'martingonzalez@mail.com', 
    2  -- Asumiendo que el ID del departamento "Recursos Humanos" es 2
);
-- Verificación: Después de ejecutar la consulta, puedes verificar que el nuevo empleado ha sido insertado correctamente
SELECT * FROM empleados;

-- 7. Actualiza el salario del empleado con nombre "Ana" para aumentarlo en un 10%.

-- Primero, obtén el id del empleado "Ana"
SELECT id FROM empleados WHERE nombre = 'Ana'; -- Al correr el codigo El ID de Ana es 1

-- Renombrar o quitar la Columna con Espacios Invisibles
ALTER TABLE empleados
CHANGE `    id` id INT NOT NULL AUTO_INCREMENT;
-- Para realizar actualizaciones en los datos de la tabla después de haber corregido el nombre o quitado espacios de la columna
UPDATE empleados
SET salario = salario * 1.10
WHERE id = 1;
-- Consultar Datos actualizados de tener Salario : 3000.00. al actualizar el 1.10 se modifico a 3300.00
DESCRIBE empleados;

-- 8. Crea un departamento llamado “Contabilidad”. 

-- Para agregar un nuevo departamento llamado "Contabilidad" a la tabla departamentos
INSERT INTO departamentos (nombre)
VALUES ('Contabilidad');
-- verifica que el nuevo departamento se haya agregado correctamente Ahora se debe Mostrar 3
SELECT * FROM departamentos;

-- 9. Cambia el departamento del empleado con nombre "Carlos" de "Recursos Humanos" a "Contabilidad"

-- Primero, obtén el id del departamento "Contabilidad"
SELECT id FROM departamentos WHERE nombre = 'Contabilidad';  -- el ID del departamento "Contabilidad" es 3
-- Luego, identifica el id del empleado llamado "Carlos" para actualizar su departamento_id
SELECT id FROM empleados WHERE nombre = 'Carlos';  -- el ID del empleado "Carlos" es 2

-- Ahora, actualiza el departamento_id del empleado con ID 2 para que coincida con el ID del departamento "Contabilidad"
UPDATE empleados
SET departamento_id = 3
WHERE id = 2;
-- Para asegurarte de que el cambio se realizó correctamente, me tiene que salir en Contabilidad el nombre de Carlos
SELECT * FROM empleados WHERE nombre = 'Carlos';

-- 10. Elimina al empleado con nombre "Laura"

-- verificación de su ID para asegurarte de que estás eliminando el registro correcto. 
SELECT id FROM empleados WHERE nombre = 'Laura';  -- ID es 3
-- Usar el siguiente comando para eliminar el empleado con el nombre "Laura":
DELETE FROM empleados WHERE id = 3;
-- Consultar Todos los Empleados para Verificar la Eliminación de "Laura"
SELECT * FROM empleados;

-- 11. Haga una consulta simple de los datos de la tabla empleados y verifique que se presente de la siguiente manera

-- Para realizar la consulta simple que muestre los datos de la tabla empleados en el formato que has especificado
SELECT id, nombre, apellido, edad, salario, correo_electronico
FROM empleados;
-- 11.1 Haga una consulta simple de los datos de la tabla empleados y verifique que se presente de la siguiente manera
-- Para realizar una consulta que muestre los datos de las columnas fecha_contratacion y departamento_id de la tabla empleados en el formato que has especificado
SELECT fecha_contratacion, departamento_id
FROM empleados;

-- 12. Haz una consulta simple de los datos de la tabla departamentos y verifica que se presente de la siguiente manera:
SELECT id, nombre
FROM departamentos;

-- FIN DE ACTIVIDAD













-- DML: Repaso

-- ✏️ Actividad : Práctica avanzada 

-- 1.- Para crear una tabla llamada clientescon las columnas id, nombre, y direccion
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,       -- Columna 'id' como entero, autoincremental, y clave primaria
    nombre VARCHAR(50),                      -- Columna 'nombre' para el nombre del cliente, máximo 50 caracteres
    direccion VARCHAR(100)                   -- Columna 'direccion' para la dirección del cliente, máximo 100 caracteres
);
-- Después de ejecutar el código, puedes verificar la creación de la tabla
SHOW TABLES;
-- Y para ver la estructura de la tabla
DESCRIBE clientes;

-- 2.- Para crear una tabla llamada productos con las columnas especificadas
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,    -- Columna 'id' como entero, autoincremental y clave primaria
    nombre VARCHAR(50),                   -- Columna 'nombre' para el nombre del producto, máximo 50 caracteres
    precio DECIMAL(10, 2)                 -- Columna 'precio' para el precio del producto, decimal con 10 dígitos y 2 decimales
);
-- Para asegurarte de que la tabla productos se ha creado correctamente
SHOW TABLES;
-- Para ver la estructura de la tabla productos

-- 3.- Para crear una tabla llamada ventas con las columnas especificadas
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,                -- Columna 'id' como entero, autoincremental y clave primaria
    producto_id INT,                                 -- Columna 'producto_id' para el ID del producto
    cliente_id INT,                                  -- Columna 'cliente_id' para el ID del cliente
    cantidad INT,                                    -- Columna 'cantidad' para la cantidad de productos vendidos
    precio_unitario DECIMAL(10, 2),                  -- Columna 'precio_unitario' para el precio unitario del producto
    monto_total DECIMAL(10, 2),                      -- Columna 'monto_total' para el monto total de la venta
    empleado_id INT                                  -- Columna 'empleado_id' para el ID del empleado que realizó la venta
);
-- Para asegurarte de que la tabla ventas se ha creado correctamente
SHOW TABLES;
-- Para ver la estructura de la tabla ventas
DESCRIBE ventas;

-- 5.- Para insertar un nuevo cliente en la tabla clientes
INSERT INTO clientes (nombre, direccion)
VALUES ('Juan Pérez', 'Libertad 3215, Mar del Plata');
-- Para verificar que el cliente se ha insertado correctamente
SELECT * FROM clientes;

-- 6.- Para insertar un nuevo producto en la tabla productos
INSERT INTO productos (nombre, precio)
VALUES ('Laptop', 1200.00);
-- Para asegurarte de que el producto se ha insertado correctamente
SELECT * FROM productos;

-- 7.- ara modificar la columna monto_total de la tabla ventas para que sea el resultado de multiplicar cantidad por precio_unitario
-- Asegúrate de que la columna monto_total sea de tipo DECIMAL y GENERATED ALWAYS
ALTER TABLE ventas
DROP COLUMN monto_total;
-- Luego agrega la columna calculada
ALTER TABLE ventas
ADD COLUMN monto_total DECIMAL(10,2) AS (cantidad * precio_unitario) STORED;

-- 8.- 
-- Después de insertar un nuevo registro Para verificar que la columna monto_total se ha configurado correctamente, puedes insertar o actualizar algunos datos
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES (1, 1, 2, 1200.00, 1);
-- Consulta para Verificar Datos
SELECT * FROM ventas;
-- Verificar y Ajustar la Estructura de la Tabla
DESCRIBE ventas;
-- Verifica los Datos
SELECT * FROM ventas;
-- Sirve para Eliminar Duplicados
DELETE FROM ventas
WHERE id NOT IN (
    SELECT id FROM (
        SELECT MIN(id) AS id
        FROM ventas
        GROUP BY producto_id, cliente_id, cantidad, precio_unitario, empleado_id
    ) AS subquery
);
-- Verifica los Datos
SELECT * FROM ventas;
-- Sirve para Desactivar el Modo Seguro Temporal
-- SET SQL_SAFE_UPDATES = 0;
-- Sirve para Activar el Modo Seguro Temporal
-- SET SQL_SAFE_UPDATES = 1;

-- 9.- Para el resultado esperado, la tabla ventas debe mostrar los datos
-- Ejecuta la Consulta
SELECT * FROM ventas;

-- FIN DE ACTIVIDAD











-- Introducción a las subconsultas
-- DML - Continuando con la práctica
-- ✏ ️Ejercicios DML

-- 1.- Para insertar un nuevo producto en la tabla productos
INSERT INTO productos (nombre, precio) VALUES ('Teléfono móvil', 450.00);
-- Para verificar que la inserción del nuevo producto fue exitosa
SELECT * FROM productos;

-- 2.- Para insertar un nuevo cliente en la tabla "clientes" con el nombre "María García" y la dirección "Constitución 456, Luján"
INSERT INTO clientes (nombre, direccion)
VALUES ('María García', 'Constitución 456, Luján');
-- Después de ejecutar esta consulta, puedes verificar la inserción ejecutando
SELECT * FROM clientes;

-- 3.- Modifica la columna correo_electrónico de la tabla empleados para que se genere automáticamente concatenado el nombre, apellido y la cadena “@mail.com”.

-- Eliminar la columna correo_electronico existente (si es necesario): Primero, si la columna correo_electronico ya existe y quieres reemplazarla con una columna generada automáticamente, deberás eliminarla
ALTER TABLE empleados DROP COLUMN correo_electronico;

-- Agregar la columna correo_electronico generada automáticamente
ALTER TABLE empleados
ADD COLUMN correo_electronico VARCHAR(100)
GENERATED ALWAYS AS (CONCAT(nombre, '.', apellido, '@mail.com')) STORED;

-- Para confirmar que la columna correo_electronico se ha creado correctamente
SELECT id, nombre, apellido, correo_electronico FROM empleados;



-- 4.- Inserta un nuevo empleado en la tabla "empleados" con el nombre "Luis” y apellido “Fernández”, edad 28, salario 2800.00 y que pertenezca al departamento “ventas”.
-- Verifica el departamento_id para "Ventas"
SELECT id FROM departamentos WHERE nombre = 'Ventas';   -- Al verificar el ID de Venta es 1
-- Inserta el nuevo empleado:
-- Con el ID de "Ventas", ahora puedes insertar a "Luis Fernández" en la tabla empleados de la siguiente manera
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES ('Luis', 'Fernández', 28, 2800.00, 1);
-- Después de la inserción, si consultas la tabla empleados
SELECT id, nombre, apellido, edad, salario, correo_electronico, departamento_id
FROM empleados;

-- 5.- Actualiza el precio del producto "Laptop" a 1350.00 en la tabla "productos".
-- Para actualizar el precio del producto "Laptop" a 1350.00 en la tabla productos
UPDATE productos
SET precio = 1350.00
WHERE nombre = 'Laptop';
-- Después de ejecutar la actualización, puedes verificar que el cambio se haya aplicado correctamente con la siguiente consulta
SELECT * FROM productos WHERE nombre = 'Laptop';

-- 6.- Modifica la dirección del cliente "Juan Pérez" a "Alberti 1789, Mar del Plata" en la tabla "clientes".
-- Desactivar modo seguro
SET SQL_SAFE_UPDATES = 0;
-- 
UPDATE clientes
SET direccion = 'Alberti 1789, Mar del Plata'
WHERE nombre = 'Juan Pérez';
-- Activar modo seguro
SET SQL_SAFE_UPDATES = 1;
-- Después de ejecutar la consulta de actualización
SELECT id, nombre, direccion
FROM clientes
WHERE nombre = 'Juan Pérez';

-- 7.- Incrementa el salario de todos los empleados en un 5% en la tabla "empleados".
SET SQL_SAFE_UPDATES = 0;
UPDATE empleados
SET salario = salario * 1.05;
SET SQL_SAFE_UPDATES = 1;
-- Verificación del resultado Luego de ejecutar la consulta, puedes verificar los cambios ejecutando una consulta SELECT
SELECT id, nombre, apellido, salario
FROM empleados;

-- 8.- Inserta un nuevo producto en la tabla "productos" con el nombre "Tablet" y un precio de 350.00.
INSERT INTO productos (nombre, precio)
VALUES ('Tablet', 350.00);
-- Verificación del resultado
SELECT * FROM productos;

-- 9.- Inserta un nuevo cliente en la tabla "clientes" con el nombre "Ana López" y la dirección "Beltrán 1452, Godoy Cruz".
INSERT INTO clientes (nombre, direccion)
VALUES ('Ana López', 'Beltrán 1452, Godoy Cruz');
-- Verificación del resultado
SELECT * FROM clientes;

-- 10.- Para insertar un nuevo empleado en la tabla empleadoscon los datos de "Marta Ramírez"
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES ('Marta', 'Ramírez', 32, 3100.00, 1);
-- Verificación del resultado
SELECT * FROM empleados;

-- 11.- Actualiza el precio del producto "Teléfono móvil" a 480.00 en la tabla "productos".
-- Para actualizar el precio del producto "Teléfono móvil" a 480.00 en la tabla productos
SET SQL_SAFE_UPDATES = 0;
UPDATE productos
SET precio = 480.00
WHERE nombre = 'Teléfono móvil';
SET SQL_SAFE_UPDATES = 1;
-- VERIFICAR Después de ejecutar la consulta 
SELECT * FROM productos;

-- 12.- Modifica la dirección del cliente "María García" a "Avenida 789, Ciudad del Este" en la tabla "clientes".
-- Para modificar la dirección del cliente "María García" a "Avenida 789
SET SQL_SAFE_UPDATES = 0;
UPDATE clientes
SET direccion = 'Avenida 789, Ciudad del Este'
WHERE nombre = 'María García';
SET SQL_SAFE_UPDATES = 1;
-- Para verificar que la dirección del cliente "María García" se ha actualizado correctamente
SELECT * FROM clientes;

-- 13.- 
-- Para verificar el ID de ventas
SELECT id FROM departamentos WHERE nombre = 'Ventas';  -- verificado sale que esta e el ID 1
-- Entonces, la consulta para actualizar el salario sería
UPDATE empleados
SET salario = salario * 1.07
WHERE departamento_id = 1;
-- Ejecuta la siguiente consulta para ver los empleados del departamento "Ventas" y comprobar los nuevos salarios
SELECT id, nombre, salario, departamento_id
FROM empleados
WHERE departamento_id = 1;

-- 14.- Inserte un nuevo producto en la tabla "productos" con el nombre "Impresora" y un precio de 280.00.
INSERT INTO productos (nombre, precio) 
VALUES ('Impresora', 280.00);
-- Para verificar que el nuevo producto ha sido correctamente insertado
SELECT * FROM productos;

-- 15.- Inserta un nuevo cliente en la tabla "clientes" con el nombre "Carlos Sánchez" y la dirección "Saavedra 206, Las Heras".
-- Para insertar un nuevo cliente en la tabla clientes
INSERT INTO clientes (nombre, direccion) 
VALUES ('Carlos Sánchez', 'Saavedra 206, Las Heras');
-- Para verificar que el nuevo cliente ha sido correctamente insertado
SELECT * FROM clientes;

-- 16.- Inserta un nuevo empleado en la tabla "empleados" con el nombre "Lorena", apellido "Guzmán", edad 26, salario 2600.00 y que pertenezca al departamento “ventas”.
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id) 
VALUES ('Lorena', 'Guzmán', 26, 2600.00, 1);
-- Para verificar que el nuevo empleado ha sido correctamente insertado
SELECT * FROM empleados WHERE nombre = 'Lorena' AND apellido = 'Guzmán';

-- 17.- Haga una consulta simple de los datos de la tabla empleados y verifique que se presente de la siguiente manera
-- Para realizar una consulta simple que muestre los datos de la tabla empleados en el formato que indicas
SELECT id, nombre, apellido, edad, salario, correo_electronico
FROM empleados;

-- 17.1.- Haga una consulta simple de los datos de la tabla empleados y verifique que se presente de la siguiente manera:
-- Para hacer una consulta simple que muestre los datos de las columnas fecha_contratacion y departamento_id de la tabla empleados en el formato solicitado
SELECT fecha_contratacion, departamento_id
FROM empleados;

-- 18.-  Haz una consulta simple de los datos de la tabla clientes y verifica que se presente de la siguiente manera:
-- Para realizar una consulta simple que muestre los datos de la tabla clientes con las columnas id, nombre y direccion
SELECT id, nombre, direccion
FROM clientes;

-- 19.- Haz una consulta simple de los datos de la tabla productos y verifica que se presenta de la siguiente manera:
-- Para realizar una consulta simple que muestre los datos de la tabla productos con las columnas id, nombre y precio
SELECT id, nombre, precio
FROM productos;

-- FIN DE ACTIVIDAD
















-- Actividad: Ejercicios Complementarios

-- Paso 1: Obtener los IDs necesarios
-- Obtener el ID del cliente 'Juan Pérez'
SELECT id FROM clientes WHERE nombre = 'Juan Pérez';

-- Obtener el ID del producto 'Laptop'
SELECT id FROM productos WHERE nombre = 'Laptop';

-- 1.-  Inserta una venta en la tabla "ventas" donde el cliente "Juan Pérez" compra una "Laptop" con una cantidad de 2 y el vendedor tiene el nombre "Ana" y apellido "Rodríguez".

-- Obtener el ID del empleado 'Ana Rodríguez'
SELECT id FROM empleados WHERE nombre = 'Ana' AND apellido = 'Rodríguez';
-- Este codigo es omitiendo el monto:total Para solucionar el problema, simplemente omite la columna monto_total en la consulta INSERT
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) 
VALUES (1, 1, 2, 1350.00, 1);
-- Para verificar el resultado de la inserción en la tabla ventas
SELECT * FROM ventas;

-- 2.- Inserta una venta en la tabla "ventas" donde el cliente "María García" compra un "Teléfono móvil" con una cantidad de 3 y el vendedor tiene el nombre "Carlos" y apellido "López".

-- Obtener el ID del cliente María García
SELECT id FROM clientes WHERE nombre = 'María García';

-- Obtener el ID del producto Teléfono móvil
SELECT id FROM productos WHERE nombre = 'Teléfono móvil';

-- Obtener el ID del empleado Carlos López
SELECT id FROM empleados WHERE nombre = 'Carlos' AND apellido = 'López';
-- Inserta la venta en la tabla ventas
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) 
VALUES (2, 2, 3, 480.00, 2);
-- eliminar duplicados
SET SQL_SAFE_UPDATES = 0;
DELETE FROM ventas
WHERE id NOT IN (
    SELECT id
    FROM (
        SELECT MIN(id) AS id
        FROM ventas
        GROUP BY producto_id, cliente_id, cantidad, precio_unitario, empleado_id
    ) AS subquery
);
SET SQL_SAFE_UPDATES = 1;
-- ver resultados
SELECT * FROM ventas;


-- 3.-  Crea una venta en la tabla "ventas" donde el cliente "Carlos Sánchez" compra una "Impresora" con una cantidad de 1 y el vendedor tiene el nombre "Marta" y apellido "Ramírez".
-- coocer los ID de los 3 
SELECT id FROM clientes WHERE nombre = 'Carlos Sánchez';
SELECT id FROM productos WHERE nombre = 'Impresora';
SELECT id FROM empleados WHERE nombre = 'Marta' AND apellido = 'Ramírez';

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES (4, 4, 1, 280.00, 6);

SELECT * FROM ventas;

-- 4.- Inserta una venta en la tabla "ventas" donde el cliente "Ana López" compra una "Laptop" con una cantidad de 1 y el vendedor tiene el nombre "Carlos" y apellido "López".
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES (1, 3, 1, 1350.00, 2);

SELECT * FROM ventas;

-- 5.- 
-- Obtener el ID del cliente Juan Pérez
SELECT id FROM clientes WHERE nombre = 'Juan Pérez';   -- ID 1

-- Obtener el ID del producto Tablet
SELECT id FROM productos WHERE nombre = 'Tablet';   -- ID 3

-- Obtener el ID del empleado Luis Fernández
SELECT id FROM empleados WHERE nombre = 'Luis' AND apellido = 'Fernández';   -- ID 5

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES (3, 1, 2, 350.00, 5);

SELECT * FROM ventas;


-- 6.-  Inserta una venta en la tabla "ventas" donde el cliente "María García" compra un "Teléfono móvil" con una cantidad de 1 y el vendedor tiene el nombre "Marta" y apellido "Ramírez".
-- Obtener el ID del cliente María García
SELECT id FROM clientes WHERE nombre = 'María García';   -- ID 2

-- Obtener el ID del producto Teléfono móvil
SELECT id FROM productos WHERE nombre = 'Teléfono móvil';  -- ID 2

-- Obtener el ID del empleado Marta Ramírez
SELECT id FROM empleados WHERE nombre = 'Marta' AND apellido = 'Ramírez';  -- ID 6

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES (2, 2, 1, 480.00, 6);

SELECT * FROM ventas;



-- 7.- Crea una venta en la tabla "ventas" donde el cliente "Carlos Sánchez" compra una "Impresora" con una cantidad de 2 y el vendedor tiene el nombre "Lorena" y apellido "Guzmán".

SELECT id FROM clientes WHERE nombre = 'Carlos Sánchez';   -- ID 4
SELECT id FROM productos WHERE nombre = 'Impresora';     -- ID 4
SELECT id FROM empleados WHERE nombre = 'Lorena' AND apellido = 'Guzmán';   -- 7

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES (4, 4, 2, 280.00, 7);

SELECT * FROM ventas;


-- 8.- Haz una consulta simple de los datos de la tabla de ventas y verifica que se presenta de la siguiente manera:
SELECT 
    id AS 'id',
    producto_id AS 'prod_id',
    cliente_id AS 'cliente_id',
    cantidad AS 'cantidad',
    precio_unitario AS 'precio',
    monto_total AS 'total',
    empleado_id AS 'empleado_id'
FROM ventas;

-- FIN DE ACTIVIDAD















-- SELECCIONAR avanzado

-- ✏️ Ejercicios: Cláusula DISTINCT

-- 1.- Lista los nombres de los empleados sin duplicados
SELECT DISTINCT nombre
FROM empleados;

-- 2. Obtén una lista de correos electrónicos únicos de todos los empleados
SELECT DISTINCT correo_electronico
FROM empleados;

-- 3. Encuentra la lista de edades distintas entre los empleados
SELECT DISTINCT edad
FROM empleados;

-- FIN DE ACTIVIDAD









-- ✏️ Ejercicios: Operadores relacionales

-- 1.- Muestra los nombres de los empleados que tienen un salario superior a $3200
SELECT nombre
FROM empleados
WHERE salario > 3200;

-- 2.- Obtén una lista de empleados que tienen 28 años de edad
SELECT nombre
FROM empleados
WHERE edad = 28;

-- 3.- Lista a los empleados cuyos salarios sean menores a $2700
SELECT nombre
FROM empleados
WHERE salario < 2700;

-- 4.- Encuentra todas las ventas donde la cantidad de productos vendidos sea mayor que 2
SELECT *
FROM ventas
WHERE cantidad > 2;

-- 5.- Muestra las ventas donde el precio unitario sea igual a $480.00
SELECT *
FROM ventas
WHERE precio_unitario = 480.00;

-- 6.- Obtén una lista de ventas donde el monto total sea menor que $1000.00
SELECT *
FROM ventas
WHERE monto_total < 1000.00;

-- 7.- Encuentra las ventas realizadas por el empleado con el ID 1
SELECT *
FROM ventas
WHERE empleado_id = 1;

-- FIN DE ACTIVIDAD 







-- ✏️ Ejercicios: Operadores lógicos
-- 1. Muestra los nombres de los empleados que trabajan en el Departamento 1 y tienen un salario superior a $3000.
SELECT nombre
FROM empleados
WHERE departamento_id = 1
  AND salario > 3000;
  
  -- 2.- Lista los empleados que tienen 32 años de edad o trabajan en el Departamento 3.
  SELECT nombre, apellido
FROM empleados
WHERE edad = 32
   OR departamento_id = 3;

-- 3. Lista las ventas donde el producto sea el ID 1 y la cantidad sea mayor o igual a 2.
SELECT *
FROM ventas
WHERE producto_id = 1
  AND cantidad >= 2;

-- 4. Muestra las ventas donde el cliente sea el ID 1 o el empleado sea el ID 2.
SELECT *
FROM ventas
WHERE cliente_id = 1
   OR empleado_id = 2;
   
-- 5. Obtén una lista de ventas donde el cliente sea el ID 2 y la cantidad sea mayor que 2.
SELECT *
FROM ventas
WHERE cliente_id = 2
  AND cantidad > 2;
  
-- 6. Encuentra las ventas realizadas por el empleado con el ID 1 y donde el monto total sea mayor que $2000.00.
SELECT *
FROM ventas
WHERE empleado_id = 1
  AND monto_total > 2000;
-- FIN DE ACTIVIDAD
  










-- ✏️ Ejercicios: Cláusula ENTRE
-- 1. Encuentra a los empleados cuyas edades están entre 29 y 33 años. Muestra el nombre y la edad de los registros que cumplen esa condición.
SELECT nombre, edad
FROM empleados
WHERE edad BETWEEN 29 AND 33;

-- 2. Encuentra las ventas donde la cantidad de productos vendidos esté entre 2 y 3.
SELECT *
FROM ventas
WHERE cantidad BETWEEN 2 AND 3;

-- 3. Muestra las ventas donde el precio unitario esté entre $300.00 y $500.00.
SELECT *
FROM ventas
WHERE precio_unitario BETWEEN 300.00 AND 500.00;

--  FIN DE ACTIVIDAD




















-- Revisión de conceptos
-- Descargable y ejecutable el siguiente script con registros

INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES
  ('Laura', 'Sánchez', 27, 3300.00, 1),
  ('Javier', 'Pérez', 29, 3100.00, 1),
  ('Camila', 'Gómez', 26, 3000.00, 1),
  ('Lucas', 'Fernández', 28, 3200.00, 1),
  ('Valentina', 'Rodríguez', 30, 3500.00, 1);
INSERT INTO productos (nombre, precio)
VALUES
  ('Cámara Digital', 420.00),
  ('Smart TV 55 Pulgadas', 1200.00),
  ('Auriculares Bluetooth', 80.00),
  ('Reproductor de Blu-ray', 120.00),
  ('Lavadora de Ropa', 550.00),
  ('Refrigeradora Doble Puerta', 800.00),
  ('Horno de Microondas', 120.00),
  ('Licuadora de Alta Potencia', 70.00),
  ('Silla de Oficina Ergonómica', 150.00),
  ('Escritorio de Madera', 200.00),
  ('Mesa de Comedor', 250.00),
  ('Sofá de Tres Plazas', 350.00),
  ('Mochila para Portátil', 30.00),
  ('Reloj de Pulsera Inteligente', 100.00),
  ('Juego de Utensilios de Cocina', 40.00),
  ('Set de Toallas de Baño', 20.00),
  ('Cama King Size', 500.00),
  ('Lámpara de Pie Moderna', 70.00),
  ('Cafetera de Goteo', 40.00),
  ('Robot Aspirador', 180.00);
INSERT INTO clientes (nombre, direccion)
VALUES
  ('Alejandro López', 'Calle Rivadavia 123, Buenos Aires'),
  ('Sofía Rodríguez', 'Avenida San Martín 456, Rosario'),
  ('Joaquín Pérez', 'Calle Belgrano 789, Córdoba'),
  ('Valeria Gómez', 'Calle Mitre 101, Mendoza'),
  ('Diego Martínez', 'Avenida 9 de Julio 654, Buenos Aires');
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
  (1, 6, 3, 1350.00, 1),
  (5, 8, 5, 420.00, 9),
  (10, 2, 2, 800.00, 6),
  (14, 7, 1, 200.00, 5),
  (20, 4, 4, 20.00, 6),
  (4, 5, 5, 280.00, 1),
  (9, 5, 3, 550.00, 1),
  (13, 3, 4, 150.00, 5),
  (19, 6, 2, 40.00, 1),
  (2, 9, 5, 480.00, 1);
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
  (3, 9, 1, 350.00, 1),
  (6, 7, 4, 1200.00, 1),
  (7, 6, 3, 80.00, 1),
  (12, 9, 5, 70.00, 1),
  (16, 8, 2, 350.00, 6),
  (23, 9, 4, 180.00, 1),
  (18, 4, 3, 100.00, 7),
  (11, 3, 2, 120.00, 5),
  (15, 5, 4, 250.00, 6),
  (8, 8, 1, 120.00, 7);
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
  (17, 3, 2, 30.00, 5),
  (21, 9, 5, 500.00, 6),
  (22, 2, 3, 70.00, 6),
  (24, 9, 2, 180.00, 1),
  (5, 1, 2, 1350.00, 1),
  (9, 6, 4, 550.00, 9),
  (13, 8, 3, 150.00, 7),
  (3, 1, 5, 350.00, 1),
  (18, 9, 1, 100.00, 6),
  (10, 5, 2, 800.00, 1);
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
  (7, 4, 3, 80.00, 6),
  (2, 5, 1, 480.00, 6),
  (8, 7, 4, 120.00, 7),
  (1, 3, 5, 1350.00, 5),
  (4, 6, 2, 280.00, 5),
  (12, 1, 1, 70.00, 1),
  (19, 4, 3, 40.00, 6),
  (15, 3, 4, 250.00, 5),
  (6, 8, 2, 1200.00, 7),
  (11, 2, 3, 120.00, 5);
-- FIN DE CODIGO COPIADO DE DESCARGA











-- Practicando con más consultas
-- ✏️Cláusula de ejercicios IN

-- 1. Encuentra los empleados cuyos ID son 1, 10 "3" o 5.
SELECT * FROM empleados WHERE id IN (1, 10, 5);

-- 2. Busque los productos con ID 2, 4 o 6 en la tabla de productos.
-- Busque los productos con ID 2, 4 o 6 en la tabla de productos:
SELECT * FROM productos WHERE id IN (2, 4, 6);

-- 3.- Encuentra las ventas que tienen los clientes con ID 1, 3 o 5:
SELECT * FROM ventas WHERE cliente_id IN (1, 3, 5);








-- ✏️Ejercicios cláusula LIKE
-- 1. Empleados cuyos nombres comienzan con "L"
SELECT * FROM empleados
WHERE nombre LIKE 'L%';

-- 2. Productos cuyos nombres contengan la palabra "Teléfono"
SELECT * FROM productos
WHERE nombre LIKE '%Teléfono%';

-- 3. Clientes cuyas direcciones contienen la palabra "Calle"
SELECT * FROM clientes
WHERE direccion LIKE '%Calle%';















-- ✏️Ejercicios cláusula ORDENAR POR:
-- 1. Ordena los empleados por salario de manera ascendente
SELECT * FROM empleados
ORDER BY salario ASC;

-- 2. Ordene los productos por nombre de manera descendente
SELECT * FROM productos
ORDER BY nombre DESC;

-- 3. Ordena las ventas por cantidad de manera ascendente y luego por precio_unitario de manera descendente
SELECT * FROM ventas
ORDER BY cantidad ASC, precio_unitario DESC;














-- ✏️Ejercicios LÍMITE
-- 1. Muestra los 5 productos más caros de la tabla "productos"
SELECT * FROM productos
ORDER BY precio DESC
LIMIT 5;

-- 2. Muestra los 10 primeros empleados en orden alfabético por apellido
SELECT * FROM empleados
ORDER BY apellido ASC
LIMIT 10;

-- 3. Muestra las 3 ventas con el monto total más alto
SELECT * FROM ventas
ORDER BY monto_total DESC
LIMIT 3;











-- ✏️Ejercicios AS
-- 1. Muestra el salario de los empleados junto con el salario incrementado en un 10% nombrando a la columna como “Aumento del 10%”
SELECT nombre,
       apellido,
       salario,
       salario * 1.10 AS `Aumento del 10%`
FROM empleados;

-- 2. Calcula el monto total de las compras realizadas por el cliente y que la columna se llame “Monto total gastado”
SELECT cliente_id,
       SUM(monto_total) AS `Monto total gastado`
FROM ventas
GROUP BY cliente_id;

-- 3. Muestra los nombres completos de los empleados concatenando los campos "nombre" y "apellido" y que la columna se llame “Nombre y apellido”
SELECT nombre,
       apellido,
       CONCAT(nombre, ' ', apellido) AS `Nombre y apellido`
FROM empleados;













-- ✏️CASO de ejercicios
-- 1. Categorizar los productos como "Caro", "Medio" o "Barato" según el precio
SELECT nombre,
       precio,
       CASE 
           WHEN precio >= 500 THEN 'Caro'
           WHEN precio >= 200 AND precio < 500 THEN 'Medio'
           ELSE 'Barato'
       END AS `Categoría`
FROM productos;

-- 2. Categorizar los empleados según la edad como "Joven", "Adulto" o "Mayor"
SELECT nombre,
       apellido,
       edad,
       CASE 
           WHEN edad < 30 THEN 'Joven'
           WHEN edad BETWEEN 30 AND 40 THEN 'Adulto'
           ELSE 'Mayor'
       END AS `Categoría de edad`
FROM empleados;

-- 3. Categorizar las ventas según la cantidad de productos vendidos
SELECT id AS `ID de venta`,
       cantidad,
       CASE 
           WHEN cantidad < 3 THEN 'Poca cantidad'
           WHEN cantidad >= 3 AND cantidad < 6 THEN 'Cantidad moderada'
           ELSE 'Mucha cantidad'
       END AS `Categoría de cantidad`
FROM ventas;

-- 4. Categorizar a los clientes según el nombre con las letras "A" y "M"
SELECT nombre,
       CASE 
           WHEN nombre LIKE 'A%' THEN 'Comienza con A'
           WHEN nombre LIKE 'M%' THEN 'Comienza con M'
           ELSE 'Otros'
       END AS `Categoría de nombre`
FROM clientes;

-- 5. Categorizar a los empleados según el salario como "Salario alto", "Salario medio" o "Salario bajo"
SELECT nombre,
       apellido,
       salario,
       CASE 
           WHEN salario >= 3500 THEN 'Salario alto'
           WHEN salario >= 3000 AND salario < 3500 THEN 'Salario medio'
           ELSE 'Salario bajo'
       END AS `Categoría de salario`
FROM empleados;

-- FIN DE ACTIVIDAD













-- Practicando con funciones avanzadas
-- ✏️Ejercicios Función MAX() 

-- 1. Encuentra el salario máximo de todos los empleados
SELECT MAX(salario) AS `Salario máximo`
FROM empleados;

-- 2. Encuentra la cantidad máxima de productos vendidos en una sola venta
SELECT MAX(cantidad) AS `Cantidad máxima de productos`
FROM ventas;

-- 3. Encuentra la edad máxima de los empleados
SELECT MAX(edad) AS `Edad máxima`
FROM empleados;






-- ✏️Ejercicios Función MIN()
-- 1. Encuentra el salario mínimo de todos los empleados
SELECT MIN(salario) AS `Salario mínimo`
FROM empleados;

-- 2. Encuentra la cantidad mínima de productos vendidos en una sola venta
SELECT MIN(cantidad) AS `Cantidad mínima de productos`
FROM ventas;

-- 3. Encuentra la edad mínima de los empleados
SELECT MIN(edad) AS `Edad mínima`
FROM empleados;













-- ✏️Ejercicios de la Función COUNT()
-- 1. Cuenta cuántos empleados hay en total
SELECT COUNT(*) AS `Total de empleados`
FROM empleados;

-- 2. Cuenta cuántas ventas se han realizado
SELECT COUNT(*) AS `Total de ventas`
FROM ventas;

-- 3. Cuenta cuántos productos tienen un precio superior a $500
SELECT COUNT(*) AS `Productos con precio > $500`
FROM productos
WHERE precio > 500;










-- ✏️Ejercicios de la Función SUM()
-- 1. Calcula la suma total de salarios de todos los empleados
SELECT SUM(salario) AS `Suma total de salarios`
FROM empleados;

-- 2. Calcula la suma total de montos vendidos en todas las ventas
SELECT SUM(monto_total) AS `Suma total de montos vendidos`
FROM ventas;

-- 3. Calcula la suma de precios de productos con ID par
SELECT SUM(precio) AS `Suma de precios de productos con ID par`
FROM productos
WHERE id % 2 = 0;









-- ✏️Ejercicios Función AVG()
-- 1. Calcula el salario promedio de todos los empleados
SELECT AVG(salario) AS `Salario promedio`
FROM empleados;

-- 2. Calcula el precio unitario promedio de todos los productos
SELECT AVG(precio) AS `Precio promedio de productos`
FROM productos;

-- 3. Calcula la edad promedio de los empleados
SELECT AVG(edad) AS `Edad promedio de empleados`
FROM empleados;










-- ✏️Ejercicios GROUP BY()
-- 1. Agrupa las ventas por empleado y muestra la cantidad total de ventas realizadas por cada empleado
SELECT empleado_id, COUNT(*) AS `Total de ventas por empleado`
FROM ventas
GROUP BY empleado_id;

-- 2. Agrupa los productos por precio y muestra la cantidad de productos con el mismo precio
SELECT precio, COUNT(*) AS `Cantidad de productos con el mismo precio`
FROM productos
GROUP BY precio;
SELECT precio, COUNT(*) AS `Cantidad de productos con el mismo precio`
FROM productos
GROUP BY precio;

-- 3. Agrupa los empleados por departamento y muestra la cantidad de empleados en cada departamento
SELECT departamento_id, COUNT(*) AS `Cantidad de empleados por departamento`
FROM empleados
GROUP BY departamento_id;








-- ✏️Ejercicios TENIENDO 
-- 1. Encuentra los departamentos con un salario promedio de sus empleados superior a $3,000
SELECT departamento_id, AVG(salario) AS `Salario promedio`
FROM empleados
GROUP BY departamento_id
HAVING AVG(salario) > 3000;

-- 2. Encuentra los productos que se han vendido al menos 5 veces
SELECT producto_id, COUNT(*) AS `Veces vendido`
FROM ventas
GROUP BY producto_id
HAVING COUNT(*) >= 5;

-- 3. Selecciona los empleados que tengan una “o” en su nombre o apellido, agrúpalos por departamento y muestra los que tengan el salario máximo
SELECT e.departamento_id, e.nombre, e.apellido, e.salario AS `Salario máximo`
FROM empleados e
INNER JOIN (
    SELECT departamento_id, MAX(salario) AS salario_max
    FROM empleados
    WHERE nombre LIKE '%o%' OR apellido LIKE '%o%'
    GROUP BY departamento_id
) AS max_salarios
ON e.departamento_id = max_salarios.departamento_id
AND e.salario = max_salarios.salario_max;











-- ✏️ Actividad: Ejercicios Complementarios
-- EJERCICIOS CON CLÁUSULA EN

-- 1. Busca los empleados que trabajan en los departamentos 2 o 3.
SELECT *
FROM empleados
WHERE departamento_id IN (2, 3);

-- 2. Trae a los clientes que no tengan los ID 2, 4 o 6.
SELECT *
FROM clientes
WHERE id NOT IN (2, 4, 6);

-- 3. Busca los productos cuyos precios son 350.00, 480.00 o 800.00.
SELECT *
FROM productos
WHERE precio IN (350.00, 480.00, 800.00);




-- EJERCICIOS CON CLÁUSULA LIKE
-- 1. Busca los empleados cuyos correos electrónicos terminan en "mail.com".
SELECT *
FROM empleados
WHERE correo_electronico LIKE '%mail.com';

-- 2. Encuentra los productos cuyos nombres tengan exactamente 6 caracteres.
SELECT *
FROM productos
WHERE LENGTH(nombre) = 6;

-- 3. Busca los clientes cuyos nombres tengan una "a" en la tercera posición.
SELECT *
FROM clientes
WHERE nombre LIKE '__a%';





-- EJERCICIOS CON CLÁUSULA ORDEN POR
-- 1. Ordena los clientes por nombre de manera ascendente y luego por dirección de manera descendente.
SELECT *
FROM clientes
ORDER BY nombre ASC, direccion DESC;

-- 2. Ordena los empleados por fecha_contratacion de manera descendente.
SELECT *
FROM empleados
ORDER BY fecha_contratacion DESC;

-- 3. Ordena los productos por precio de manera ascendente.
SELECT *
FROM productos
ORDER BY precio ASC;


-- EJERCICIOS CON FUNCIÓN MAX()
-- 1. Encuentra el precio máximo de un producto.
SELECT MAX(precio) AS precio_maximo
FROM productos;

-- 2. Encuentra el monto total máximo de una venta.
SELECT MAX(monto_total) AS monto_total_maximo
FROM ventas;

-- 3. Encuentra el ID de cliente con el valor máximo.
SELECT cliente_id
FROM ventas
GROUP BY cliente_id
ORDER BY SUM(monto_total) DESC
LIMIT 1;



-- EJERCICIOS CON FUNCIÓN MIN()
-- 1. Encuentra el precio mínimo de un producto.
SELECT MIN(precio) AS precio_minimo
FROM productos;

-- 2. Encuentra el monto total mínimo de una venta.
SELECT MIN(monto_total) AS monto_total_minimo
FROM ventas;

-- 3. Encuentra el ID de cliente con el valor mínimo.
SELECT cliente_id
FROM ventas
GROUP BY cliente_id
ORDER BY SUM(monto_total) ASC
LIMIT 1;




-- EJERCICIOS CON FUNCIÓN COUNT()
-- 1. Cuentas cuántos clientes tienen la palabra "López" en su nombre.
SELECT COUNT(*) AS cantidad_clientes
FROM clientes
WHERE nombre LIKE '%López%';

-- 2. Cuenta cuántas ventas fueron realizadas por el empleado con el ID 9.
SELECT COUNT(*) AS cantidad_ventas
FROM ventas
WHERE empleado_id = 9;

-- 3. Cuentas cuántos productos tienen un nombre que contiene la palabra "Digital".
SELECT COUNT(*) AS cantidad_productos
FROM productos
WHERE nombre LIKE '%Digital%';



-- EJERCICIOS CON FUNCIÓN SUM()
-- 1. Calcula la suma de cantidades de productos vendidos por empleado.
SELECT empleado_id, SUM(cantidad) AS suma_cantidades
FROM ventas
GROUP BY empleado_id;

-- 2. Calcula la suma de salarios de empleados en el Departamento 1.
SELECT SUM(salario) AS suma_salarios
FROM empleados
WHERE departamento_id = 1;

-- 3. Calcula la suma de precios de productos vendidos al cliente con ID 2.
SELECT SUM(precio_unitario * cantidad) AS suma_precios
FROM ventas
WHERE cliente_id = 2;



-- EJERCICIOS CON FUNCIÓN AVG()
-- 1. Calcula el precio promedio de productos con un precio superior a $200.
SELECT AVG(precio) AS precio_promedio
FROM productos
WHERE precio > 200;

-- 2. Calcula el salario promedio de los empleados en el Departamento 1.
SELECT AVG(salario) AS salario_promedio
FROM empleados
WHERE departamento_id = 1;

-- 3. Calcula la cantidad promedio de productos vendidos por empleado.
SELECT empleado_id, AVG(cantidad) AS cantidad_promedio
FROM ventas
GROUP BY empleado_id;



-- EJERCICIOS CON FUNCIÓN GROUP BY()
-- 1. Agrupa las ventas por cliente y muestra el monto total gastado por cada cliente.
SELECT cliente_id, SUM(monto_total) AS monto_total_gastado
FROM ventas
GROUP BY cliente_id;

-- 2. Encuentra el salario máximo por departamento.
SELECT departamento_id, MAX(salario) AS salario_maximo
FROM empleados
GROUP BY departamento_id;

-- 3. Encuentra el salario mínimo por departamento.
SELECT departamento_id, MIN(salario) AS salario_minimo
FROM empleados
GROUP BY departamento_id;

-- 4. Obtén la suma total de salarios por departamento.
SELECT departamento_id, SUM(salario) AS suma_salarios
FROM empleados
GROUP BY departamento_id;

-- 5. Encuentra la cantidad total de productos vendidos por empleado.
SELECT empleado_id, SUM(cantidad) AS cantidad_total_vendida
FROM ventas
GROUP BY empleado_id;



-- EJERCICIOS CON FUNCIÓN HAVING()
-- 1. Encuentra los departamentos con al menos 2 empleados con una edad menor de 30 años.
SELECT departamento_id, COUNT(*) AS cantidad_empleados
FROM empleados
WHERE edad < 30
GROUP BY departamento_id
HAVING COUNT(*) >= 2;

-- 2. Muestra los clientes que han gastado más de $2,000 en total en compras.
SELECT cliente_id, SUM(monto_total) AS total_gastado
FROM ventas
GROUP BY cliente_id
HAVING SUM(monto_total) > 2000;




-- EJERCICIOS CON FUNCIÓN AS()
-- 1. Muestra la edad de los empleados junto con la edad aumentada en 5 años y que esta nueva columna se llame “Edad en 5 años”.
SELECT nombre, apellido, edad, edad + 5 AS `Edad en 5 años`
FROM empleados;

-- 2. Muestra el monto total de ventas junto con el monto total incrementado en un 21% y que esta nueva columna se llame “Precio + IVA”.
SELECT SUM(monto_total) AS `Monto Total`, 
       SUM(monto_total) * 1.21 AS `Precio + IVA`
FROM ventas;

-- 3. Muestra el nombre del producto y su precio unitario precedido con el signo “$” y que esta nueva columna se llame “Precio con formato”.
SELECT nombre AS `Nombre del Producto`, 
       CONCAT('$', precio) AS `Precio con formato`
FROM productos;



-- EJERCICIOS CON FUNCIÓN LIMIT()
-- 1. Muestra los 5 clientes con los ID más bajos.
SELECT *
FROM clientes
ORDER BY id ASC
LIMIT 5;

-- 2. Muestra los 3 productos más vendidos.
SELECT p.id, p.nombre, SUM(v.cantidad) AS total_vendido
FROM productos p
JOIN ventas v ON p.id = v.producto_id
GROUP BY p.id, p.nombre
ORDER BY total_vendido DESC
LIMIT 3;

-- 3. Muestra los 5 empleados más jóvenes.
SELECT *
FROM empleados
ORDER BY edad ASC
LIMIT 5;


-- EJERCICIOS CON FUNCIÓN CASE()
-- 1. Crea una consulta que muestre el nombre de los productos y las categorías como "Laptop" si el nombre contiene la palabra "Laptop", "Teléfono" si contiene la palabra "Teléfono", y "Otros" en otros casos.
SELECT nombre,
       CASE
           WHEN nombre LIKE '%Laptop%' THEN 'Laptop'
           WHEN nombre LIKE '%Teléfono%' THEN 'Teléfono'
           ELSE 'Otros'
       END AS categoria
FROM productos;

-- 2
SELECT producto_id,
       CASE
           WHEN SUM(cantidad) >= 9 THEN 'Alto Volumen'
           WHEN SUM(cantidad) BETWEEN 4 AND 8 THEN 'Medio Volumen'
           ELSE 'Bajo Volumen'
       END AS categoria
FROM ventas
GROUP BY producto_id
ORDER BY SUM(cantidad) DESC;

-- 3
SELECT producto_id,
       CASE
           WHEN SUM(cantidad) >= 9 THEN 'Alto Volumen'
           WHEN SUM(cantidad) BETWEEN 4 AND 8 THEN 'Medio Volumen'
           ELSE 'Bajo Volumen'
       END AS categoria,
       SUM(cantidad) AS total_cantidad
FROM ventas
GROUP BY producto_id
ORDER BY total_cantidad DESC;

-- 4
SELECT id,
       CASE
           WHEN monto_total < 500 THEN 'Venta pequeña'
           WHEN monto_total >= 500 AND monto_total < 1500 THEN 'Venta mediana'
           ELSE 'Venta grande'
       END AS categoria
FROM ventas;

-- 5
SELECT nombre,
       CASE
           WHEN LENGTH(direccion) >= 30 THEN 'Dirección larga'
           WHEN LENGTH(direccion) >= 20 AND LENGTH(direccion) < 30 THEN 'Dirección mediana'
           ELSE 'Dirección corta'
       END AS categoria
FROM clientes;

-- 6

SELECT nombre,
       CASE
           WHEN departamento_id = 1 THEN 'Ventas'
           WHEN departamento_id = 2 THEN 'Recursos Humanos'
           WHEN departamento_id = 3 THEN 'Contabilidad'
           ELSE 'Otro'
       END AS categoria
FROM empleados;



-- 7

SELECT p.nombre,
       CASE 
           WHEN p.nombre IN ('Laptop', 'Reloj de Pulsera Inteligente', 'Reproductor de Blu-ray', 
                             'Auriculares Bluetooth', 'Smart TV 55 Pulgadas', 'Cámara Digital', 
                             'Impresora', 'Tablet', 'Teléfono móvil') THEN
               CASE
                   WHEN p.precio >= 1000 THEN 'Tecnología cara'
                   WHEN p.precio BETWEEN 500 AND 999 THEN 'Tecnología gama media'
                   WHEN p.precio < 500 THEN 'Tecnología barata'
               END
           ELSE
               CASE
                   WHEN p.precio >= 1000 THEN 'Caro'
                   WHEN p.precio BETWEEN 500 AND 999 THEN 'Medio'
                   WHEN p.precio < 500 THEN 'Barato'
               END
       END AS categoria
FROM productos p;





-- Iniciando con la práctica
-- ✏️Ejercicios consultas multitabla - Parte 1

-- 1.- Una las tablas de empleados con departamentos y solo muestra las columnas nombre, apellido, edad, salario de empleados y la columna nombre de departamentos.
SELECT e.nombre, e.apellido, e.edad, e.salario, d.nombre AS nombre_departamento
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id;

-- 2.- Una las tablas de ventas con la tabla empleados donde se muestren todas las columnas de ventas excepto la columna empleado_id y en su lugar muestres el nombre y apellido de la tabla empleados.
SELECT v.id, v.producto_id, v.cliente_id, v.cantidad, v.precio_unitario, v.monto_total, 
       e.nombre, e.apellido
FROM ventas v
JOIN empleados e ON v.empleado_id = e.id;

-- 3.- Une las tablas ventas con la tabla productos donde se muestren todas las columnas de ventas excepto la columna producto_id y en su lugar muestres la columna nombre de la tabla productos.
SELECT v.id, v.cliente_id, v.cantidad, v.precio_unitario, v.monto_total, 
       p.nombre AS nombre_producto
FROM ventas v
JOIN productos p ON v.producto_id = p.id;

-- 4.- Una las tablas de ventas con la tabla clientes donde se muestren todas las columnas de ventas excepto la columna cliente_id y en su lugar muestres la columna nombre de la tabla clientes.
SELECT v.id, v.producto_id, v.cantidad, v.precio_unitario, v.monto_total, 
       c.nombre AS nombre_cliente
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id;

-- 5.- Une las tablas de ventas con las tablas empleados y departamentos donde se muestren todas las columnas de ventas excepto la columna empleado_id y en su lugar muestres el nombre y apellido de la tabla empleados y además muestres la columna nombre de la tabla departamentos.
SELECT v.id, v.producto_id, v.cliente_id, v.cantidad, v.precio_unitario, v.monto_total, 
       e.nombre AS nombre_empleado, e.apellido, d.nombre AS nombre_departamento
FROM ventas v
JOIN empleados e ON v.empleado_id = e.id
JOIN departamentos d ON e.departamento_id = d.id;

-- 6.- Una las tablas de ventas, empleados, productos y clientes donde se muestren las columnas de la tabla de ventas reemplazando sus columnas de FOREIGN KEYs con las respectivas columnas de “nombre” de las otras tablas.
SELECT v.id, p.nombre AS nombre_producto, c.nombre AS nombre_cliente, v.cantidad, 
       v.precio_unitario, v.monto_total, e.nombre AS nombre_empleado, e.apellido
FROM ventas v
JOIN productos p ON v.producto_id = p.id
JOIN clientes c ON v.cliente_id = c.id
JOIN empleados e ON v.empleado_id = e.id;

-- 7.- Calcular el salario máximo de los empleados en cada departamento y mostrar el nombre del departamento junto con el salario máximo.
SELECT d.nombre AS nombre_departamento, MAX(e.salario) AS salario_maximo
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre;

-- FIN DE ACTIVIDAD








-- Avanzando con la práctica
-- ✏️Ejercicios consultas multitabla - Parte 2 

-- 1. Calcula el monto total de ventas por departamento y muestra el nombre del departamento junto con el monto total de ventas.
SELECT d.nombre AS departamento, SUM(v.monto_total) AS total_ventas
FROM ventas v
JOIN empleados e ON v.empleado_id = e.id
JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre;

-- 2. Encuentra el empleado más joven de cada departamento y muestra el nombre del departamento junto con la edad del empleado más joven.
SELECT d.nombre AS departamento, MIN(e.edad) AS edad_mas_joven
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre;

-- 3. Calcula el volumen de productos vendidos por cada producto y muestra la categoría de volumen junto con la cantidad y el nombre del producto.
SELECT p.nombre AS producto, SUM(v.cantidad) AS cantidad_vendida,
       CASE 
           WHEN SUM(v.cantidad) >= 8 THEN 'Alto'
           WHEN SUM(v.cantidad) < 8 AND SUM(v.cantidad) >= 5 THEN 'Medio'
           ELSE 'Bajo'
       END AS categoria_volumen
FROM ventas v
JOIN productos p ON v.producto_id = p.id
GROUP BY p.nombre;

-- 4. Encontrar el cliente que ha realizado el mayor monto total de compras y mostrar su nombre y el monto total.
SELECT c.nombre AS cliente, SUM(v.monto_total) AS total_compras
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nombre
ORDER BY total_compras DESC
LIMIT 1;

-- 5. Calcula el precio promedio de los productos vendidos por cada empleado y muestra el nombre del empleado junto con el precio promedio de los productos que ha vendido.
SELECT e.nombre, e.apellido, AVG(v.precio_unitario) AS precio_promedio
FROM ventas v
JOIN empleados e ON v.empleado_id = e.id
GROUP BY e.nombre, e.apellido;

-- 6. Encuentre el departamento con el salario mínimo más bajo entre los empleados y muestre el nombre del departamento junto con el salario mínimo más bajo.
SELECT d.nombre AS departamento, MIN(e.salario) AS salario_minimo
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre
ORDER BY salario_minimo ASC
LIMIT 1;

-- 7. Encuentra el departamento con el salario promedio más alto entre los empleados mayores de 30 años y muestra el nombre del departamento junto con el salario promedio. Limita los resultados a mostrar solo los departamentos con el salario promedio mayor a 3320.
SELECT d.nombre AS departamento, AVG(e.salario) AS salario_promedio
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
WHERE e.edad > 30
GROUP BY d.nombre
HAVING salario_promedio > 3320
ORDER BY salario_promedio DESC;









-- ✏️ Actividad: Ejercicios Complementarios

-- 1. Encuentre la cantidad de productos vendidos por cada empleado y muestre el nombre del empleado junto con la cantidad de productos vendidos.
SELECT e.nombre, e.apellido, SUM(v.cantidad) AS productos_vendidos
FROM ventas v
JOIN empleados e ON v.empleado_id = e.id
GROUP BY e.nombre, e.apellido;

-- 2. Calcula el monto total de ventas por cada cliente y muestra el nombre del cliente junto con el monto total de sus compras.
SELECT c.nombre, SUM(v.monto_total) AS total_compras
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nombre;

-- 3. Encuentre el producto más caro vendido y muestre su nombre y precio.
SELECT p.nombre, MAX(v.precio_unitario) AS precio_mas_caro
FROM ventas v
JOIN productos p ON v.producto_id = p.id
GROUP BY p.nombre
ORDER BY precio_mas_caro DESC
LIMIT 1;

-- 4. Calcular el salario promedio de los empleados en cada departamento y mostrar el nombre del departamento junto con el salario promedio.
SELECT d.nombre AS departamento, AVG(e.salario) AS salario_promedio
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre;

-- 5. Encuentre la cantidad total de ventas realizadas por cada empleado y muestre el nombre y apellido del empleado junto con la cantidad total de ventas.
SELECT e.nombre, e.apellido, COUNT(v.id) AS total_ventas
FROM ventas v
JOIN empleados e ON v.empleado_id = e.id
GROUP BY e.nombre, e.apellido;

-- 6. Encuentra la cantidad de ventas realizadas por cada empleado y muestra el nombre y apellido del empleado junto con la cantidad total de ventas. Limita los resultados a mostrar solo a los empleados que hayan realizado más de 5 ventas y ordénalos de forma descendente con respecto a la cantidad de ventas.
SELECT e.nombre, e.apellido, COUNT(v.id) AS total_ventas
FROM ventas v
JOIN empleados e ON v.empleado_id = e.id
GROUP BY e.nombre, e.apellido
HAVING total_ventas > 5
ORDER BY total_ventas DESC;

-- 7. Calcula el monto total vendido por cada empleado y muestra el nombre del empleado junto con el monto total. Usa la cláusula HAVING para filtrar a aquellos empleados que hayan vendido más de 10 productos en total. Muestra el resultado en orden descendente según el monto total vendido.
SELECT e.nombre, e.apellido, SUM(v.monto_total) AS monto_total_vendido
FROM ventas v
JOIN empleados e ON v.empleado_id = e.id
GROUP BY e.nombre, e.apellido
HAVING SUM(v.cantidad) > 10
ORDER BY monto_total_vendido DESC;

-- 8. Encuentra el monto total vendido a cada cliente y muestra el nombre del cliente junto con el monto total. Usa la cláusula HAVING para filtrar a aquellos clientes cuyo monto total promedio en sus compras sea superior a $1500. Muestra el resultado en orden descendente según el monto total vendido.
SELECT c.nombre, SUM(v.monto_total) AS monto_total
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nombre
HAVING AVG(v.monto_total) > 1500
ORDER BY monto_total DESC;

-- 9. Calcula la cantidad total de ventas realizadas a cada cliente y muestra el nombre del cliente junto con la cantidad total de ventas. Limita los resultados a mostrar solo a los clientes que hayan realizado más de 3 ventas y ordénalos de forma descendente según la cantidad de ventas.
SELECT c.nombre, COUNT(v.id) AS total_ventas
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nombre
HAVING total_ventas > 3
ORDER BY total_ventas DESC;

-- 10. Encuentra los productos más caros vendidos (precio mayor a 1000), muestra su nombre y precio y ordénalos de forma descendente por precio.
SELECT p.nombre, v.precio_unitario
FROM ventas v
JOIN productos p ON v.producto_id = p.id
WHERE v.precio_unitario > 1000
ORDER BY v.precio_unitario DESC;


































-- Uniones entre tablas
-- 1.- Encuentra el nombre y apellido de los empleados junto con la cantidad total de ventas que han realizado.
SELECT e.nombre, e.apellido, COUNT(v.id) AS total_ventas
FROM empleados e
JOIN ventas v ON e.id = v.empleado_id
GROUP BY e.id;

-- 2.- Calcula el monto total vendido a cada cliente y muestra el nombre del cliente, su dirección y el monto total.
SELECT c.nombre, c.direccion, SUM(v.monto_total) AS total_compras
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
GROUP BY c.id;

-- 3.- Encuentra los productos vendidos por cada empleado en el departamento de "Ventas" y muestra el nombre del empleado junto con el nombre de los productos que han vendido.
SELECT e.nombre AS empleado, p.nombre AS producto
FROM empleados e
JOIN ventas v ON e.id = v.empleado_id
JOIN productos p ON v.producto_id = p.id
JOIN departamentos d ON e.departamento_id = d.id
WHERE d.nombre = 'Ventas';

-- 4.- Encuentra el nombre del cliente, el nombre del producto y la cantidad comprada de productos con un precio superior a $500.
SELECT c.nombre AS cliente, p.nombre AS producto, v.cantidad
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
JOIN productos p ON v.producto_id = p.id
WHERE v.precio_unitario > 500;




-- Continuando con la práctica
-- ✏️Ejercicios JOIN Parte 2

-- 1.- Calcula la cantidad de ventas por departamento, incluso si el departamento no tiene ventas.
SELECT d.nombre AS departamento, COUNT(v.id) AS total_ventas
FROM departamentos d
LEFT JOIN empleados e ON d.id = e.departamento_id
LEFT JOIN ventas v ON e.id = v.empleado_id
GROUP BY d.id;

-- 2.- Encuentra el nombre y la dirección de los clientes que han comprado más de 3 productos y muestra la cantidad de productos comprados.
SELECT c.nombre, c.direccion, SUM(v.cantidad) AS total_productos
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
GROUP BY c.id
HAVING SUM(v.cantidad) > 3;
 
-- 3.- Calcula el monto total de ventas realizadas por cada departamento y muestra el nombre del departamento junto con el monto total de ventas.
SELECT d.nombre AS departamento, SUM(v.monto_total) AS total_ventas
FROM departamentos d
JOIN empleados e ON d.id = e.departamento_id
JOIN ventas v ON e.id = v.empleado_id
GROUP BY d.id;












-- ✏️  Actividad: Ejercicios Complementarios

-- 1.- Muestra el nombre y apellido de los empleados que pertenecen al departamento de "Recursos Humanos" y han realizado más de 5 ventas.
SELECT e.nombre, e.apellido
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
JOIN ventas v ON e.id = v.empleado_id
WHERE d.nombre = 'Recursos Humanos'
GROUP BY e.id
HAVING COUNT(v.id) > 5;


-- 2.- Muestra el nombre y apellido de todos los empleados junto con la cantidad total de ventas que han realizado, incluso si no han realizado ventas.
SELECT e.nombre, e.apellido, COUNT(v.id) AS total_ventas
FROM empleados e
LEFT JOIN ventas v ON e.id = v.empleado_id
GROUP BY e.id;

-- 3.- Encuentra el empleado más joven de cada departamento y muestra el nombre del departamento junto con el nombre y la edad del empleado más joven.
SELECT d.nombre AS departamento, e.nombre AS empleado, e.apellido, e.edad
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
WHERE e.edad = (
    SELECT MIN(edad)
    FROM empleados
    WHERE departamento_id = e.departamento_id
);

-- 4.- Calcula el volumen de productos vendidos por cada producto (por ejemplo, menos de 5 como "bajo", entre 5 y 10 como "medio", y más de 10 como "alto") y muestra la categoría de volumen junto con la cantidad y el nombre del producto.
SELECT p.nombre AS producto, SUM(v.cantidad) AS total_vendido,
    CASE
        WHEN SUM(v.cantidad) < 5 THEN 'bajo'
        WHEN SUM(v.cantidad) BETWEEN 5 AND 10 THEN 'medio'
        ELSE 'alto'
    END AS volumen
FROM productos p
JOIN ventas v ON p.id = v.producto_id
GROUP BY p.id;




























-- Funciones clave en MySQL. Subconsultas
-- ✏️Ejercicios Prácticos con Tablas Temporales 

-- 1.- Utiliza TABLE para consultar la tabla productos de manera simple, ordenando los productos de forma descendente por precio y solo 10 filas.
-- Crear una tabla temporal para los productos ordenados por precio descendente
CREATE TEMPORARY TABLE productos_ordenados
AS
SELECT * 
FROM productos
ORDER BY precio DESC
LIMIT 10;

-- Consultar la tabla temporal
SELECT * 
FROM productos_ordenados;

-- 2.- Crea una tabla temporal de los empleados donde unifiques su nombre y apellido en una sola columna.

-- Crear una tabla temporal unificando nombre y apellido en una sola columna
CREATE TEMPORARY TABLE empleados_unificados
AS
SELECT id, 
       CONCAT(nombre, ' ', apellido) AS nombre_completo, 
       edad, 
       salario, 
       departamento_id
FROM empleados;

-- Consultar la tabla temporal
SELECT * 
FROM empleados_unificados;

-- 3.- Crea una tabla temporal de la tabla clientes donde solo tengas la columna nombre.

-- Crear una tabla temporal con solo la columna nombre de la tabla clientes
CREATE TEMPORARY TABLE clientes_nombres
AS
SELECT nombre
FROM clientes;

-- Consultar la tabla temporal
SELECT * 
FROM clientes_nombres;

-- 4.- Realiza la unión entre las tablas temporales de empleados y clientes usando TABLE.

--  Paso 1: Crear la tabla temporal empleados_nombres
CREATE TEMPORARY TABLE empleados_nombres AS
SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo
FROM empleados;

-- Paso 3: Unir las tablas temporales
SELECT e.nombre_completo AS empleado_nombre_completo, c.nombre AS cliente_nombre
FROM empleados_nombres e
JOIN clientes_nombres c;

-- 5.- Crea una tabla temporal escuela primaria que tenga las siguientes columnas: id(int), nombre(varchar), apellido(varchar), edad(int) y grado(int). Y que tenga los siguientes valores:
-- puedes realizar consultas sobre esta tabla como si fuera una tabla normal durante la sesión.
CREATE TEMPORARY TABLE escuela_primaria (
    id INT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    grado INT
);

INSERT INTO escuela_primaria (id, nombre, apellido, edad, grado) VALUES
(1, 'Alejandro', 'González', 11, 5),
(2, 'Isabella', 'López', 10, 4),
(3, 'Lucas', 'Martínez', 11, 5),
(4, 'Sofía', 'Rodríguez', 10, 4),
(5, 'Mateo', 'Pérez', 12, 6),
(6, 'Valentina', 'Fernández', 12, 6),
(7, 'Diego', 'Torres', 10, 4),
(8, 'Martina', 'Gómez', 11, 5),
(9, 'Joaquín', 'Hernández', 10, 4),
(10, 'Valeria', 'Díaz', 11, 5);
-- Algunas consultas
-- 1.- Mostrar la estructura de la tabla temporal:
DESCRIBE escuela_primaria;
-- 2. Mostrar los datos de la tabla temporal:
SELECT * FROM escuela_primaria;











-- ✏️Ejercicios Complementarios con Tablas Temporales 

-- 1. Agregar el nuevo cliente:
INSERT INTO clientes (nombre, direccion)
VALUES ('Ana Rodríguez', 'San Martín 2515, Mar del Plata');

-- 1.1. Recrear la tabla temporal de clientes:
-- CREATE TEMPORARY TABLE clientes_nombres AS
-- SELECT nombre FROM clientes;

-- 1.2.Realizar la intersección entre empleados y clientes:
SELECT e.nombre_completo AS empleado_nombre_completo, c.nombre AS cliente_nombre
FROM empleados_nombres e
JOIN clientes_nombres c
LIMIT 1000;




-- 2. Realiza la excepción entre la tabla temporal de clientes y la de empleados.
SELECT c.nombre AS cliente_nombre
FROM clientes_nombres c
LEFT JOIN empleados_nombres e ON c.nombre = e.nombre_completo
WHERE e.nombre_completo IS NULL;

-- 3. Crea una tabla temporal escuela secundaria que tenga las siguientes columnas: id(int), nombre(varchar), apellido(varchar), edad(int) y grado(int). Y que tenga los siguientes valores:

CREATE TEMPORARY TABLE escuela_secundaria (
    id INT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    grado INT
);

INSERT INTO escuela_secundaria (id, nombre, apellido, edad, grado) VALUES
(1, 'Eduardo', 'Sánchez', 16, 10),
(2, 'Camila', 'Martín', 17, 11),
(3, 'Manuel', 'Gutiérrez', 15, 9),
(4, 'Laura', 'García', 16, 10),
(11, 'Pablo', 'Ortega', 17, 11),
(12, 'Carmen', 'Ramírez', 15, 9),
(13, 'Carlos', 'Molina', 16, 10),
(14, 'Ana', 'Ruiz', 17, 11),
(15, 'Luis', 'Fernández', 15, 9),
(16, 'María', 'López', 16, 10);

-- 4.- Realiza la intersección de la escuela primaria y escuela secundaria con el nombre y apellido de los alumnos para saber quienes fueron a ambas escuelas.

SELECT p.nombre AS nombre, p.apellido AS apellido
FROM escuela_primaria p
INNER JOIN escuela_secundaria s ON p.nombre = s.nombre AND p.apellido = s.apellido;

-- 5.- Realiza la excepción de la escuela primaria con la secundaria para saber quienes no siguieron cursando en dicha escuela secundaria.

SELECT p.nombre AS nombre, p.apellido AS apellido
FROM escuela_primaria p
LEFT JOIN escuela_secundaria s ON p.nombre = s.nombre AND p.apellido = s.apellido
WHERE s.nombre IS NULL;

-- 6.- Realiza la excepción de la escuela secundaria con la primaria para saber quienes no siguieron cursando en dicha escuela secundaria.

SELECT s.nombre AS nombre, s.apellido AS apellido
FROM escuela_secundaria s
LEFT JOIN escuela_primaria p ON s.nombre = p.nombre AND s.apellido = p.apellido
WHERE p.nombre IS NULL;

-- 7.- Realiza la unión de la escuela primaria y secundaria con la columna grado para saber cuáles son los grados que abarcan ambas escuelas, y ordénalos de forma descendente.

SELECT grado
FROM escuela_primaria
UNION
SELECT grado
FROM escuela_secundaria
ORDER BY grado DESC;
-- FIN DE EJERCICIO COMPLE








-- ✏️Ejercicios  Subconsultas All y Any

-- 1.- Encuentra los nombres de los clientes que han realizado compras de productos con un precio superior a la media de precios de todos los productos.
SELECT c.nombre
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
JOIN productos p ON v.producto_id = p.id
WHERE p.precio > (SELECT AVG(precio) FROM productos);

-- 2.- Encuentra los empleados cuyo salario sea mayor que al menos uno de los salarios de los empleados del departamento de "Ventas".

SELECT nombre, apellido
FROM empleados
WHERE salario > ANY (SELECT salario 
                    FROM empleados 
                    WHERE departamento_id = (SELECT id FROM departamentos WHERE nombre = 'Ventas'));

-- 3.- Encuentra los productos cuyos precios sean mayores que todos los precios de los productos con la palabra "Móvil" en su nombre.

SELECT nombre, precio
FROM productos
WHERE precio > ALL (SELECT precio 
                    FROM productos 
                    WHERE nombre LIKE '%Móvil%');
                    
-- 4.- Muestra la información de los clientes que realizaron la compra con el monto total más alto, incluyendo su nombre, dirección y el monto total de compra.

SELECT c.nombre, c.direccion, v.monto_total
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
WHERE v.monto_total = (SELECT MAX(monto_total) FROM ventas);

-- 5.- Para cada departamento, encuentra el empleado con el salario más alto. Muestra el nombre del departamento junto con el nombre del empleado y su salario.

SELECT d.nombre AS departamento, e.nombre, e.apellido, e.salario
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
WHERE e.salario = (SELECT MAX(salario) 
                   FROM empleados 
                   WHERE departamento_id = d.id);
                   





-- Continuando con las práctica

-- ✏️Ejercicios  Subconsultas All y Any

-- 1.- Encuentra los empleados que ganan más que el salario promedio de los empleados del departamento de "Contabilidad".

SELECT *
FROM empleados
WHERE salario > (SELECT AVG(salario) 
                  FROM empleados 
                  WHERE departamento_id = (SELECT id FROM departamentos WHERE nombre = 'Contabilidad'));



-- 2.- Encuentra los productos que tienen un precio superior al precio de al menos uno de los productos vendidos al cliente con nombre "Juan Pérez".

SELECT p.*
FROM productos p
WHERE p.precio > ANY (SELECT precio 
                       FROM ventas v 
                       JOIN clientes c ON v.cliente_id = c.id 
                       WHERE c.nombre = 'Juan Pérez');



-- 3.- Encuentra los departamentos en los que al menos hay un empleado menor de 30 años.

SELECT DISTINCT d.*
FROM departamentos d
JOIN empleados e ON d.id = e.departamento_id
WHERE e.edad < 30;



-- 4.- Muestra la información del empleado más joven, que esté entre los 3 empleados con más cantidad de productos vendidos, incluyendo su nombre, apellido y edad.

SELECT e.nombre, e.apellido, e.edad
FROM empleados e
WHERE e.id IN (
    SELECT empleado_id
    FROM (
        SELECT empleado_id
        FROM ventas
        GROUP BY empleado_id
        ORDER BY SUM(cantidad) DESC
        LIMIT 3
    ) AS top_empleados
)
ORDER BY e.edad ASC
LIMIT 1;




-- 5.- Para cada cliente, encuentra el empleado que realizó la venta con el monto total más alto. Muestra el nombre del cliente junto con el nombre del empleado y el monto total.                   

SELECT c.nombre AS cliente_nombre, e.nombre AS empleado_nombre, v.monto_total
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
JOIN empleados e ON v.empleado_id = e.id
WHERE v.monto_total = (SELECT MAX(monto_total) 
                       FROM ventas 
                       WHERE cliente_id = c.id);










-- ✏️Ejercicios  Complementarios 

-- 1.- Encuentra los clientes que no han realizado ninguna compra. Muestra el nombre y la dirección de estos clientes.

SELECT c.nombre, c.direccion
FROM clientes c
LEFT JOIN ventas v ON c.id = v.cliente_id
WHERE v.id IS NULL;

-- 2.- Muestra el nombre de los productos que se han vendido más veces que cualquier producto con un precio superior a 500.

SELECT p.nombre
FROM productos p
JOIN ventas v ON p.id = v.producto_id
GROUP BY p.id
HAVING COUNT(v.id) > (
    SELECT MAX(cantidad_vendida)
    FROM (
        SELECT COUNT(*) AS cantidad_vendida
        FROM ventas
        JOIN productos ON ventas.producto_id = productos.id
        WHERE productos.precio > 500
        GROUP BY productos.id
    ) AS subquery
);

-- 3.- Encuentra los empleados cuya edad sea menor que la edad de al menos un empleado del departamento de "Recursos Humanos".

SELECT e1.nombre, e1.apellido
FROM empleados e1
WHERE e1.edad < (
    SELECT MAX(e2.edad)
    FROM empleados e2
    WHERE e2.departamento_id = (SELECT id FROM departamentos WHERE nombre = 'Recursos Humanos')
);

-- 4.- Encuentra los productos cuyos precios sean menores o iguales a todos los precios de los productos con la palabra "Cámara" en su nombre.

SELECT nombre
FROM productos
WHERE precio <= ALL (
    SELECT precio
    FROM productos
    WHERE nombre LIKE '%Cámara%'
);

-- 5.- Muestra el nombre y el salario de los empleados con salarios superiores al promedio de salarios de todos los empleados.

SELECT nombre, salario
FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados);

-- 6.- Encuentra el nombre y el salario de los empleados con salarios inferiores al promedio de salarios de todos los empleados del departamento de "Ventas".

SELECT nombre, salario
FROM empleados
WHERE salario < (
    SELECT AVG(salario)
    FROM empleados
    WHERE departamento_id = (SELECT id FROM departamentos WHERE nombre = 'Ventas')
);

-- 7.- Encuentra los clientes que han realizado compras de productos con un precio_unitario inferior al precio promedio de todos los productos.

SELECT DISTINCT c.nombre
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
JOIN productos p ON v.producto_id = p.id
WHERE p.precio < (SELECT AVG(precio) FROM productos);

-- 8.- Encuentra los empleados que tienen un salario igual al salario de al menos un empleado del departamento de "Recursos Humanos".

SELECT DISTINCT e1.nombre, e1.salario
FROM empleados e1
JOIN empleados e2 ON e1.salario = e2.salario
WHERE e2.departamento_id = (SELECT id FROM departamentos WHERE nombre = 'Recursos Humanos');

-- 9.- Encuentra los productos cuyo precio es mayor o igual a todos los precios de los productos con la palabra "Refrigeradora" en su nombre.

SELECT nombre
FROM productos
WHERE precio >= ALL (
    SELECT precio
    FROM productos
    WHERE nombre LIKE '%Refrigeradora%'
);

-- 10.- Muestra el nombre, apellido y salario del empleado con el salario más alto que esté por debajo del promedio salarial de los empleados.					

SELECT nombre, apellido, salario
FROM empleados
WHERE salario < (SELECT AVG(salario) FROM empleados)
ORDER BY salario DESC
LIMIT 1;























-- Base de datos Relacionales - MySQL: Funciones de Texto

-- Ejercicios con funciones de texto - Parte 1

-- ✏️Ejercicios funciones de texto

-- 1. Crea una tabla llamada "estudiantes" con cinco columnas: "id" de tipo INT como clave primaria, "nombre" de tipo VARCHAR(50), "apellido" de tipo VARCHAR(50), "edad" de tipo INT y "promedio" de tipo FLOAT. Luego, inserta cinco filas en la tabla "estudiantes" con los siguientes datos
CREATE TABLE estudiantes (
    id INT PRIMARY KEY,              -- Columna 'id' es clave primaria (única para cada registro)
    nombre VARCHAR(50),              -- Columna 'nombre' es de tipo texto con hasta 50 caracteres
    apellido VARCHAR(50),            -- Columna 'apellido' es de tipo texto con hasta 50 caracteres
    edad INT,                        -- Columna 'edad' es de tipo entero
    promedio FLOAT                   -- Columna 'promedio' es de tipo decimal (para calificaciones)
);
-- Inserción de los cinco registros en la tabla
INSERT INTO estudiantes (id, nombre, apellido, edad, promedio)
VALUES 
(1, 'Juan', 'Pérez', 22, 85.5),
(2, 'María', 'Gómez', 21, 90.0),
(3, 'Luis', 'Rodríguez', 20, 88.5),
(4, 'Ana', 'Martínez', 23, 92.0),
(5, 'Carlos', 'López', 22, 86.5);
-- Creación o estructura de la tabla estudiantes
DESCRIBE estudiantes;
-- Para ver los registros en la tabla estudiantes
SELECT * FROM estudiantes;


-- 2. Encuentra la longitud del nombre del estudiante con el nombre "Luis" y apellido "Rodríguez".
SELECT LENGTH(nombre) AS longitud_nombre
FROM estudiantes
WHERE nombre = 'Luis' AND apellido = 'Rodríguez';    -- al ejecutar 4
-- LENGTH devuelve la longitud de la cadena en caracteres.


-- 3. Concatena el nombre y el apellido del estudiante con el nombre "María" y apellido "Gómez" con un espacio en el medio. 
SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo
FROM estudiantes
WHERE nombre = 'María' AND apellido = 'Gómez';   -- Resultado María Gómez
-- CONCAT une varias cadenas en una sola. 

-- 4. Encuentra la posición de la primera 'e' en el apellido del estudiante con el nombre "Juan" y apellido "Pérez".
SELECT INSTR(apellido, 'e') AS posicion_e
FROM estudiantes
WHERE nombre = 'Juan' AND apellido = 'Pérez';   -- Resultado 4
-- INSTR devuelve la posición de la primera aparición del carácter especificado.
-- para que me cuente la e con tilde
SELECT LOCATE('e', REPLACE(apellido, 'é', 'e')) AS posicion_primera_e FROM estudiantes WHERE nombre = 'Juan' AND apellido = 'Pérez';

-- 5. Inserta la cadena ' García' en la posición 3 del nombre del estudiante con el nombre "Ana" y apellido "Martínez".
SET SQL_SAFE_UPDATES = 0;

SELECT INSERT(nombre, 3, 0, ' García') AS nuevo_nombre
FROM estudiantes
WHERE nombre = 'Ana' AND apellido = 'Martínez';
-- INSERT agrega una subcadena en la posición dada sin reemplazar caracteres.

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM estudiantes;

-- 6.- Convierte el nombre del estudiante con el nombre "Luis" y apellido "Rodríguez" a minúsculas. (LOWER)
SELECT LOWER(nombre) AS nombre_minuscula
FROM estudiantes
WHERE nombre = 'Luis' AND apellido = 'Rodríguez';
-- LOWER convierte una cadena de texto a minúsculas.

-- 7.- Convierte el apellido del estudiante con el nombre "Juan" y apellido "Pérez" a mayúsculas. (UPPER)
SELECT UPPER(apellido) AS apellido_mayuscula
FROM estudiantes
WHERE nombre = 'Juan' AND apellido = 'Pérez';
-- UPPER convierte una cadena de texto a mayúsculas.

-- 8.- Obtiene los primeros 4 caracteres del apellido del estudiante con el nombre "María" y apellido "Gómez". (LEFT)
SELECT LEFT(apellido, 4) AS primeros_4
FROM estudiantes
WHERE nombre = 'María' AND apellido = 'Gómez';
-- LEFT extrae los primeros caracteres especificados.

-- 9.- Obtiene los últimos 3 caracteres del apellido del estudiante con el nombre "Ana" y apellido "Martínez". (RIGHT)
SELECT RIGHT(apellido, 3) AS ultimos_3
FROM estudiantes
WHERE nombre = 'Ana' AND apellido = 'Martínez';
-- RIGHT extrae los últimos caracteres especificados.

-- 10.- Encuentra la posición de la primera 'o' en el nombre del estudiante con el nombre "Carlos" y apellido "López". (LOCATE)
SELECT LOCATE('o', nombre) AS posicion_o
FROM estudiantes
WHERE nombre = 'Carlos' AND apellido = 'López';
-- LOCATE devuelve la posición de la primera aparición de la subcadena.

-- 11.- Encuentra la posición de la primera aparición de la letra 'a' en el nombre de la estudiante con el nombre "María" y apellido "Gómez".
SELECT LOCATE('a', nombre) AS posicion_a
FROM estudiantes
WHERE nombre = 'María' AND apellido = 'Gómez';
-- LOCATE devuelve la posición de la primera aparición de la subcadena.

-- 12.- Reemplaza 'a' con 'X' en el nombre del estudiante con el nombre "Ana" y apellido "Martínez". 
SELECT REPLACE(nombre, 'a', 'X') AS nuevo_nombre
FROM estudiantes
WHERE nombre = 'Ana' AND apellido = 'Martínez';
-- REPLACE reemplaza todas las ocurrencias de una subcadena con otra.

-- 13.- Encuentra la subcadena de 3 caracteres de longitud de la columna 'nombre' del estudiante con el nombre "María" y apellido "Gómez", comenzando en la posición 2.
SELECT SUBSTRING(nombre, 2, 3) AS subcadena
FROM estudiantes
WHERE nombre = 'María' AND apellido = 'Gómez';
-- SUBSTRING devuelve una subcadena de una cadena especificando la posición y la longitud.

-- 14.- Combina los nombres de todos los estudiantes en una única cadena separada por guiones.
SELECT GROUP_CONCAT(nombre SEPARATOR '-') AS nombres_concatenados
FROM estudiantes;
-- GROUP_CONCAT concatena los valores de una columna agrupados con un separador.

-- 15.- Combina los nombres y apellidos de todos los estudiantes en una única cadena separada por un guion vertical (|).
SELECT GROUP_CONCAT(CONCAT(nombre, ' ', apellido) SEPARATOR '|') AS nombres_apellidos_concatenados
FROM estudiantes;
-- GROUP_CONCAT con CONCAT une el nombre y apellido separados por espacio, y luego agrupa con '|'.

-- 16.- Elimina los espacios en blanco iniciales del texto "    … usé muchos espacios    ".
SELECT LTRIM('    … usé muchos espacios    ') AS sin_espacios_iniciales;
-- LTRIM elimina los espacios en blanco a la izquierda (inicio) de la cadena.

-- 17.- Elimina los espacios en blanco finales del texto "    … usé muchos espacios    ".
SELECT RTRIM('    … usé muchos espacios    ') AS sin_espacios_finales;
-- RTRIM elimina los espacios en blanco a la derecha (final) de la cadena.

-- 18.- Cita el resultado de los dos ejercicios anteriores utilizando la función QUOTE.
SELECT QUOTE(LTRIM('    … usé muchos espacios    ')) AS cita_inicial,
       QUOTE(RTRIM('    … usé muchos espacios    ')) AS cita_final;
-- QUOTE añade comillas simples a los resultados.

-- FIN DE LA ACTIVIDAD: PARTE 1









-- Ejercicios con funciones de texto - Parte 2
-- ✏️Ejercicios funciones de texto

-- 1.- Repite el nombre y apellido del estudiante con el nombre "Juan" y apellido "Pérez" tres veces.
SELECT REPEAT(CONCAT(nombre, ' ', apellido), 3) AS nombre_repetido
FROM estudiantes
WHERE nombre = 'Juan' AND apellido = 'Pérez';

-- REPEAT repite una cadena un número especificado de veces.
-- CONCAT une nombre y apellido con un espacio en el medio.

-- 2.- Invierte el nombre del estudiante con el nombre "Ana" y apellido "Martínez"

SELECT REVERSE(nombre) AS nombre_invertido
FROM estudiantes
WHERE nombre = 'Ana' AND apellido = 'Martínez';
-- REVERSE invierte el orden de los caracteres de una cadena.

-- 3.- Devuelve una cadena que contiene 8 caracteres de espacio usando la función SPACE y muéstrala con la función QUOTE.
SELECT QUOTE(SPACE(8)) AS espacios_citados;
-- SPACE genera una cadena de espacios de la longitud especificada.
-- QUOTE pone la cadena resultante entre comillas simples.

-- 4.- Extrae una subcadena que contiene el nombre del estudiante con el nombre "María" y apellido "Gómez" antes de la segunda a utilizar SUBSTRING_INDEX.
SELECT SUBSTRING_INDEX(nombre, 'a', 2) AS subcadena
FROM estudiantes
WHERE nombre = 'María' AND apellido = 'Gómez';
-- SUBSTRING_INDEX devuelve una subcadena hasta la segunda aparición del delimitador ('a' en este caso).

-- 5.- Combina las edades de todos los estudiantes en una única cadena separada por comas y orden descendente.
SELECT GROUP_CONCAT(edad ORDER BY edad DESC SEPARATOR ',') AS edades
FROM estudiantes;
-- GROUP_CONCAT combina valores de una columna en una única cadena.
-- ORDER BY DESC ordena los valores en orden descendente.

-- 6.- Elimina las 'a' del nombre' del estudiante con el nombre "Ana" y apellido "Martínez" usando la función REPLACE. 
SELECT REPLACE(nombre, 'a', '') AS nombre_sin_a
FROM estudiantes
WHERE nombre = 'Ana' AND apellido = 'Martínez';
-- REPLACE reemplaza todas las ocurrencias de 'a' por una cadena vacía (''), eliminando las 'a'.

-- 7.- Rellene a la derecha el promedio del estudiante con el nombre "Luis" y apellido "Rodríguez" con asteriscos hasta una longitud total de 10 caracteres. 
SELECT LPAD(promedio, 10, '*') AS promedio_relleno
FROM estudiantes
WHERE nombre = 'Luis' AND apellido = 'Rodríguez';
-- LPAD rellena una cadena por la izquierda hasta alcanzar la longitud especificada.

-- 8.- Obtenga el promedio del estudiante con nombre 'Carlos' y apellido 'López', formateado con dos decimales y utilizando la configuración regional 'es_AR'.alter.alter
SELECT FORMAT(promedio, 2, 'es_AR') AS promedio_formateado
FROM estudiantes
WHERE nombre = 'Carlos' AND apellido = 'López';

-- FORMAT formatea el valor numérico con el número de decimales especificado y el formato regional.
-- FIN DE ACTIVIDAD PARTE 2






















-- Iniciando con la práctica de funciones de fecha y hora
-- ✏️ Ejercicios funciones de fecha y hora

-- 1.- Crea una tabla llamada "envios" con cuatro columnas: "id" de tipo INT como clave primaria y autoincremental, "fecha_envio" de tipo DATETIME, "fecha_entrega" de tipo DATETIME y "codigo_producto" de tipo VARCHAR(10). Luego, inserta siete filas en la tabla "envios" con los siguientes datos
CREATE TABLE envios (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Clave primaria autoincremental
    fecha_envio DATETIME,              -- Fecha de envío con tipo DATETIME
    fecha_entrega DATETIME,            -- Fecha de entrega con tipo DATETIME
    codigo_producto VARCHAR(10)        -- Código del producto
);

-- Insertar los datos de los envíos
INSERT INTO envios (fecha_envio, fecha_entrega, codigo_producto)
VALUES
('2022-01-15 08:00:00', '2022-01-20 12:30:00', 'ABC123'),
('2022-02-10 10:15:00', '2022-02-15 14:45:00', 'XYZ789'),
('2022-03-05 09:30:00', '2022-03-10 13:20:00', 'PQR456'),
('2022-04-20 11:45:00', '2022-04-25 15:10:00', 'LMN001'),
('2022-05-12 07:55:00', '2022-05-17 10:25:00', 'DEF777'),
('2022-06-08 08:20:00', '2022-06-13 12:40:00', 'GHI888'),
('2022-07-03 10:05:00', '2022-07-08 14:15:00', 'JKL999');
-- para ver los registros
SELECT * FROM envios;


-- 2.- Utilizando la función DATE_ADD, calcula la fecha de entrega programada para un envío con código de producto 'ABC123' cuando se le añaden 5 días a la fecha de envío.
SELECT DATE_ADD(fecha_envio, INTERVAL 5 DAY) AS fecha_entrega_programada
FROM envios
WHERE codigo_producto = 'ABC123';

-- 3.- Utilizando la función ADDTIME, encuentra la hora estimada de entrega para un envío con código de producto 'XYZ789' si se suma 4 horas y 30 minutos a la hora de entrega. 
SELECT ADDTIME(fecha_entrega, '04:30:00') AS nueva_hora_entrega
FROM envios
WHERE codigo_producto = 'XYZ789';

-- 4.- Utilizando la función CONVERT_TZ, convierte la fecha de envío de un envío con código de producto 'PQR456' de la zona horaria 'UTC' (+00:00) a la zona horaria de Argentina GMT-3 (-03:00).
SELECT CONVERT_TZ(fecha_envio, '+00:00', '-03:00') AS fecha_envio_argentina
FROM envios
WHERE codigo_producto = 'PQR456';

-- 5.- Calcula la diferencia en días entre la fecha de entrega y la fecha de envío para el envío con el código de producto 'LMN001' utilizando la función DATEDIFF.
SELECT DATEDIFF(fecha_entrega, fecha_envio) AS dias_diferencia
FROM envios
WHERE codigo_producto = 'LMN001';

-- 6.- Utilice la función CURDATE para obtener la fecha actual y, a continuación, obtener la diferencia en días entre la fecha de entrega con código de producto 'DEF777' y la fecha actual.
SELECT DATEDIFF(fecha_entrega, CURDATE()) AS dias_restantes
FROM envios
WHERE codigo_producto = 'DEF777';

-- 7.- Utilizando la función CURTIME, obtenga la hora actual del sistema.
SELECT CURTIME() AS hora_actual;

-- 8.- Utiliza la función DATE para extraer la fecha de envío del envío con ID 3.
SELECT DATE(fecha_envio) AS solo_fecha_envio
FROM envios
WHERE id = 3;

-- 9.- Utilice la función DATE_ADD para calcular la fecha de entrega programada para el envío con código de producto 'XYZ789' si se le agrega 3 días a la fecha de envío.
SELECT DATE_ADD(fecha_envio, INTERVAL 3 DAY) AS nueva_fecha_entrega
FROM envios
WHERE codigo_producto = 'XYZ789';

-- 10.- Utiliza la función DATE_FORMAT para mostrar la fecha de envío del envío con ID 6 en el formato 'DD-MM-AAAA'.
SELECT DATE_FORMAT(fecha_envio, '%d-%m-%Y') AS fecha_formateada
FROM envios
WHERE id = 6;

-- 11.- Utiliza la función DATE_SUB para calcular la fecha de envío del envío con ID 4 si se le restan 2 días.
SELECT DATE_SUB(fecha_envio, INTERVAL 2 DAY) AS fecha_menos_dos_dias
FROM envios
WHERE id = 4;

-- 12.- Utilice la función DATEDIFF para calcular la diferencia en días entre la fecha de envío y la fecha de entrega programada para el envío con código de producto 'PQR456'.
SELECT DATEDIFF(fecha_entrega, fecha_envio) AS dias_diferencia
FROM envios
WHERE codigo_producto = 'PQR456';

-- 13.- Utilice la función DAY para obtener el día del mes en que se realizó el envío con ID 2.
SELECT DAY(fecha_envio) AS dia_envio
FROM envios
WHERE id = 2;

-- 14.- Utilice la función DAYNAME para obtener el nombre del día de la semana en que se entregará el envío con código de producto 'DEF777'.
SELECT DAYNAME(fecha_entrega) AS dia_entrega
FROM envios
WHERE codigo_producto = 'DEF777';

-- 15.- Utilice la función DAYOFMONTH para obtener el día del mes en que se entregará el envío con código de producto 'GHI888'.
SELECT DAYOFMONTH(fecha_entrega) AS dia_entrega
FROM envios
WHERE codigo_producto = 'GHI888';
-- FIN DE PRIMER EJERCICIO














-- Funciones de fecha y hora avanzadas
-- ✏️Ejercicios funciones de fecha y hora

-- 1.- Utilice la función PERIOD_ADD para agregar un período de 3 meses al año-mes '2022-07'.
SELECT PERIOD_ADD(202207, 3) AS nuevo_periodo;
-- PERIOD_ADD agrega un número de meses a un año-mes en formato 'AAAAMM'.
-- Esto sumará 3 meses a '2022-07', resultando en '2022-10'.

-- 2.- Utiliza la función PERIOD_DIFF para calcular el número de meses entre los períodos '2022-03' y '2022-12'.
SELECT PERIOD_DIFF(202212, 202203) AS diferencia_meses;
-- PERIOD_DIFF devuelve la diferencia en meses entre dos periodos 'AAAAMM'.
-- Esto calculará el número de meses entre marzo de 2022 y diciembre de 2022.

-- 3.- Utilice la función QUARTER para obtener el trimestre de la fecha de entrega del envío con código de producto 'PQR456'.
SELECT QUARTER(fecha_entrega) AS trimestre
FROM envios
WHERE codigo_producto = 'PQR456';
-- QUARTER devuelve el trimestre de una fecha dada.
-- Busca la fecha de entrega del producto con el código 'PQR456' y devuelve su trimestre.

-- 4.- Utiliza la función SEC_TO_TIME para convertir 3665 segundos al formato 'hh:mm:ss'.
SELECT SEC_TO_TIME(3665) AS tiempo_formateado;
-- SEC_TO_TIME convierte un valor en segundos al formato de tiempo 'hh:mm:ss'.
-- Convierte 3665 segundos, que son 1 hora, 1 minuto y 5 segundos.

-- 5.- Utiliza la función SECOND para obtener los segundos de la hora de envío del envío con ID 2.
SELECT SECOND(fecha_envio) AS segundos
FROM envios
WHERE id = 2;
-- SECOND extrae los segundos de un valor de fecha/hora.
-- Obtiene los segundos de la fecha de envío del registro con ID 2.

SELECT * FROM envios WHERE id = 2;
-- Agregar Segundos a la hora
UPDATE envios 
SET fecha_envio = CONCAT(DATE(fecha_envio), ' ', TIME_FORMAT(fecha_envio, '%H:%i:%s'));
-- Esto actualiza las fechas con la hora y segundos formateados correctamente

-- 6.- Utiliza la función STR_TO_DATE para convertir la cadena '2022()08()15' en una fecha.
SELECT STR_TO_DATE('2022()08()15', '%Y()%m()%d') AS fecha_convertida;
-- STR_TO_DATE convierte una cadena en una fecha según el formato especificado.
-- Convierte '2022()08()15' a '2022-08-15' utilizando el formato '%Y()%m()%d'.

-- 7.- Utilice la función SUBDATE (o DATE_SUB) para reiniciar 5 días a la fecha de entrega del envío con código de producto 'GHI888'.
SELECT DATE_SUB(fecha_entrega, INTERVAL 5 DAY) AS nueva_fecha_entrega
FROM envios
WHERE codigo_producto = 'GHI888';
-- DATE_SUB resta un intervalo de tiempo a una fecha.
-- Resta 5 días de la fecha de entrega del envío con el código 'GHI888'.

-- 8.- Utiliza la función SUBTIME para reiniciar 2 horas y 15 minutos a la hora de envío del envío con ID 7.
SELECT SUBTIME(fecha_envio, '02:15:00') AS nueva_hora_envio
FROM envios
WHERE id = 7;
-- SUBTIME resta una cantidad de tiempo en formato 'hh:mm:ss' a una fecha/hora.
-- Resta 2 horas y 15 minutos de la hora de envío del ID 7.

-- 9.- Utilice la función TIME para extraer la porción de tiempo de la fecha de envío del envío con ID 1.
SELECT TIME(fecha_envio) AS hora_envio
FROM envios
WHERE id = 1;
-- TIME extrae la porción de tiempo (hora, minuto y segundo) de una fecha/hora.
-- Obtiene la hora de la fecha de envío del registro con ID 1.

-- 10.- Utiliza la función TIME_FORMAT para formatear la hora de envío del envío con ID 2 en 'hh:mm:ss'.
SELECT TIME_FORMAT(fecha_envio, '%H:%i:%s') AS hora_formateada
FROM envios
WHERE id = 2;
-- TIME_FORMAT formatea un valor de hora según un formato especificado.
-- Formatea la hora de envío del registro con ID 2 como 'hh:mm:ss'.

-- 11.- Utiliza la función TIME_TO_SEC para convertir la hora de envío del envío con ID 3 en segundos.
SELECT TIME_TO_SEC(fecha_envio) AS segundos_totales
FROM envios
WHERE id = 3;
-- TIME_TO_SEC convierte un valor de tiempo a segundos.
-- Convierte la hora de envío del registro con ID 3 a su valor en segundos.

-- 12.- Utilice la función TIMEDIFF para calcular la diferencia de horas entre las fechas de envío y entrega del envío con ID 4.
SELECT TIMEDIFF(fecha_entrega, fecha_envio) AS diferencia_horas
FROM envios
WHERE id = 4;
-- TIMEDIFF calcula la diferencia en tiempo entre dos fechas/hora.
-- Calcula la diferencia entre la fecha de envío y entrega del registro con ID 4.

-- 13.- Utilice la función SYSDATE para obtener la hora exacta en la que se ejecuta la función en la consulta. Para comprobar esto invoca SYSDATE, luego la función SLEEP durante 5 segundos y luego vuelve a invocar la función SYSDATE, y verifica la diferencia entre ambas invocaciones con TIMEDIFF.
-- Muestra el tiempo inicial
SELECT SYSDATE() AS tiempo_inicial;
-- Pausa de 5 segundos
SELECT SLEEP(5);
-- Muestra el tiempo después de la pausa
SELECT SYSDATE() AS tiempo_final;

-- 14.- Crea una consulta que utilice la función TIMESTAMP para obtener todos los valores de fecha_envio sumandole 12 horas.
SELECT TIMESTAMP(fecha_envio, '12:00:00') AS nueva_fecha_envio
FROM envios;
-- TIMESTAMP suma una cantidad de tiempo (12 horas) a la fecha de envío.
-- Devuelve la fecha de envío ajustada para cada registro.

-- 15.- Utilice la función TIMESTAMPADD para agregar 3 horas a la fecha de entrega del envío con código de producto 'XYZ789'.
SELECT TIMESTAMPADD(HOUR, 3, fecha_entrega) AS nueva_fecha_entrega
FROM envios
WHERE codigo_producto = 'XYZ789';
-- TIMESTAMPADD agrega un intervalo de tiempo (3 horas) a una fecha.
-- Agrega 3 horas a la fecha de entrega del producto con código 'XYZ789'.













-- ✏️Ejercicios Complementarios 

-- ✏️Ejercicios Complementarios 

-- 1.- Utiliza la función DAYOFWEEK para obtener el número del día de la semana en que se realizó el envío con ID 7.
SELECT DAYOFWEEK(fecha_envio) AS dia_semana FROM envios WHERE id = 7;

-- 2.- Utilice la función DAYOFYEAR para obtener el día del año en que se entregará el envío con código de producto 'JKL999'.
SELECT DAYOFYEAR(fecha_entrega) AS dia_año FROM envios WHERE codigo_producto = 'JKL999';

-- 3.- Utilice la función EXTRACT para obtener el año de la fecha de envío del envío con código de producto 'LMN001'.
SELECT EXTRACT(YEAR FROM fecha_envio) AS año FROM envios WHERE codigo_producto = 'LMN001';

-- 4.- Utiliza la función FROM_DAYS para obtener la fecha correspondiente a 737402 días a partir del año 0.
SELECT FROM_DAYS(737402) AS fecha_correspondiente;

-- 5.- Utiliza la función FROM_UNIXTIME para saber que fecha sería si pasó 1.617.799.784 segundos desde 1970.
SELECT FROM_UNIXTIME(1617799784) AS fecha;

-- 6.- Utilice la función GET_FORMAT para obtener el formato de fecha “EUR” para formatear la fecha de entrega del envío con código de producto 'XYZ789'.
SELECT DATE_FORMAT(fecha_entrega, GET_FORMAT(DATE, 'EUR')) AS fecha_formato_eur FROM envios WHERE codigo_producto = 'XYZ789';

-- 7.- Utilice la función HOUR para extraer la hora de la fecha de envío del envío con ID 1.
SELECT HOUR(fecha_envio) AS hora FROM envios WHERE id = 1;

-- 8.- Utilice la función LAST_DAY para obtener el último día del mes de la fecha de entrega programada para el envío con código de producto 'XYZ789'.
SELECT LAST_DAY(fecha_entrega) AS ultimo_dia_mes FROM envios WHERE codigo_producto = 'XYZ789';

-- 9.- Utilice la función LOCALTIME para obtener la hora y la fecha local actual del servidor.
SELECT LOCALTIME() AS fecha_hora_local;

-- 10.- Utiliza la función MAKEDATE para crear una fecha correspondiente al año 2023 y al día del año 180.
SELECT MAKEDATE(2023, 180) AS fecha;

-- 11.- Utiliza la función MAKETIME para crear una hora con 3 horas, 30 minutos y 15 segundos.
SELECT MAKETIME(3, 30, 15) AS hora;

-- 12.- Utilice la función MICROSECOND para obtener los microsegundos de la fecha de entrega del envío con ID 3.
SELECT MICROSECOND(fecha_entrega) AS microsegundos FROM envios WHERE id = 3;

-- 13.- Utiliza la función MINUTE para obtener el minuto de la hora de envío del envío con ID 4.
SELECT MINUTE(fecha_envio) AS minuto FROM envios WHERE id = 4;

-- 14.- Utiliza la función MES para obtener el mes de la fecha de envío del envío con ID 5.
SELECT MONTH(fecha_envio) AS mes FROM envios WHERE id = 5;

-- 15.- Utilice la función MONTHNAME para obtener el nombre del mes de la fecha de envío del envío con ID 6.
SELECT MONTHNAME(fecha_envio) AS nombre_mes FROM envios WHERE id = 6;

-- 16.- Utiliza la función NOW para obtener la fecha y hora actual.
SELECT NOW() AS fecha_hora_actual;

-- 17.- Utilice la función TIMESTAMPDIFF para calcular la diferencia en días entre la fecha de envío del envío con ID 5 y la fecha de entrega del envío con ID 6.
SELECT TIMESTAMPDIFF(DAY, (SELECT fecha_envio FROM envios WHERE id = 5), (SELECT fecha_entrega FROM envios WHERE id = 6)) AS diferencia_dias;

-- 18.- Utiliza la función TO_DAYS para convertir la fecha de envío del envío con ID 7 en días.
SELECT TO_DAYS(fecha_envio) AS dias_desde_año_0 FROM envios WHERE id = 7;

-- 19.- Utiliza la función TO_SECONDS para convertir la fecha de entrega del envío con código de producto 'JKL999' en segundos desde el Año 0.
SELECT TO_SECONDS(fecha_entrega) AS segundos_desde_año_0 FROM envios WHERE codigo_producto = 'JKL999';

-- 20.- Utiliza la función UNIX_TIMESTAMP para obtener una marca de tiempo Unix de la fecha de envío del envío con ID 1.
SELECT UNIX_TIMESTAMP(fecha_envio) AS unix_timestamp FROM envios WHERE id = 1;

-- 21.- Utiliza la función UTC_DATE para obtener la fecha UTC actual.
SELECT UTC_DATE() AS fecha_utc;

-- 22.- Utiliza la función UTC_TIME para obtener la hora UTC actual.
SELECT UTC_TIME() AS hora_utc;

-- 23.- Utiliza la función UTC_TIMESTAMP para obtener la fecha y hora UTC actual.
SELECT UTC_TIMESTAMP() AS fecha_hora_utc;

-- 24.- Utiliza la función SEMANA para obtener el número de semana de la fecha de envío del envío con ID 2.
SELECT WEEK(fecha_envio) AS semana FROM envios WHERE id = 2;

-- 25.- Utilice la función WEEKDAY para obtener el índice del día de la semana de la fecha de envío del envío con ID 3.
SELECT WEEKDAY(fecha_envio) AS dia_semana FROM envios WHERE id = 3;

-- 26.- Utiliza la función WEEKOFYEAR para obtener la semana del calendario de la fecha de entrega del envío con ID 4.
SELECT WEEKOFYEAR(fecha_entrega) AS semana_calendario FROM envios WHERE id = 4;

-- 27.- Utiliza la función YEAR para obtener el año de la fecha de envío del envío con ID 5.
SELECT YEAR(fecha_envio) AS año FROM envios WHERE id = 5;

-- 28.- Utiliza la función YEARWEEK para obtener el año y la semana de la fecha de envío del envío con ID 6.
SELECT YEARWEEK(fecha_envio) AS año_semana FROM envios WHERE id = 6;
















-- Introducción Vistas y funciones matemáticas
-- Ejercicios Vistas y funciones

-- ✏️Ejercicios vistas y funciones matemáticas

-- 1.- Crea una tabla triangulos_rectangulos con dos columnas: longitud_lado_adyacente y longitud lado_opuesto, ambas de tipo INT.
-- Crear la tabla con dos columnas: longitud_lado_adyacente y longitud_lado_opuesto
CREATE TABLE triangulos_rectangulos (
    longitud_lado_adyacente INT,
    longitud_lado_opuesto INT
);
--  Ver la Tabla Creada 
SELECT * FROM mi__bd.triangulos_rectangulos;

-- 2.- Rellena la tabla triangulos_rectangulos con 10 filas con enteros aleatorios entre 1 y 100
-- Insertar 10 filas con valores aleatorios entre 1 y 100
INSERT INTO triangulos_rectangulos (longitud_lado_adyacente, longitud_lado_opuesto)
VALUES
    (FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100));

-- 3.- Crea una vista donde agrega la columna “hipotenusa” calculándola a partir de los otros dos lados. Utiliza el teorema de Pitágoras para realizar el cálculo: Siendo el lado adyacente “A” y el opuesto “B” y la hipotenusa “C” la fórmula quedaría de la siguiente forma:C = A2 + B2
-- Crear una vista para calcular la hipotenusa usando el teorema de Pitágoras
CREATE VIEW vista_triangulos AS
SELECT longitud_lado_adyacente, longitud_lado_opuesto,
       SQRT(POW(longitud_lado_adyacente, 2) + POW(longitud_lado_opuesto, 2)) AS hipotenusa
FROM triangulos_rectangulos;

-- 4.- Reemplace la vista y ahora agregue dos columnas para calcular el ángulo α en radianes y grados. Aquí tienes dos fórmulas:En radianes: =arcsen(BC) =arccos(AC) = arctan(BA)  
-- Reemplazar la vista y agregar columnas para el ángulo α en radianes y grados
CREATE OR REPLACE VIEW vista_triangulos AS
SELECT longitud_lado_adyacente, longitud_lado_opuesto,
       SQRT(POW(longitud_lado_adyacente, 2) + POW(longitud_lado_opuesto, 2)) AS hipotenusa,
       ATAN2(longitud_lado_opuesto, longitud_lado_adyacente) AS angulo_alfa_radianes,
       DEGREES(ATAN2(longitud_lado_opuesto, longitud_lado_adyacente)) AS angulo_alfa_grados
FROM triangulos_rectangulos;

-- 5.- Reemplace la vista y ahora agregue dos columnas para calcular el ángulo β en radianes y grados. Aquí tienes dos fórmulas:En radianes: β =arccos(BC)=arcsen(AC) = arctan(AB)  
-- Reemplazar la vista y agregar columnas para el ángulo β en radianes y grados
CREATE OR REPLACE VIEW vista_triangulos AS
SELECT longitud_lado_adyacente, longitud_lado_opuesto,
       SQRT(POW(longitud_lado_adyacente, 2) + POW(longitud_lado_opuesto, 2)) AS hipotenusa,
       ATAN2(longitud_lado_opuesto, longitud_lado_adyacente) AS angulo_alfa_radianes,
       DEGREES(ATAN2(longitud_lado_opuesto, longitud_lado_adyacente)) AS angulo_alfa_grados,
       ATAN2(longitud_lado_adyacente, longitud_lado_opuesto) AS angulo_beta_radianes,
       DEGREES(ATAN2(longitud_lado_adyacente, longitud_lado_opuesto)) AS angulo_beta_grados
FROM triangulos_rectangulos;

-- 6.- Reemplace la vista y ahora agregue dos columnas para calcular el ángulo γ en radianes y grados. Como se trata de triángulos rectángulos, el ángulo es de 90°, pero aplica una fórmula de igual manera, usa la regla de que la suma de los ángulos de un triángulo suma 180°.
-- Reemplazar la vista para agregar el ángulo γ (siempre será 90 grados para un triángulo rectángulo)
CREATE OR REPLACE VIEW vista_triangulos AS
SELECT longitud_lado_adyacente, longitud_lado_opuesto,
       SQRT(POW(longitud_lado_adyacente, 2) + POW(longitud_lado_opuesto, 2)) AS hipotenusa,
       ATAN2(longitud_lado_opuesto, longitud_lado_adyacente) AS angulo_alfa_radianes,
       DEGREES(ATAN2(longitud_lado_opuesto, longitud_lado_adyacente)) AS angulo_alfa_grados,
       ATAN2(longitud_lado_adyacente, longitud_lado_opuesto) AS angulo_beta_radianes,
       DEGREES(ATAN2(longitud_lado_adyacente, longitud_lado_opuesto)) AS angulo_beta_grados,
       RADIANS(90) AS angulo_gamma_radianes,
       90 AS angulo_gamma_grados
FROM triangulos_rectangulos;

-- 7.- Crea una tabla triangulos_rectangulos_2 con dos columnas: angulo_alfa y una hipotenusa ambos de tipo INT.
-- Crear una nueva tabla con ángulo alfa y la hipotenusa
CREATE TABLE triangulos_rectangulos_2 (
    angulo_alfa INT,
    hipotenusa INT
);

-- 8.- Rellene la tabla triangulos_rectangulos_2 con 10 filas con enteros aleatorios entre 1 y 89 para angulo_alfa y enteros aleatorios entre 1 y 100 para la columna hipotenusa.
-- Insertar 10 filas con valores aleatorios
INSERT INTO triangulos_rectangulos_2 (angulo_alfa, hipotenusa)
VALUES
    (FLOOR(1 + RAND() * 89), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 89), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 89), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 89), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 89), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 89), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 89), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 89), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 89), FLOOR(1 + RAND() * 100)),
    (FLOOR(1 + RAND() * 89), FLOOR(1 + RAND() * 100));

-- 9.- Crea una vista donde agrega la columna lado_adyacente donde calcula su longitud.
-- Crear la vista que calcule el lado adyacente
CREATE VIEW vista_triangulos_2 AS
SELECT angulo_alfa, hipotenusa,
       hipotenusa * COS(RADIANS(angulo_alfa)) AS lado_adyacente
FROM triangulos_rectangulos_2;

-- 10.- Agrega a la vista la columna lado_opuesto donde calcula su longitud.
-- Reemplazar la vista para agregar la columna lado_opuesto
CREATE OR REPLACE VIEW vista_triangulos_2 AS
SELECT angulo_alfa, hipotenusa,
       hipotenusa * COS(RADIANS(angulo_alfa)) AS lado_adyacente,
       hipotenusa * SIN(RADIANS(angulo_alfa)) AS lado_opuesto
FROM triangulos_rectangulos_2;

-- 11.- Agrega a la vista la columna angulo_beta donde calcula su valor en grados.
-- Reemplazar la vista para agregar la columna angulo_beta
CREATE OR REPLACE VIEW vista_triangulos_2 AS
SELECT angulo_alfa, hipotenusa,
       hipotenusa * COS(RADIANS(angulo_alfa)) AS lado_adyacente,
       hipotenusa * SIN(RADIANS(angulo_alfa)) AS lado_opuesto,
       90 - angulo_alfa AS angulo_beta
FROM triangulos_rectangulos_2;

-- 12.- Agrega a la vista la columna angulo_gamma donde calcula su valor en grados.
-- Reemplazar la vista para agregar la columna angulo_gamma
CREATE OR REPLACE VIEW vista_triangulos_2 AS
SELECT angulo_alfa, hipotenusa,
       hipotenusa * COS(RADIANS(angulo_alfa)) AS lado_adyacente,
       hipotenusa * SIN(RADIANS(angulo_alfa)) AS lado_opuesto,
       90 - angulo_alfa AS angulo_beta,
       90 AS angulo_gamma
FROM triangulos_rectangulos_2;

-- 13.- Redondea todos los valores con hasta dos números decimales.
-- Reemplazar la vista para redondear todos los valores a 2 decimales
CREATE OR REPLACE VIEW vista_triangulos_2 AS
SELECT angulo_alfa, hipotenusa,
       ROUND(hipotenusa * COS(RADIANS(angulo_alfa)), 2) AS lado_adyacente,
       ROUND(hipotenusa * SIN(RADIANS(angulo_alfa)), 2) AS lado_opuesto,
       ROUND(90 - angulo_alfa, 2) AS angulo_beta,
       ROUND(90, 2) AS angulo_gamma
FROM triangulos_rectangulos_2;
-- FIN DE ACTIVIDAD vistas y funciones matemáticas

















-- Ejercicios con funciones matemáticas

-- ✏️ Ejercicios vistas y funciones matemáticas

-- 1.- Crea una tabla mensajes que tenga una columna “datos” de tipo varchar y una columna valor_crc de tipo int
-- Crear la tabla mensajes con dos columnas: datos (varchar) y valor_crc (int)
CREATE TABLE mensajes (
    datos VARCHAR(255),   -- Columna para almacenar el mensaje de texto
    valor_crc BIGINT      -- Columna para almacenar el valor CRC del mensaje
);

-- Insertar las filas especificadas en la tabla mensajes
INSERT INTO mensajes (datos, valor_crc) VALUES
('Hola, ¿cómo estás? Espero que tengas un buen día.', 3221685809),
('Ayer fui al cine a ver una película genial.', 951196167),
('Estoy emocionado por el próximo fin de semana.', 3275166159),
('Mi reunión se pospuso para el martes que viene.', 169741145),
('He estado trabajando en un proyecto importante.', 6480112535),
('Esta receta de pastel de manzana es deliciosa.', 2524836786),
('Planeo hacer un viaje a la playa este verano.', 5107635050),
('Mi gato se divierte jugando con su pelota.', 3578632817),
('Hoy es un día soleado y agradable.', 3675102258),
('El libro que estoy leyendo es muy interesante.', 854938277);

-- 2.- Crea una vista con una tercera columna “análisis” donde verifiques si el valor crc del mensaje es igual al valor de la segunda columna, si no es igual muestra un mensaje “adulterado” en la tercera columna o “correcto” en el caso contrario.
-- Crear una vista que agregue una columna "análisis" que indique si el valor CRC es correcto
CREATE OR REPLACE VIEW vista_mensajes AS
SELECT datos, valor_crc,
       CASE
           -- Si el valor_crc del mensaje es igual al valor esperado, muestra "correcto"
           WHEN valor_crc = CRC32(datos) THEN 'correcto'
           -- Si no es igual, muestra "adulterado"
           ELSE 'adulterado'
       END AS analisis
FROM mensajes;
-- Para ver los resultados
SELECT * FROM vista_mensajes;

-- 3.- Crea una tabla llamada ahorros con tres columnas: ahorro_inicial (la cantidad inicial de ahorros en dólares) de tipo decimal(10, 2), periodos (el número de períodos en años) de tipo int, y tasa_interes (la tasa de interés nominal anual en porcentaje) de tipo decimal(5, 2). 
-- Crear la tabla ahorros con tres columnas: ahorro_inicial (decimal), periodos (int), y tasa_interes (decimal)
CREATE TABLE ahorros (
    ahorro_inicial DECIMAL(10, 2),  -- Cantidad inicial de ahorros
    periodos INT,                   -- Número de periodos (años)
    tasa_interes DECIMAL(5, 2)      -- Tasa de interés anual nominal
);

-- 4.- Llena la tabla con 10 filas de números aleatorios para ahorro_inicial (un valor mayor a 1000), periodos (un valor entre 1 y 10), y tasa_interes (un valor entre 1 y 1,20).
-- Insertar 10 filas con valores aleatorios en la tabla ahorros
INSERT INTO ahorros (ahorro_inicial, periodos, tasa_interes) VALUES
(1200.00, 5, 1.15),
(1500.50, 3, 1.10),
(2000.00, 7, 1.08),
(2500.75, 10, 1.12),
(3000.25, 4, 1.05),
(1750.00, 6, 1.20),
(2200.40, 9, 1.18),
(1800.10, 8, 1.09),
(1950.60, 2, 1.14),
(2700.90, 1, 1.07);
-- verificar el contenido de la tabla
SELECT * FROM ahorros;

-- 5.- Crea una vista llamada vista_ahorros_futuros que incluye una columna con el cálculo de los ahorros futuros ajustados por la tasa de interés. Para esto utilizaremos la fórmula para calcular el interés compuesto:
-- Crear una vista para calcular el valor futuro de los ahorros utilizando interés compuesto
CREATE OR REPLACE VIEW vista_ahorros_futuros AS
SELECT ahorro_inicial, periodos, tasa_interes,
       -- Cálculo del valor futuro usando la fórmula VF = VA * (1 + r)^n
       ahorro_inicial * POW((1 + tasa_interes / 100), periodos) AS valor_futuro
FROM ahorros;
-- Para ver los resultados
SELECT * FROM vista_ahorros_futuros;
-- FIN DE ACTIVIDAD vistas y funciones matemáticas




















-- ✏️Ejercicios Complementarios

-- 1. Crear la tabla concentracion_de_hidrogenos
-- Crear la tabla concentracion_de_hidrogenos con una columna id autoincremental y otra de nanomoles_por_litro
CREATE TABLE concentracion_de_hidrogenos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nanomoles_por_litro DECIMAL(15, 10) -- Columna que almacena la concentración en nanomoles por litro
);

-- Modificar la tabla para que la columna nanomoles_por_litro sea de tipo DOUBLE
ALTER TABLE concentracion_de_hidrogenos
MODIFY COLUMN nanomoles_por_litro DOUBLE;

-- Insertar los valores de nanomoles_por_litro después de modificar la columna a DOUBLE
INSERT INTO concentracion_de_hidrogenos (nanomoles_por_litro) VALUES
(POW(10, 9)), 
(POW(10, 8)), 
(POW(10, 7)), 
(POW(10, 6)), 
(POW(10, -1)), 
(POW(10, -2)), 
(POW(10, -3)), 
(POW(10, -4)), 
(POW(10, -5)), 
(POW(10, 5));
-- Para ver los resultados
SELECT * FROM concentracion_de_hidrogenos;

-- 2. Crear una vista que calcule el pH

-- Crear una vista para calcular el pH de la sustancia, primero convirtiendo nanomoles a moles y luego aplicando la fórmula de pH
CREATE OR REPLACE VIEW vista_ph AS
SELECT id, nanomoles_por_litro,
       -- Conversión de nanomoles a moles (1 mol = 1,000,000,000 nanomoles)
       nanomoles_por_litro / 1000000000 AS moles_por_litro,
       -- Calcular el pH usando la fórmula pH = -LOG10([H+])
       -LOG10(nanomoles_por_litro / 1000000000) AS ph
FROM concentracion_de_hidrogenos;
-- Para ver los resultados
SELECT * FROM vista_ph;

-- 3. Crear una vista con la clasificación del pH

-- Crear una vista para agregar la columna escala_de_ph
CREATE OR REPLACE VIEW vista_clasificacion_ph AS
SELECT id, nanomoles_por_litro, moles_por_litro, ph,
       CASE
           -- Clasificación de pH en Ácido, Neutro o Alcalina
           WHEN ph > 7 THEN 'Alcalina'
           WHEN ph = 7 THEN 'Neutro'
           WHEN ph < 7 THEN 'Ácido'
       END AS escala_de_ph
FROM vista_ph;
-- Para ver los resultados
SELECT * FROM vista_clasificacion_ph;

-- 4. Crear la tabla numeros_ocultos

-- Crear la tabla numeros_ocultos con columnas columna_1 (varchar) y columna_2 (int)
CREATE TABLE numeros_ocultos (
    columna_1 VARCHAR(255),
    columna_2 INT
);

-- Insertar los valores proporcionados en la tabla numeros_ocultos
INSERT INTO numeros_ocultos (columna_1, columna_2) VALUES
('EB4ECB', 16),
('25SK1E', 31),
('8C2B88', 22),
('58D660A', 15),
('100010020211000', 3),
('20251A2', 13),
('4MFL6M', 23),
('IO36L', 29),
('748D676', 14),
('J1G50', 32);
-- Para ver los resultados
SELECT * FROM numeros_ocultos;

-- 5. Crear una vista para convertir los números a base 10

-- Crear una vista para convertir los valores de columna_1 a base 10
CREATE OR REPLACE VIEW vista_numeros_base10 AS
SELECT columna_1, columna_2,
       -- Convertir el valor de columna_1 desde la base en columna_2 a base 10
       CONV(columna_1, columna_2, 10) AS valor_base_10
FROM numeros_ocultos
ORDER BY valor_base_10 DESC;

-- Para ver los resultados
SELECT * FROM vista_numeros_base10;

-- 6. Actualizar la vista vista_ahorros_futuros y crear una nueva vista vista_ahorro_inicial

-- Actualizar la vista vista_ahorros_futuros para no incluir la columna ahorro_inicial
CREATE OR REPLACE VIEW vista_ahorros_futuros AS
SELECT periodos, tasa_interes,
       ahorro_inicial * POW((1 + tasa_interes / 100), periodos) AS valor_futuro
FROM ahorros;

-- Crear una nueva vista vista_ahorro_inicial para calcular el valor actual (ahorro_inicial)
CREATE OR REPLACE VIEW vista_ahorro_inicial AS
SELECT periodos, valor_futuro,
       -- Calcular ahorro_inicial usando la fórmula VA = VF / (1 + r)^n
       valor_futuro / POW((1 + tasa_interes / 100), periodos) AS ahorro_inicial
FROM vista_ahorros_futuros;

-- 7. Crear la vista vista_tasa_interes

-- Crear una vista vista_tasa_interes para calcular la tasa de interés
CREATE OR REPLACE VIEW vista_tasa_interes AS
SELECT valor_futuro, ahorro_inicial,
       -- Calcular la tasa de interés usando la fórmula r = ((VF / VA)^(1/n)) - 1
       POW((valor_futuro / ahorro_inicial), (1 / periodos)) - 1 AS tasa_interes
FROM vista_ahorro_inicial;
-- Ver Resultado
SELECT * FROM vista_tasa_interes;

-- 8. Crear la vista vista_periodos

-- Crear la vista vista_periodos para calcular el número de periodos
CREATE OR REPLACE VIEW vista_periodos AS
SELECT valor_futuro, ahorro_inicial, tasa_interes,
       -- Calcular los periodos usando la fórmula n = ln(VF / VA) / ln(1 + r)
       LOG(valor_futuro / ahorro_inicial) / LOG(1 + tasa_interes) AS periodos
FROM vista_tasa_interes;
-- Ver Resultado
SELECT * FROM vista_periodos;
-- FIN DE EJERCICIOS COMPLEMETARIOS
