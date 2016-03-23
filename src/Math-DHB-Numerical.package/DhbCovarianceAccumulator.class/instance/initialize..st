initialization
initialize: anInteger

	covariance := ( ( 1 to: anInteger) collect: [ :n | DhbVector new: n]) asDhbVector.
	^super initialize: anInteger