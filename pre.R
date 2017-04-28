test_normal=read.csv("~/work/amazon_review/reviews_sample.csv")

maxn=max(test_normal[,5])
minn=min(test_normal[,5])
maxd=max(test_normal[,6])
mind=min(test_normal[,6])

i<-1
while(i<=dim(test_normal)[1])
{
  test_normal[i,5]=(test_normal[i,5]-minn)*((1-0.1)/(maxn-minn))+0.1
  test_normal[i,6]=(test_normal[i,6]-mind)*((1-0.1)/(maxd-mind))+0.1
  i=i+1
}
