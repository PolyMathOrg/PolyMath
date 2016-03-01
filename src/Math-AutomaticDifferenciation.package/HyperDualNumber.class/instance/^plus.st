arithmetic
+ aHyperDualNumber
	|r|
	r := super + aHyperDualNumber.
	aHyperDualNumber isDualNumber
		ifFalse:[ r eps2:eps2; eps1eps2: eps1eps2] 
		ifTrue: [r eps2: eps2 + aHyperDualNumber eps2; eps1eps2: eps1eps2 + aHyperDualNumber eps1eps2].
	^ r