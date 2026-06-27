-- =====================================================
-- PROYECTO SEMANA 09
-- TEMA: CENTRO DE CALL CENTER
-- SQLITE
-- =====================================================

PRAGMA foreign_keys = ON;

-- =====================================================
-- ELIMINAR TABLAS SI EXISTEN
-- =====================================================

DROP TABLE IF EXISTS calls;
DROP TABLE IF EXISTS campaigns;
DROP TABLE IF EXISTS agents;

-- =====================================================
-- TABLA AGENTES
-- =====================================================

CREATE TABLE agents (
id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
hire_date DATE NOT NULL
);

-- =====================================================
-- TABLA CAMPAÑAS
-- =====================================================

CREATE TABLE campaigns (
id INTEGER PRIMARY KEY AUTOINCREMENT,
campaign_name TEXT NOT NULL,
client_company TEXT NOT NULL
);

-- =====================================================
-- TABLA LLAMADAS
-- =====================================================

CREATE TABLE calls (
id INTEGER PRIMARY KEY AUTOINCREMENT,
agent_id INTEGER,
campaign_id INTEGER,
customer_name TEXT NOT NULL,
call_duration INTEGER NOT NULL,
call_date DATE NOT NULL,

FOREIGN KEY (agent_id) REFERENCES agents(id),
FOREIGN KEY (campaign_id) REFERENCES campaigns(id)

);

-- =====================================================
-- INSERTAR AGENTES
-- 20 REGISTROS
-- =====================================================

INSERT INTO agents (first_name,last_name,hire_date) VALUES
('Carlos','Ramirez','2023-01-10'),
('Ana','Gomez','2023-01-15'),
('Luis','Morales','2023-02-10'),
('Sofia','Castro','2023-02-20'),
('Miguel','Torres','2023-03-01'),
('Laura','Diaz','2023-03-10'),
('Jorge','Rojas','2023-03-25'),
('Valentina','Lopez','2023-04-01'),
('Andres','Mendoza','2023-04-12'),
('Camila','Suarez','2023-04-18'),
('Daniel','Vargas','2023-05-02'),
('Paula','Herrera','2023-05-08'),
('Juan','Perez','2023-05-15'),
('Maria','Gutierrez','2023-06-01'),
('Fernando','Silva','2023-06-10'),
('Natalia','Ruiz','2023-06-20'),
('Kevin','Martinez','2023-07-05'),
('Diana','Ortega','2023-07-15'),
('Ricardo','Flores','2023-08-01'),
('Karen','Navarro','2023-08-12');

-- =====================================================
-- INSERTAR CAMPAÑAS
-- 20 REGISTROS
-- =====================================================

INSERT INTO campaigns (campaign_name, client_company) VALUES
('Ventas Internet','MoviNet'),
('Soporte Tecnico','TechHelp'),
('Encuesta Clientes','MarketData'),
('Cobranza','Finanzas Plus'),
('Retencion Clientes','TeleCom'),
('Ventas Seguros','Proteccion Total'),
('Atencion Bancaria','Banco Union'),
('Portabilidad','MoviNet'),
('Encuesta Satisfaccion','QualityData'),
('Soporte Premium','TechHelp'),
('Renovacion Planes','TeleCom'),
('Ventas TV','CableMax'),
('Ventas Energia','ElectroPlus'),
('Recuperacion Clientes','TeleCom'),
('Campaña Educativa','EducaCorp'),
('Atencion Medica','Salud Total'),
('Ventas Tarjetas','Banco Union'),
('Soporte Empresarial','TechHelp'),
('Encuesta Nacional','DataGroup'),
('Atencion VIP','Premium Service');

-- =====================================================
-- INSERTAR LLAMADAS
-- 80 REGISTROS
-- =====================================================

INSERT INTO calls (agent_id,campaign_id,customer_name,call_duration,call_date) VALUES
(1,1,'Juan Perez',12,'2025-01-01'),
(2,2,'Maria Torres',8,'2025-01-01'),
(3,3,'Pedro Lopez',15,'2025-01-02'),
(4,4,'Ana Rios',10,'2025-01-02'),
(5,5,'Luis Diaz',9,'2025-01-03'),
(6,6,'Carlos Mora',11,'2025-01-03'),
(7,7,'Andrea Ruiz',7,'2025-01-04'),
(8,8,'Jorge Silva',13,'2025-01-04'),
(9,9,'Camilo Vega',6,'2025-01-05'),
(10,10,'Paula Gomez',14,'2025-01-05'),

(11,11,'Mario Torres',12,'2025-01-06'),
(12,12,'Valeria Soto',10,'2025-01-06'),
(13,13,'Karen Perez',8,'2025-01-07'),
(14,14,'Julian Ruiz',17,'2025-01-07'),
(15,15,'Andrea Diaz',9,'2025-01-08'),
(1,16,'Luis Castro',11,'2025-01-08'),
(2,17,'Fernando Mora',12,'2025-01-09'),
(3,18,'Patricia Leon',7,'2025-01-09'),
(4,19,'Mateo Rojas',13,'2025-01-10'),
(5,20,'Laura Silva',15,'2025-01-10'),

(6,1,'Javier Torres',10,'2025-01-11'),
(7,2,'Kevin Diaz',11,'2025-01-11'),
(8,3,'Natalia Ruiz',8,'2025-01-12'),
(9,4,'Felipe Gomez',9,'2025-01-12'),
(10,5,'Sandra Leon',14,'2025-01-13'),
(11,6,'Diana Rios',7,'2025-01-13'),
(12,7,'Camilo Torres',12,'2025-01-14'),
(13,8,'Laura Mendoza',10,'2025-01-14'),
(14,9,'Nicolas Ruiz',13,'2025-01-15'),
(15,10,'Johana Perez',9,'2025-01-15'),

(1,11,'Julio Castro',8,'2025-01-16'),
(2,12,'Pedro Gomez',12,'2025-01-16'),
(3,13,'Andrea Silva',15,'2025-01-17'),
(4,14,'Carlos Diaz',10,'2025-01-17'),
(5,15,'Maria Rojas',7,'2025-01-18'),
(6,16,'Paula Torres',11,'2025-01-18'),
(7,17,'Javier Perez',13,'2025-01-19'),
(8,18,'Tatiana Ruiz',9,'2025-01-19'),
(9,19,'Ricardo Mora',8,'2025-01-20'),
(10,20,'Valentina Diaz',14,'2025-01-20'),

(11,1,'Carlos Vega',10,'2025-01-21'),
(12,2,'Sandra Torres',12,'2025-01-21'),
(13,3,'Felipe Leon',7,'2025-01-22'),
(14,4,'Kevin Mora',9,'2025-01-22'),
(15,5,'Andrea Perez',13,'2025-01-23'),
(1,6,'Luis Gomez',15,'2025-01-23'),
(2,7,'Mario Ruiz',11,'2025-01-24'),
(3,8,'Karen Silva',10,'2025-01-24'),
(4,9,'Natalia Mora',9,'2025-01-25'),
(5,10,'Jorge Diaz',12,'2025-01-25'),

(6,11,'Diana Ruiz',14,'2025-01-26'),
(7,12,'Juan Castro',8,'2025-01-26'),
(8,13,'Patricia Gomez',11,'2025-01-27'),
(9,14,'Ricardo Perez',13,'2025-01-27'),
(10,15,'Sandra Diaz',7,'2025-01-28'),
(11,16,'Laura Torres',9,'2025-01-28'),
(12,17,'Felipe Rojas',12,'2025-01-29'),
(13,18,'Camila Leon',10,'2025-01-29'),
(14,19,'Kevin Silva',8,'2025-01-30'),
(15,20,'Maria Mora',15,'2025-01-30'),

(1,1,'Cliente 61',10,'2025-02-01'),
(2,2,'Cliente 62',11,'2025-02-01'),
(3,3,'Cliente 63',9,'2025-02-02'),
(4,4,'Cliente 64',8,'2025-02-02'),
(5,5,'Cliente 65',14,'2025-02-03'),
(6,6,'Cliente 66',12,'2025-02-03'),
(7,7,'Cliente 67',7,'2025-02-04'),
(8,8,'Cliente 68',15,'2025-02-04'),
(9,9,'Cliente 69',11,'2025-02-05'),
(10,10,'Cliente 70',10,'2025-02-05'),
(11,11,'Cliente 71',13,'2025-02-06'),
(12,12,'Cliente 72',9,'2025-02-06'),
(13,13,'Cliente 73',12,'2025-02-07'),
(14,14,'Cliente 74',8,'2025-02-07'),
(15,15,'Cliente 75',14,'2025-02-08'),
(1,16,'Cliente 76',10,'2025-02-08'),
(2,17,'Cliente 77',11,'2025-02-09'),
(3,18,'Cliente 78',9,'2025-02-09'),
(4,19,'Cliente 79',15,'2025-02-10'),
(5,20,'Cliente 80',12,'2025-02-10');

-- =====================================================
-- CONSULTA 1
-- INNER JOIN PRINCIPAL
-- LLAMADAS Y AGENTES
-- =====================================================

SELECT
c.id AS call_id,
c.customer_name,
c.call_duration,
a.first_name,
a.last_name
FROM calls c
INNER JOIN agents a
ON c.agent_id = a.id;

-- =====================================================
-- CONSULTA 2
-- JOIN DE TRES TABLAS
-- LLAMADAS + AGENTES + CAMPAÑAS
-- =====================================================

SELECT
c.id AS call_id,
c.customer_name,
a.first_name || ' ' || a.last_name AS agent_name,
cp.campaign_name,
cp.client_company
FROM calls c
INNER JOIN agents a
ON c.agent_id = a.id
INNER JOIN campaigns cp
ON c.campaign_id = cp.id;

-- =====================================================
-- CONSULTA 3
-- TODOS LOS AGENTES
-- INCLUSO LOS QUE NO TIENEN LLAMADAS
-- =====================================================

SELECT
a.id,
a.first_name,
a.last_name,
c.customer_name,
c.call_date
FROM agents a
LEFT JOIN calls c
ON a.id = c.agent_id
ORDER BY a.id;

-- =====================================================
-- CONSULTA 4
-- AGENTES SIN LLAMADAS (HUERFANOS)
-- =====================================================

SELECT
a.id,
a.first_name,
a.last_name
FROM agents a
LEFT JOIN calls c
ON a.id = c.agent_id
WHERE c.id IS NULL;

-- =====================================================
-- CONSULTA 5
-- REPORTE AGREGADO
-- TOTAL DE LLAMADAS POR AGENTE
-- =====================================================

SELECT
a.id,
a.first_name,
a.last_name,
COUNT(c.id) AS total_calls
FROM agents a
LEFT JOIN calls c
ON a.id = c.agent_id
GROUP BY
a.id,
a.first_name,
a.last_name
ORDER BY total_calls DESC;