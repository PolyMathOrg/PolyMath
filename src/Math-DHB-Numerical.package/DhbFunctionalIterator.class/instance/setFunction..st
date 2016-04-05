initialization
setFunction: aBlock
	( aBlock respondsTo: #value:)
		ifFalse:[ self error: 'Function block must implement the method value:'].
	functionBlock := aBlock