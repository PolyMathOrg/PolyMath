operation
inverse1By1
		"Private - Answer the inverse of the receiver when it is a 1x1 matrix (no check is made).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/5/99 "
	^self class rows: ( DhbVector with: ( DhbVector with: ( 1/ ((rows at: 1) at: 1))))