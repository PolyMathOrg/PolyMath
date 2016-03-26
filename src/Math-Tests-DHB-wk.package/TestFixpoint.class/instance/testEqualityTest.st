tests
testEqualityTest
	fp
		block: [ :x | 
			| d |
			d := x - 1.
			d < -2
				ifTrue: [ d := 2 ].
			d ].	"can return an Integer!"
	fp equalityTest: [ :x :y | x = y ].
	fp value: 2.0.
	fp evaluate.
	self assert: fp cycleLength equals: 5.
	fp equalityTest: [ :x :y | x = 0 or: [ y = 0 ] ].
	fp value: 2.0.
	fp evaluate.
	self assert: fp iterations equals: 2.
	self assert: fp cycleLength equals: 1