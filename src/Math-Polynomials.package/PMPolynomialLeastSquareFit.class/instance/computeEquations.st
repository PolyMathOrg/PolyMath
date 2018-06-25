transformation
computeEquations
		"Private - Answer a pair Matrix/Vector defining the system of equations
		 to solve the receiver."
	| rows vector |
	vector := ( PMVector new: degreePlusOne) atAllPut: 0 ; yourself.
	rows := ( 1 to: degreePlusOne) collect: [ :k | ( PMVector new: degreePlusOne) atAllPut: 0 ; yourself].
	pointCollection do:
		[ :each | self accumulate: each into: rows and: vector].
	^Array with: ( PMSymmetricMatrix rows: rows) with: vector