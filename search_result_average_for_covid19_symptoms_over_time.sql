-- Search Result Average for COVID-19 Symptoms Over Time: (Specified Country)
SELECT
  date,
  country_name,
  AVG(search_trends_fever) AS fever,
  AVG(search_trends_chills) AS chills,
  AVG(search_trends_cough) AS cough,
  AVG(search_trends_shortness_of_breath) AS shortness_of_breath,
  AVG(search_trends_sore_throat) AS sore_throat,
  AVG(search_trends_anosmia) AS loss_of_smell,
  AVG(search_trends_ageusia) AS loss_of_taste,
  AVG(search_trends_fatigue) AS fatigue,
  AVG(search_trends_myalgia) AS muscle_or_body_aches,
  AVG(search_trends_headache) AS headache,
  AVG(search_trends_nausea) AS nausua,
  AVG(search_trends_vomiting) AS vomiting,
  AVG(search_trends_diarrhea) AS diarrhea,
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE
  country_name = 'United States of America' -- insert country name
  AND date BETWEEN '2020-01-01' AND '2023-5-31' -- insert time period
GROUP BY date, country_name
ORDER BY date ASC;

-- Search Result Average for COVID-19 Symptoms Over Time: (Worldwide)
SELECT
  date,
  AVG(search_trends_fever) AS fever,
  AVG(search_trends_chills) AS chills,
  AVG(search_trends_cough) AS cough,
  AVG(search_trends_shortness_of_breath) AS shortness_of_breath,
  AVG(search_trends_sore_throat) AS sore_throat,
  AVG(search_trends_anosmia) AS loss_of_smell,
  AVG(search_trends_ageusia) AS loss_of_taste,
  AVG(search_trends_fatigue) AS fatigue,
  AVG(search_trends_myalgia) AS muscle_or_body_aches,
  AVG(search_trends_headache) AS headache,
  AVG(search_trends_nausea) AS nausua,
  AVG(search_trends_vomiting) AS vomiting,
  AVG(search_trends_diarrhea) AS diarrhea,
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE
  date BETWEEN '2020-01-01' AND '2023-5-31' -- insert time period
GROUP BY date
ORDER BY date ASC;

