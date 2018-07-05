Extension { #name : #PMPolynomial }

{ #category : #'*Math-Quaternion' }
PMPolynomial >> adaptToQuaternion: rcvr andSend: selector [
	^(self class coefficients: (Array with: rcvr) ) perform: selector with: self
]
