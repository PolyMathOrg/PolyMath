initialization
initializeRows: anArrayOrVector
		"Defines the components of the recevier.
		  No check is made: components are assumed to be orgainized in rows.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	rows := anArrayOrVector asDhbVector collect: [ :each | each asDhbVector].