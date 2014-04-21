accessing
seed: seedArray
	jcong := (seedArray at: 1) bitAnd: 16rFFFFFFFF.
	jsr := (seedArray at: 2) bitAnd: 16rFFFFFFFF.
	w := (seedArray at: 3) bitAnd: 16rFFFFFFFF.
	z := (seedArray at: 4) bitAnd: 16rFFFFFFFF.