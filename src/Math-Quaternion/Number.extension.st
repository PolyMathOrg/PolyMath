Extension { #name : #Number }

{ #category : #'*Math-Quaternion' }
Number >> adaptToQuaternion: rcvr andSend: selector [ 
	"If I am involved in arithmetic with a Quaternion, convert me to a Quaternion."
	^ rcvr perform: selector with: self asQuaternion
]

{ #category : #'*Math-Quaternion' }
Number >> asQuaternion [
	^PMQuaternion 
		qr: self
		qi: 0
		qj: 0
		qk: 0
]

{ #category : #'*Math-Quaternion' }
Number >> i: qi j: qj k: qk [ 
	^PMQuaternion 
		qr: self
		qi: qi
		qj: qj
		qk: qk
]

{ #category : #'*Math-Quaternion' }
Number >> j [
	^PMQuaternion 
		qr: 0
		qi: 0
		qj: self
		qk: 0
]

{ #category : #'*Math-Quaternion' }
Number >> k [
	^PMQuaternion 
		qr: 0
		qi: 0
		qj: 0
		qk: self
]

{ #category : #'*Math-Quaternion' }
Number >> multiplyByQuaternion: quaternion [
	^ quaternion multiplyByNumber: self.
]
