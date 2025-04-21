library(tidyverse)
library(cowplot)

x       <- c(anscombe$x1, anscombe$x2, anscombe$x3, anscombe$x4)
y       <- c(anscombe$y1, anscombe$y2, anscombe$y3, anscombe$y4)
quartet <- rep(c('A', 'B', 'C', 'D'), each = nrow(anscombe))
ansDf   <- tibble(x, y, quartet)
anscombePlot <- ansDf %>%
    ggplot(aes(x = x, y = y)) +
    geom_point(alpha = 0.4, size = 2) +
    stat_smooth(method = 'lm', se = F, size = 0.4, alpha = 0.6) +
    facet_wrap(vars(quartet)) +
    scale_x_continuous(breaks=seq(4, 18, 2), limits=c(4, 19)) +
    scale_y_continuous(breaks=seq(4, 12, 2), limits=c(3, 13)) +
    theme_minimal_grid() +
    theme(
        axis.ticks = element_blank(),
        axis.ticks.length = unit(0, "cm"),
        panel.grid.major = element_line(size = 0.3, colour = "grey90"),
        axis.text = element_blank(),
        axis.title = element_blank(),
        strip.background = element_blank(),
        strip.text.x = element_blank(),
        panel.spacing = unit(0, "lines"),
        plot.margin = margin(0, 0, 0, 0, "cm")) + 
    panel_border(color = 'black', size = 1) 

ggsave('anscombePlot.png', anscombePlot, width = 4, height = 2.5)
