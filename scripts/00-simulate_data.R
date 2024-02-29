#### Preamble ####
# Purpose: Simulates how long prime ministers of Canada lived
# Author: Zijun Meng
# Date: 28 February 2024
# Contact: zijun.meng@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
set.seed(1234)
#### Simulate data ####
simulated_dataset <-
  tibble(
    prime_minister = rep(1:10),
    birth_year = sample(1700:1990, size = 10, replace = TRUE),
    years_lived = sample(50:100, size = 10, replace = TRUE),
    death_year = birth_year + years_lived
  ) |>
  select(prime_minister, birth_year, death_year, years_lived) |>
  arrange(birth_year)

simulated_dataset


