-- ============================================
-- PROYECTO: CALL CENTER
-- Semana 01 — Bases de Datos
-- ============================================


-- PASO 1: ENTIDAD PRINCIPAL (calls)


CREATE TABLE calls (
    id INTEGER PRIMARY KEY,
    client_name TEXT NOT NULL,
    agent_name TEXT NOT NULL,
    duration INTEGER, -- duración en minutos
    status TEXT -- en curso, finalizada, perdida
);


-- PASO 2: SEGUNDA ENTIDAD (agents)


CREATE TABLE agents (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    shift TEXT -- mañana, tarde, noche
);


-- PASO 3: DATOS DE PRUEBA


--  15 registros (tabla principal)

INSERT INTO calls (id, client_name, agent_name, duration, status) VALUES
(1, 'Juan Pérez', 'Carlos López', 5, 'finalizada'),
(2, 'Ana Gómez', 'Laura Díaz', 8, 'finalizada'),
(3, 'Pedro Ramírez', 'Carlos López', 3, 'perdida'),
(4, 'Luisa Torres', 'Miguel Ruiz', 10, 'finalizada'),
(5, 'Camila Vargas', 'Laura Díaz', 7, 'en curso'),
(6, 'Andrés Castro', 'Miguel Ruiz', 4, 'finalizada'),
(7, 'Sofía Herrera', 'Carlos López', 6, 'finalizada'),
(8, 'Diego Martínez', 'Laura Díaz', 9, 'finalizada'),
(9, 'Valentina Rojas', 'Miguel Ruiz', 2, 'perdida'),
(10, 'Daniel Moreno', 'Carlos López', 12, 'finalizada'),
(11, 'Paula Jiménez', 'Laura Díaz', 5, 'en curso'),
(12, 'Jorge Sánchez', 'Miguel Ruiz', 11, 'finalizada'),
(13, 'Natalia Silva', 'Carlos López', 6, 'finalizada'),
(14, 'Felipe Cruz', 'Laura Díaz', 3, 'perdida'),
(15, 'María López', 'Miguel Ruiz', 8, 'finalizada');

--  5 registros (tabla secundaria)

INSERT INTO agents (id, name, email, shift) VALUES
(1, 'Carlos López', 'carlos@callcenter.com', 'mañana'),
(2, 'Laura Díaz', 'laura@callcenter.com', 'tarde'),
(3, 'Miguel Ruiz', 'miguel@callcenter.com', 'noche'),
(4, 'Andrea Torres', 'andrea@callcenter.com', 'mañana'),
(5, 'Luis Gómez', 'luis@callcenter.com', 'tarde');

-- ============================================
-- PASO 4: CONSULTAS SELECT
-- ============================================

--  Mostrar todas las llamadas
SELECT *
FROM calls;

-- Mostrar nombres de clientes ordenados
SELECT client_name
FROM calls
ORDER BY client_name ASC;

--  Contar total de llamadas
SELECT COUNT(*) AS total_calls
FROM calls;

--  Mostrar agentes del turno mañana
SELECT name
FROM agents
WHERE shift = 'mañana';