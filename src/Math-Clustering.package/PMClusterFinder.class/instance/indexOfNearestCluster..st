information
indexOfNearestCluster: aVector
	"Private - Answers the index of the cluster nearest to aVector."
	
	| distance index |
	index := 1.
	distance := (result at: 1) distanceTo: aVector.
	2 to: result size do:
		[ :n | | x |
		  x := (result at: n) distanceTo: aVector.
		  x < distance
			ifTrue: [ distance := x.
					  index := n 	] ].
	^ index