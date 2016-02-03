comparing
requirements
	^superclassName == #nil
		ifTrue: [self poolDictionaries]
		ifFalse: [(Array with: superclassName), self poolDictionaries]