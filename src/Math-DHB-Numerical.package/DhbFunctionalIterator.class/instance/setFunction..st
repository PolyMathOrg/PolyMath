initialization
setFunction: aBlock
		"Defines the function for which zeroes will be found.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 7/1/99 "
	( aBlock respondsTo: #value:)
		ifFalse:[ self error: 'Function block must implement the method value:'].
	functionBlock := aBlock.