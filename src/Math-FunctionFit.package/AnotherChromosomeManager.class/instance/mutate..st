operation
mutate: aVector
"BGA mutation"
	| isMutated threshold new index|
	isMutated :=false.
	threshold :=1/ aVector size asFloat .
	new :=aVector copy.
	1 to: aVector size do:[:i| Float random < threshold ifTrue:[
			isMutated :=true.
			new at: i put: (new at: i) + 
			((Float random <0.5 ifTrue: [0.5] ifFalse:[0.5 negated ] )*(self randomRangeAt: i))]].
	isMutated ifFalse: [
		index := aVector size random + 1.
		new at: index put: (new at: index) + 
			((Float random <0.5 ifTrue: [0.5] ifFalse:[0.5 negated ] )*(self randomRangeAt: index))].
	^new