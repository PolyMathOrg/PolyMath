creation
equations: anArrayOfArrays
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 30/3/99 "
		^self new initialize: ( anArrayOfArrays collect: [ :each | each copy]).