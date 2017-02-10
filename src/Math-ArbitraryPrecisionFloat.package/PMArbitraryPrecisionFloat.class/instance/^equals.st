comparing
= aNumber
	aNumber isNumber ifFalse: [^ false].
	aNumber class = self class ifTrue:
		[aNumber negative == self negative
			ifTrue: [^ (self digitCompare: aNumber) = 0]
			ifFalse: [^ false]].
	^ aNumber adaptToArbitraryPrecisionFloat: self andCompare: #=