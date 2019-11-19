```{r}
n<-10
L<-200000
i<-0.03
monthly_rate <- (1+i/12)^12-1
payment_size<-L/((1-(1/(1+monthly_rate)^n))/monthly_rate)
beginning <- c(0,0,L)
rownames = c(0:10)
colnames = c("interest paid", "principal repaid", "outstanding balance")
dimnames = list(rownames, colnames)
amortization_table <- matrix(round(beginning,digits = 4), 1 + n, 3,TRUE,dimnames=dimnames)
period<-1
for (time in 1:n) {
  amortization_table[period+1,1] <- amortization_table[period,3] * (monthly_rate)
  amortization_table[period+1,2] <- payment_size-amortization_table[period+1,1]
  amortization_table[period+1,3] <- amortization_table[period,3]-amortization_table[period+1,2]
  period<-period+1
};amortization_table



