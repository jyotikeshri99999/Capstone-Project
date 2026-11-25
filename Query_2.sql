SELECT COUNT(*) AS clinics FROM clinics;

SELECT COUNT(*) AS appointments, SUM(no_show) AS no_shows
FROM appointments;