#### Preamble ####
# Purpose: Download and save data from Wikipedia
# Author: Zijun Meng
# Date: 28 February 2024
# Contact: zijun.meng@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse) 
library(xml2)
# [...UPDATE THIS...]

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]
raw_data <- read_html(
  "https://en.wikipedia.org/wiki/List_of_prime_ministers_of_Canada"
)

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_html(raw_data, "data/raw_data/pms.html")
         
