initialization
initializeIdentity: anInteger
		"Build components for an identity matrix.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	rows := ( 1 to: anInteger) asVector collect: [ :n | (DhbVector new: anInteger) atAllPut: 0; at: n put: 1; yourself].