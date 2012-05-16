initialization
initialize: anInteger
		"Build empty components for a square matrix.
		  No check is made: components are assumed to be orgainized in rows.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	rows := ( 1 to: anInteger) asVector collect: [ :each | DhbVector new: anInteger].