library(plyr)

rm(list = ls())

## Test the progress bar
l_ply(1:1000000, identity, .progress = progress_text(char = "."))
