streaming
streamResultsFor: aName tree: aTree single: oneResult
	| anExpectedResult aNewTree |
	1 to: (self numberOfDifferentResultsAt: aName) do: [ :num | 
		anExpectedResult := self extractFromResults: (self resultsAt: aName) which: num onlyOne: oneResult.
		aNewTree := oneResult ifTrue: [ aTree ] ifFalse: [ self putExpectedResult: anExpectedResult totree: aTree ].
		self format: anExpectedResult type: 'expected result' postfix: nil tree: aNewTree.
		self streamArgumentsAt: num for: aName tree: aNewTree.
		self severalChecksOn: aName with: anExpectedResult tree: aNewTree ]