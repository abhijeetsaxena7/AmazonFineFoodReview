Sys.setenv("HADOOP_CMD"="/usr/local/hadoop/bin/hadoop")
Sys.setenv("HADOOP_STREAMING"="/usr/local/hadoop/hadoop-2.6.0/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar")
Sys.setenv("HADOOP_USER_NAME"="hduser")

library(rhdfs)
library(rmr2)


#mr config and initialising hdfs
hdfs.init()
rmr.options(hdfs.tempdir = "/home/")
tempfile(tmpdir = "/home/")


mr1=mapreduce(
  input = to.dfs(prod_data),
  
  map=function(k,tupple)
  {
    return(keyval(tupple[2], tupple))
  },
  
  reduce=function(k,val)
  {
    hn=sum(val[5])
    hd=sum(val[6])
    avg_score=sum(val[7])/dim(val)[1]
    hp=(hn/hd)*avg_score
    return(keyval(k,hp))
  }
  
)

helpfulness=from.dfs(mr1)
