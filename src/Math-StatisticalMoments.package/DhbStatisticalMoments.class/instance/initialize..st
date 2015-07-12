initialization
initialize: anInteger 
	"Private - ( anInteger - 1) is the degree of the highest accumulated central moment.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/5/99 "

	moments := Array new: anInteger.
	self reset.
	^self