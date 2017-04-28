prod_data=read.csv("~/work/amazon_review/reviews_sample.csv")

maxn=max(prod_data[,5])
minn=min(prod_data[,5])
maxd=max(prod_data[,6])
mind=min(prod_data[,6])

i<-1
while(i<=dim(prod_data)[1])
{
  prod_data[i,5]=(prod_data[i,5]-minn)*((1-0.1)/(maxn-minn))+0.1
  prod_data[i,6]=(prod_data[i,6]-mind)*((1-0.1)/(maxd-mind))+0.1
  i=i+1
}

