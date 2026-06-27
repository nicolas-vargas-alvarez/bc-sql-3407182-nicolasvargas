-- =====================================================
-- SEMANA 07 - NULL Y CONSTRAINTS
-- Proyecto: Call Center
-- Autor: Nicolas Vargas
-- =====================================================

PRAGMA foreign_keys = ON;

-- =====================================================
-- ELIMINAR TABLAS SI EXISTEN
-- =====================================================

DROP TABLE IF EXISTS llamadas;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS agentes;


-- =====================================================
-- TABLA AGENTES
-- =====================================================

CREATE TABLE agentes(

id INTEGER PRIMARY KEY,

nombre TEXT NOT NULL,

apellido TEXT NOT NULL,

correo TEXT NOT NULL UNIQUE,

telefono TEXT UNIQUE,

cargo TEXT NOT NULL
CHECK(cargo IN(
'Asesor',
'Supervisor',
'Coordinador'
)),

salario REAL NOT NULL
CHECK(salario > 0),

turno TEXT NOT NULL
CHECK(turno IN(
'Diurno',
'Nocturno',
'Mixto'
)),

is_active INTEGER NOT NULL DEFAULT 1
);


-- =====================================================
-- TABLA CLIENTES
-- =====================================================

CREATE TABLE clientes(

id INTEGER PRIMARY KEY,

nombre TEXT NOT NULL,

apellido TEXT NOT NULL,

correo TEXT UNIQUE,

telefono TEXT,

ciudad TEXT,

fecha_registro TEXT NOT NULL
);


-- =====================================================
-- TABLA LLAMADAS
-- =====================================================

CREATE TABLE llamadas(

id INTEGER PRIMARY KEY,

cliente_id INTEGER NOT NULL,

agente_id INTEGER NOT NULL,

tipo TEXT NOT NULL
CHECK(tipo IN(
'Soporte',
'Ventas',
'Reclamo',
'Información'
)),

estado TEXT NOT NULL
CHECK(estado IN(
'Pendiente',
'Completada',
'Cancelada'
)),

comentario TEXT,

fecha TEXT NOT NULL,

FOREIGN KEY(cliente_id)
REFERENCES clientes(id)
ON DELETE RESTRICT,

FOREIGN KEY(agente_id)
REFERENCES agentes(id)
ON DELETE RESTRICT
);


-- =====================================================
-- INSERT AGENTES
-- =====================================================

INSERT INTO agentes
VALUES
(1,'Carlos','Ramirez',
'carlos@callcenter.com',
'3001111111',
'Asesor',
2000000,
'Diurno',
1),

(2,'Laura','Gomez',
'laura@callcenter.com',
'3002222222',
'Supervisor',
2500000,
'Nocturno',
1),

(3,'Nicolas','Vargas',
'nicolas@callcenter.com',
NULL,
'Coordinador',
3400000,
'Diurno',
1);


-- =====================================================
-- INSERT CLIENTES
-- Algunos registros tendrán NULL
-- =====================================================

INSERT INTO clientes
VALUES
(1,'Juan','Perez',
'juan@gmail.com',
'3111111111',
'Bogota',
'2026-06-01'),

(2,'Maria','Torres',
NULL,
'3222222222',
'Medellin',
'2026-06-01'),

(3,'Camilo','Ruiz',
'camilo@gmail.com',
NULL,
'Cali',
'2026-06-02'),

(4,'Luisa','Martinez',
NULL,
NULL,
'Bogota',
'2026-06-03');


-- =====================================================
-- INSERT LLAMADAS
-- =====================================================

INSERT INTO llamadas
VALUES

(1,1,1,
'Reclamo',
'Completada',
'Problema solucionado',
'2026-06-05'),

(2,2,1,
'Soporte',
'Pendiente',
NULL,
'2026-06-05'),

(3,3,2,
'Ventas',
'Completada',
'Cliente interesado',
'2026-06-05'),

(4,4,3,
'Información',
'Completada',
NULL,
'2026-06-05');


-- =====================================================
-- CONSULTA IS NULL
-- Clientes sin correo
-- =====================================================

SELECT

id,
nombre,
apellido

FROM clientes

WHERE correo IS NULL;



-- =====================================================
-- CONSULTA IS NOT NULL
-- Clientes con teléfono registrado
-- =====================================================

SELECT

id,
nombre,
telefono

FROM clientes

WHERE telefono IS NOT NULL;



-- =====================================================
-- CONSULTA COALESCE
-- Mostrar correo alternativo
-- =====================================================

SELECT

nombre,

COALESCE(
correo,
'sin_correo@registrado.com'
)
AS correo_mostrado

FROM clientes;



-- =====================================================
-- CONSULTA IFNULL
-- =====================================================

SELECT

nombre,

IFNULL(
telefono,
'Sin telefono'
)
AS telefono_cliente

FROM clientes;



-- =====================================================
-- CONSULTA NULLIF
-- =====================================================

SELECT

nombre,

NULLIF(
ciudad,
'Bogota'
)
AS ciudad_filtrada

FROM clientes;



-- =====================================================
-- CONSULTA CON JOIN
-- =====================================================

SELECT

c.nombre AS cliente,

a.nombre AS agente,

l.tipo,

l.estado,

COALESCE(
l.comentario,
'Sin comentarios'
)
AS observacion

FROM llamadas l

INNER JOIN clientes c
ON l.cliente_id=c.id

INNER JOIN agentes a
ON l.agente_id=a.id;