Extension { #name : #PMVector }

{ #category : #'*Math-Complex' }
PMVector >> adaptToComplex: rcvr andSend: selector [
	^ self collect: [ :ea | rcvr perform: selector with: ea ]
]
