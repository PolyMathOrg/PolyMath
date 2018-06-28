Extension { #name : #Number }

{ #category : #'*Math-Quaternion' }
Number >> adaptToQuaternion: rcvr andSend: selector [ 
	"If I am involved in arithmetic with a Quaternion, convert me to a Quaternion."
	^ rcvr perform: selector with: self asQuaternion
]

{ #category : #'*Math-Quaternion' }
Number >> asQuaternion [
	^Quaternion 
		qr: self
		qi: 0
		qj: 0
		qk: 0
]

{ #category : #'*Math-Quaternion' }
Number >> i: qi j: qj k: qk [ 
	^Quaternion 
		qr: self
		qi: qi
		qj: qj
		qk: qk
]

{ #category : #'*Math-Quaternion' }
Number >> j [
	^Quaternion 
		qr: 0
		qi: 0
		qj: self
		qk: 0
]

{ #category : #'*Math-Quaternion' }
Number >> k [
	^Quaternion 
		qr: 0
		qi: 0
		qj: 0
		qk: self
]
