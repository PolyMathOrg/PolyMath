operation
initializeIterations
|aBox|
result := LinkedList new.
severalBoxes 
	ifTrue: [box do:[:b| result addLast: (Array with: b with: (function value: b))].
		aBox:=box first ]
	ifFalse: [result addLast: (Array with: box with: (function value: box)). aBox:=box].
min :=function value: aBox midPoint.