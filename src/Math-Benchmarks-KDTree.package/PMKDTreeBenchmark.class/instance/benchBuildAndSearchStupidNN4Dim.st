benchmarking
benchBuildAndSearchStupidNN4Dim
	| n s |
	s := PMStupidNN withAll: m.
	1 to: self class defaultProblemSize do: [ :v | 
		n := 1.0 / v.
		s
			nnSearch:
				(collType
					with: n
					with: n
					with: n
					with: n)
			i: 10 ]