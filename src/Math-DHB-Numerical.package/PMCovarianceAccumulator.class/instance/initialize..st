initialization
initialize: anInteger

	covariance := ( ( 1 to: anInteger) collect: [ :n | PMVector new: n]) asPMVector.
	^super initialize: anInteger