comparing
= aNumberOrMatrix 
	aNumberOrMatrix isNil ifTrue: [^false].
	aNumberOrMatrix isNumber ifTrue: [^self numberOfRows = 1 and: [self numberOfColumns = 1
			and: [(self rowAt: 1 columnAt: 1)
					= aNumberOrMatrix]]].
	aNumberOrMatrix species = self species ifFalse: [^false].
	^self rows = aNumberOrMatrix rows