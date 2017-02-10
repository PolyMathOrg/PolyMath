accessing
value: anArray
	| dualValueTemplate dualValue |
	dualValueTemplate := anArray collect: [ :i | PMDualNumber value: i ].
	^ (1 to: anArray size)
		collect: [ :i | 
			dualValue := dualValueTemplate deepCopy.
			(dualValue at: i) eps: 1.
			(function value: dualValue) eps ]
		as: anArray class