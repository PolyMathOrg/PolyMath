comparing
= aNumberOrPolynomial 
	aNumberOrPolynomial isNil ifTrue: [^false].
	aNumberOrPolynomial isNumber ifTrue: [^coefficients size = 1 and: [coefficients first = aNumberOrPolynomial]].
	aNumberOrPolynomial class = self class ifFalse: [^false].
	^self coefficients = aNumberOrPolynomial coefficients