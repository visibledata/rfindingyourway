library("tidyverse")
library("ggcal")
library("rtweet")
library("lubridate")

## ==== ggcal() modifications ====
## The ggcal::ggcal() function has annoying presets, here I've butchered the code
modified_ggcal <- function(dates, fills) {
  months <- format(seq(as.Date("2016-01-01"), as.Date("2016-12-01"),
                       by = "1 month"
  ), "%B")
  mindate <- as.Date(format(min(dates), "%Y-%m-01"))
  maxdate <- (seq(as.Date(format(max(dates), "%Y-%m-01")),
                  length.out = 2, by = "1 month"
  ) - 1)[2]
  filler <- tibble(date = seq(mindate, maxdate, by = "1 day"))
  t1 <- tibble(date = dates, fill = fills) %>%
    right_join(filler,
               by = "date"
    ) %>%
    mutate(dow = as.numeric(format(
      date,
      "%w"
    ))) %>%
    mutate(month = format(date, "%B")) %>%
    mutate(woy = as.numeric(format(
      date,
      "%U"
    ))) %>%
    mutate(year = as.numeric(format(date, "%Y"))) %>%
    mutate(month = factor(month, levels = months, ordered = TRUE)) %>%
    arrange(year, month) %>%
    mutate(monlabel = month)
  if (length(unique(t1$year)) > 1) {
    t1$monlabel <- paste(t1$month, t1$year)
  }
  t2 <- t1 %>%
    mutate(monlabel = factor(monlabel, ordered = TRUE)) %>%
    mutate(monlabel = fct_inorder(monlabel)) %>%
    mutate(monthweek = woy -
             min(woy), y = max(monthweek) - monthweek + 1)
  weekdays <- c("S", "M", "T", "W", "T", "F", "S")
  ggplot(t2, aes(dow, y, fill = fill)) + geom_tile(aes(color = "gray80")) + scale_x_continuous(expand = c(
    0,
    0
  ), position = "top", breaks = seq(0, 6), labels = weekdays) +
    scale_y_continuous(expand = c(0, 0)) + theme(
      panel.background = element_rect(
        fill = NA,
        color = NA
      ), strip.background = element_rect(
        fill = NA,
        color = NA
      ), strip.text.x = element_text(
        hjust = 0,
        face = "bold"
      ),  axis.ticks = element_blank(),
      axis.title = element_blank(), axis.text.y = element_blank(),
      strip.placement = "outsite"
    )
}

## ==== get twitter data ====

my_favourites <- rtweet::get_favorites(user = "rfindingyourway")
my_tweets <- get_timeline(user = "rfindingyourway")

tweets_in_period <- my_favourites %>%
  bind_rows(my_tweets) %>%
  select(created_at) %>%
  mutate(created_at = as.Date(created_at)) %>%
  filter(created_at >= ymd("2019-09-01"),
         created_at <= ymd("2019-09-30")) %>%
  count(created_at)


gg_tweets_in_month <- modified_ggcal(tweets_in_period$created_at,
               tweets_in_period$n) +
  labs(title = "@rfindingyourfeet activity September 2019") +
  # guides(fill=guide_legend(title="New Legend Title")) +
  # scale_fill_continuous(type = "viridis", na.value="lightgrey") +
  # scale_colour_manual(values=NA) +              
  # guides(colour=guide_legend("No data", override.aes=list(colour="lightgrey")))
  guides(color = guide_legend(override.aes = list(fill = "lightgrey"))) +
  scale_fill_viridis_c("Number of tweets", na.value = "lightgrey") +
  scale_color_manual(values = 'lightgrey', labels = "", name = "Tweetless days")

ggsave("static/img/blog-images/header-images/things-we-learned_september-2019.png",
       width = 144,
       height = 72, 
       units = "mm")


