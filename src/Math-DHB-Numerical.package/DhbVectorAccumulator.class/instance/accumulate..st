transformation
accumulate: aVectorOrArray
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/16/00 "
	| delta |
	count := count + 1.
	delta := average - aVectorOrArray asVector scaleBy: 1 / count.
	average accumulateNegated: delta.
	^delta