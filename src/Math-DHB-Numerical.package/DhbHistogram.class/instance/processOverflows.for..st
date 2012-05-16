transformation
processOverflows: anInteger for: aNumber
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	freeExtent
		ifTrue: [ self growContents: anInteger.
					 moments accumulate: aNumber
				   ]
		ifFalse:[ self countOverflows: anInteger].