prod<-c(helpfulness$key)
helpfulnessfactor<-c(helpfulness$val)
classify<-c()
i<-1
while(i<=length(helpfulnessfactor))
{
  if(helpfulnessfactor[i]<=3.000000)
  {
    classify<-c(classify,"NEED IMPROVEMENT")
  }else
  {
    classify<-c(classify,"POPULAR")
  }
    i<-i+1
}
