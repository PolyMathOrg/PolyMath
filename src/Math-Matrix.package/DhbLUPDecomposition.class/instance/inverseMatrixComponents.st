operations
inverseMatrixComponents
	| n inverseRows column |
	permutation isNil
		ifTrue: [ self protectedDecomposition].
	permutation = 0
		ifTrue: [ ^ nil].	"Singular matrix has no inverse"
	n := rows size.
	inverseRows := (1 to: n) asDhbVector collect: [ :j | DhbVector new: n].
	1 to: n do:
		[ :j |
		  column := self solve: ( ( Array new: rows size) atAllPut: 0; at: j put: 1; yourself).
		  column ifNil: [^nil].	"Singular matrix has no inverse"
		  1 to: n do: [ :i | ( inverseRows at: i) at: j put: ( column at: i)].
		]. 
	^inverseRows