information
skewness
		"Answer the skewness of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	^(((lowLimit squared * lowLimit + ( peak squared * peak) + ( highLimit squared * highLimit) ) / 135)
	-(((lowLimit squared * peak) + (lowLimit squared * highLimit) + (peak squared * lowLimit) + (peak squared * highLimit) + (highLimit squared * lowLimit) + (highLimit squared * peak))/90)
	+( 2 * lowLimit * peak * highLimit / 45)) / ( self standardDeviation raisedToInteger: 3)