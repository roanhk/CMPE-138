-- Search Result Average for COVID-19 Symptoms Over Time: (Specified Country)
SELECT
  date,
  country_name,
  ROUND(AVG(search_trends_fever), 3) AS fever,
  ROUND(AVG(search_trends_chills), 3) AS chills,
  ROUND(AVG(search_trends_cough), 3) AS cough,
  ROUND(AVG(search_trends_shortness_of_breath), 3) AS shortness_of_breath,
  ROUND(AVG(search_trends_sore_throat), 3) AS sore_throat,
  ROUND(AVG(search_trends_anosmia), 3) AS loss_of_smell,
  ROUND(AVG(search_trends_ageusia), 3) AS loss_of_taste,
  ROUND(AVG(search_trends_fatigue), 3) AS fatigue,
  ROUND(AVG(search_trends_myalgia), 3) AS muscle_or_body_aches,
  ROUND(AVG(search_trends_headache), 3) AS headache,
  ROUND(AVG(search_trends_nausea), 3) AS nausea,
  ROUND(AVG(search_trends_vomiting), 3) AS vomiting,
  ROUND(AVG(search_trends_diarrhea), 3) AS diarrhea
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE
  country_name = 'United States of America' -- insert country name
  AND date BETWEEN '2020-01-01' AND '2023-5-31' -- insert time period
GROUP BY date, country_name
ORDER BY date ASC;

-- Search Result Average for COVID-19 Symptoms Over Time: (Worldwide)
SELECT
  date,
  ROUND(AVG(search_trends_fever), 3) AS fever,
  ROUND(AVG(search_trends_chills), 3) AS chills,
  ROUND(AVG(search_trends_cough), 3) AS cough,
  ROUND(AVG(search_trends_shortness_of_breath), 3) AS shortness_of_breath,
  ROUND(AVG(search_trends_sore_throat), 3) AS sore_throat,
  ROUND(AVG(search_trends_anosmia), 3) AS loss_of_smell,
  ROUND(AVG(search_trends_ageusia), 3) AS loss_of_taste,
  ROUND(AVG(search_trends_fatigue), 3) AS fatigue,
  ROUND(AVG(search_trends_myalgia), 3) AS muscle_or_body_aches,
  ROUND(AVG(search_trends_headache), 3) AS headache,
  ROUND(AVG(search_trends_nausea), 3) AS nausea,
  ROUND(AVG(search_trends_vomiting), 3) AS vomiting,
  ROUND(AVG(search_trends_diarrhea), 3) AS diarrhea
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE
  date BETWEEN '2020-01-01' AND '2023-5-31' -- insert time period
GROUP BY date
ORDER BY date ASC;

