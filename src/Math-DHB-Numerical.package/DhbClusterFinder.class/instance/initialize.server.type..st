information
initialize: anInteger server: aClusterDataServer type: aClusterClass
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 9/3/99 "
	self dataServer: aClusterDataServer.
	self clusters: ( (1 to: anInteger) collect: [ :n | aClusterClass new]).
	minimumRelativeClusterSize := 0.
	^self