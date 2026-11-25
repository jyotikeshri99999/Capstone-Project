# Capstone-Project-CareLoop Clinics — No-Show Guard

Repository: https://github.com/jyotikeshri99999/Capstone-Project

## Four findings

- **Part 1:** The cleaned table has 990 bookings; 218 were no-shows (22.0%).
- **Part 2:** Gomti Nagar Care Point had the highest clinic rate, 33.3% across 90 appointments.
- **Part 3:** The selected model is logistic regression, using a 0.35 risk threshold; **replace `[CV AUC]` with your actual 5-fold training ROC-AUC from Colab** (reference result is about 0.77).
- **Part 4:** In the first 10 notes, 9 had text; both notes classified as forgot/no reminder were linked to appointments with no reminder.

## Recommendation

CareLoop should use the selected logistic-regression model to rank bookings the evening before each appointment, then call patients whose risk is at least 0.35, adjusting that cutoff to the front desk's available call capacity. The cleaned data contains 990 bookings and 218 no-shows (22.0%); Gomti Nagar Care Point had the highest observed clinic rate at 33.3% across 90 appointments; the model's training cross-validation ROC-AUC was **[insert your actual value]**; and both of the two notes classified as forgot/no reminder were for appointments marked reminder_sent = No. Start by checking reminder delivery and offering quick rebooking support, while investigating transport barriers shown in the notes. The note sample is small, so treat these reasons as leads for follow-up rather than clinic-wide estimates.

## Model choice

The model was selected using 5-fold cross-validation on the training data. Logistic regression had the highest training ROC-AUC (**[insert your actual CV ROC-AUC]**), so it was selected. The 0.35 threshold was chosen from out-of-fold training probabilities because it gave the higher F1 score and greater recall than 0.50. On the test set, record your observed precision, recall, flagged count, and ROC-AUC here: **[fill in from your Part 3.5 output]**.

## Limitations

1. The 10 follow-up notes are only an illustration and cannot show the true reasons across all clinics.
2. Cleaning medians, quartiles, and outlier fences were calculated using all 990 rows before the train/test split, so test rows had a small influence on cleaning.
3. The split was random rather than past-to-future, and the same patient may appear in both training and test data.

## Project files

- `01_ingest_clean.ipynb` — Part 1 data reading, cleaning, clinic enrichment, and exports.
- `02_queries.sql` — Part 2 database checks and no-show analyses.
- `03_model.ipynb` — Part 3 feature preparation, model comparison, and risk scores.
- `04_genai.ipynb` — Part 4 structured note analysis and validation. The API key must not be saved in this notebook.
- `data/` — the three original CSV files.

Before submitting, replace every bracketed placeholder with the values from your own Colab output and revise the wording so the README reflects your results.
