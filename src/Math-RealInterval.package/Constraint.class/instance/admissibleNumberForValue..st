accessing
admissibleNumberForValue: aValue
"returns 0 if aValue is not admissible, 1 if it is partly admissible or undecidable and 2 if it is admissible"
^(self isAdmissibleValue: aValue) 
	ifTrue: [ 2 ] 
	ifFalse: [ (self isNotAdmissibleValue: aValue)
		ifTrue: [ 0 ] ifFalse: [ 1 ]  ]