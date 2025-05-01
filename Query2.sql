/*-- Unoptimized version of this query
SELECT *
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE population IS NOT NULL
ORDER BY health_expenditure_usd * population DESC
LIMIT 15;
*/


SELECT
  country_name,
  country_code,
  population,
  health_expenditure_usd,
  ROUND(health_expenditure_usd * population, 0) AS total_health_spending_usd,
  nurses_per_1000,
  physicians_per_1000,
  out_of_pocket_health_expenditure_usd
FROM
  `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE
  country_code IS NOT NULL
  AND population > 50000000
  AND health_expenditure_usd IS NOT NULL
  AND date = (SELECT MAX(date) FROM `bigquery-public-data.covid19_open_data.covid19_open_data`)
ORDER BY
  total_health_spending_usd DESC
  LIMIT 15;


