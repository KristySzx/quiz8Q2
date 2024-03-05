# Load necessary libraries
install.packages("tidyverse")
library(tidyverse)

# Simulate the situation
set.seed(123) # Setting a seed for reproducibility
n <- 100 # Number of observations

# Simulating three predictors
predictor1 <- sample(x = 1:5, size = n, replace = TRUE) # For example, education levels 1-5
predictor2 <- rnorm(n) # Continuous variable, e.g., income
predictor3 <- sample(x = c('low', 'medium', 'high'), size = n, replace = TRUE) # For example, risk category

# Simulate outcome variable 'count of levels', e.g., count of political support levels
outcome <- rpois(n, lambda = 2) # Poisson-distributed outcome variable

# Combine into a data frame
data <- tibble(predictor1, predictor2, predictor3, outcome)

# Conduct ten different tests - assuming tests are linear models for illustration
models <- list()
for (i in 1:10) {
  formula <- as.formula(paste("outcome ~ predictor1 + predictor2 + predictor3"))
  models[[i]] <- glm(formula, data = data, family = 'poisson')
}

# Display summaries of each model
lapply(models, summary)

