streaming
severalChecksOn: aName with: anExpectedResult tree: aTree
	| aResult  error |
	aResult := self calcResult: aName tree: aTree .
	error := aResult isCollection
		ifTrue: [ aResult with: anExpectedResult collect: [ :r :e | self calcErrorOf: r realResult: e ] ]
		ifFalse: [ self calcErrorOf: aResult realResult: anExpectedResult ].
	(self format: error type: 'error' postfix: '%' tree: aTree) cr; cr.
