# 📊 Practical Machine Learning Project

This project was completed as part of the [Practical Machine Learning course](https://www.coursera.org/learn/practical-machine-learning) on Coursera (Johns Hopkins University). The goal was to build a classification model that predicts how well a person is performing barbell lifting exercises using sensor data.

---

## 📌 Project Objective

The goal is to predict the **manner in which the exercise was performed** (the `classe` variable) using data from sensors placed on the **belt**, **forearm**, **arm**, and **dumbbell**.

This is part of the "quantified self" movement — using devices like Jawbone Up, Nike FuelBand, and Fitbit to track personal metrics.

---

## 📁 Files Included

- `ml-project-report.Rmd` — R Markdown file with all code, plots, and analysis  
- `ml-project-report.html` — Compiled report (open in browser)  
- `README.md` — This file  
- `problem_id_1.txt` to `problem_id_20.txt` — Predictions for the 20 test cases  

---

## 🔗 Data Sources

- Training data: [`pml-training.csv`](https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv)  
- Test data: [`pml-testing.csv`](https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv)  
- Dataset info: [Weight Lifting Exercise Dataset (Archived)](http://web.archive.org/web/20161224072740/http://groupware.les.inf.puc-rio.br/har)

---

## 🚀 How to Run the Analysis

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. Open `ml-project-report.Rmd` in RStudio.

3. Install required R packages:

   ```r
   install.packages(c("caret", "randomForest", "dplyr", "ggplot2"))
   ```

4. Knit the R Markdown file to HTML (`ml-project-report.html`).

---

## 🧪 Machine Learning Model

- **Algorithm**: Random Forest (`randomForest` via `caret`)  
- **Accuracy**: ~99.85% on validation set  
- **Cross-Validation**: 3-fold CV  
- **Important Features**: Total acceleration, gyroscope angular velocity, roll/pitch/yaw of various limbs  

---

## 📦 Output

Predictions for the 20 quiz test cases are saved as individual `.txt` files:

```
problem_id_1.txt  
problem_id_2.txt  
...  
problem_id_20.txt  
```

These files can be uploaded to the Coursera Course Project Prediction Quiz.

---

## ✅ Reproducibility Notes

- All results can be reproduced by running `ml-project-report.Rmd`.  
- No data files are stored in this repo — they are dynamically downloaded.  
- Random seed is set to ensure reproducibility of results.  

---

## 📸 Preview

You can view the rendered report online here:

👉 **[GitHub Pages link (if using `gh-pages`)](https://yourusername.github.io/your-repo-name/ml-project-report.html)**

---

## 🧠 Author

- Name: *Rene Persau*  
- Course: Practical Machine Learning (Johns Hopkins / Coursera)  
- GitHub: [@Renek1992](https://github.com/Renek1992)
