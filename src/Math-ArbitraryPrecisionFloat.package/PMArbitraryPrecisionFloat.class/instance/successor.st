truncation and round off
successor
	mantissa = 0 ifTrue: [^self].
	mantissa negative ifTrue: [^self negated predecessor negated].
	^self + self ulp