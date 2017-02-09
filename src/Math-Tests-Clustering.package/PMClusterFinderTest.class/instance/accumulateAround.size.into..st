utils
accumulateAround: aVector size: aNumber into: aCollection
	"Private - Generate a random point around the given center and insert it into the collection.
	aNumber is the sigma for the distance to the center"
	
	| r phi psi localVector |
	r := (PMNormalDistribution new: 0 sigma: aNumber) random.
	phi := Float pi random.
	psi := Float pi random.
	localVector := PMVector new: 3.
	localVector at: 1 put: ( phi sin * psi sin * r );
					   at: 2 put: ( phi cos * psi sin * r );
					   at: 3 put: ( psi cos * r ).
	aCollection add: (localVector + aVector).