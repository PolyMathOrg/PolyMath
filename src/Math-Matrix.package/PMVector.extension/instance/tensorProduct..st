*Math-Matrix
tensorProduct: aVector
	"Answers the tensor product of the receiver with aVector."
	^self == aVector "dont use #="
			ifTrue: [PMSymmetricMatrix new: self size function:[:x :y|x*y]] 
			ifFalse:[PMMatrix rows: ( self collect: [ :a | aVector collect: [ :b | a * b]])]
