Extension { #name : #Number }

{ #category : #'*Math-AutomaticDifferenciation' }
Number >> addDualNumber: aDualNumber [
	^ aDualNumber class
		value: self + aDualNumber value
		eps: aDualNumber eps
]

{ #category : #'*Math-AutomaticDifferenciation' }
Number >> multiplyDualNumber: aDualNumber [
	^ aDualNumber class
		value: aDualNumber value * self
		eps: aDualNumber eps * self
]
