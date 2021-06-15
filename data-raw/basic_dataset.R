library(tidyverse)

useragents <- read_csv(
  "~/Downloads/whatismybrowser-user-agent-database-2021-05-03-06-17--csv-SAMPLE/whatismybrowser-user-agent-database.csv",
  col_types = cols(.default = "c")
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

usethis::use_data(useragents, internal = TRUE)
