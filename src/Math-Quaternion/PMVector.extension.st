Extension { #name : #PMVector }

{ #category : #'*Math-Quaternion' }
PMVector >> adaptToQuaternion: aQuaternion andSend: aByteSymbol [
	^ self collect: [ :ea | aQuaternion perform: aByteSymbol with: ea ]
]
