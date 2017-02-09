information
value: aNumber
	"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."

	^ aNumber > 0
		ifTrue: [ (aNumber ln * (alpha - 1) - (aNumber / beta) - norm) exp ]
		ifFalse: [ 0 ]