private
flushCache
	"Private"

	| maximum values |
	minimum isNil
		ifTrue: [ 
			minimum := contents isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ contents first ] ].
	maximum := minimum.
	contents
		do: [ :each | 
			each < minimum
				ifTrue: [ minimum := each ]
				ifFalse: [ 
					each > maximum
						ifTrue: [ maximum := each ] ] ].
	maximum = minimum
		ifTrue: [ maximum := minimum + desiredNumberOfBins ].
	values := contents.
	self adjustDimensionUpTo: maximum.
	values do: [ :each | self accumulate: each ]