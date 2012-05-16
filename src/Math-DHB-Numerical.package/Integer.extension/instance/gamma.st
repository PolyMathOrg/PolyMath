*Math-DHB-Numerical-Extensions
gamma
	self > 0
		ifFalse: [^ self error: 'Attempt to compute the Gamma function of a non-positive integer'].
	^ (self - 1) factorial.