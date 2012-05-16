mathematical functions
raisedTo: aNumber 
	"Answer the receiver raised to aNumber."

	aNumber isInteger ifTrue:
		["Do the special case of integer power"
		^ self raisedToInteger: aNumber].
	
	0 = aNumber ifTrue: [^ self class one].	"Special case of exponent=0"
	1 = aNumber ifTrue: [^ self].	"Special case of exponent=1"
	0 = self ifTrue: [				"Special case of self = 0"
		aNumber < 0
			ifTrue: [^ (ZeroDivide dividend: self) signal]
			ifFalse: [^ self]].
	^ (aNumber * self ln) exp		"Otherwise use logarithms"