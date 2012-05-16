operation
minimizeDirection: aVectorFunction 
	"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	^unidimensionalFinder
		reset;
		setFunction: aVectorFunction;
		addPointAt: 0;
		addPointAt: precision;
		addPointAt: precision negated;
		evaluate