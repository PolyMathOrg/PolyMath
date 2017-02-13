initialization
setFunction: aBlock
	( aBlock respondsTo: #value:)
		ifFalse:[ self error: 'Function block must implement the method value:'].
	originalFunction :=aBlock . "necessary for subclass; do not delete that nonsense!"
	functionBlock := aBlock.
	self resetBestPoints.
