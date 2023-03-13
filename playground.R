
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

no_upsets_for_the_win <- function(x,y){
  teams <- read_tsv("https://raw.githubusercontent.com/bmwoodruff/march-madness-2023/main/teams.tsv", show_col_types = FALSE)
  if(x %in% (teams %>% pull(Team))){ 
  } else {teams <- rbind(teams,tibble(Ranking = runif(1,0,51), Team = x ))}
  if(y %in% (teams %>% pull(Team))){ 
  } else {teams <- rbind(teams,tibble(Ranking = runif(1,0,51), Team = y ))}
  teams %>% 
    filter(Team %in% c(x,y)) %>% 
    slice_min(Ranking) %>% 
    pull(Team)
}


all_upsets_for_the_win("Alabama_CrimsonTide","Baylor_Bears")
no_upsets_for_the_win("Alabama_CrimsonTide","Baylor_Bears")

imps_toss_darts_for_the_win <- function(x,y){
  teams <- read_tsv("https://raw.githubusercontent.com/bmwoodruff/march-madness-2023/main/teams.tsv", show_col_types = FALSE)
  if(x %in% (teams %>% pull(Team))){ 
  } else {teams <- rbind(teams,tibble(Ranking = runif(1,0,51), Team = x ))}
  if(y %in% (teams %>% pull(Team))){ 
  } else {teams <- rbind(teams,tibble(Ranking = runif(1,0,51), Team = y ))}
  ### Inspiration from Paul Cannon
  set.seed(666)
  teams %>% 
    mutate(dart_ranking = runif(n=length(Team))) %>% 
    filter(Team %in% c(x,y)) %>%  
    slice_min(dart_ranking) %>% 
    pull(Team)
}

imps_toss_darts_for_the_win("Alabama_CrimsonTide","Arizona_Wildcats")

#none of the code above deals with an issue that the team name might not be in the list. So let's take care of this. 

x <- "bobert_team"
y <- "Alabam_CrimsonTide"
tibble(Ranking = runif(1,0,51), Team = x )
if(x %in% (teams %>% pull(Team))){ 
} else {teams <- rbind(teams,tibble(Ranking = runif(1,0,51), Team = x ))}
if(y %in% (teams %>% pull(Team))){ 
} else {teams <- rbind(teams,tibble(Ranking = runif(1,0,51), Team = y ))}
teams
imps_toss_darts_for_the_win(x,y)

all_upsets_for_the_win("Alabama_CrimsonTide","Baylor_Bears")
no_upsets_for_the_win("Alabama_CrimsonTide","Baylor_Bears")
imps_toss_darts_for_the_win("Alabama_CrimsonTide","Baylor_Bears")

