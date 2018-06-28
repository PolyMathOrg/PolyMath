Extension { #name : #PMVector }

{ #category : #'*Math-Matrix' }
PMVector >> tensorProduct: aVector [
	"Answers the tensor product of the receiver with aVector."
	^self == aVector "dont use #="
			ifTrue: [PMSymmetricMatrix new: self size function:[:x :y|(self at: x) * (self at: y)]] 
			ifFalse:[PMMatrix rows: ( self collect: [ :a | aVector collect: [ :b | a * b]])]

]
