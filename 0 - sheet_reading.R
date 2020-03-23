# package for reading the googlesheet
# install.packages("googlesheets4")

library(tidyverse)
library(googlesheets4)

# read data

quest_sheet <- read_sheet("https://docs.google.com/spreadsheets/d/1PPXIx2DL3UJqnHtcZAkQ1I8ife8XLFyZ6Eh2ccBTb3g/edit#gid=1178879794")

# write data (rewrite to update)

write_rds(quest_sheet, "input_data/quest_sheet.rds")
