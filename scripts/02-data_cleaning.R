#### Preamble ####
# Purpose: Cleans the raw data
# Author: Zijun Meng
# Date: 28 February 2024
# Contact: zijun.meng@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(xml2)
library(rvest)
library(janitor)
#### Clean data ####
raw_data <- read_html("data/raw_data/pms.html")

parse_data_selector_gadget <-
  raw_data |>
  html_elements(".wikitable") |>
  html_table()

head(parse_data_selector_gadget)
parsed_data<-parse_data_selector_gadget[[2]]

pm_list <-
  parsed_data |> 
  clean_names()|>
  select(name_birth_death) |>
  distinct()

initial_clean <-
  pm_list |>
  separate(
    name_birth_death, into = c("name", "birth_death"), sep = "\\(", extra = "merge",
  ) |> 
  mutate(date = str_extract(birth_death, "[[:digit:]]{4}–[[:digit:]]{4}")) |>
  mutate(alive_date =  str_extract(birth_death, "b. [[:digit:]]{4}")) |>
  select(name, date, alive_date)

cleaned_list <-
  initial_clean |>
  separate(
    date, into = c("birth", "died"), sep = "–", extra = "merge",
  ) |>
  mutate(alive_birth = str_extract(alive_date, "[[:digit:]]{4}"))

cleaned_list$birth[is.na(cleaned_list$birth)] <- cleaned_list$alive_birth[is.na(cleaned_list$birth)]



cleaned_list<-select(cleaned_list,name, birth, died) 

cleaned_list <-
  transform(cleaned_list, birth = as.integer(birth),died = as.integer(died))

cleaned_list <- cleaned_list[-24,]
#### Save data ####
write_csv(cleaned_list, "data/analysis_data.csv")
