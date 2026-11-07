

## Func. to find Genre of data

library(spotifyr)
library(dplyr)
library(purrr) ##Loading packages

add_song_genres <- function(df, song_column) {
  # get column to find genre of
  song_col_sym <- ensym(song_column)
  songs <- df %>% pull(!!song_col_sym)
  
  # put songs in column into vector
  genres_vector <- map_chr(songs, function(song) {
    if (is.na(song) || song == "") {
      return(NA_character_)
    }
    
    # 1. Search for the track
    search_res <- tryCatch({
      search_spotify(song, type = "track", limit = 1)
    }, error = function(e) {
      NULL
    })
    
    # 2. Get the artist ID and find genres
    if (!is.null(search_res) && nrow(search_res) > 0) {
      artist_id <- search_res$artists[[1]]$id[1]
      
      artist_res <- tryCatch({
        get_artist(artist_id)
      }, error = function(e) {
        NULL
      })
      
      if (!is.null(artist_res) && length(artist_res$genres) > 0) {
        return(paste(artist_res$genres, collapse = ", "))
      }
    }
    
    return(NA_character_)
  })
  
  # Adding new column with genres
  df %>%
    mutate(genres = genres_vector)
}