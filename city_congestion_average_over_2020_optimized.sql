WITH filtered_city_data AS (
  SELECT
    city_name,
    percent_congestion
  FROM
    `bigquery-public-data.covid19_geotab_mobility_impact.city_congestion`
  WHERE
    percent_congestion IS NOT NULL
)
SELECT
  city_name,
  AVG(percent_congestion) AS average_congestion
FROM
  filtered_city_data
GROUP BY 
  city_name
ORDER BY
  average_congestion DESC;