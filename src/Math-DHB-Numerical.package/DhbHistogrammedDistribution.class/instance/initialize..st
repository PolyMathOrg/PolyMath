initialization
initialize: aHistogram
		"Private - Defines the histogram of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/2/99 "
	aHistogram count = 0
		ifTrue: [ self error: 'Cannot define probability density on an empty histogram'].
	histogram := aHistogram.
	^self