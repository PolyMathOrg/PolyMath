information
smallNumber
	
	smallNumber isNil
		ifTrue: [ smallNumber := self smallestNumber sqrt].
	^smallNumber