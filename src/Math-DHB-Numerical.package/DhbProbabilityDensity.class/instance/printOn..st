display
printOn: aStream 
	"(c) Copyrights Didier BESSET, 1999, all rights reserved. 
	Initial code: 4/3/99"

	| params |
	aStream nextPutAll: self class distributionName.
	(params := self parameters) notNil
		ifTrue: 
			[| first |
			first := true.
			aStream nextPut: $(.
			params
				do: 
					[:each | 
					first
						ifTrue: [first := false]
						ifFalse: [aStream nextPut: $,].
					aStream space.
					each printOn: aStream].
			aStream nextPut: $)]