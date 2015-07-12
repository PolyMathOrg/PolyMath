information
binWidth
	"Answer the bin width for the receiver."

	self isCached
		ifTrue: [ self flushCache ].
	^ binWidth