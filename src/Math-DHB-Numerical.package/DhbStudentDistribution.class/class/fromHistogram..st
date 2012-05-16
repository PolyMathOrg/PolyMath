creation
fromHistogram: aHistogram
		"Create an instance of the receiver with parameters estimated from the
		  given histogram using best guesses. This method can be used to
		  find the initial values for a fit.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 5/3/99 "
	| dof var |
	var := aHistogram variance.
	var = 0
		ifTrue: [ ^nil].
	dof :=  ( 2 / (1 - (1 / aHistogram variance))) rounded max: 1.
	^dof > self asymptoticLimit ifTrue: [ nil]
								ifFalse:[ self degreeOfFreedom: dof]