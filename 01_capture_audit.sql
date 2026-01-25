-- Normalizing table to International Business Standards
ALTER TABLE citas_honda RENAME COLUMN asesor TO advisor_name;
ALTER TABLE citas_honda RENAME COLUMN modelo TO car_model;
ALTER TABLE citas_honda RENAME COLUMN fec_cita TO appointment_date;
ALTER TABLE citas_honda RENAME COLUMN tiempo_horas TO billable_hours;
ALTER TABLE citas_honda RENAME COLUMN telefono TO customer_phone;
ALTER TABLE citas_honda RENAME COLUMN averia TO service_description;

/* PROJECT: Honda Service Center - Financial Recovery
SCRIPT: 01_capture_audit.sql
GOAL: Identify data gaps causing revenue leakage.
*/

-- High-level overview of missing contact info per advisor
SELECT 
    advisor_name,
    COUNT(*) AS total_appointments,
    COUNT(*) FILTER (WHERE customer_phone IS NULL) AS missing_contact_info,
    -- Financial Impact: Assuming $120 USD average service ticket
    (COUNT(*) FILTER (WHERE customer_phone IS NULL) * 120) AS potential_revenue_loss_usd
FROM citas_honda
GROUP BY 1
ORDER BY potential_revenue_loss_usd DESC;