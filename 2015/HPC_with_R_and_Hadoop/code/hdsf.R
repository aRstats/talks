library(rhdfs)
library (plyr)

rm(list = ls())

## Start the HDFS interaction
hdfs.init()
## Give the file path (in this case is an local hdfs)
## The file for this example has 1.6 millions of records
BTC_Trades="/home/remote/workspace/aR/hadoop-2.7.1/hdfs/dn1/bitstamp/allTrades.csv"
## You can play with the buffer to see if the cluster can resist
Buffer="1000000"

## Load the records
reader = hdfs.line.reader(BTC_Trades, Buffer)

## Assign to an content object
content = reader$read()

## Now you can benchmark the Normal or Parallelized


## Normal
# do.call(rbind, lapply(content, data.frame, stringsAsFactors=FALSE))

## Parallel
rbind.fill(content)
