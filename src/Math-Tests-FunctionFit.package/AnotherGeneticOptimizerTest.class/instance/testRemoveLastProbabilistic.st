tests
testRemoveLastProbabilistic
	| r1 r2 correct |
	correct := 0.
	3
		timesRepeat: [ 
			self setUp.
			go maximumIterations: 1000.
			go removeLast: true.
			r1 := go evaluate norm.
			self setUp.
			go maximumIterations: 1000.
			go removeLast: false.
			r2 := go evaluate norm.
			correct := r1 > r2
				ifTrue: [ correct + 1 ]
				ifFalse: [ correct - 1 ] ].
	self assert: correct > 0