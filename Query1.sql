/* Unoptimized version 
SELECT
  *
FROM
  `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE
  population IS NOT NULL
ORDER BY
  cumulative_deceased DESC
LIMIT 15;
*/


-- Queries to show most affted countries with max death for top populated countries and death of age group below 10 
SELECT
  MAX(country_name) AS country_name,
  country_code,
  MAX(population) AS population,
  MAX(cumulative_deceased) AS total_deaths,
  MAX(cumulative_deceased_age_5) AS total_deaths_age_5,
  MAX(cumulative_deceased_age_6) AS total_deaths_age_6,
  MAX(cumulative_deceased_age_9) AS total_deaths_age_9,
  MAX(
    IFNULL(cumulative_deceased_age_5, 0) +
    IFNULL(cumulative_deceased_age_6, 0) +
    IFNULL(cumulative_deceased_age_9, 0)
  ) AS total_deaths_aged_5_6_9,
  MAX(date) AS latest_data_date
FROM
  `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE
  country_code IS NOT NULL
  AND population > 50000000
GROUP BY
  country_code
ORDER BY
  total_deaths DESC
LIMIT 15;