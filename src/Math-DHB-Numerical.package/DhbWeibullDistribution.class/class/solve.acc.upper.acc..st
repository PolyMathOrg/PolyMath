creation
solve: lowX acc: lowAcc upper: highX acc: highAcc 
	"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "

	| lowLnAcc highLnAcc deltaLnAcc lowLnX highLnX |
	lowLnAcc := (1 - lowAcc) ln negated ln.
	highLnAcc := (1 - highAcc) ln negated ln.
	deltaLnAcc := highLnAcc - lowLnAcc.
	lowLnX := lowX ln.
	highLnX := highX ln.
	^self shape: deltaLnAcc / (highLnX - lowLnX)
		scale: ((highLnAcc * lowLnX - (lowLnAcc * highLnX)) / deltaLnAcc) exp