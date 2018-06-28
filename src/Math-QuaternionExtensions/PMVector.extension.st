Extension { #name : #PMVector }

{ #category : #'*Math-QuaternionExtensions' }
PMVector >> adaptToQuaternion: aQuaternion andSend: aByteSymbol [
	^ self collect: [ :ea | aQuaternion perform: aByteSymbol with: ea ]
]
