-- ============================================
-- PROYECTO SEMANAL — CONSULTAS SELECT
-- Semana 04
-- Dominio: Call Center
-- ============================================

-- ============================================
-- CREACIÓN DE TABLAS
-- ============================================

DROP TABLE IF EXISTS llamadas;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS agentes;

CREATE TABLE agentes (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    correo TEXT NOT NULL,
    telefono TEXT NOT NULL,
    cargo TEXT NOT NULL,
    salario REAL NOT NULL,
    turno TEXT NOT NULL,
    fecha_contratacion DATE DEFAULT CURRENT_DATE,
    is_active INTEGER DEFAULT 1
);

CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    correo TEXT NOT NULL,
    telefono TEXT NOT NULL,
    ciudad TEXT DEFAULT 'Bogotá',
    tipo_cliente TEXT NOT NULL,
    fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE llamadas (
    id INTEGER PRIMARY KEY,
    agente_id INTEGER NOT NULL,
    cliente_id INTEGER NOT NULL,
    duracion_minutos INTEGER NOT NULL,
    tipo_llamada TEXT NOT NULL,
    estado TEXT DEFAULT 'Completada',
    observaciones TEXT,
    fecha_llamada DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (agente_id) REFERENCES agentes(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- ============================================
-- INSERTS AGENTES
-- ============================================

INSERT INTO agentes
(id, nombre, apellido, correo, telefono, cargo, salario, turno)
VALUES
(1,'Carlos','Ramirez','carlos@call.com','3001111111','Asesor',2000000,'Diurno'),
(2,'Laura','Gomez','laura@call.com','3002222222','Supervisor',2500000,'Nocturno'),
(3,'Andres','Torres','andres@call.com','3003333333','Asesor',1800000,'Diurno'),
(4,'Sofia','Martinez','sofia@call.com','3004444444','Asesor',1900000,'Mixto'),
(5,'Daniel','Rojas','daniel@call.com','3005555555','Coordinador',3200000,'Diurno'),
(6,'Valentina','Lopez','valentina@call.com','3006666666','Asesor',1850000,'Nocturno'),
(7,'Mateo','Perez','mateo@call.com','3007777777','Asesor',1800000,'Diurno'),
(8,'Camila','Diaz','camila@call.com','3008888888','Supervisor',2600000,'Mixto'),
(9,'Juan','Castro','juan@call.com','3009999999','Asesor',1700000,'Nocturno'),
(10,'Sara','Mendoza','sara@call.com','3011111111','Asesor',1820000,'Diurno');

-- ============================================
-- INSERTS CLIENTES
-- ============================================

INSERT INTO clientes
(id,nombre,apellido,correo,telefono,ciudad,tipo_cliente)
VALUES
(1,'Ana','Ruiz','ana@gmail.com','3111111111','Bogotá','Premium'),
(2,'Pedro','Lopez','pedro@gmail.com','3112222222','Medellín','Regular'),
(3,'Luisa','Gomez','luisa@gmail.com','3113333333','Cali','Empresarial'),
(4,'Jorge','Martinez','jorge@gmail.com','3114444444','Bogotá','Premium'),
(5,'Camila','Torres','camila@gmail.com','3115555555','Barranquilla','Regular'),
(6,'David','Perez','david@gmail.com','3116666666','Cali','Premium'),
(7,'Paula','Rojas','paula@gmail.com','3117777777','Bogotá','Empresarial'),
(8,'Oscar','Vega','oscar@gmail.com','3118888888','Medellín','Regular'),
(9,'Juliana','Diaz','juliana@gmail.com','3119999999','Cali','Premium'),
(10,'Sebastian','Morales','sebastian@gmail.com','3121111111','Bogotá','Regular');

-- ============================================
-- INSERTS LLAMADAS
-- ============================================

INSERT INTO llamadas
(id,agente_id,cliente_id,duracion_minutos,tipo_llamada,estado,observaciones)
VALUES
(1,1,1,12,'Soporte','Completada','Problema solucionado'),
(2,2,2,8,'Ventas','Completada','Cliente interesado'),
(3,3,3,15,'Reclamo','Completada','Escalado'),
(4,4,4,6,'Información','Completada','Consulta resuelta'),
(5,5,5,20,'Soporte','Completada','Configuración realizada'),
(6,6,6,10,'Ventas','Completada','Venta realizada'),
(7,7,7,7,'Información','Completada','Solicitud recibida'),
(8,8,8,5,'Reclamo','Completada','Caso cerrado'),
(9,9,9,14,'Soporte','Completada','Actualización realizada'),
(10,10,10,9,'Ventas','Completada','Cliente indeciso'),
(11,1,2,11,'Información','Completada','Información entregada'),
(12,2,3,4,'Reclamo','Completada','Compensación aplicada'),
(13,3,4,13,'Soporte','Completada','Error solucionado'),
(14,4,5,16,'Ventas','Completada','Seguimiento pendiente'),
(15,5,6,18,'Información','Completada','Cliente satisfecho'),
(16,6,7,7,'Soporte','Completada','Reinicio sistema'),
(17,7,8,8,'Ventas','Completada','Promoción enviada'),
(18,8,9,9,'Información','Completada','Consulta técnica'),
(19,9,10,10,'Reclamo','Completada','Proceso abierto'),
(20,10,1,6,'Ventas','Completada','Oferta aceptada'),
(21,1,3,12,'Soporte','Completada','Equipo actualizado'),
(22,2,4,11,'Información','Completada','Datos verificados'),
(23,3,5,14,'Reclamo','Completada','Caso revisado'),
(24,4,6,5,'Ventas','Completada','Interés confirmado'),
(25,5,7,7,'Soporte','Completada','Acceso recuperado'),
(26,6,8,9,'Información','Completada','Cambio realizado'),
(27,7,9,13,'Ventas','Completada','Pago pendiente'),
(28,8,10,6,'Reclamo','Completada','Solicitud enviada'),
(29,9,1,15,'Soporte','Completada','Sistema reparado'),
(30,10,2,10,'Información','Completada','Cliente orientado');

-- ============================================
-- CONSULTAS SELECT
-- ============================================

-- Consulta 1: agentes activos
SELECT
    nombre AS nombre_agente,
    apellido AS apellido_agente,
    cargo AS cargo_agente
FROM agentes
WHERE is_active = 1;

-- Consulta 2: clientes premium
SELECT
    nombre AS cliente,
    ciudad AS ciudad_cliente,
    tipo_cliente AS categoria
FROM clientes
WHERE tipo_cliente = 'Premium';

-- Consulta 3: llamadas mayores a 10 minutos
SELECT
    id AS llamada,
    duracion_minutos AS duracion,
    tipo_llamada AS categoria
FROM llamadas
WHERE duracion_minutos > 10;

-- Consulta 4: agentes ordenados por salario
SELECT
    nombre,
    apellido,
    salario
FROM agentes
ORDER BY salario DESC;

-- Consulta 5: clientes ordenados por ciudad
SELECT
    nombre,
    apellido,
    ciudad
FROM clientes
ORDER BY ciudad ASC;

-- Consulta 6: primeras 5 llamadas
SELECT
    id,
    tipo_llamada,
    duracion_minutos
FROM llamadas
LIMIT 5 OFFSET 0;

-- Consulta 7: segunda página de llamadas
SELECT
    id,
    tipo_llamada,
    duracion_minutos
FROM llamadas
LIMIT 5 OFFSET 5;

-- Consulta 8: llamadas tipo ventas
SELECT
    id AS codigo_llamada,
    tipo_llamada AS tipo,
    estado AS estado_llamada
FROM llamadas
WHERE tipo_llamada = 'Ventas';

-- Consulta 9: clientes de Bogotá
SELECT
    nombre AS cliente,
    ciudad
FROM clientes
WHERE ciudad = 'Bogotá';

-- Consulta 10: agentes con salario mayor a 2 millones
SELECT
    nombre,
    apellido,
    salario
FROM agentes
WHERE salario >= 2000000;