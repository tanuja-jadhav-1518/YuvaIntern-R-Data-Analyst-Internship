
# WEEK 1: OUTLIER DETECTION


# Step 1: Select numerical variables
numeric_data <- titanic_clean[
  c("Age", "Fare", "SibSp", "Parch")
]

# Step 2: Create function to detect outliers
detect_outliers <- function(x) {
  
  Q1 <- quantile(x, 0.25, na.rm = TRUE)
  Q3 <- quantile(x, 0.75, na.rm = TRUE)
  
  IQR_value <- IQR(x, na.rm = TRUE)
  
  lower_limit <- Q1 - 1.5 * IQR_value
  upper_limit <- Q3 + 1.5 * IQR_value
  
  outliers <- x[
    x < lower_limit | x > upper_limit
  ]
  
  return(list(
    Lower_Limit = lower_limit,
    Upper_Limit = upper_limit,
    Outlier_Count = length(outliers)
  ))
}

# Step 3: Apply IQR method
age_outliers <- detect_outliers(numeric_data$Age)
fare_outliers <- detect_outliers(numeric_data$Fare)
sibsp_outliers <- detect_outliers(numeric_data$SibSp)
parch_outliers <- detect_outliers(numeric_data$Parch)

# Step 4: Display results
print(age_outliers)
print(fare_outliers)
print(sibsp_outliers)
print(parch_outliers)

# Step 5: Create boxplots
par(mfrow = c(2, 2))

boxplot(numeric_data$Age,
        main = "Age Outliers",
        ylab = "Age")

boxplot(numeric_data$Fare,
        main = "Fare Outliers",
        ylab = "Fare")

boxplot(numeric_data$SibSp,
        main = "SibSp Outliers",
        ylab = "Number")

boxplot(numeric_data$Parch,
        main = "Parch Outliers",
        ylab = "Number")

# Step 6: Save boxplot image
png("Output/Outlier_Boxplots.png",
    width = 1200, height = 900)

par(mfrow = c(2, 2))

boxplot(numeric_data$Age, main = "Age Outliers")
boxplot(numeric_data$Fare, main = "Fare Outliers")
boxplot(numeric_data$SibSp, main = "SibSp Outliers")
boxplot(numeric_data$Parch, main = "Parch Outliers")

dev.off()

# Reset plotting layout
par(mfrow = c(1, 1))
