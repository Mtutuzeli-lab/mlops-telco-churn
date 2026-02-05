-- pipelines/batch_predict_logreg.sql
-- Daily batch scoring for churn logistic regression

CREATE OR REPLACE TABLE `telco_churn_ds.predictions_logreg_daily`
PARTITION BY DATE(run_ts) AS
SELECT
  CURRENT_TIMESTAMP() AS run_ts,
  customerID,
  predicted_label AS predicted_churn,
  predicted_label_probs[OFFSET(1)] AS prob_churn
FROM ML.PREDICT(
  MODEL `telco_churn_ds.churn_logreg_model`,
  (
    SELECT * EXCEPT(customerID, split)
    FROM `telco_churn_ds.v_features_with_split`
    WHERE split != 'train'
  )
);