tests
testOrthogonalize
	| a b i |
	i := 0.
	[ a := DhbMatrix rows: 5 columns: 5 random: 5.0.
	a rank = 5
		ifTrue: [ a atRow: 2 put: (a rowAt: 1) + (3 * (a rowAt: 3)).
			a atRow: 4 put: 3.11 * (a rowAt: 2).
			b := a orthogonalize.
			self assert: b numberOfColumns equals: 3.
			i := i + 1.
			self assert: ((b columnAt: 1) * (b columnAt: 2) equalsTo: 0).
			self assert: ((b columnAt: 1) * (b columnAt: 3) equalsTo: 0).
			self assert: ((b columnAt: 3) * (b columnAt: 2) equalsTo: 0).
			self assert: ((b columnAt: 1) * (b columnAt: 1) equalsTo: 1).
			self assert: ((b columnAt: 3) * (b columnAt: 3) equalsTo: 1).
			self assert: ((b columnAt: 2) * (b columnAt: 2) equalsTo: 1) ].
	i < 10 ] whileTrue