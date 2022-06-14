Extension { #name : #PMVector }

{ #category : #'*Math-Quaternion' }
PMVector >> adaptToQuaternion: aQuaternion andSend: aByteSymbol [
	^ self collect: [ :ea | aQuaternion perform: aByteSymbol with: ea ]
]

{ #category : #'*Math-Quaternion' }
PMVector >> multiplyByQuaternion: quaternion [

	^ self * quaternion.
]
