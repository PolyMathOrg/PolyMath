benchmarking
benchSearchTree4Dim
|n|
1 to: self class defaultProblemSize do:[:v|n :=1.0/ v.
	aTree nnSearch: (collType with:n with:n with:n with:n )   i:10] .