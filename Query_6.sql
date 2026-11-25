WITH clinic_rates AS (
    SELECT
        c.clinic_name AS clinic,
        c.city,
        100.0 * SUM(a.no_show) / COUNT(*) AS no_show_pct
    FROM appointments AS a
    JOIN clinics AS c
        ON a.clinic_id = c.clinic_id
    GROUP BY c.clinic_id, c.clinic_name, c.city
)
SELECT
    clinic,
    city,
    ROUND(no_show_pct, 1) AS no_show_pct,
    RANK() OVER (
        PARTITION BY city
        ORDER BY no_show_pct DESC
    ) AS rank_in_city,
    CASE
        WHEN no_show_pct > (SELECT 100.0 * AVG(no_show) FROM appointments)
            THEN 'above'
        WHEN no_show_pct < (SELECT 100.0 * AVG(no_show) FROM appointments)
            THEN 'below'
        ELSE 'equal'
    END AS vs_overall
FROM clinic_rates
ORDER BY city, rank_in_city;