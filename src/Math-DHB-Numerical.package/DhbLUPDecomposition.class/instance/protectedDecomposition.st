private
protectedDecomposition
	"Private - If decomposition fails, set permutation to 0."
	[ self decompose] on: Error do: [ :signal | permutation := 0. signal return: nil].