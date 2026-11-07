## Clean Datasets

# 1. Clean Dataset 2016
Spotify_2016_2 <- Spotify_2016_1 %>%
  slice(-1) %>%
  transmute(
    position = as.numeric(.[[1]]),
    name = .[[2]],
    artists = .[[3]],
    streams = parse_number(as.character(.[[4]]))
  )
# 2. Clean Dataset 2026
Spotify_2026_2 <- Spotify_2026_1 %>%
  transmute(
    position = row_number(),
    name = .[[3]],
    artists = .[[4]],
    streams = as.numeric(.[[5]])
  )

# Take a look 
view(Spotify_2016_2)
view(Spotify_2026_2)