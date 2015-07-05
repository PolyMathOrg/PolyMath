transformation
accumulate: aVectorOrArray

	| delta |
	count := count + 1.
	delta := average - aVectorOrArray asDhbVector scaleBy: 1 / count.
	average accumulateNegated: delta.
	^ delta