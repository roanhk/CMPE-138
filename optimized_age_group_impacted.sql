WITH latest_data AS (
  SELECT
    country_name,
    population,
    population_age_70_79,
    population_age_80_and_older,
    cumulative_deceased,
    date,
    ROW_NUMBER() OVER (PARTITION BY country_name ORDER BY date DESC) AS rn
  FROM
    `bigquery-public-data.covid19_open_data.covid19_open_data`
  WHERE
    population IS NOT NULL
    AND cumulative_deceased IS NOT NULL
    AND population_age_70_79 IS NOT NULL
    AND population_age_80_and_older IS NOT NULL
)

SELECT
  country_name,
  date,
  cumulative_deceased,
  population,
  ROUND(cumulative_deceased / population * 100000, 2) AS deaths_per_100k,
  ROUND((population_age_70_79 + population_age_80_and_older) / population * 100, 2) AS elderly_percentage
FROM
  latest_data
WHERE
  rn = 1
ORDER BY
  elderly_percentage DESC
LIMIT 10;
