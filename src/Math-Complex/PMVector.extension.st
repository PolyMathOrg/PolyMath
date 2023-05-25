Extension { #name : #PMVector }

{ #category : #'*Math-Complex' }
PMVector >> adaptToComplex: rcvr andSend: selector [
	^ self collect: [ :ea | rcvr perform: selector with: ea ]
]

{ #category : #'*Math-Complex' }
PMVector >> isReal [

	"Answer true if all values of the vector are real numbers"

	^ self allSatisfy: [ :each | each isRealNumber ]
]
