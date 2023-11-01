library(tidyverse)
library(gganimate)

source("field_plot.R")

week_1_tracking <- read_csv("Data/tracking_week_1.csv")






data_for_plot <- week_1_tracking %>% 
  filter(gameId == 2022090800 & playId == 2712) %>% 
  select(gameId,playId, time, displayName, club, x,y,frameId, jerseyNumber)


mycolors <-
  c(
    "football" = "#492E22",
    "BUF" = "#E64402",
    "LA" = "blue"
  )
mysize <- c("football" = 3,
            "BUF" = 7,
            "LA" = 7)
myalpha <- c("football" = 1,
             "BUF" = 0.7,
             "LA" = 0.7)

plot <- data_for_plot %>% 
  ggplot(aes(x = x, y = y, color = club, size = club, label = jerseyNumber))+
  gg_field()+
  geom_point(show.legend = FALSE) +
  scale_color_manual(values = mycolors) +
  scale_size_manual(values = mysize)+
  scale_alpha_manual(values = myalpha)+
  geom_text(aes(x = x, y = y, label = jerseyNumber), size = 4, color = "Black", show.legend = FALSE)+
  transition_time(time) +
  labs(title = "Date - Time: {format(frame_time, '%Y/%m/%d %H:%M:%OS2')}")






