tests
testMatrixSquared
	"this tests squared and is not in Math-Tests-DHB-Numerical since it uses random matrices"

	| a |
	10
		timesRepeat: [ a := DhbMatrix rows: 20 columns: 21 random: 10.0.
			self assert: a squared equals: a transpose * a ].
	self assert: a squared class equals: DhbSymmetricMatrix