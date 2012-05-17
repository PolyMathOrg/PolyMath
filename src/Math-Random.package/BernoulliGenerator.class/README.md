A BernoulliGenerator is simulates a Bernoulli Process. This is a discrete process, with probability of p for success, and 1-p for failure. 

next
	answer 1 if success event, 0 otherwise
	
generator:
	provide a uniform [0,1] random number generator
	
p: 
	set the probability of success events
	
class methods

withProbability:
	create a generator with probability set to p
	
defaultGenerator
	class used for generator in new instances