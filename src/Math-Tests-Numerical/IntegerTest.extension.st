Extension { #name : 'IntegerTest' }

{ #category : '*Math-Tests-Numerical' }
IntegerTest >> testFindNK [

	self assert: 6 inverseBinomialCoefficient equals:  #(6 1 6 5 4 2).
	self assert: 10 inverseBinomialCoefficient equals: #(10 1 10 9 5 2 5 3).
	self assert: 20 inverseBinomialCoefficient equals: #(20 1 20 19 6 3).
	self assert: 21 inverseBinomialCoefficient equals: #(21 1 21 20 7 2 7 5).
	self assert: 55 inverseBinomialCoefficient equals: #(55 1 55 54 11 2 11 9).
	self assert: 120 inverseBinomialCoefficient equals: #(120 1 120 119 16 2 16 14 10 3 10 7).
	self assert: 3003 inverseBinomialCoefficient equals: #(3003 1 3003 3002 78 2 78 76 15 5 15 10 14 6 14 8).
	self assert: 8966473191018617158916954970192684 inverseBinomialCoefficient equals: #(8966473191018617158916954970192684 1 8966473191018617158916954970192684 8966473191018617158916954970192683 123 45 123 78).

	self should: [ 1 inverseBinomialCoefficient ] raise: Error.
	self should: [ 0 inverseBinomialCoefficient ] raise: Error
]
