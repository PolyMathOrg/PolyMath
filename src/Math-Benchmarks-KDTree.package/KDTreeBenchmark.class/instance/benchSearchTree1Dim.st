benchmarking
benchSearchTree1Dim
|n|
1 to: self class defaultProblemSize do:[:v|n :=1.0/ v.
	bTree nnSearch: (collType with:n) i:10 ] .