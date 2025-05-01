-- Infections and Vaccinations Over Time (Specified Country)
SELECT
  date,
  country_name,
  MAX(cumulative_confirmed) AS total_cases,
  MAX(cumulative_vaccine_doses_administered) AS total_vaccinations
FROM bigquery-public-data.covid19_open_data.covid19_open_data
WHERE
  country_name = 'United States of America' -- insert country name
  AND date BETWEEN '2021-01-01' AND '2023-5-31' -- insert time period
GROUP BY date, country_name
ORDER BY date ASC;

-- Infections and Vaccinations Over Time (Worldwide)
SELECT
  date,
  MAX(cumulative_confirmed) AS total_cases,
  MAX(cumulative_vaccine_doses_administered) AS total_vaccinations
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE
  date BETWEEN '2021-01-01' AND '2023-5-31' -- insert time period
GROUP BY date
ORDER BY date ASC;

