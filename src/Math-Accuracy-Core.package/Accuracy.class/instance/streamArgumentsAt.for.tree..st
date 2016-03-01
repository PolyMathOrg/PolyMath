streaming
streamArgumentsAt: anInteger for: aName tree:aTree
	|ar|
	ar :=self argumentAt: aName.
	ar  ifNil:[aStream cr]
	   ifNotNilDo: [ :a | 
		(self format:  (a at: anInteger) type: 'arguments' postfix: nil tree: aTree) cr]