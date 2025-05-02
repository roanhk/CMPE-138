WITH filtered_data AS (
  SELECT
    FORMAT_DATE('%Y-%m', date) AS test_month,
    tests_total,
    tests_increase
  FROM
    `bigquery-public-data.covid19_covidtracking.summary`
  WHERE
    tests_total > 0
)
SELECT
  test_month,
  SUM(tests_total) AS total_tests,
  SAFE_DIVIDE(SUM(tests_increase), SUM(tests_total)) * 100 AS increase_rate
FROM
  filtered_data
GROUP BY
  test_month
ORDER BY
  test_month ASC;