WITH latest_vax AS (
  SELECT
    country_name,
    cumulative_persons_vaccinated,
    population,
    date,
    ROW_NUMBER() OVER (PARTITION BY country_name ORDER BY date DESC) AS rn
  FROM
    `bigquery-public-data.covid19_open_data.covid19_open_data`
  WHERE
    cumulative_persons_vaccinated IS NOT NULL
    AND population IS NOT NULL
)

SELECT
  country_name,
  date,
  cumulative_persons_vaccinated,
  population,
  ROUND(cumulative_persons_vaccinated / population * 100, 2) AS vaccination_rate
FROM
  latest_vax
WHERE
  rn = 1
ORDER BY
  vaccination_rate DESC
LIMIT 10;
