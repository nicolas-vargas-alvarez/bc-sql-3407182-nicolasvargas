
-- PROYECTO SEMANAL: FUNCIONES DE AGREGACIÓN
-- Semana 06 - Call Center




-- PARTE 1: COUNT


-- Total de llamadas registradas

SELECT
    COUNT(*) AS total_llamadas
FROM llamadas;


-- Total de clientes con correo registrado

SELECT
    COUNT(correo) AS clientes_con_correo
FROM clientes;


-- Total de agentes activos

SELECT
    COUNT(*) AS agentes_activos
FROM agentes
WHERE is_active = 1;



-- PARTE 2: SUM Y AVG


-- Masa salarial total y promedio salarial

SELECT
    SUM(salario) AS salario_total_empresa,
    AVG(salario) AS salario_promedio
FROM agentes;


-- Duración total y promedio de llamadas

SELECT
    SUM(duracion_minutos) AS minutos_totales,
    AVG(duracion_minutos) AS promedio_minutos
FROM llamadas;



-- PARTE 3: MIN Y MAX


-- Salario mínimo y máximo

SELECT
    MIN(salario) AS salario_minimo,
    MAX(salario) AS salario_maximo
FROM agentes;


-- Llamada más corta y más larga

SELECT
    MIN(duracion_minutos) AS llamada_mas_corta,
    MAX(duracion_minutos) AS llamada_mas_larga
FROM llamadas;



-- PARTE 4: GROUP BY


-- Cantidad de agentes y salario promedio por cargo

SELECT
    cargo AS cargo_agente,
    COUNT(*) AS total_agentes,
    AVG(salario) AS salario_promedio
FROM agentes
GROUP BY cargo
ORDER BY total_agentes DESC;


-- Total de llamadas por tipo

SELECT
    tipo_llamada AS categoria_llamada,
    COUNT(*) AS total_llamadas,
    AVG(duracion_minutos) AS promedio_minutos
FROM llamadas
GROUP BY tipo_llamada
ORDER BY total_llamadas DESC;


-- Total de clientes por tipo de plan

SELECT
    tipo_plan AS plan_cliente,
    COUNT(*) AS total_clientes
FROM clientes
GROUP BY tipo_plan
ORDER BY total_clientes DESC;



-- PARTE 5: HAVING


-- Mostrar solo tipos de llamadas
-- con más de 3 registros

SELECT
    tipo_llamada AS categoria,
    COUNT(*) AS total
FROM llamadas
GROUP BY tipo_llamada
HAVING COUNT(*) > 3
ORDER BY total DESC;


-- Mostrar cargos con salario
-- promedio superior a 2 millones

SELECT
    cargo AS cargo_empleado,
    AVG(salario) AS promedio_salario
FROM agentes
GROUP BY cargo
HAVING AVG(salario) > 2000000
ORDER BY promedio_salario DESC;



-- PARTE 6: WHERE + GROUP BY + HAVING


-- Agentes activos agrupados por turno
-- con más de dos empleados

SELECT
    turno AS jornada,
    COUNT(*) AS total_agentes,
    AVG(salario) AS salario_promedio
FROM agentes
WHERE is_active = 1
GROUP BY turno
HAVING COUNT(*) > 2
ORDER BY salario_promedio DESC;


-- Llamadas completadas por categoría

SELECT
    tipo_llamada AS categoria,
    COUNT(*) AS total,
    AVG(duracion_minutos) AS promedio
FROM llamadas
WHERE estado='Completada'
GROUP BY tipo_llamada
HAVING COUNT(*) > 2
ORDER BY promedio DESC;