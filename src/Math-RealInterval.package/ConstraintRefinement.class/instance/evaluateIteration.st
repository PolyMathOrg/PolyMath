operation
evaluateIteration
	| aSplit adm|
	[aSplit := initialQueue removeFirst]on: Error do:[^0] .	"iterations =29 ifTrue:[self halt]."	"3."
	(constraints isNotAdmissibleValue: aSplit)	ifTrue: [ ^ self returnPrecision ]."4."
	aSplit := aSplit split."5"
	aSplit do: [:aBox| adm:=constraints admissibleNumberForValue: aBox.
		aBox width < myDesiredPrec	"6"	
			ifTrue: [ adm > 0 ifTrue: [self resultAdd: aBox ]]"7"
			ifFalse: [ adm > 0 ifTrue: 
				[adm  =2 
					ifTrue:[self resultAdd: aBox] 
					ifFalse: [initialQueue addFirst: aBox] ] ]]."9"
	^ self returnPrecision
