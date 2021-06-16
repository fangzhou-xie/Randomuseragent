library(tidyverse)

useragents <- read_csv(
  "~/Downloads/whatismybrowser-user-agent-database-2021-05-03-06-17--csv-SAMPLE/whatismybrowser-user-agent-database.csv",
  col_types = cols_only(
    id = col_integer(),
    user_agent = col_character(),
    times_seen = col_integer(),
    software_name = col_character(),
    software_type = col_character(),
    operating_system_name = col_character(),
    hardware_type = col_character(),
    layout_engine_name = col_character(),
    last_seen_at = col_character()
    )
  ) %>%
  select(
    id,
    user_agent,
    times_seen,
    software_name,
    software_type,
    operating_system_name,
    hardware_type,
    layout_engine_name,
    last_seen_at
  )

usethis::use_data(useragents, internal = TRUE, overwrite = TRUE)
