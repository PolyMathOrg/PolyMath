comparing
= aNumberOrMatrix 
	aNumberOrMatrix isNil ifTrue: [^false].
	aNumberOrMatrix isNumber ifTrue: [^(self numberOfRows = 1 and: [self numberOfColumns = 1])
			and: [(self rowAt: 1 columnAt: 1)
					= aNumberOrMatrix]].
	aNumberOrMatrix class = self class ifFalse: [^false].
	^self rows = aNumberOrMatrix rows