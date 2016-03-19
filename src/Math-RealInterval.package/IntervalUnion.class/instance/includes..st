testing
includes: aNumberOrInterval
aNumberOrInterval isIntervalUnion ifTrue: [ ^(self union: aNumberOrInterval) =self ].
^(aNumberOrInterval isRealInterval and:[aNumberOrInterval isEmpty]) 
	or:[self anySatisfy: [ :int|int includes: aNumberOrInterval ]]