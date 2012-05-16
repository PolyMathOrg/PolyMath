information
leadingFactor: aNumber
		"Private - Answers the log of the leading factor in Lanczos' formula.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/3/99 "
	| temp |
	temp := aNumber + 5.5.
	^( temp ln * ( aNumber + 0.5) - temp)