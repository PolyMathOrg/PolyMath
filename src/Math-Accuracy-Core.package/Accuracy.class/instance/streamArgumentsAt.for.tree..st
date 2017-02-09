streaming
streamArgumentsAt: anInteger for: aName tree: aTree
	| ar |
	ar := self argumentAt: aName.
	ar
		ifNil: [ aStream cr ]
		ifNotNil: [ :a | 
			(self
				format: (a at: anInteger)
				type: 'arguments'
				postfix: nil
				tree: aTree) cr ]