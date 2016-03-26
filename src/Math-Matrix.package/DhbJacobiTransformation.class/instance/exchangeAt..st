transformation
exchangeAt: anInteger
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/6/99 "
	| temp n |
	n := anInteger + 1.
	temp := result at: n.
	result at: n put: ( result at: anInteger).
	result at: anInteger put: temp.
	transform do:
		[ :each |
		  temp := each at: n.
		  each at: n put: ( each at: anInteger).
		  each at: anInteger put: temp.
		].