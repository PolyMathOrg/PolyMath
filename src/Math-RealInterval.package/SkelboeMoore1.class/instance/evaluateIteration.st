operation
evaluateIteration
|aBox aResult|
aBox :=result removeFirst . "iterations =128 ifTrue:[self halt]."
aBox second inf > min 
	ifFalse: [(aBox first split) 
	  ifNil: [result addLast: aBox] 
	  ifNotNil: [ :aSplit| 
		aResult :=aSplit collect: [ :i|function value:i ].
		1 to:2 do:[:index||res|res:=aResult at: index.
			res inf <= min ifTrue:[ 
				result addLast: (Array with: (aSplit at: index) with: res).
				min := {
					min.
					(function value: (aSplit at: index)midPoint)asFloat successor.
					res sup} min ]]]].
^result first first width