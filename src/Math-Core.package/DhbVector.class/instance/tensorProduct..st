operation
tensorProduct: aVector
	"Answers the tensor product of the receiver with aVector."
	^self == aVector "dont use #="
			ifTrue: [DhbSymmetricMatrix new: self size function:[:x :y|x*y]] 
			ifFalse:[DhbMatrix rows: ( self collect: [ :a | aVector collect: [ :b | a * b]])]
