information
computePrecision: whateverData  "can be changed to check how the ga behaves"	
	statistics ifTrue:
	[bestValueHistory add: bestPoints first value.
	whateverHistory add: whateverData .
	worstValueHistory add: bestPoints last value].	
	^steadyState ifTrue: [bestPoints last value - bestPoints first value] ifFalse: [1]