
# WEEK 1: NORMALIZATION AND ENCODING

# Step 1: Create a copy of cleaned dataset
titanic_processed <- titanic_clean

# Step 2: Min-Max Normalization
# Formula: (x - min) / (max - min)

normalize <- function(x) {
  (x - min(x, na.rm = TRUE)) /
    (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}

# Normalize numerical variables
titanic_processed$Age_Normalized <-
  normalize(titanic_processed$Age)

titanic_processed$Fare_Normalized <-
  normalize(titanic_processed$Fare)

titanic_processed$SibSp_Normalized <-
  normalize(titanic_processed$SibSp)

titanic_processed$Parch_Normalized <-
  normalize(titanic_processed$Parch)

# Step 3: Encode Sex
# Female = 0, Male = 1

titanic_processed$Sex_Encoded <-
  ifelse(titanic_processed$Sex == "male", 1, 0)

# Step 4: Encode categorical variables
# Convert Pclass and Embarked into factors

titanic_processed$Pclass <-
  factor(titanic_processed$Pclass)

titanic_processed$Embarked <-
  factor(titanic_processed$Embarked)

# Step 5: Create dummy variables
dummy_data <- model.matrix(
  ~ Pclass + Embarked - 1,
  data = titanic_processed
)

# Combine encoded variables
titanic_processed <- cbind(
  titanic_processed,
  dummy_data
)

# Step 6: Check processed dataset
head(titanic_processed)

# Step 7: Check normalized values
summary(
  titanic_processed[
    c("Age_Normalized", "Fare_Normalized",
      "SibSp_Normalized", "Parch_Normalized")
  ]
)

# Step 8: Check dataset dimensions
dim(titanic_processed)

# Step 9: Save processed dataset
write.csv(
  titanic_processed,
  "Output/Titanic_Processed.csv",
  row.names = FALSE
)

# Step 10: Display completion message
cat("Normalization and encoding completed successfully!")
