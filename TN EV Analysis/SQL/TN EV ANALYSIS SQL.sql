


CREATE TABLE public.ev_registrations (
    year             INTEGER,
    month            INTEGER,
    rto_number       TEXT,
    rto_name         TEXT,
    fuel_type_code   TEXT,
    fuel_type        TEXT,
    registrations    INTEGER,
    vehicle_category TEXT
);
select * from ev_registrations;
SELECT * FROM ev_registrations LIMIT 20;
SELECT COUNT(*) FROM ev_registrations;
SELECT COUNT(*) FROM ev_registrations WHERE rto_name IS NULL;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT rto_name) AS total_rtos,
    SUM(registrations) AS total_registrations
FROM public.ev_registrations;

SELECT
    vehicle_category,
    SUM(registrations) AS total_registrations
FROM public.ev_registrations
GROUP BY vehicle_category
ORDER BY total_registrations DESC;


SELECT DISTINCT vehicle_category
FROM public.ev_registrations
ORDER BY vehicle_category;



SELECT
    vehicle_category,
    SUM(registrations) AS total_registrations
FROM public.ev_registrations
WHERE LOWER(vehicle_category) IN ('pure ev', 'electric bov')
GROUP BY vehicle_category
ORDER BY total_registrations DESC;

SELECT
    year,
    SUM(registrations) AS total_ev_registrations
FROM public.ev_registrations
WHERE LOWER(vehicle_category) IN ('pure ev', 'electric bov')
  AND month BETWEEN 1 AND 10
  AND year IN (2025, 2026)
GROUP BY year
ORDER BY year;

SELECT
    rto_name,
    SUM(registrations) AS total_ev_registrations
FROM public.ev_registrations
WHERE LOWER(vehicle_category) IN ('pure ev', 'electric bov')
GROUP BY rto_name
ORDER BY total_ev_registrations DESC
LIMIT 10;
SELECT
    rto_name,
    SUM(registrations) AS total_ev_registrations
FROM public.ev_registrations
WHERE LOWER(vehicle_category) IN ('pure ev', 'electric bov')
GROUP BY rto_name
ORDER BY total_ev_registrations asc
LIMIT 10;



SELECT
    year,
    month,
    SUM(registrations) AS total_ev_registrations
FROM public.ev_registrations
WHERE LOWER(vehicle_category) IN ('pure ev', 'electric bov')
and month between 1 and 10 AND year IN (2025, 2026)
GROUP BY year, month
ORDER BY year, month;
------------------------------------------------------------------
--VALIDATIONN QUERIES 


SELECT SUM(registrations) AS total_registrations
FROM public.ev_registrations;

SELECT SUM(registrations)
FROM public.ev_registrations
WHERE year = 2025;

SELECT SUM(registrations)
FROM public.ev_registrations
WHERE year = 2026;