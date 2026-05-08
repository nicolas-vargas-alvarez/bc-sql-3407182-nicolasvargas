-- ============================================
-- PROYECTO SEMANAL: DDL de tu Dominio
-- Semana 02 — DDL: Diseño de Esquemas
-- DOMINIO: CENTRO DE CALL CENTER
-- ============================================

-- ============================================
-- LIMPIEZA: eliminar tablas si existen
-- ============================================

DROP TABLE IF EXISTS llamadas;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS agentes;

-- ============================================
-- TABLA 1: AGENTES
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

-- ============================================
-- TABLA 2: CLIENTES
-- ============================================

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

-- ============================================
-- TABLA 3: LLAMADAS
-- ============================================

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
-- INSERTS TABLA AGENTES (15 registros)
-- ============================================

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

-- ============================================
-- INSERTS TABLA CLIENTES (5 registros)
-- ============================================

INSERT INTO clientes (nombre, apellido, correo, telefono, ciudad, tipo_cliente) VALUES
('Pedro', 'Sanchez', 'pedro@gmail.com', '3101111111', 'Bogotá', 'Premium'),
('Maria', 'Lozano', 'maria@gmail.com', '3102222222', 'Medellín', 'Regular'),
('Jorge', 'Cortes', 'jorge@gmail.com', '3103333333', 'Cali', 'Premium'),
('Luisa', 'Navarro', 'luisa@gmail.com', '3104444444', 'Barranquilla', 'Regular'),
('Felipe', 'Garcia', 'felipe@gmail.com', '3105555555', 'Cartagena', 'Empresarial');

-- ============================================
-- INSERTS TABLA LLAMADAS (5 registros)
-- ============================================

INSERT INTO llamadas (agente_id, cliente_id, duracion_minutos, tipo_llamada, estado, observaciones) VALUES
(1, 1, 12, 'Soporte', 'Completada', 'Problema solucionado'),
(2, 2, 8, 'Ventas', 'Completada', 'Cliente interesado'),
(3, 3, 15, 'Reclamo', 'Pendiente', 'Escalado al supervisor'),
(4, 4, 6, 'Información', 'Completada', 'Consulta resuelta'),
(5, 5, 20, 'Soporte', 'Completada', 'Configuración realizada');

-- ============================================
-- VERIFICACIÓN
-- ============================================

.tables

PRAGMA table_info(agentes);
PRAGMA table_info(clientes);
PRAGMA table_info(llamadas);