tests
testRangeScaleProbabilistic
	| r1 r2 correct |
	correct := 0.
	9
		timesRepeat: [ 
			self setUp.
			go maximumIterations: 500.
			go rangeScale: true.
			r1 := go evaluate norm.
			self setUp.
			go maximumIterations: 500.
			go rangeScale: false.
			r2 := go evaluate norm.
			correct := r1 < r2
				ifTrue: [ correct + 1 ]
				ifFalse: [ correct - 1 ] ].
	self assert: correct > 0