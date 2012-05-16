public methods
sort
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 27/5/99 "
	points := ( points asSortedCollection: self sortBlock) asOrderedCollection.