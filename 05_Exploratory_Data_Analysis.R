
# WEEK 1: EXPLORATORY DATA ANALYSIS

# Step 1: Dataset overview

cat("Dataset Dimensions:\n")
print(dim(titanic_clean))

cat("Dataset Summary:\n")
print(summary(titanic_clean))

# Step 2: Survival count

survival_count <- table(titanic_clean$Survived)

print(survival_count)

# Step 3: Survival rate by gender

gender_survival <- aggregate(
  Survived ~ Sex,
  data = titanic_clean,
  FUN = mean
)

gender_survival$Survival_Percentage <-
  gender_survival$Survived * 100

print(gender_survival)

# Step 4: Survival rate by passenger class

class_survival <- aggregate(
  Survived ~ Pclass,
  data = titanic_clean,
  FUN = mean
)

class_survival$Survival_Percentage <-
  class_survival$Survived * 100

print(class_survival)

# Step 5: Age distribution

print(summary(titanic_clean$Age))

# Step 6: Fare distribution

print(summary(titanic_clean$Fare))

# Step 7: Correlation analysis

correlation_data <- titanic_clean[
  c("Survived", "Pclass", "Age",
    "SibSp", "Parch", "Fare")
]

correlation_matrix <- cor(
  correlation_data,
  use = "complete.obs"
)

print(round(correlation_matrix, 2))

# Save correlation results
write.csv(
  correlation_matrix,
  "Output/Correlation_Matrix.csv"
)

# Step 8: Create survival bar chart

png("Output/Survival_Count.png",
    width = 1000, height = 700)

barplot(
  survival_count,
  main = "Titanic Survival Count",
  xlab = "Survival Status (0 = No, 1 = Yes)",
  ylab = "Number of Passengers",
  col = c("skyblue", "orange")
)

dev.off()

# Step 9: Gender survival chart

png("Output/Survival_By_Gender.png",
    width = 1000, height = 700)

barplot(
  gender_survival$Survival_Percentage,
  names.arg = gender_survival$Sex,
  main = "Survival Rate by Gender",
  xlab = "Gender",
  ylab = "Survival Percentage",
  col = c("skyblue", "pink"),
  ylim = c(0, 100)
)

dev.off()

# Step 10: Passenger class survival chart

png("Output/Survival_By_Class.png",
    width = 1000, height = 700)

barplot(
  class_survival$Survival_Percentage,
  names.arg = class_survival$Pclass,
  main = "Survival Rate by Passenger Class",
  xlab = "Passenger Class",
  ylab = "Survival Percentage",
  col = c("lightgreen", "orange", "skyblue"),
  ylim = c(0, 100)
)

dev.off()

# Step 11: Age histogram

png("Output/Age_Distribution.png",
    width = 1000, height = 700)

hist(
  titanic_clean$Age,
  main = "Passenger Age Distribution",
  xlab = "Age",
  ylab = "Frequency",
  col = "lightblue"
)

dev.off()

# Step 12: Fare histogram

png("Output/Fare_Distribution.png",
    width = 1000, height = 700)

hist(
  titanic_clean$Fare,
  main = "Passenger Fare Distribution",
  xlab = "Fare",
  ylab = "Frequency",
  col = "lightgreen"
)

dev.off()

# Step 13: Save survival analysis tables

write.csv(
  gender_survival,
  "Output/Gender_Survival_Analysis.csv",
  row.names = FALSE
)

write.csv(
  class_survival,
  "Output/Class_Survival_Analysis.csv",
  row.names = FALSE
)

cat("Exploratory Data Analysis completed successfully!")
