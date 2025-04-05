# Load libraries
library(caret)
library(randomForest)
library(dplyr)
library(ggplot2)

# Set seed for reproducibility
set.seed(123)

# Load data
train_url <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
test_url  <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

train_raw <- read.csv(train_url, na.strings = c("NA", "", "#DIV/0!"))
test_raw  <- read.csv(test_url, na.strings = c("NA", "", "#DIV/0!"))

# --- Data Cleaning ---

# Remove columns with more than 95% NA
na_cols <- sapply(train_raw, function(x) mean(is.na(x))) < 0.95
train_filtered <- train_raw[, na_cols]
test_filtered  <- test_raw[, na_cols]

# Remove the first 5 metadata columns (ID, name, timestamp, etc.)
train_filtered <- train_filtered[, -(1:5)]
test_filtered  <- test_filtered[, -(1:5)]

# Keep only numeric predictors and the target
train_filtered <- train_filtered %>%
  select(where(is.numeric), classe)

# Drop rows with any remaining NA
train_filtered <- na.omit(train_filtered)

# --- Partition Data ---
inTrain <- createDataPartition(train_filtered$classe, p = 0.7, list = FALSE)
training   <- train_filtered[inTrain, ]
validation <- train_filtered[-inTrain, ]

# --- Train Model (Random Forest) ---
control <- trainControl(method = "cv", number = 3)

rf_model <- train(classe ~ ., 
                  data = training, 
                  method = "rf", 
                  trControl = control, 
                  ntree = 100)  # Reduce trees for speed

# --- Evaluate Model ---
rf_pred <- predict(rf_model, newdata = validation)

# Ensure matching factor levels
validation$classe <- factor(validation$classe)
rf_pred <- factor(rf_pred, levels = levels(validation$classe))

# Confusion matrix
conf_matrix <- confusionMatrix(rf_pred, validation$classe)
print(conf_matrix)


#--- Final Predictions on Test Set ---
# Align test set columns with training set
predictors <- names(training)[names(training) != "classe"]
test_filtered <- test_filtered[, predictors]

# Predict
final_preds <- predict(rf_model, newdata = test_filtered)
print(final_preds)
