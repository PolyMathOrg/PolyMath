information
valueAndError: aNumber 
	"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/8/00 "

	| valueGradient gradient gVar |
	valueGradient := result valueAndGradient: aNumber.
	gradient := valueGradient last copyFrom: 1 to: valueGradient last size - 1.
	gVar := gradient * (self errorMatrix * gradient) / count.
	^Array with: valueGradient first
		with: ((valueGradient first / count) squared * countVariance + gVar) sqrt