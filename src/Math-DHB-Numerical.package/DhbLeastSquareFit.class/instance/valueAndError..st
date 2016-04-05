information
valueAndError: aNumber
	| valueGradient |
	valueGradient := result valueAndGradient: aNumber.
	^Array with: valueGradient first
		   with: ( valueGradient last * ( self errorMatrix * valueGradient last)) sqrt