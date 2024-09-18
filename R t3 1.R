# Load necessary libraries

library(ggplot2)

# Load the data using base R
df <- read.csv("C:/Users/Somepalli Bhargavi/Downloads/NYC Taxi Data.csv")

# Handle missing values by dropping rows with NA in 'pickup_longitude' or 'dropoff_longitude'
df <- na.omit(df[, c("pickup_latitude", "dropoff_latitude")])

# Create a linear regression model
model <- lm(dropoff_latitude ~ pickup_latitude, data = df)

# Make predictions
df$predictions <- predict(model, newdata = df)

# Plot the data and the regression line
ggplot(df, aes(x = pickup_latitude, y = dropoff_latitude)) +
  geom_point(color = 'blue') +
  geom_smooth(method = 'lm', color = 'red', se = FALSE) +
  labs(x = 'pickup_latitude', y = 'dropoff_latitudee', title = 'Linear Regression') +
  theme_minimal()
