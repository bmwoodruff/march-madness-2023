library(tidyverse)

all_upsets_for_the_win <- function(x,y){
  teams <- read_tsv("https://raw.githubusercontent.com/bmwoodruff/march-madness-2023/main/teams.tsv", show_col_types = FALSE)
  if(x %in% (teams %>% pull(Team))){ 
  } else {teams <- rbind(teams,tibble(Ranking = runif(1,0,51), Team = x ))}
  if(y %in% (teams %>% pull(Team))){ 
  } else {teams <- rbind(teams,tibble(Ranking = runif(1,0,51), Team = y ))}
  teams %>% 
    filter(Team %in% c(x,y)) %>% 
    slice_max(Ranking) %>% 
    pull(Team)
}
