WITH latest_deaths AS (
  SELECT
    country_name,
    cumulative_deceased,
    population,
    date,
    ROW_NUMBER() OVER (PARTITION BY country_name ORDER BY date DESC) AS rn
  FROM
    `bigquery-public-data.covid19_open_data.covid19_open_data`
  WHERE
    population IS NOT NULL
    AND cumulative_deceased IS NOT NULL
    AND subregion1_name IS NULL    
    AND population > 50000000          
)

SELECT
  country_name,
  population,
  cumulative_deceased,
  ROUND(SAFE_DIVIDE(cumulative_deceased, population) * 100000, 2) AS deaths_per_100k,
  date
FROM
  latest_deaths
WHERE
  rn = 1
ORDER BY
  cumulative_deceased DESC
LIMIT 10;
