private
resultAdd: aHalfSplit
(result isEmpty not and: [ result first second inf > min ])
	ifTrue: [ result := IntervalHeap newQueue].
result add: aHalfSplit 	