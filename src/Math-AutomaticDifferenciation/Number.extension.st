Extension { #name : #Number }

{ #category : #'*Math-AutomaticDifferenciation' }
Number >> addPMDualNumber: aPMDualNumber [

	^ PMDualNumber
		value: self + aPMDualNumber value
		eps: aPMDualNumber eps
]
