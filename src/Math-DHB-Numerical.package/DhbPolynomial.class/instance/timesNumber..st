double dispatching
timesNumber: aNumber
	
	^self class coefficients: ( coefficients reverse collect: [ :each | each * aNumber])