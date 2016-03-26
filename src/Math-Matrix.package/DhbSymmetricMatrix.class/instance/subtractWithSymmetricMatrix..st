double dispatching
subtractWithSymmetricMatrix: aMatrix
	^ self class 
		new: aMatrix numberOfRows 
		function: [ :x :y|((aMatrix rows at:x)at:y)-(( rows at:x)at:y) ]