initialization
initialize: anInteger server: aClusterDataServer type: aClusterClass
	
	self dataServer: aClusterDataServer.
	self clusters: ( (1 to: anInteger) collect: [ :n | aClusterClass new]).
	minimumRelativeClusterSize := 0.
	^self