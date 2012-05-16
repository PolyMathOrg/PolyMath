transformation
protectedDecomposition
		"Private - If decomposition fails, set permutation to 0.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 30/3/99 "
	[ self decompose] on: Error do: [ :signal | permutation := 0. signal return: nil].