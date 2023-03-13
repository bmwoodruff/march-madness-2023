library(tidyverse)


imps_toss_darts_for_the_win <- function(x,y){
  teams <- read_tsv("https://raw.githubusercontent.com/bmwoodruff/march-madness-2023/main/teams.tsv", show_col_types = FALSE)
  ### Inspiration from Paul Cannon
  set.seed(666)
  if(x %in% (teams %>% pull(Team))){ 
  } else {teams <- rbind(teams,tibble(Ranking = runif(1,0,51), Team = x ))}
  if(y %in% (teams %>% pull(Team))){ 
  } else {teams <- rbind(teams,tibble(Ranking = runif(1,0,51), Team = y ))}
  teams %>% 
    mutate(dart_ranking = runif(n=length(Team))) %>% 
    filter(Team %in% c(x,y)) %>%  
    slice_min(dart_ranking) %>% 
    pull(Team)
}
