transformation
accumulate: aVectorOrArray

	| delta |
	count := count + 1.
	delta := average - aVectorOrArray asPMVector scaleBy: 1 / count.
	average accumulateNegated: delta.
	^ delta