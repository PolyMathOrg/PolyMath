operation
initializeIterations
|aBox|
result := IntervalHeap newQueue.
initialQueue := "SortedIntervalCollection new "IntervalHeap newQueue.
severalBoxes 
	ifTrue: [box do:[:b| initialQueue add: (Array with: b with: (function value: b))].
		aBox:=box first ]
	ifFalse: [initialQueue add: (Array with: box with: (function value: box)). aBox:=box].
min :=function value: aBox midPoint.