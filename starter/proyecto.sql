-- ============================================
-- PROYECTO SEMANAL: Operadores y Filtros
-- Dominio: Centro de Call Center
-- Semana 05 — BETWEEN, IN, LIKE
-- ============================================

-- ============================================
-- ELIMINAR TABLAS SI EXISTEN
-- ============================================

DROP TABLE IF EXISTS agentes;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS llamadas;

-- ============================================
-- CREACIÓN DE TABLAS
-- ============================================

CREATE TABLE agentes (
    id_agente INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    cargo TEXT NOT NULL,
    salario REAL NOT NULL
);

CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_cliente TEXT NOT NULL,
    empresa TEXT NOT NULL,
    telefono TEXT NOT NULL
);

CREATE TABLE tickets (
    id_ticket INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente TEXT NOT NULL,
    estado TEXT NOT NULL,
    prioridad TEXT NOT NULL
);

CREATE TABLE llamadas (
    id_llamada INTEGER PRIMARY KEY AUTOINCREMENT,
    agente_id INTEGER,
    campana TEXT NOT NULL,
    duracion_minutos INTEGER NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (agente_id) REFERENCES agentes(id_agente)
);

-- ============================================
-- INSERTAR DATOS EN AGENTES (10 registros)
-- ============================================

INSERT INTO agentes (nombre, cargo, salario) VALUES
('Carlos Pérez', 'Supervisor', 3200000),
('Ana Torres', 'Agente', 1800000),
('Luis Gómez', 'Agente', 2200000),
('María Díaz', 'Coordinadora', 3500000),
('Jorge Ramírez', 'Agente', 2100000),
('Sofía Martínez', 'Agente', 1950000),
('Camilo Herrera', 'Supervisor', 3000000),
('Valentina Rojas', 'Agente', 1750000),
('Daniel Castro', 'Agente', 2500000),
('Laura Méndez', 'Coordinadora', 4000000);

-- ============================================
-- INSERTAR DATOS EN CLIENTES (10 registros)
-- ============================================

INSERT INTO clientes (nombre_cliente, empresa, telefono) VALUES
('Tech Solutions', 'TS Corp', '3001112233'),
('Global Tech', 'GT SAS', '3012223344'),
('Innovatech', 'Innovatech Ltda', '3023334455'),
('Data Center Pro', 'DCP SAS', '3034445566'),
('Call Experts', 'CE Group', '3045556677'),
('Net Solutions', 'NS Corp', '3056667788'),
('Digital World', 'DW SAS', '3067778899'),
('ServiTech', 'ST Ltda', '3078889900'),
('Future Systems', 'FS Group', '3089990011'),
('Tech Vision', 'TV Corp', '3090001122');

-- ============================================
-- INSERTAR DATOS EN TICKETS (10 registros)
-- ============================================

INSERT INTO tickets (cliente, estado, prioridad) VALUES
('Tech Solutions', 'Abierto', 'Alta'),
('Global Tech', 'Pendiente', 'Media'),
('Innovatech', 'En Proceso', 'Alta'),
('Data Center Pro', 'Cerrado', 'Baja'),
('Call Experts', 'Abierto', 'Alta'),
('Net Solutions', 'Pendiente', 'Media'),
('Digital World', 'En Proceso', 'Alta'),
('ServiTech', 'Cerrado', 'Baja'),
('Future Systems', 'Abierto', 'Media'),
('Tech Vision', 'Pendiente', 'Alta');

-- ============================================
-- INSERTAR DATOS EN LLAMADAS (30 registros)
-- ============================================

INSERT INTO llamadas (agente_id, campana, duracion_minutos, descripcion) VALUES
(1, 'Ventas', 10, 'Llamada de venta de servicio premium'),
(2, 'Soporte', 15, 'Soporte técnico y venta cruzada'),
(3, 'Retención', 7, 'Proceso de retención y venta adicional'),
(4, 'Ventas', 20, 'Venta corporativa a cliente nuevo'),
(5, 'Soporte', 12, 'Ayuda técnica para plataforma'),
(6, 'Retención', 9, 'Cliente interesado en continuar'),
(7, 'Ventas', 14, 'Venta de paquete empresarial'),
(8, 'Soporte', 6, 'Consulta técnica rápida'),
(9, 'Retención', 11, 'Oferta de descuento y venta'),
(10, 'Ventas', 18, 'Venta de nuevo plan corporativo'),
(1, 'Soporte', 5, 'Atención de incidente técnico'),
(2, 'Ventas', 13, 'Venta de actualización de servicio'),
(3, 'Retención', 8, 'Retención de cliente importante'),
(4, 'Ventas', 17, 'Presentación comercial de venta'),
(5, 'Soporte', 16, 'Resolución de problema de acceso'),
(6, 'Retención', 10, 'Negociación de renovación'),
(7, 'Ventas', 19, 'Venta consultiva empresarial'),
(8, 'Soporte', 7, 'Asistencia técnica remota'),
(9, 'Retención', 6, 'Cliente evalúa cancelar servicio'),
(10, 'Ventas', 21, 'Venta de servicio internacional'),
(1, 'Soporte', 9, 'Soporte de configuración'),
(2, 'Ventas', 15, 'Venta adicional de licencias'),
(3, 'Retención', 13, 'Renovación y venta complementaria'),
(4, 'Ventas', 11, 'Venta telefónica corporativa'),
(5, 'Soporte', 8, 'Validación de incidentes'),
(6, 'Retención', 12, 'Cliente acepta permanencia'),
(7, 'Ventas', 16, 'Venta de soporte premium'),
(8, 'Soporte', 14, 'Atención de plataforma'),
(9, 'Retención', 5, 'Seguimiento de retención'),
(10, 'Ventas', 22, 'Venta internacional avanzada');

-- ============================================
-- CONSULTA 1: BETWEEN
-- ============================================
-- Mostrar agentes con salario entre 1.800.000 y 3.000.000

SELECT id_agente,
       nombre,
       salario,
       cargo
FROM agentes
WHERE salario BETWEEN 1800000 AND 3000000;

-- ============================================
-- CONSULTA 2: IN
-- ============================================
-- Mostrar tickets con estados específicos

SELECT id_ticket,
       cliente,
       estado,
       prioridad
FROM tickets
WHERE estado IN ('Abierto', 'Pendiente', 'En Proceso');

-- ============================================
-- CONSULTA 3: LIKE
-- ============================================
-- Buscar clientes cuyo nombre contenga "Tech"

SELECT id_cliente,
       nombre_cliente,
       empresa,
       telefono
FROM clientes
WHERE nombre_cliente LIKE '%Tech%';

-- ============================================
-- CONSULTA 4: FILTRO COMBINADO
-- ============================================
-- Mostrar llamadas:
-- 1. Duración entre 5 y 20 minutos
-- 2. Campañas específicas
-- 3. Descripción relacionada con ventas

SELECT id_llamada,
       agente_id,
       campana,
       duracion_minutos,
       descripcion
FROM llamadas
WHERE duracion_minutos BETWEEN 5 AND 20
  AND campana IN ('Ventas', 'Soporte', 'Retención')
  AND descripcion LIKE '%venta%'
ORDER BY duracion_minutos DESC;