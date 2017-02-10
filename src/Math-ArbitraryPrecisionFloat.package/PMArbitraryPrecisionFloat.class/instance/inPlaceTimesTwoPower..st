private
inPlaceTimesTwoPower: n 
	self isZero
		ifFalse: [biasedExponent := biasedExponent + n]