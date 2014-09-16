transformation
addPointAt: aVector
"makes room if necessary and adds point only, 
if there is already enough  room or the bestPoints get better with the new point" 
	|p|
	p:=optimizingPointClass vector: aVector function: functionBlock.
	((p value isInfinite)or:[p value isNaN]) ifTrue:[^self].
	(bestPoints size >= chromosomeManager populationSize)
		ifTrue: [(p betterThan: bestPoints last ) ifTrue: 
			[removeLast ifTrue: [bestPoints removeLast] ifFalse: [self removeNearestTo: p].
			self add: p] ]  
		ifFalse: [self add: p].