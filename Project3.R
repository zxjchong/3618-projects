```{r}
n<-10
C<-10000
r=0.06
i<-0.04
coupon_size<-C*r
annual_rate<-(1+i/2)^2-1
bond_selling_price<-coupon_size*(1-(1/(annual_rate+1)^n))/annual_rate+C*(1/(annual_rate+1)^n)
monthly_rate <- (1+i/12)^12-1
beginning <- c(0,0,0,bond_selling_price)
rownames = c(0:10)
colnames = c("Cash Paid", "Interest Expense", "Amortization","Carry Value of Bond")
dimnames = list(rownames, colnames)
amortization_table <- matrix(beginning, 1 + n, 4,TRUE,dimnames=dimnames)
period<-1
for (time in 1:n) {
  amortization_table[period+1,1] <- coupon_size
  amortization_table[period+1,2] <-amortization_table[period,4]*annual_rate
  amortization_table[period+1,3] <-amortization_table[period+1,1]-amortization_table[period+1,2]
  amortization_table[period+1,4] <-amortization_table[period,4]-amortization_table[period+1,3]
  period<-period+1
};amortization_table 

```
