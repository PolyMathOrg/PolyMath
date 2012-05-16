operation
evaluateIteration
	"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

	| centerOfGravity newPoint nextPoint |
	centerOfGravity := (bestPoints inject: ((worstVector copy)
						atAllPut: 0;
						yourself)
				into: [:sum :each | each position + sum]) * (1 / bestPoints size).
	newPoint := optimizingPointClass vector: 2 * centerOfGravity - worstVector
				function: functionBlock.
	(newPoint betterThan: bestPoints first) 
		ifTrue: 
			[nextPoint := optimizingPointClass 
						vector: newPoint position * 2 - centerOfGravity
						function: functionBlock.
			(nextPoint betterThan: newPoint) ifTrue: [newPoint := nextPoint]]
		ifFalse: 
			[newPoint := optimizingPointClass 
						vector: centerOfGravity * 0.666667 + (worstVector * 0.333333)
						function: functionBlock.
			(newPoint betterThan: bestPoints first) ifFalse: [^self contract]].
	worstVector := bestPoints removeLast position.
	bestPoints add: newPoint.
	result := bestPoints first position.
	^self computePrecision