double dispatching
addWithSymmetricMatrix: aMatrix
	^self class 
		new: aMatrix numberOfRows 
		function: [ :x :y|((rows at:x)at:y)+((aMatrix rows at:x)at:y) ]
