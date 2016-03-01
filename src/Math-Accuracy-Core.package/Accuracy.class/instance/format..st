printing
format: aCollection
	|col|
	col:= self asArray: aCollection.
	^col collect: [ :a | a isNumber 
			ifTrue: [ self class floatAsShortString: a ]
			ifFalse: [ a ] ].
