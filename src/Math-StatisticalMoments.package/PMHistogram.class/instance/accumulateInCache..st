private
accumulateInCache: aNumber
	"Private - Accumulate aNumber inside a cache "

	contents add: aNumber.
	contents size > cacheSize
		ifTrue: [ self flushCache ]