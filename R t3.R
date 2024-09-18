# Load necessary libraries
install.packages("ggplot2")
library(ggplot2)

# Load the data using base R
df <- read.csv("C:/Users/Somepalli Bhargavi/Downloads/NYC Taxi Data.csv")

# Handle missing values by dropping rows with NA in 'pickup_longitude' or 'dropoff_longitude'
df <- na.omit(df[, c("pickup_longitude", "dropoff_longitude")])

# Create a linear regression model
model <- lm(dropoff_longitude ~ pickup_longitude, data = df)

# Make predictions
df$predictions <- predict(model, newdata = df)

# Plot the data and the regression line
ggplot(df, aes(x = pickup_longitude, y = dropoff_longitude)) +
  geom_point(color = 'blue') +
  geom_smooth(method = 'lm', color = 'red', se = FALSE) +
  labs(x = 'pickup_longitude', y = 'dropoff_longitude', title = 'Linear Regression') +
  theme_minimal()
