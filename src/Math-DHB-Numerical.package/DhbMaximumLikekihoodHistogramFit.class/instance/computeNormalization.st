operation
computeNormalization
	"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "

	| numerator denominator temp |
	numerator := 0.
	denominator := 0.
	dataHolder pointsAndErrorsDo: 
			[:each | 
			temp := result value: each xValue.
			temp = 0 
				ifFalse: 
					[numerator := numerator + (each yValue squared / temp).
					denominator := denominator + temp]].
	count := ( numerator / denominator) sqrt.
	countVariance := numerator / ( 4 * count).