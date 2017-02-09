private
processOverflows: anInteger for: aNumber
	"Private"

	freeExtent
		ifTrue: [ 
			self growContents: anInteger.
			moments accumulate: aNumber ]
		ifFalse: [ self countOverflows: anInteger ]