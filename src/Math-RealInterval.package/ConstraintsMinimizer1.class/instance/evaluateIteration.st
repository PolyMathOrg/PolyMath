operation
evaluateIteration
|aBox|
aBox :=result removeFirst . "iterations =47 ifTrue:[self halt]."
aBox second inf > min 
	ifFalse: [(aBox first split) 
	  ifNil: [result addLast: aBox] 
	  ifNotNil: [ :aSplit| |domain codomain mp|
		1 to:2 do:[:index|
			domain := splicer box:(aSplit at: index);doFastSplicing. "lazy stupid trick, 
											but in a way necessary for the next stupidity"
			codomain := function value: domain.
			(codomain inf <= min and:[constraints isPerhapsAdmissibleValue: domain])
				ifTrue:[ 
					result addLast: (Array with: domain with: codomain).
					min := min min:	codomain sup. "this is not (!) correct, but works relatively 
															often with the stupidity above"
					(constraints isAdmissibleValue: (mp:=domain midPoint)) 
						ifTrue:[min := min min: (function value:mp)]]]
		]].
^result isEmpty ifTrue:[0] ifFalse:[result first first width]