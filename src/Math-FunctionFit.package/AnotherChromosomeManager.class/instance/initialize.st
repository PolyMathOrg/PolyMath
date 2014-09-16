initialization
initialize 
super initialize .
populationSize :=100.
hammersley :=true.
rateOfEir :=0.16.
rateOfLC:=0.29.
rateOfMutation :=0.4.
rateOfCrossover :=0.15.
Primes  ifNil:[Primes :=Integer primesUpTo: 500].	"sufficient for up to 95 dimensions (parameters)"

