DECLARE input_country_name STRING DEFAULT 'United States of America';  -- Set to '' for worldwide, or e.g., 'United States of America'

SELECT
  date,
  IF(input_country_name = '', 'Worldwide', country_name) AS country,
  MAX(cumulative_confirmed) AS total_cases,
  MAX(cumulative_vaccine_doses_administered) AS total_vaccinations
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE
  date BETWEEN '2021-01-01' AND '2023-05-31'
  AND (input_country_name = '' OR country_name = input_country_name)
GROUP BY date, country
ORDER BY date ASC;
