library(dplyr)
library(readr)
library(glue)

# Functions for building showcase

get_showcase_df <- function(semester) {
    df <- read_csv(here::here('showcase', glue('{semester}.csv'))) %>% 
        mutate(
            img = glue(
                '<img src="/showcase/{semester}/{stub}.{img}" width = 100%>'
            ),
            title = glue(
                '<h3><a href="/showcase/{semester}/{stub}.html"
                target="_blank">{title}</a></h3>
    by {student}'
            ),
            video = ifelse(is.na(video), '', glue(
                '<br><a href="{video}" target="_blank"><i class="bi-camera-video-fill"></i></a>'
            )),
            award = ifelse(is.na(award), '', paste0('<br>', award)),
            body = paste0(title, video, award)
        )
    return(df)
}

build_showcase <- function(df) {
    for (i in 1:nrow(df)) {
        cat(
            '\n::: {.g-col-4}\n\n',
            df[i, ]$img,
            '\n\n:::\n',
            '\n::: {.g-col-8}\n\n',
            df[i, ]$body,
            '\n:::\n'
        )
    }
}
