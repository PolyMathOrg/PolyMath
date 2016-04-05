initialization
initialize: aHistogram
		"Private - Defines the histogram of the receiver."
	aHistogram count = 0
		ifTrue: [ self error: 'Cannot define probability density on an empty histogram'].
	histogram := aHistogram.
	^self