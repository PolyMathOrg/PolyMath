private
findNearestTo: anOptimizingPointClass
	|max dist|
	max:=Array with: bestPoints size with: Float infinity.
	(bestPoints size to: 2 by: -1)
		do: [:index |(anOptimizingPointClass better: (bestPoints at: index) ) ifTrue: 
			[dist:=(anOptimizingPointClass position - (bestPoints at: index) position / chromosomeManager range)abs sum.
			 dist=0 ifTrue:[^index ].
			 (dist < max second) ifTrue: [max at: 1 put: index. max at: 2 put: dist]] ifFalse: 
			[ ^max first]] .
	^max first.