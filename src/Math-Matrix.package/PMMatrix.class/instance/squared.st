operation
squared
	| transposed |
	transposed :=self privateTranspose.
	^ PMSymmetricMatrix 
		new: transposed numberOfRows 
		function: [ :x :y|(transposed rowAt: x) * (transposed rowAt: y) ]
