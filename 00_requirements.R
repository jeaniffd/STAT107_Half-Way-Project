## Necessary Packages
if (!require(tidyverse)) { ## If package is not installed
  install.packages("tidyverse") ## Install
  library(tidyverse) ## Load package to environment.
}

if (!require(spotifyr)) { ## If package is not installed
  install.packages("spotifyr") ## Install
  library(spotifyr) ## Load package to environment.
}
## Uploading files 
library(readr)
Spotify_2016_1 <- read_csv("GitHub/Half-Way Project/regional-global-weekly-2016-12-30--2017-01-06.csv")

library(readr)
Spotify_2026_1 <- read_csv("GitHub/Half-Way Project/history.csv")

## Creating spotify credientials to access spotifyr package
Sys.setenv(SPOTIFY_CLIENT_ID = 'your_client_id_here')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'your_client_secret_here')
