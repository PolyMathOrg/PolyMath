transformation
accumulate: aNumber
		"Accumulate aNumber into the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	| bin |
	"(contents includes: nil) ifTrue: [self halt]."
	self isCached
		ifTrue: [ ^self accumulateInCache: aNumber].

	bin := self binIndex: aNumber.
	( bin between: 1 and: contents size)
		ifTrue: [ contents at: bin put: ( contents at: bin) + 1.
					 moments accumulate: aNumber.
				   ]
		ifFalse:[ self processOverflows: bin for: aNumber].
