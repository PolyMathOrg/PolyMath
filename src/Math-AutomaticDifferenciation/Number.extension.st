Extension { #name : #Number }

{ #category : #'*Math-AutomaticDifferenciation' }
Number >> addDualNumber: aPMDualNumber [

	^ PMDualNumber
		value: self + aPMDualNumber value
		eps: aPMDualNumber eps
]

{ #category : #'*Math-AutomaticDifferenciation' }
Number >> multiplyDualNumber: aDualNumber [
	^PMDualNumber value: aDualNumber value * self eps: aDualNumber eps * self
]
