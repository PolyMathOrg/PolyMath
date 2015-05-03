printing
printOn: aStream
	| first |
	(rows isNil or: [rows first isNil])
		ifTrue:[super printOn: aStream. aStream nextPutAll:'(uninitialized)'. ^self].
	first := true.
	rows do: 
		[ :each |
		  first ifTrue: [ first := false]
				 ifFalse:[ aStream cr].
		  each printOn: aStream.
		].