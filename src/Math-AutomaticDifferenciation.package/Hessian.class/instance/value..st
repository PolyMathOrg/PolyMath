accessing
value: anArray
	| hDualValueTemplate hDualValue |
	gradient := Array new: anArray size.
	hDualValueTemplate := anArray collect: [ :i | HyperDualNumber value: i ].
	^ result := PMSymmetricMatrix
		new: anArray size
		function: [ :x :y | 
			| r |
			hDualValue := hDualValueTemplate deepCopy.
			x = y
				ifTrue: [ 
					(hDualValue at: x)
						eps: 1;
						eps2: 1 ]
				ifFalse: [ 
					(hDualValue at: x) eps: 1.
					(hDualValue at: y) eps2: 1 ].
			r := function value: hDualValue.
			x = y
				ifTrue: [ gradient at: x put: r eps ].
			r eps1eps2 ]