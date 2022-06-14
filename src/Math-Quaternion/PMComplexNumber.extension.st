Extension { #name : #PMComplexNumber }

{ #category : #'*Math-Quaternion' }
PMComplexNumber >> adaptToQuaternion: rcvr andSend: selector [ 
	"If I am involved in arithmetic with a Quaternion, convert me to a Quaternion."
	^ rcvr perform: selector with: self asQuaternion
]

{ #category : #'*Math-Quaternion' }
PMComplexNumber >> asQuaternion [
	^ PMQuaternion
		qr: real
		qi: imaginary
		qj: 0
		qk: 0
]

{ #category : #'*Math-Quaternion' }
PMComplexNumber >> j [
	"same as self * 1 j"

	^PMQuaternion 
		qr: 0
		qi: 0
		qj: real
		qk: imaginary
]

{ #category : #'*Math-Quaternion' }
PMComplexNumber >> k [
	"same as self * 1 k"

	^PMQuaternion 
		qr: 0
		qi: 0
		qj: imaginary negated
		qk: real
]

{ #category : #'*Math-Quaternion' }
PMComplexNumber >> multiplyByQuaternion: quaternion [

	^ quaternion multiplyByComplexNumber: self
]
