SELECT
 FORMAT_DATE('%Y-%m', DATE(date)) AS test_month,
 SUM(tests_total) AS total_tests,
 SAFE_DIVIDE(SUM(tests_increase), SUM(tests_total)) * 100 AS increase_rate
FROM
 `bigquery-public-data.covid19_covidtracking.summary`
GROUP BY 1
ORDER BY test_month;


-- V2

-- Per state query
DECLARE state_filter STRING DEFAULT NULL;  -- Can be set to specific state code like 'CA'

SELECT
  FORMAT_DATE('%Y-%m', DATE(date)) AS test_month,
  SUM(tests_total) AS total_tests,
  SAFE_DIVIDE(SUM(tests_increase), SUM(tests_total)) * 100 AS increase_rate
FROM
  `bigquery-public-data.covid19_covidtracking.summary`
WHERE
  (state = state_filter OR state_filter IS NULL)
GROUP BY 
  test_month
ORDER BY 
  test_month;