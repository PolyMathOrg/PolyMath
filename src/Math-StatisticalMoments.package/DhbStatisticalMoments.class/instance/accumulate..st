transformation
accumulate: aNumber 
	"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/5/99 "

	| correction n n1 oldSums pascal nTerm cTerm term |
	n := moments at: 1.
	n1 := n + 1.
	correction := ((moments at: 2) - aNumber) / n1.
	oldSums := moments copyFrom: 1 to: moments size.
	moments
		at: 1 put: n1;
		at: 2 put: (moments at: 2) - correction.
	pascal := Array new: moments size.
	pascal atAllPut: 0.
	pascal
		at: 1 put: 1;
		at: 2 put: 1.
	nTerm := -1.
	cTerm := correction.
	n1 := n / n1.
	n := n negated.
	3 to: moments size
		do: 
			[:k | 
			cTerm := cTerm * correction.
			nTerm := n * nTerm.
			term := cTerm * (1 + nTerm).
			k to: 3
				by: -1
				do: 
					[:l | 
					pascal at: l put: (pascal at: l - 1) + (pascal at: l).
					term := (pascal at: l) * (oldSums at: l) + term.
					oldSums at: l put: (oldSums at: l) * correction].
			pascal at: 2 put: (pascal at: 1) + (pascal at: 2).
			moments at: k put: term * n1]