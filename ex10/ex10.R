n=0
set.seed(1569)
for (x in 1:200) {
  sample<-rnorm(20, mean=80.3, sd=2)
  z=(mean(sample)-79)/(2/sqrt(20))
  if(abs(z)<=1.75069){
    # Não rejeita
	  n=n+1
   }
}

prob <- n / 200

