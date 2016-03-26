tests
testlineCrossOver
	| a |
	1 to: 10 do: [ :i | 
		a := cm lineCrossOver: #(-2 2) and: #(-4 4).
		self assert: ((a at: 1) at: 2) equals: ((a at: 1) at: 1) negated.
		self assert: ((a at: 2) at: 2) equals: ((a at: 2) at: 1) negated ]