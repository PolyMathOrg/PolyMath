Extension { #name : #PMPolynomial }

{ #category : #'*Math-Complex-Number' }
PMPolynomial >> adaptToComplex: rcvr andSend: selector [
	^(self class coefficients: (Array with: rcvr) ) perform: selector with: self
]
