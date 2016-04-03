information
value: aNumber
	"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."

	^ [ (aNumber / beta) negated exp / beta ]
		on: Error
		do: [ :signal | signal return: 0 ]