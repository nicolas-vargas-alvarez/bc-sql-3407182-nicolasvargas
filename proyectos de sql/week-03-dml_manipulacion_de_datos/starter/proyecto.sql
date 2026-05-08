-- ============================================
-- PROYECTO SEMANAL: DML — Manipulación de Datos
-- Semana 03 — INSERT INTO, UPDATE, DELETE
-- DOMINIO: CENTRO DE CALL CENTER
-- ============================================

-- ============================================
-- ELIMINAR TABLAS SI EXISTEN
-- ============================================

DROP TABLE IF EXISTS llamadas;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS agentes;

-- ============================================
-- CREACIÓN DE TABLAS
-- ============================================

CREATE TABLE IF NOT EXISTS agentes (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre              TEXT NOT NULL,
    apellido            TEXT NOT NULL,
    correo              TEXT NOT NULL UNIQUE,
    telefono            TEXT NOT NULL UNIQUE,
    cargo               TEXT NOT NULL,
    salario             REAL NOT NULL CHECK(salario > 0),
    turno               TEXT NOT NULL DEFAULT 'Diurno',
    fecha_contratacion  DATE DEFAULT CURRENT_DATE,
    is_active           INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS clientes (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre              TEXT NOT NULL,
    apellido            TEXT NOT NULL,
    correo              TEXT NOT NULL UNIQUE,
    telefono            TEXT NOT NULL UNIQUE,
    ciudad              TEXT DEFAULT 'Bogotá',
    tipo_cliente        TEXT NOT NULL,
    fecha_registro      DATE DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS llamadas (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    agente_id           INTEGER NOT NULL,
    cliente_id          INTEGER NOT NULL,
    duracion_minutos    INTEGER NOT NULL CHECK(duracion_minutos > 0),
    tipo_llamada        TEXT NOT NULL,
    estado              TEXT NOT NULL DEFAULT 'Completada',
    observaciones       TEXT,
    fecha_llamada       DATE DEFAULT CURRENT_DATE,

    FOREIGN KEY (agente_id) REFERENCES agentes(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- ============================================
-- PARTE 1: INSERT INTO
-- ============================================

-- INSERTS TABLA AGENTES (15 filas)

INSERT INTO agentes (nombre, apellido, correo, telefono, cargo, salario, turno) VALUES
('Carlos', 'Ramirez', 'carlos.ramirez@callcenter.com', '3001111111', 'Asesor', 1800000, 'Diurno'),
('Laura', 'Gomez', 'laura.gomez@callcenter.com', '3002222222', 'Supervisor', 2500000, 'Nocturno'),
('Andres', 'Torres', 'andres.torres@callcenter.com', '3003333333', 'Asesor', 1750000, 'Diurno'),
('Sofia', 'Martinez', 'sofia.martinez@callcenter.com', '3004444444', 'Asesor', 1900000, 'Mixto'),
('Daniel', 'Rojas', 'daniel.rojas@callcenter.com', '3005555555', 'Coordinador', 3200000, 'Diurno'),
('Valentina', 'Lopez', 'valentina.lopez@callcenter.com', '3006666666', 'Asesor', 1850000, 'Nocturno'),
('Mateo', 'Perez', 'mateo.perez@callcenter.com', '3007777777', 'Asesor', 1800000, 'Diurno'),
('Camila', 'Diaz', 'camila.diaz@callcenter.com', '3008888888', 'Supervisor', 2600000, 'Mixto'),
('Juan', 'Castro', 'juan.castro@callcenter.com', '3009999999', 'Asesor', 1700000, 'Nocturno'),
('Sara', 'Mendoza', 'sara.mendoza@callcenter.com', '3011111111', 'Asesor', 1820000, 'Diurno'),
('Nicolas', 'Vargas', 'nicolas.vargas@callcenter.com', '3012222222', 'Coordinador', 3400000, 'Diurno'),
('Paula', 'Fernandez', 'paula.fernandez@callcenter.com', '3013333333', 'Asesor', 1760000, 'Mixto'),
('David', 'Morales', 'david.morales@callcenter.com', '3014444444', 'Supervisor', 2550000, 'Nocturno'),
('Juliana', 'Herrera', 'juliana.herrera@callcenter.com', '3015555555', 'Asesor', 1810000, 'Diurno'),
('Sebastian', 'Ruiz', 'sebastian.ruiz@callcenter.com', '3016666666', 'Asesor', 1790000, 'Mixto');

-- INSERTS TABLA CLIENTES (15 filas)

INSERT INTO clientes (nombre, apellido, correo, telefono, ciudad, tipo_cliente) VALUES
('Pedro', 'Sanchez', 'pedro@gmail.com', '3101111111', 'Bogotá', 'Premium'),
('Maria', 'Lozano', 'maria@gmail.com', '3102222222', 'Medellín', 'Regular'),
('Jorge', 'Cortes', 'jorge@gmail.com', '3103333333', 'Cali', 'Premium'),
('Luisa', 'Navarro', 'luisa@gmail.com', '3104444444', 'Barranquilla', 'Regular'),
('Felipe', 'Garcia', 'felipe@gmail.com', '3105555555', 'Cartagena', 'Empresarial'),
('Andrea', 'Rincon', 'andrea@gmail.com', '3106666666', 'Bogotá', 'Regular'),
('Camilo', 'Ruiz', 'camilo@gmail.com', '3107777777', 'Cali', 'Premium'),
('Diana', 'Suarez', 'diana@gmail.com', '3108888888', 'Bogotá', 'Regular'),
('Ricardo', 'Mora', 'ricardo@gmail.com', '3109999999', 'Medellín', 'Empresarial'),
('Natalia', 'Silva', 'natalia@gmail.com', '3111111111', 'Cartagena', 'Premium'),
('Oscar', 'Perez', 'oscar@gmail.com', '3112222222', 'Cali', 'Regular'),
('Paula', 'Jimenez', 'paula@gmail.com', '3113333333', 'Bogotá', 'Premium'),
('Diego', 'Torres', 'diego@gmail.com', '3114444444', 'Barranquilla', 'Regular'),
('Valeria', 'Castro', 'valeria@gmail.com', '3115555555', 'Medellín', 'Empresarial'),
('Santiago', 'Vega', 'santiago@gmail.com', '3116666666', 'Bogotá', 'Premium');

-- INSERTS TABLA LLAMADAS (15 filas)

INSERT INTO llamadas (agente_id, cliente_id, duracion_minutos, tipo_llamada, estado, observaciones) VALUES
(1, 1, 12, 'Soporte', 'Completada', 'Problema solucionado'),
(2, 2, 8, 'Ventas', 'Completada', 'Cliente interesado'),
(3, 3, 15, 'Reclamo', 'Pendiente', 'Escalado al supervisor'),
(4, 4, 6, 'Información', 'Completada', 'Consulta resuelta'),
(5, 5, 20, 'Soporte', 'Completada', 'Configuración realizada'),
(6, 6, 10, 'Ventas', 'Completada', 'Venta concretada'),
(7, 7, 7, 'Información', 'Pendiente', 'Cliente solicita devolución'),
(8, 8, 5, 'Reclamo', 'Completada', 'Caso cerrado'),
(9, 9, 14, 'Soporte', 'Completada', 'Actualización realizada'),
(10, 10, 9, 'Ventas', 'Pendiente', 'Cliente indeciso'),
(11, 11, 11, 'Información', 'Completada', 'Información entregada'),
(12, 12, 4, 'Reclamo', 'Completada', 'Compensación aplicada'),
(13, 13, 13, 'Soporte', 'Completada', 'Error solucionado'),
(14, 14, 16, 'Ventas', 'Pendiente', 'Seguimiento pendiente'),
(15, 15, 18, 'Información', 'Completada', 'Cliente satisfecho');

-- ============================================
-- PARTE 2: UPDATE
-- ============================================

-- Actualizar salario de un agente específico

UPDATE agentes
SET salario = 2000000
WHERE id = 1;

-- Actualizar múltiples columnas de un cliente

UPDATE clientes
SET ciudad = 'Pereira',
    tipo_cliente = 'Premium'
WHERE id = 2;

-- Actualizar múltiples filas con condición

UPDATE llamadas
SET estado = 'Completada'
WHERE estado = 'Pendiente';

-- ============================================
-- PARTE 3: DELETE SEGURO
-- ============================================

-- Verificar clientes de Barranquilla

SELECT id, nombre, ciudad
FROM clientes
WHERE ciudad = 'Barranquilla';

-- Eliminar clientes de Barranquilla

DELETE FROM clientes
WHERE ciudad = 'Barranquilla';

-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================

SELECT * FROM agentes ORDER BY id;

SELECT * FROM clientes ORDER BY id;

SELECT * FROM llamadas ORDER BY id;