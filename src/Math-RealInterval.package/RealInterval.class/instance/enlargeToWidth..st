converting
enlargeToWidth: aNumber
| mp hw |
	mp := self midPoint.
	mp =0 
		ifTrue:[self width < aNumber 
			ifTrue:[hw := 1]
			ifFalse: [ ^ self ]]
		ifFalse:[self width / mp abs < aNumber 
			ifTrue:[hw := mp abs]
			ifFalse: [ ^ self ]].
	hw := hw * aNumber / 2.0.
	inf := mp - hw.
	sup := mp + hw