creation
points: aDataHolder function: aParametricFunction 
	"(c) Copyrights Didier BESSET, 1999, all rights reserved. 
	Initial code: 11/3/99"

	^aParametricFunction isNil
		ifTrue: [nil]
		ifFalse: [super new initialize: aDataHolder data: aParametricFunction]