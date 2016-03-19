accessing
result: aCollectionOfBoxesOrBox
	result:= aCollectionOfBoxesOrBox class =IntervalBox 
		ifTrue:[aCollectionOfBoxesOrBox asSimpleBoxes]
		ifFalse:[aCollectionOfBoxesOrBox].
	self calcBuilder .
	^result