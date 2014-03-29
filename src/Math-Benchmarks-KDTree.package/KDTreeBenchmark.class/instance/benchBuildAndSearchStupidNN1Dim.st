benchmarking
benchBuildAndSearchStupidNN1Dim
|n s|
s :=StupidNN withAll: r.
1 to: self class defaultProblemSize do:[:v|n :=1.0/ v.
	s nnSearch: (collType with:n) i:10 ] .