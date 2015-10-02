library(rmr2)
library(rhdfs)

rm(list = ls())


#small.ints = 1:100000
#sapply(small.ints, function(x) x^2)


hdfs.init()

# small.ints <- to.dfs(1:1000)
# fs.ptr <-
#   mapreduce(
#     input = small.ints, map = function(k,v)
#       cbind(v,v ^ 2)
#   )
# result <- from.dfs(fs.ptr)
# head(result$val)


# with map reduce
# small.ints = to.dfs(1:100000)
# mapreduce(
#   input = small.ints,
#   map = function(k, v)
#     cbind(v, v ^ 2)
# )

groups = rbinom(32, n = 50, prob = 0.4)
tapply(groups, groups, length)

groups = to.dfs(groups)
from.dfs(mapreduce(
  input = groups,
  map = function(., v)
    keyval(v, 1),
  reduce =
    function(k, vv)
      keyval(k, length(vv))
))
