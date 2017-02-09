initialization
initialize: anInteger

	covariance := ( ( 1 to: anInteger) collect: [ :n | PMVector new: n]) asDhbVector.
	^super initialize: anInteger