display
printOn: aStream
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	super printOn: aStream.
	bestPoints do: [ :each | aStream cr. each printOn: aStream].