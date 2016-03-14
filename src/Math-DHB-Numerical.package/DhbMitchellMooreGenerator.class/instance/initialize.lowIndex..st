initialization
initialize: anArray lowIndex: anInteger
	"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/11/00 "

	randoms := anArray.
	lowIndex := anInteger.
	highIndex := randoms size.
	^self