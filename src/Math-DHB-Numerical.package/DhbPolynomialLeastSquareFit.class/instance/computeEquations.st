transformation
computeEquations
		"Private - Answer a pair Matrix/Vector defining the system of equations
		 to solve the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 18/3/99 "
	| rows vector |
	vector := ( DhbVector new: degreePlusOne) atAllPut: 0 ; yourself.
	rows := ( 1 to: degreePlusOne) collect: [ :k | ( DhbVector new: degreePlusOne) atAllPut: 0 ; yourself].
	pointCollection do:
		[ :each | self accumulate: each into: rows and: vector].
	^Array with: ( DhbSymmetricMatrix rows: rows) with: vector