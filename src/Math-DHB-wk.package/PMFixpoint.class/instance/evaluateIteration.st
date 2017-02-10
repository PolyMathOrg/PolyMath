operation
evaluateIteration
cycleFlag 	ifTrue: [result1:=result] 
				ifFalse:[result2:=result].
cycleFlag :=cycleFlag not.
result := block value: result copy .
^results add:result