-- Basic exploration to understand the data volume
SELECT COUNT(*) FROM citas_honda; -- Total records

SELECT COUNT(DISTINCT nombre) FROM citas_honda; -- Total clientes

-- Checking the date range
SELECT MIN(appointment_date), MAX(appointment_date) FROM citas_honda;