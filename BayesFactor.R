
# This is to calculate Bayes factor

library(see)
library(BayesFactor)
library(bayestestR)

df <- read.csv(file.choose(), header = TRUE, sep = ',')

cor <- correlationBF(df$beta, df$DU)

describe_posterior(cor)
bayesfactor(cor)
plot(bayesfactor(cor)) +
  scale_fill_pizza()

