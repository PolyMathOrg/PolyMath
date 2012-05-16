initialization
initialize: aBlock from: aNumber1 to: aNumber2
		"Private - Initialize the parameters of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 7/1/99 "
	functionBlock := aBlock.
	self from: aNumber1 to: aNumber2.
	^self