operation
squared
	|transposed|
	transposed :=self privateTranspose .
	^DhbSymmetricMatrix 
		new: transposed numberOfRows 
		function: [ :x :y|(transposed rowAt: x) * (transposed rowAt: y) ]
