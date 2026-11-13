
# Create a copy of original dataset
titanic_clean <- titanic

# Step 1: Convert blank strings into NA
for (col in names(titanic_clean)) {
  if (is.character(titanic_clean[[col]])) {
    titanic_clean[[col]] <- trimws(titanic_clean[[col]])
    titanic_clean[[col]][titanic_clean[[col]] == ""] <- NA
  }
}

# Step 2: Check missing values again
colSums(is.na(titanic_clean))

# Step 3: Create Cabin availability column
titanic_clean$HasCabin <- ifelse(
  is.na(titanic_clean$Cabin), "No", "Yes"
)

# Step 4: Fill missing Age using median
# of passengers in the same class and sex

for (i in which(is.na(titanic_clean$Age))) {
  
  pclass_value <- titanic_clean$Pclass[i]
  sex_value <- titanic_clean$Sex[i]
  
  median_age <- median(
    titanic_clean$Age[
      titanic_clean$Pclass == pclass_value &
        titanic_clean$Sex == sex_value
    ],
    na.rm = TRUE
  )
  
  titanic_clean$Age[i] <- median_age
}

# Step 5: Fill missing Embarked values
# using the most frequent category

mode_embarked <- names(
  sort(table(titanic_clean$Embarked), decreasing = TRUE)
)[1]

titanic_clean$Embarked[
  is.na(titanic_clean$Embarked)
] <- mode_embarked

# Step 6: Fill missing Cabin values
titanic_clean$Cabin[
  is.na(titanic_clean$Cabin)
] <- "Unknown"

# Step 7: Check missing values after cleaning
colSums(is.na(titanic_clean))

# Step 8: Display cleaned dataset
head(titanic_clean)

# Step 9: Check dataset dimensions
dim(titanic_clean)
