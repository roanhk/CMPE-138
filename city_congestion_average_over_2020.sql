SELECT
 city_name,
 AVG(percent_congestion) AS average_congestion
FROM
 `bigquery-public-data.covid19_geotab_mobility_impact.city_congestion`
GROUP BY city_name
ORDER BY average_congestion
DESC;
